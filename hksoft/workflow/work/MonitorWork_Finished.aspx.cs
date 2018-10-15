using System;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class MonitorWork_Finished : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE hk_Work SET wStatus='强制结束',wUserIDs='强制结束',wUserNames='强制结束',LastTime=GETDATE() WHERE wID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            mydb.Alert_Refresh_Close("执行成功！","MonitorWork.aspx");
        }
    }
}
