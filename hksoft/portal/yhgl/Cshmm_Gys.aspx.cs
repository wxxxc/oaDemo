using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.portal.yhgl
{
    public partial class Cshmm_Gys : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("60311", "60311");

                if (this.Session["systype"].ToString() == "A")     //主登录页
                {
                    SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT ProduID FROM hk_Init WHERE ProduID='F'");
                    if (datar1.Read())
                    {
                        p_pms.Visible = true;
                    }
                    datar1.Close();
                }
                else  //子登录页
                {
                    if (this.Session["systype"].ToString() == "F")
                    {
                        p_pms.Visible = true;
                    }
                }
            }
        }

        //初始化密码
        protected void Set_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT UI_PWD FROM YH WHERE UI_ID='" + hkdb.GetStr(yhid.Text) + "' AND UI_LX='供应商'");
            if (dr.Read())
            {
                dr.Close();

                //MD5加密 
                byte[] data = System.Text.Encoding.Unicode.GetBytes(newpwd.Text.ToCharArray());
                System.Security.Cryptography.MD5CryptoServiceProvider md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
                byte[] result = md5.ComputeHash(data);
                string sResult = System.Text.Encoding.Unicode.GetString(result);
                string EnPswdStr = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(newpwd.Text.ToString(), "MD5");

                SqlHelper.ExecuteSql("UPDATE YH SET UI_PWD='" + EnPswdStr + "' WHERE UI_ID='" + hkdb.GetStr(yhid.Text) + "' AND UI_LX='供应商'");

                mydb.Alert("初始化成功，请牢记新密码！");
            }
            else
            {
                dr.Close();
                mydb.Alert("该供应商编码不存在！");
            }
        }

        protected void yhid_TextChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT UI_DESC FROM YH WHERE UI_ID='" + hkdb.GetStr(yhid.Text) + "' AND UI_LX='供应商'");
            if (dr.Read())
            {
                lblyhxm.Text = dr["UI_DESC"].ToString();
                Page.SetFocus(newpwd);

                dr.Close();
            }
            else
            {
                dr.Close();

                yhid.Text = "";
                mydb.Alert("该供应商编码不存在！");
            }
        }
    }
}
