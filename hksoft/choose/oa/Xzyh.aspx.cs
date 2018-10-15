using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hksoft.choose.oa
{
    public partial class Xzyh : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                string sql_down_bh = "select bm_id,dLine+bm_mc as aaa from BM order by dQxStr asc";
                bd.Bind_DropDownList(Unit, sql_down_bh, "bm_id", "aaa", "", "");
            }

            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " where ui_lx='企业'";

            if (!string.IsNullOrEmpty(name.Text))
            {
                Str1 = Str1 + " AND ui_desc LIKE '%" + hkdb.GetStr(name.Text) + "%'";
            }

            if (!string.IsNullOrEmpty(Unit.SelectedValue))
            {
                Str1 = Str1 + " AND ui_ssbm='" + Unit.SelectedValue + "'";
            }

            DataSet ds = SqlHelper.ExecuteDs("select * from yh " + Str1);
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
            GridViewBind();
        }
    }
}