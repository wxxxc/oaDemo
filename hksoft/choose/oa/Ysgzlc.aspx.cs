using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hksoft.choose.oa
{
    public partial class Ysgzlc : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                name.Attributes["onkeydown"] = "if (event.keyCode==13) { document.all.Button4.click(); return false;}";
                requeststr.Text = Server.UrlDecode(Request.QueryString["requeststr"].ToString());
            }

            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " where (CHARINDEX('," + this.Session["deptid"] + ",',','+FlowUnitId+',')>0) and FormId='" + Request.QueryString["FormId"] + "'";

            if (!string.IsNullOrEmpty(name.Text))
            {
                Str1 = Str1 + " AND FlowName like '%" + name.Text + "%'";
            }

            DataSet ds = SqlHelper.ExecuteDs("select * from YS_WorkFlow" + Str1);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.GridView1.PageIndex = e.NewPageIndex;
            GridViewBind();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Ysgzlc.aspx?str=" + name.Text + "&requeststr=" + Server.UrlDecode(Request.QueryString["requeststr"].ToString()) + "");
            GridViewBind();
        }
    }
}