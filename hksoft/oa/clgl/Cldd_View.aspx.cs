using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.clgl
{
    public partial class Cldd_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10804", "0");

                //短信
                dxtz.Visible = Convert.ToBoolean(hkdb.VeriSms());

                SqlDataReader datar = SqlHelper.ExecuteReader("select a.*,b.bm_mc from oa_clsq a left outer JOIN BM b on (a.sqbm=b.bm_id) where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (datar.Read())
                {
                    if (datar["zt"].ToString() == "审批中")
                    {
                        DropDownListBind();
                    }

                    if (datar["zt"].ToString() == "已同意")
                    {
                        SpBtn.Visible = false;
                        ThBtn.Visible = false;
                        DropDownListBind_ty();
                        xzcl.Enabled = false;
                        xzjsy.Enabled = false;
                        spyj.Enabled = false;

                        Panelghsm.Visible = true;
                        QRGH.Visible = true;
                        ghsm.Enabled = true;
                    }
                    if (datar["zt"].ToString() == "已归还")
                    {
                        SpBtn.Visible = false;
                        ThBtn.Visible = false;
                        DropDownListBind_ty();
                        xzcl.Enabled = false;
                        xzjsy.Enabled = false;
                        spyj.Enabled = false;

                        Panelghsm.Visible = true;
                        QRGH.Visible = false;
                        ghsm.Enabled = false;
                    }
                    if (datar["zt"].ToString() == "已拒绝")
                    {
                        SpBtn.Visible = false;
                        ThBtn.Visible = false;
                        DropDownListBind_ty();
                        xzcl.Enabled = false;
                        xzjsy.Enabled = false;
                        spyj.Enabled = false;

                        QRGH.Visible = false;
                        Panelghsm.Visible = false;
                    }

                    sqbm.Text = datar["bm_mc"].ToString();
                    ccxs.SelectedValue = datar["ccxs"].ToString();
                    fcdd.Text = datar["fcdd"].ToString();
                    dddd.Text = datar["dddd"].ToString();
                    czrs.Text = datar["czrs"].ToString();
                    ccsy.Text = datar["ccsy"].ToString();
                    xycl.SelectedValue = datar["xycl"].ToString();
                    jsy.SelectedValue = datar["jsy"].ToString();
                    xzjsy.SelectedValue = datar["jsy"].ToString();
                    xzcl.SelectedValue = datar["xycl"].ToString();
                    bz.Text = datar["bz"].ToString();
                    kssj.Text = datar["xssj_s"].ToString();
                    jssj.Text = datar["xssj_e"].ToString();
                    spyj.Text = datar["spyj"].ToString();
                    ghsm.Text = datar["ghsm"].ToString();
                    ycxx.Text = datar["sqr"].ToString();

                }
                else
                {
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }
                datar.Close();
            }
        }

        //dp绑定 
        public void DropDownListBind()
        {
            //申请车辆
            string sql_xycl = "select clmc,id from OA_CLDA order by id";
            bd.Bind_DropDownList(xycl, sql_xycl, "id", "clmc", "", "");

            //分配车辆
            string sql_xzcl = "select clmc,id from OA_CLDA where clzt='未借出' order by id";
            bd.Bind_DropDownList(xzcl, sql_xzcl, "id", "clmc", "", "");

            //申请驾驶员
            string sql_jsy = "select xm,id from OA_JSYDA order by id";
            bd.Bind_DropDownList(jsy, sql_jsy, "id", "xm", "未选择驾驶员", "未选择驾驶员");

            //分配驾驶员
            string sql_xzjsy = "select xm,id from OA_JSYDA order by id";
            bd.Bind_DropDownList(xzjsy, sql_xzjsy, "id", "xm", "", "");

        }

        public void DropDownListBind_ty()
        {
      
            string sql_xycl = "select clmc,id from OA_CLDA order by id";
            bd.Bind_DropDownList(xycl, sql_xycl, "id", "clmc", "", "");


            string sql_xzcl = "select clmc,id from OA_CLDA order by id";
            bd.Bind_DropDownList(xzcl, sql_xzcl, "id", "clmc", "", "");


            string sql_jsy = "select xm,id from OA_JSYDA order by id";
            bd.Bind_DropDownList(jsy, sql_jsy, "id", "xm", "未选择驾驶员", "未选择驾驶员");


            string sql_xzjsy = "select xm,id from OA_JSYDA order by id";
            bd.Bind_DropDownList(xzjsy, sql_xzjsy, "id", "xm", "", "");

        }

        //同意申请
        protected void shenpi_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(spyj.Text))
            {
                SqlHelper.ExecuteSql("update OA_CLSQ set zt='已同意',jsy='" + xzjsy.SelectedValue + "',xycl='" + xzcl.SelectedValue + "',spr='" + this.Session["userid"] + "',spsj=GETDATE(),spyj='" + hkdb.GetStr(spyj.Text) + "' where zt='审批中' and id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                SqlHelper.ExecuteSql("update OA_CLDA set clzt='已借出' where id='" + xzcl.SelectedValue + "'");
                Dxyj_Click("1");
                mydb.Alert_Refresh_Close("已同意车辆申请！", "Cldd.aspx");
            }
        }

        //拒绝申请 
        protected void TuiHui_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(spyj.Text))
            {
                SqlHelper.ExecuteSql("update OA_CLSQ set zt='已拒绝',spr='" + this.Session["userid"] + "',spsj=GETDATE(),spyj='" + hkdb.GetStr(spyj.Text) + "' where zt='审批中' and id='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                Dxyj_Click("3");
                mydb.Alert_Refresh_Close("已拒绝车辆申请！", "Cldd.aspx");
            }
            else
            {
                mydb.Alert("请录入审批意见！");
            }
        }

        //归还
        protected void QRGH_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ghsm.Text))
            {
                SqlHelper.ExecuteSql("update OA_CLSQ set zt='已归还',ghsj=GETDATE(),ghsm='" + hkdb.GetStr(ghsm.Text) + "' where zt='已同意' and id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                SqlHelper.ExecuteSql("update OA_CLDA set clzt='未借出' where id='" + xzcl.SelectedValue + "'");
                Dxyj_Click("2");
                mydb.Alert_Refresh_Close("已确认归还成功！", "Cldd.aspx");
            }
            else
            {
                mydb.Alert("请录入归还说明！");
            }
        }

        //消息短信
        protected void Dxyj_Click(string mess)
        {
            //Msg 
            if (xxtz.Checked == true | dxtz.Checked == true)
            {
                string message = null;

                if (mess == "1")
                {
                    message = this.Session["username"].ToString() + "已同意您的车辆申请,车辆:[" + xzcl.SelectedItem.Text + "]驾驶员[" + xzjsy.SelectedItem.Text + "]!";
                }
                else if (mess == "2")
                {
                    message = "您使用的[" + xzcl.SelectedItem.Text + "]车辆已确认归还!" + this.Session["username"].ToString();
                }
                else
                {
                    message = "您申请使用的[" + xycl.SelectedItem.Text + "]已被拒绝,请登录平台查看详细信息!" + this.Session["username"].ToString();
                }

                hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), ycxx.Text, message);
            }
        }
    }
}
