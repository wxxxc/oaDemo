using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;
using System.Data;

namespace hksoft.choose.oa
{
    public partial class rwview_dw : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("2");

            if (!IsPostBack)
            {
                GridViewBind();
            }
        }
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }
        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = "";
            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str1 = "where name like '%" + query_content.Text + "%'";
            }
            DataSet ds = SqlHelper.ExecuteDs("select * from OA_Rwfbdw " + Str1 + " order by num asc");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }
        protected void set_null(object sender, EventArgs e)
        {
            Response.Write("<script language=javascript>");
            Response.Write("window.opener.document.getElementById(\"jsdx\").value='';");
            Response.Write("window.close();<");
            Response.Write("/script>");
        }
    }
}