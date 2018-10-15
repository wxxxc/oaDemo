using System;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class AppComm_Del : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("DELETE FROM hk_WorkAppComm WHERE acID='" + hkdb.GetStr(Request.QueryString["acid"]) + "'");
            mydb.Alert_Refresh_Close("删除成功！","AppComm.aspx?id=" + Request.QueryString["wfid"] + "");
        }
    }
}
