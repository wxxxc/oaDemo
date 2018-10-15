using System;
using haoke365;

namespace hksoft
{
    public partial class myMsgRemindAjax : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("1");

            SqlHelper.ExecuteSql("UPDATE YH SET LASTTIME=GETDATE() WHERE UI_ID='" + this.Session["userid"] + "'");
        }
    }
}