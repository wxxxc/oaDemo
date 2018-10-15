using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jhgl
{
    public partial class Wdjh_Mod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public string istr = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10110", "0");

                BindAttr();

                SqlDataReader dr = SqlHelper.ExecuteReader("select * from oa_gzjh01 where jhid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (dr.Read())
                {
                    ny.Text = dr["jhnf"].ToString() + "年" + dr["jhyf"].ToString() + "工作计划";
                    ztmb.Text = dr["ztmb"].ToString();
                    zt.Text = dr["zt"].ToString();
                    spyj.Text = dr["spyj"].ToString();
                    zwpj.Text = dr["zwpj"].ToString();
                    zgpjnr.Text = dr["zgpjnr"].ToString();
                    df.Text = dr["zgpjfs"].ToString();
                    UserID.Text = dr["sprIDs"].ToString();
                    UserName.Text = dr["sprNames"].ToString();
                    dr.Close();
                }
                else
                {
                    dr.Close();
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }

                switch (zt.Text)
                {
                    case "录入":
                        AddBtn.Visible = true;
                        DelBtn.Visible = true;
                        DelJhBtn.Visible = true;
                        songshen.Visible = true;
                        SendBtn.Visible = true;
                        SaveBtn.Visible = true;
                        ztmb.ReadOnly = false;
                        //短信
                        dxtz.Visible = Convert.ToBoolean(hkdb.VeriSms());

                        //增加按钮 
                        AddBtn.Attributes.Add("onclick", "Javascript:popView('gzx_add.aspx?type=m&id=" + Request.QueryString["id"] + "');");
                        istr = "lr";
                        break;
                    case "审核中":
                        istr = "shz";
                        break;
                    case "评价中":
                        //songshen.Visible = true;
                        UpBtn.Visible = true;
                        spyjpanel.Visible = true;
                        zwpj.ReadOnly = false;
                        istr = "pjz";
                        break;
                    case "完成":
                        spyjpanel.Visible = true;
                        zgpjpanel.Visible = true;
                        istr = "wc";
                        break;
                }

                GridViewBind();
            }
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");
        }

        //gv绑定 
        public void GridViewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("select jhid,id,gzzt,jhkssj,jhwcsj from OA_GZJH02 where jhid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //保存 
        protected void Save_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("update OA_GZJH01 set ztmb='" + hkdb.GetStr(ztmb.Text) + "',sprIDs='" + hkdb.GetStr(UserID.Text) + "',sprNames='" + hkdb.GetStr(UserName.Text) + "' where jhid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");

            mydb.Alert_Refresh("保存成功！", "Wdjh.aspx");
        }

        //送审 
        protected void Send_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("update OA_GZJH01 set zt='审核中',lrsj=GETDATE(),sprIDs='" + hkdb.GetStr(UserID.Text) + "',sprNames='" + hkdb.GetStr(UserName.Text) + "' where zt='录入' and jhid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            
            //Msg 
            if (xxtz.Checked == true | dxtz.Checked == true)
            {
                string message = this.Session["username"].ToString() + "向您提交了一份工作计划,请审批!";

                hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), UserID.Text, message);
            }

            mydb.Alert_Refresh_Close("计划已成功送审！", "Wdjh.aspx");
        }

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            string cal = "";
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
                        cal = cal + "','" + GridView1.DataKeys[i].Value.ToString();
                    }
                }
            }
            if (!string.IsNullOrEmpty(cal))
            {
                SqlHelper.ExecuteSql("delete from OA_GZJH02 where id in ('" + cal + "')");
                mydb.Alert("删除成功！");
                GridViewBind();
            }
            else
            {
                mydb.Alert("删除失败,请先选中记录！");
            }
        }

        //提交评价 
        protected void Up_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("update oa_gzjh01 set zwpj='" + hkdb.GetStr(zwpj.Text) + "' where jhid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            //Msg 
            //if (xxtz.Checked == true | dxtz.Checked == true)
            //{
            //    string message = this.Session["username"].ToString() + "向您提交了一份工作计划的自我评价,请审批!";
            //    hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), spr.SelectedValue, message);
            //}
            mydb.Alert_Close("自我评价已成功提交！");
        }

        //删除计划
        protected void DelJh_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("delete from OA_GZJH02 where jhid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            SqlHelper.ExecuteSql("delete from OA_GZJH01 where jhid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            mydb.Alert_Refresh_Close("删除计划成功！", "Wdjh.aspx");
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
