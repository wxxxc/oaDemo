using System;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class QueryWork_Finish : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE hk_Work SET wStatus='强制结束',wUserIDs='强制结束',wUserNames='强制结束',LastTime=GETDATE() WHERE wID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            mydb.Alert_Refresh_Close("工作已成功结束！","AddWork.aspx");   //SCM供应商使用时：需要重定向到AddWork.aspx
        }
    }
}
