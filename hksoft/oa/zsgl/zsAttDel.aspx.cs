using System;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class zsAttDel : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("DELETE FROM OA_KlChapAtt WHERE NewName='" + hkdb.GetStr(Request.QueryString["Number"]) + "'");
            mydb.Alert_Close("删除成功！");
        }
    }
}
