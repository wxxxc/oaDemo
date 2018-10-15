using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class AppComm : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            GridviewBind();
        }

        public void GridviewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,B.ui_desc FROM hk_WorkAppComm A LEFT OUTER JOIN yh B ON(A.FK_uid=B.ui_id) WHERE ac_wfID='" + hkdb.GetStr(Request.QueryString["id"]) + "' AND ac_Status='有效' ORDER BY acID");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";

                Label ln = (Label)e.Row.FindControl("lblacID");
                Label ll = (Label)e.Row.FindControl("lbltxt");
                ll.Text = null;

                if (this.Session["UserID"].ToString() == "admin")
                {
                    ll.Text = "<a href='#' onclick='if (!confirm(\"是否确定删除？\")) return false;window.open (\"AppComm_Del.aspx?wfid=" + Request.QueryString["id"] + "&acid=" + ln.Text + "\", \"_blank\", \"height=1, width=1,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=110,left=110\")' class='gvlink'>删除</a>";
                }
            }
        }
    }
}
