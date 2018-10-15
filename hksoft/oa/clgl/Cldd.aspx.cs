using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.clgl
{
    public partial class Cldd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10804", "10804");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //Init 
                //txtSdate.Text = DateTime.Now.AddDays(-30).ToString("yyyy-MM-dd");
                txtSdate.Text = Request.Cookies["haoke"].Values["sdate"].ToString();
                txtEdate.Text = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");

                //页面绑定
                GridViewBind();
            }
        }

        //查询 
        protected void ChangeType(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            System.DateTime sdateStr = Convert.ToDateTime(txtSdate.Text);
            System.DateTime edateStr = Convert.ToDateTime(txtEdate.Text);

            string Str1 = "where sqsj>='" + sdateStr + "' and sqsj<='" + edateStr + "'";

            if (!string.IsNullOrEmpty(zt.SelectedValue))
            {
                Str1 = Str1 + " and a.zt='" + zt.SelectedValue + "'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from  OA_CLSQ a left outer join yh b on (a.sqr=b.ui_id) left outer JOIN BM c on (a.sqbm=c.bm_id)" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select a.*,b.ui_desc,c.bm_mc from OA_CLSQ a left outer join yh b on (a.sqr=b.ui_id) left outer JOIN BM c on (a.sqbm=c.bm_id)" + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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
