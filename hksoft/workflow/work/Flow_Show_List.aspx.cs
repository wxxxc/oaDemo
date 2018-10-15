using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class Flow_Show_List : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                lblwfno.Text = Request.QueryString["FlowNumber"].ToString();
                GridviewBind();
            }
        }

        public void GridviewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM hk_WorkFlowNode WHERE FK_wfno='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "'");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";

                Label lp = (Label)e.Row.FindControl("lblfnPosition");
                Label ln = (Label)e.Row.FindControl("lblNextNodeNum");
                Label lb = (Label)e.Row.FindControl("lblbase");
                if (lp.Text == "结束")
                {
                    lb.Text = "结束";
                }
                else
                {
                    lb.Text = ln.Text;
                }
            }
        }
    }
}
