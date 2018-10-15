using System;
using System.Data.SqlClient;
using System.Web.Security;
using haoke365;

namespace hkpro.workflow.seal
{
    public partial class MySignet_Mod1 : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM hk_Seal WHERE sID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (datar.Read())
                {
                    sName.Text = datar["sName"].ToString();
                    sRemark.Text = datar["sRemark"].ToString();
                }
                datar.Close();
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //MD5加密
            string soldPwdStr = FormsAuthentication.HashPasswordForStoringInConfigFile(oldsPwd.Text.ToString(), "MD5");
            string snewPwdStr = FormsAuthentication.HashPasswordForStoringInConfigFile(newsPwd.Text.ToString(), "MD5");

            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_Seal WHERE sID='" + hkdb.GetStr(Request.QueryString["id"]) + "' AND sPwd='" + soldPwdStr + "'");
            if (dr.Read())
            {
                SqlHelper.ExecuteSql("UPDATE hk_Seal SET sName='" + hkdb.GetStr(sName.Text) + "',sPwd='" + snewPwdStr + "',sRemark='" + hkdb.GetStr(sRemark.Text) + "',ModUser='" + this.Session["userid"] + "',ModTime=GETDATE() WHERE sID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                mydb.Alert_Goto("保存成功！", "MySignet.aspx");
            }
            else
            {
                dr.Close();
                mydb.Alert("原印章密码输入错误，请重试！");
                return;
            }
        }
    }
}
