using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.workflow.docu
{
    public partial class AdminDoc_Down : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_AdminDoc WHERE adNewName='" + hkdb.GetStr(Request.QueryString["number"]) + "'");
            if (datar1.Read())
            {
                Response.Redirect("../../Attach/flow/AdminDoc/" + Server.UrlDecode(Request.QueryString["number"]) + "");
            }
            else
            {
                mydb.Alert_Close("文件下载失败！");
            }
            datar1.Close();
        }
    }
}
