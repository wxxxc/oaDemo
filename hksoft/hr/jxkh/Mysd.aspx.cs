using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Mysd : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("1");
        }

        public void Save_Click(object Sender, EventArgs E)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT CXMY FROM HR_Kpdf_PW WHERE PID='" + this.Session["userid"] + "'");
            if (dr.Read())
            {
                string pwdstr = dr["CXMY"].ToString().Trim();
                dr.Close();

                //加密
                byte[] data = System.Text.Encoding.Unicode.GetBytes(oldpwd.Text.ToCharArray());
                System.Security.Cryptography.MD5CryptoServiceProvider md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
                byte[] result = md5.ComputeHash(data);
                string sResult = System.Text.Encoding.Unicode.GetString(result);
                string EnPswdStr = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(oldpwd.Text.ToString(), "MD5");

                //对比
                if (EnPswdStr != pwdstr)
                {
                    mydb.Alert("原查询密钥错误！");
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
                    SqlHelper.ExecuteSql("UPDATE HR_Kpdf_PW SET CXMY='" + EnPswdStr_n + "' WHERE PID='" + this.Session["userid"] + "'");

                    mydb.Alert("查询密钥修改成功！");
                }
            }
            else
            {
                dr.Close();
                mydb.Alert("警告，该评委不存在，可能已被删除！");
            }
        }
    }
}
