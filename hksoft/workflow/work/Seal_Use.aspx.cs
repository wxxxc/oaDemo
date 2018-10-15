using System;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class Seal_Use : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                string sql_dpSeal = "SELECT sPicNewName,sName+'('+sType+')' AS sName FROM hk_Seal WHERE sUser='" + this.Session["userid"] + "' AND sStatus='正常'";
                bd.Bind_DropDownList(dpSeal, sql_dpSeal, "sPicNewName", "sName", "请选择", "请选择");
            }

            Button1.Attributes["onclick"] = "javascript:return chknull();";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string hashPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(sealpwd.Text, "MD5");

            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_Seal WHERE sPicNewName='" + dpSeal.SelectedValue + "' AND sPwd='" + hashPassword + "'");
            if (dr.Read())
            {
                SqlHelper.ExecuteSql("INSERT INTO hk_WorkSeal(wsNo,wsName,wsNewName,FK_uid,wsIP,AddTime) VALUES('" + hkdb.GetStr(Request.QueryString["Number"]) + "','" + dpSeal.SelectedItem.Text + "','" + dpSeal.SelectedValue + "','" + this.Session["userid"] + "','" + Page.Request.UserHostAddress + "',GETDATE())");
                SqlHelper.ExecuteSql("INSERT INTO hk_SealLog(slName,slNewName,FK_uid,slModu,Usetime,slIP) VALUES('" + dpSeal.SelectedItem.Text + "','" + dpSeal.SelectedValue + "','" + this.Session["userid"] + "','" + hkdb.GetStr(Request.QueryString["Number"]) + "',GETDATE(),'" + Page.Request.UserHostAddress + "')");
                this.Response.Write("<script language=javascript>window.opener.InserSeal('" + dpSeal.SelectedValue + "');window.close();</script>");
            }
            else
            {
                mydb.Alert("密码输入错误，请重试！");
            }
            dr.Close();
        }
    }
}
