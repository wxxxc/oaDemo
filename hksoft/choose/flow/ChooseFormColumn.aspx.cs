using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.Choose.flow
{
    public partial class ChooseFormColumn : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("2");

            if (!IsPostBack)
            {
                name.Attributes["onkeydown"] = "if (event.keyCode==13) { document.all.QueBtn.click(); return false;}";
                rqstr.Text = Server.UrlDecode(Request.QueryString["rqstr"].ToString());
            }

            GridviewBind();
        }

        public void GridviewBind()
        {
            if (Request.QueryString["str"] != null)
            {
                DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM hk_FormColumn WHERE FK_fno='" + hkdb.GetStr(Request.QueryString["FormNumber"]) + "' AND clName LIKE '%" + Server.UrlDecode(Request.QueryString["str"]) + "%' ORDER BY clID DESC");
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM hk_FormColumn WHERE FK_fno='" + hkdb.GetStr(Request.QueryString["FormNumber"]) + "' ORDER BY clID DESC");
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }

        protected void QueBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChooseFormColumn.aspx?str=" + name.Text + "&rqstr=" + Server.UrlDecode(Request.QueryString["rqstr"].ToString()) + "&FormNumber=" + Request.QueryString["FormNumber"] + "");
        }

        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";      //单击变色
            }
        }
    }
}
