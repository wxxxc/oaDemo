using System;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class zsshowDel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("Delete from OA_KlComm where id='" + Request.QueryString["id"].ToString() + "'");
            mydb.Alert_Refresh_Close("删除成功！","zsshow.aspx?id=" + Request.QueryString["Backid"] + "");
        }
    }
}
