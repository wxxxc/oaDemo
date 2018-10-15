using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class wdzs_show_state : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        public static string ShowTitle, State;

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10111", "0");

                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KnowLedge  where id='" + hkdb.GetStr(Request.QueryString["id"]) + "'  ");
                if (datar.Read())
                {
                    ShowTitle = datar["Title"].ToString();
                    State = datar["State"].ToString();
                }
                datar.Close();

                if (State == "等待审批")
                {
                    Panel2.Visible = true;
                }

                if (State == "禁止发布")
                {
                    Panel4.Visible = true;
                }

                if (State == "暂存")
                {
                    Panel1.Visible = true;
                }

                if (State == "正常")
                {
                    Panel5.Visible = true;
                }

                if (State == "用户终止")
                {
                    Panel3.Visible = true;
                }
            }
        }

        protected void BtnS_Click(object sender, EventArgs e)
        {
            string KmManger = null;
            SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KlManger ");
            if (datar.Read())
            {
                KmManger = datar["realname"].ToString();
            }
            datar.Close();

            SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + KmManger.TrimEnd(',') + "','您有新的知识需要审批，请注意查看！'");

            SqlHelper.ExecuteSql("Update OA_KnowLedge  Set State='等待审批'  where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            mydb.Alert_Refresh_Close("提交成功，请等待审批！", "wdzs.aspx?LittleId=" + Request.QueryString["LittleId"] + "");
        }

        protected void Btnkq_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("Update OA_KnowLedge  Set State='正常'  where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            mydb.Alert_Refresh_Close("提交成功，状态改变为［正常］！", "wdzs.aspx?LittleId=" + Request.QueryString["LittleId"] + "");
        }

        protected void BtnSa_Click(object sender, EventArgs e)
        {
            string KmManger = null;

            SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KlManger ");
            if (datar.Read())
            {
                KmManger = datar["realname"].ToString();
            }
            datar.Close();

            SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + KmManger.TrimEnd(',') + "','您有新的知识需要审批，请注意查看！'");

            SqlHelper.ExecuteSql("Update OA_KnowLedge  Set State='等待审批'  where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            mydb.Alert_Refresh_Close("提交成功，请等待审批！", "wdzs.aspx?LittleId=" + Request.QueryString["LittleId"] + "");
        }

        protected void Btnstop_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("update OA_KnowLedge Set State='用户终止' where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            mydb.Alert_Refresh_Close("提交成功，状态改变为［用户终止］！", "wdzs.aspx?LittleId=" + Request.QueryString["LittleId"] + "");
        }
    }
}
