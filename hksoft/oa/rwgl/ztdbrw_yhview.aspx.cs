using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;
using System.Collections.Generic;

namespace hkpro.oa.rwgl
{
    public partial class ztdbrw_yhview : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10302", "0");
                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));

                //短信
                dxtz.Visible = Convert.ToBoolean(hkdb.VeriSms());

                //dp绑定 
                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT A.*,C.MC AS RWXZ_MC FROM OA_RWD01 A LEFT OUTER JOIN HK_ZDYLX C ON(A.RWXZ=C.ID) WHERE A.RWID='" + hkdb.GetStr(Request.QueryString["rwid"].ToString()) + "'");
                if (datar.Read())
                {
                    rwly.Text = datar["source"].ToString();
                    cbrwid.Text= datar["rwid"].ToString();
                    rwid.Text= datar["rwid"].ToString();
                    rwidstr.Text = datar["rwid"].ToString();
                    rwdh.Text = datar["rwdh"].ToString();
                    lblrwbt.Text = datar["rwbt"].ToString();
                    lbljjcd.Text = datar["jjcd"].ToString();
                    lblrwxz.Text = datar["rwxz_mc"].ToString();
                    lbljsdx.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["jsdx"].ToString() + "','1'"));
                    qtld.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["qtld"].ToString() + "','1'"));
                    zrld.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["zrld"].ToString() + "','1'"));
                    zrr.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["zrr"].ToString() + "','1'"));
                    lblnr.Text = hkdb.GetStrTeOut(datar["rwnr"].ToString());
                    lblksrq.Text = datar["ksrq"].ToString();
                    lbljzrq.Text = datar["jzrq"].ToString();
                    lblynxs.Text = datar["ynxs"].ToString();

                    savefj.Text = datar["fjmc"].ToString();
                    fqsj.Text = string.Format("{0:d}", datar["fbsj"]);
                    savefj.Text = datar["fjmc"].ToString();
                    savefj.NavigateUrl = (datar["fjlj"] == System.DBNull.Value ? "" : "../.." + datar["fjlj"]) + datar["fjmc"].ToString();
                    datar.Close();

                    if (lblynxs.Text == "是")
                    {
                        Panelrq.Visible = true;
                    }
                }
                else
                {
                    datar.Close();
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }

                //页面绑定 
                GridViewBind();
                GridViewBind2();
                GridViewBind3();
                GridViewBind4();
            }
        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " where ssrwid='" + hkdb.GetStr(rwidstr.Text) + "' ";

            DataSet ds = SqlHelper.ExecuteDs("select a.jsid,a.jssj,(case when a.jszt='未接收' then 'noch' when a.jszt='审核退回' then 'noch' else 'ch' end)as jszt,b.ui_desc from OA_RWD02 a left outer join yh b on (a.jsr=b.ui_id)" + Str1 + "order by jssj desc");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        public void GridViewBind2()
        {
            string str_qtld = Convert.ToString(SqlHelper.ExecuteScalar("select QTLD from wit_soft.dbo.OA_Rwd01 WHERE rwid ='" + hkdb.GetStr(rwidstr.Text) + "'"));
            string[] arr_qtld=str_qtld.Split(',');
            string con_qtld = "";
            for(int i=0;i<arr_qtld.Length;i++)
            {
                con_qtld += "'" + arr_qtld[i] + "'" + ",";
            }
            con_qtld = con_qtld.Substring(0, con_qtld.Length - 1);
            //object ds = SqlHelper.ExecuteScalar("select QTLD from wit_soft.dbo.OA_Rwd01 WHERE rwid ='" + hkdb.GetStr(rwidstr.Text) + "'");

            DataSet DS = SqlHelper.ExecuteDs("SELECT * FROM wit_soft.DBO.YH WHERE ui_id IN("+ con_qtld + ")");
            GridView2.DataSource = DS;
            GridView2.DataBind();
        }
        public void GridViewBind3()
        {
            string str_qtld = Convert.ToString(SqlHelper.ExecuteScalar("select zrld from wit_soft.dbo.OA_Rwd01 WHERE rwid ='" + hkdb.GetStr(rwidstr.Text) + "'"));
            string[] arr_qtld = str_qtld.Split(',');
            string con_qtld = "";
            for (int i = 0; i < arr_qtld.Length; i++)
            {
                con_qtld += "'" + arr_qtld[i] + "'" + ",";
            }
            con_qtld = con_qtld.Substring(0, con_qtld.Length - 1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM wit_soft.DBO.YH WHERE ui_id IN(" + con_qtld + ")");
            GridView3.DataSource = ds;
            GridView3.DataBind();
        }
        public void GridViewBind4()
        {
            string str_qtld = Convert.ToString(SqlHelper.ExecuteScalar("select zrr from wit_soft.dbo.OA_Rwd01 WHERE rwid ='" + hkdb.GetStr(rwidstr.Text) + "'"));
            string[] arr_qtld = str_qtld.Split(',');
            string con_qtld = "";
            for (int i = 0; i < arr_qtld.Length; i++)
            {
                con_qtld += "'" + arr_qtld[i] + "'" + ",";
            }
            con_qtld = con_qtld.Substring(0, con_qtld.Length - 1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM wit_soft.DBO.YH WHERE ui_id IN(" + con_qtld + ")");
            GridView4.DataSource = ds;
            GridView4.DataBind();
        }

        //通知 
        protected void Send_Click(object sender, EventArgs e)
        {
            string cal = "";
            string mestr = "";
            int i = 0;
            for (i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Rows[i].Cells[1].FindControl("del");
                if (cb.Checked == true)
                {
                    if (string.IsNullOrEmpty(cal))
                    {
                        cal = GridView1.DataKeys[i].Value.ToString();
                    }
                    else
                    {
                        cal = cal + "," + GridView1.DataKeys[i].Value.ToString();
                    }
                }
            }

            if (!string.IsNullOrEmpty(cal))
            {
                int j = 0;
                for (j = 0; j < (cal.Split(',')).Length; j++)
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("select jsid,jsr from OA_RWD02 where jsid='" + cal.Split(',')[j] + "'");
                    if (datar.Read())
                    {
                        mestr = mestr + "," + datar["jsr"].ToString();
                    }
                    datar.Close();
                }
            }

            if (string.IsNullOrEmpty(mestr))
            {
                mydb.Alert("请先选择接收人员，再执行任务催办！");
               
            }
            else
            {
                //Msg 

                //SqlHelper.ExecuteSql("insert into OA_Rwd01(cbyy) values('" + hkdb.GetStr(cbreason.Text) + "',GETDATE())");
                var arr = mestr.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                for (i = 0; i < arr.Length; i++)
                {
                    SqlHelper.ExecuteSql("insert into OA_RwCb(rwid,reason,person,createuser,createtime) values ('" + hkdb.GetStr(rwidstr.Text) + "','" + hkdb.GetStr(cbreason.Text) + "','" + arr[i] + "','" + this.Session["userid"] + "', GETDATE())");
                }
                mydb.Alert_Close("已成功催办！");

                if (xxtz.Checked == true | dxtz.Checked == true)
                {
                    string message = "请尽快接收[" + hkdb.GetStr(rwdh.Text) + "-" + lblrwbt.Text + "]任务单!" + this.Session["username"].ToString();
                    string templateParam = "{\"name\":\"" + lblrwbt.Text + "\",\"status\":" + "\"催办\"" + "}";
                    hkdb.SendAliSMS(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), mestr.Substring(1), message, templateParam);
                    //hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), mestr.Substring(1), message);
                    mydb.Alert_Close("己成功通知任务接收人员！");
                }
                else
                {
                    mydb.Alert("请先选择站内消息或手机短信任意一种，再执行任务催办！");
                }
            }
        }
        //问责
        protected void Send_Click1(object sender, EventArgs e)
        {
            string cal = "";
            string ca2 = "";
            string ca3 = "";
            string ca4 = "";

            string mestr = "";
            int i = 0;
            for (i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Rows[i].Cells[1].FindControl("del");

              
                if (cb.Checked == true)
                {
                    if (string.IsNullOrEmpty(cal))
                    {
                        cal = GridView1.DataKeys[i].Value.ToString();
                    }
                    else
                    {
                        cal = cal + "," + GridView1.DataKeys[i].Value.ToString();
                    }
                }
            }
            for (i = 0; i <= GridView2.Rows.Count - 1; i++)
            {
                CheckBox cb1 = (CheckBox)GridView2.Rows[i].Cells[1].FindControl("del1");
                if (cb1.Checked == true)
                {
                    if (string.IsNullOrEmpty(ca2))
                    {
                        ca2 = GridView2.DataKeys[i].Value.ToString();
                    }
                    else
                    {
                        ca2 = ca2 + "," + GridView2.DataKeys[i].Value.ToString();
                    }
                }
            }
            for (i = 0; i <= GridView3.Rows.Count - 1; i++)
            {
                CheckBox cb2 = (CheckBox)GridView3.Rows[i].Cells[1].FindControl("del2");
                if (cb2.Checked == true)
                {
                    if (string.IsNullOrEmpty(ca3))
                    {
                        ca3 = GridView3.DataKeys[i].Value.ToString();
                    }
                    else
                    {
                        ca3 = ca3 + "," + GridView3.DataKeys[i].Value.ToString();
                    }
                }
            }

            for (i = 0; i <= GridView4.Rows.Count - 1; i++)
            {

                CheckBox cb3 = (CheckBox)GridView4.Rows[i].Cells[1].FindControl("del3");
                if (cb3.Checked == true)
                {
                    if (string.IsNullOrEmpty(ca4))
                    {
                        ca4 = GridView4.DataKeys[i].Value.ToString();
                    }
                    else
                    {
                        ca4 = ca4 + "," + GridView4.DataKeys[i].Value.ToString();
                    }
                }
            }
            if (!string.IsNullOrEmpty(cal))
            {
                int j = 0;
                for (j = 0; j < (cal.Split(',')).Length; j++)
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("select jsid,jsr from OA_RWD02 where jsid='" + cal.Split(',')[j] + "'");
                    if (datar.Read())
                    {
                        mestr = mestr + "," + datar["jsr"].ToString();
                    }
                    datar.Close();
                }
            }
          
            if (!string.IsNullOrEmpty(ca2))
            {
                string message = "您办理的[" + hkdb.GetStr(rwdh.Text) + "]" + lblrwbt.Text + ";任务被问责!" + this.Session["username"].ToString();
                string templateParam = "{\"name\":\"" + lblrwbt.Text + "\",\"status\":" + "\"被问责\"" + "}";
                hkdb.SendAliSMS(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), ca2, message, templateParam);
                var arr = ca2.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                for (i = 0; i < arr.Length; i++)
                {
                    string s = Convert.ToString(SqlHelper.ExecuteScalar("select score from yh WHERE ui_id ='" + arr[i] + "'"));
                    int ss = Convert.ToInt32(s);
                    SqlHelper.ExecuteSql("Update yh set score='" + (ss - 3) + "' WHERE ui_id='" + arr[i] + "'");
                    SqlHelper.ExecuteSql("insert into OA_RwPunish (rwid,reason,person,createuser,createtime) values ('" + hkdb.GetStr(rwidstr.Text) + "','" + hkdb.GetStr(reason.Text) + "','" + arr[i] + "','" + this.Session["userid"] + "', GETDATE())");
                }
                mydb.Alert_Close("己成功问责！");

            }
            if (!string.IsNullOrEmpty(ca3))
            {
                string message = "您办理的[" + hkdb.GetStr(rwdh.Text) + "]" + lblrwbt.Text + ";任务被问责!" + this.Session["username"].ToString();
                string templateParam = "{\"name\":\"" + lblrwbt.Text + "\",\"status\":" + "\"被问责\"" + "}";
                hkdb.SendAliSMS(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), ca3, message, templateParam);
                var arr = ca3.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                for (i = 0; i < arr.Length; i++)
                {
                    string s = Convert.ToString(SqlHelper.ExecuteScalar("select score from yh WHERE ui_id ='" + arr[i] + "'"));
                    int ss = Convert.ToInt32(s);
                    SqlHelper.ExecuteSql("Update yh set score='" + (ss - 3) + "' WHERE ui_id='" + arr[i] + "'");
                    SqlHelper.ExecuteSql("insert into OA_RwPunish (rwid,reason,person,createuser,createtime) values ('" + hkdb.GetStr(rwidstr.Text) + "','" + hkdb.GetStr(reason.Text) + "','" + arr[i] + "','" + this.Session["userid"] + "', GETDATE())");

                }
                mydb.Alert_Close("己成功问责！");
            }
            if (!string.IsNullOrEmpty(ca4))
            {
                string message = "您办理的[" + hkdb.GetStr(rwdh.Text) + "]" + lblrwbt.Text + ";任务被问责!" + this.Session["username"].ToString();
                string templateParam = "{\"name\":\"" + lblrwbt.Text + "\",\"status\":" + "\"被问责\"" + "}";
                hkdb.SendAliSMS(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), ca4, message, templateParam);
                var arr = ca4.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                for (i = 0; i < arr.Length; i++)
                {
                    string s = Convert.ToString(SqlHelper.ExecuteScalar("select score from yh WHERE ui_id ='" + arr[i] + "'"));
                    int ss = Convert.ToInt32(s);
                    SqlHelper.ExecuteSql("Update yh set score='" + (ss - 3) + "' WHERE ui_id='" + arr[i] + "'");
                    SqlHelper.ExecuteSql("insert into OA_RwPunish (rwid,reason,person,createuser,createtime) values ('" + hkdb.GetStr(rwidstr.Text) + "','" + hkdb.GetStr(reason.Text) + "','" + arr[i] + "','" + this.Session["userid"] + "', GETDATE())");

                }
                mydb.Alert_Close("己成功问责！");
            }

            if (string.IsNullOrEmpty(mestr))
            {
                //mydb.Alert("请先选择，再执行问责！");
            }
            else
            {
                string message = "您办理的[" + hkdb.GetStr(rwdh.Text) + "]" + lblrwbt.Text + ";任务被问责!" + this.Session["username"].ToString();
                string templateParam = "{\"name\":\"" + lblrwbt.Text + "\",\"status\":" + "\"被问责\"" + "}";
                hkdb.SendAliSMS(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), mestr.Substring(1), message, templateParam);
                var arr = mestr.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                for (i=0;i<arr.Length;i++) {
                    string s = Convert.ToString(SqlHelper.ExecuteScalar("select score from yh WHERE ui_id ='" + arr[i] + "'"));
                    int ss = Convert.ToInt32(s);
                    SqlHelper.ExecuteSql("Update yh set score='" + (ss - 3) + "' WHERE ui_id='" + arr[i] + "'");
                    SqlHelper.ExecuteSql("insert into OA_RwPunish (rwid,reason,person,createuser,createtime) values ('" + hkdb.GetStr(rwidstr.Text) + "','" + hkdb.GetStr(reason.Text) + "','" + arr[i] + "','" + this.Session["userid"] + "', GETDATE())");

                }
                mydb.Alert_Close("己成功问责！");
            }
           
           

        }

        //gv行处理 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}
