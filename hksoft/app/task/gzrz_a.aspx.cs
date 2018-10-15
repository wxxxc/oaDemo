using haoke365;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hksoft.app.task
{
    public partial class gzrz_a : System.Web.UI.Page
    {
        SqlConnection Cnn;
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                hkdb.PassTo("10106", "10106");


            }
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from  hk_wdrc where syz='" + this.Session["userid"] + "'");
            DataSet ds = SqlHelper.ExecuteDs("select * from  hk_wdrc where syz='" + this.Session["userid"] + "'  order by cjsj desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            ListView1.DataSource = ds;
            ListView1.DataBind();
        }
        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }
        //gv行处理 
        //protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
        //    }
        //}
    }
}