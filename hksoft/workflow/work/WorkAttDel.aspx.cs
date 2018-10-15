using System;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class WorkAttDel : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("DELETE FROM hk_AttUpload WHERE attNewName='" + hkdb.GetStr(Request.QueryString["Number"]) + "' AND attClass='w01'");
            mydb.Alert_Close("删除成功！");
        }
    }
}
