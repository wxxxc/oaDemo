using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class zssp_view : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("12107", "0");

                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KnowLedge where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' and  State='等待审批'");
                if (datar.Read())
                {
                    TitleName.Text = datar["Title"].ToString();
                    Content.Text = datar["Content"].ToString();
                    State.Text = datar["State"].ToString();
                    Username.Text = datar["Username"].ToString();
                    Realname.Text = datar["Realname"].ToString();
                }
                datar.Close();
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (Shenpi.SelectedValue == "通过")
            {
                SqlHelper.ExecuteSql("Update OA_KnowLedge    Set State='正常',SpTime='" + System.DateTime.Now.ToString() + "' where id='" + int.Parse(Request.QueryString["id"]) + "'");
                SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + hkdb.GetStr(Username.Text) + "','您的知识[" + hkdb.GetStr(TitleName.Text) + "]已经通过审批，请注意查看！'");
            }
            else
            {
                SqlHelper.ExecuteSql("Update OA_KnowLedge    Set State='禁止发布', SpTime='" + System.DateTime.Now.ToString() + "'  where id='" + int.Parse(Request.QueryString["id"]) + "'");
                SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + hkdb.GetStr(Username.Text) + "','您的知识[" + hkdb.GetStr(TitleName.Text) + "]被拒绝审批，请注意查看！'");
            }

            mydb.Alert_Refresh_Close("知识审批成功！", "zssp.aspx");
        }
    }
}
