using System;
using haoke365;

namespace hkpro
{
    public partial class AttDel : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("DELETE FROM hk_AttUpload WHERE attNewName='" + hkdb.GetStr(Request.QueryString["Number"]) + "'");
            mydb.Alert_Close("删除成功！");
        }
    }
}
