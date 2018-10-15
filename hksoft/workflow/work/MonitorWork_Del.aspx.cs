using System;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class MonitorWork_Del : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            //日志
            string strTitle = SqlHelper.ExecuteScalar("SELECT wTitle FROM hk_Work WHERE wID='" + hkdb.GetStr(Request.QueryString["id"]) + "'").ToString();
            mydb.InsertLog("删除标题为【" + strTitle + "】的工作记录", "11404");

            SqlHelper.ExecuteSql("DELETE FROM hk_Work WHERE wID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");

            mydb.Alert_Refresh_Close("删除成功！","MonitorWork.aspx");
        }
    }
}
