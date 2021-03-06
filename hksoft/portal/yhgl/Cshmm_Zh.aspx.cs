﻿using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.portal.yhgl
{
    public partial class Cshmm_Zh : System.Web.UI.Page
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
                    SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT ProduID FROM hk_Init WHERE ProduID='G'");
                    if (datar2.Read())
                    {
                        p_gys.Visible = true;
                    }
                    datar2.Close();
                }
                else  //子登录页
                {
                    if (this.Session["systype"].ToString() == "M")
                    {
                        p_gys.Visible = true;
                    }
                }
            }
        }

        protected void Set_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT PWD FROM ZH_TENANT WHERE ZHBM='" + hkdb.GetStr(zhid.Text) + "'");
            if (dr.Read())
            {
                dr.Close();

                //MD5加密 
                byte[] data = System.Text.Encoding.Unicode.GetBytes(newpwd.Text.ToCharArray());
                System.Security.Cryptography.MD5CryptoServiceProvider md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
                byte[] result = md5.ComputeHash(data);
                string sResult = System.Text.Encoding.Unicode.GetString(result);
                string EnPswdStr = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(newpwd.Text.ToString(), "MD5");

                SqlHelper.ExecuteSql("UPDATE ZH_TENANT SET PWD='" + EnPswdStr + "' WHERE ZHBM='" + hkdb.GetStr(zhid.Text) + "' ");

                mydb.Alert("初始化成功，请牢记新密码！");
            }
            else
            {
                dr.Close();
                mydb.Alert("该租户编码不存在！");
            }
        }

        protected void zhid_TextChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT ZHMC FROM ZH_TENANT WHERE ZHBM='" + hkdb.GetStr(zhid.Text) + "'");
            if (dr.Read())
            {
                lblzhmc.Text = dr["ZHMC"].ToString();
                Page.SetFocus(newpwd);

                dr.Close();
            }
            else
            {
                dr.Close();

                zhid.Text = "";
                mydb.Alert("该租户编码不存在！");
            }
        }
    }
}
