using System;
using haoke365;

namespace hkpro
{
    public partial class InitMain_Del : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo_Close("Y") == "true")
            {
                return;
            }
            
            SqlHelper.ExecuteSql("delete from hk_MyDesk where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

            mydb.Alert_Refresh_Close("删除成功！", "initmain.aspx");
        }
    }
}
