using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.app.portal
{
    public partial class Mod_Pwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("9");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (this.Session["demo"].ToString() == "Y")
            {
                lblMsg.Text = "对不起。为确保其它用户的测试体验，试用环境下不能执行此操作！";
                return;
            }

            SqlDataReader dr = SqlHelper.ExecuteReader("select ui_pwd from yh where ui_id='" + this.Session["userid"] + "'");
            if (dr.Read())
            {
                string pwdstr = dr["ui_pwd"].ToString().Trim();
                dr.Close();

                //加密密码 
                byte[] data = System.Text.Encoding.Unicode.GetBytes(oldpwd.Text.ToCharArray());
                System.Security.Cryptography.MD5CryptoServiceProvider md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
                byte[] result = md5.ComputeHash(data);
                string sResult = System.Text.Encoding.Unicode.GetString(result);
                string EnPswdStr = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(oldpwd.Text.ToString(), "MD5");
                //对比密码 
                if (EnPswdStr != pwdstr)
                {
                    mydb.Alert("原密码错误！");
                }
                else
                {
                    //MD5加密 
                    byte[] data_n = System.Text.Encoding.Unicode.GetBytes(newpwd.Text.ToCharArray());
                    System.Security.Cryptography.MD5CryptoServiceProvider md5_n = new System.Security.Cryptography.MD5CryptoServiceProvider();
                    byte[] result_n = md5.ComputeHash(data);
                    string sResult_n = System.Text.Encoding.Unicode.GetString(result);
                    string EnPswdStr_n = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(newpwd.Text.ToString(), "MD5");
                    
                    //正式修改 
                    SqlHelper.ExecuteSql("UPDATE YH SET UI_PWD='" + EnPswdStr_n + "' WHERE UI_ID='" + this.Session["userid"] + "'");
                    mydb.Alert_Goto("修改保存成功", "Set.aspx");
                }
            }
            else
            {
                dr.Close();
                mydb.Alert( "警告，该用户不存在，可能已被删除！");
            }
        }
    }
}
