using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro
{
    public partial class Mod_Pwd : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("1");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
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
                    
                    mydb.Alert("密码修改成功！");
                }
            }
            else
            {
                dr.Close();
                mydb.Alert("密码修改失败,此用户不存在！");
            }
        }
    }
}
