using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class Seal_UseLog : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            GridviewBind();
        }

        public void GridviewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,B.ui_desc FROM hk_WorkSeal A LEFT OUTER JOIN yh B ON(A.FK_uid=B.ui_id) WHERE wsNo='" + hkdb.GetStr(Request.QueryString["Number"]) + "' ORDER BY wsID DESC");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}
