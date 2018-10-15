using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.bmgl
{
    public partial class Zwwh : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("60303", "60303");

                OperQx();

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //页面绑定 
                GridViewBind();
            }
        }

        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(AddBtn, "60303a", Session["roleqx"].ToString());
        }

        //查询 
        protected void ChangeType(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " WHERE 1=1";
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM ZW A" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.ZWID,A.ZWMC,A.ZWMS FROM ZW A " + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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
            }
        }
    }
}
