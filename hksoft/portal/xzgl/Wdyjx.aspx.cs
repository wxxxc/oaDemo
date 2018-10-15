using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Wdyjx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10114", "10114");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //页面绑定 
                GridViewBind();
            }
        }

        //gv绑定 
        public void GridViewBind()
        {
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM HK_WDYJ A LEFT OUTER JOIN HK_YJX B ON(A.YJX=B.ID) WHERE B.GLY='" + this.Session["userid"] + "' AND A.ZT='" + tj.SelectedValue + "'");
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,B.MC FROM HK_WDYJ A LEFT OUTER JOIN HK_YJX B ON(A.YJX=B.ID) WHERE B.GLY='" + this.Session["userid"] + "' AND A.ZT='" + tj.SelectedValue + "' ORDER BY A.FBSJ DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //选择 
        protected void Select_Click(object sender, EventArgs e)
        {
            GridViewBind();
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
