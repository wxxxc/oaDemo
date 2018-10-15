using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.Choose.portal
{
    public partial class Spyjview : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("2");

            if (!IsPostBack)
            {
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
            string Str1 = " where fl='p03' and zt='正常'";
            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str1 = Str1 + " and mc like '%" + hkdb.GetStr(query_content.Text) + "%' ";
            }
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from hk_ZDYLX" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select mc from hk_ZDYLX" + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        //gv行处理 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
                e.Row.Attributes.Add("onclick", "javascript:chuan(this)");
            }
        }

        protected void set_null(object sender, EventArgs e)
        {
            Response.Write("<script language=javascript>");
            Response.Write("window.opener.document.getElementById(\"spyj\").value='';");
            Response.Write("window.close();<");
            Response.Write("/script>");
        }
    }
}
