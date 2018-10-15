using System;
using haoke365;

namespace hkpro.workflow.form
{
    public partial class FormDesign_Add_cldel : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("DELETE FROM hk_FormColumn WHERE clNo='" + hkdb.GetStr(Request.QueryString["Number"]) + "'");
            mydb.Alert_Close("字段删除完成！");
        }
    }
}
