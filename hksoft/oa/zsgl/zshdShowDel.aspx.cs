using System;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class zshdShowDel : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql(" Delete from OA_KlAction where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' or ParentNodesID = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            mydb.Alert_Refresh_Close("提交成功！","zshdShow.aspx?id=" + Request.QueryString["Backid"] + "");
        }
    }
}
