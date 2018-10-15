using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;
using System.Data;

namespace hksoft.oa.rwgl
{
    public partial class rwfabudanwei : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("13802", "13802");
                

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                GridViewBind();
            }
        }
    

        //查询 
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

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM OA_Rwfbdw " + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select * from OA_Rwfbdw " + Str1 + " order by num asc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }
      
    }
}
