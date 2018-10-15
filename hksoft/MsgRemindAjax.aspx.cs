using System;
using haoke365;

namespace hksoft
{
    public partial class MsgRemindAjax : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("1");

            int newID = (Int32)SqlHelper.ExecuteScalar("SELECT COUNT(*)AS NUMS FROM hk_Mess_JS WHERE jsr='" + this.Session["userid"] + "' AND zt='0'");
            if (newID > 0)
            {
                Response.Write("1");
            }
            else
            {
                Response.Write("0");
            }

            SqlHelper.ExecuteSql("UPDATE YH SET LASTTIME=GETDATE() WHERE UI_ID='" + this.Session["userid"] + "'");
        }
    }
}