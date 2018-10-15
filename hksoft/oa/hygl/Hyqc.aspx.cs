using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.hygl
{
    public partial class Hyqc : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10107", "10107");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //页面绑定
                GridViewBind();
            }
        }

        //gv绑定 
        public void GridViewBind()
        {
            string sql = " where fqr='" + this.Session["userid"] + "'";

            if (!string.IsNullOrEmpty(tj.Text))
            {
                sql = sql + " and a.hyzt like '%" + hkdb.GetStr(tj.Text) + "%'";
            }

            if (!string.IsNullOrEmpty(jszt.SelectedValue))
            {
                sql = sql + " and a.zt='" + jszt.SelectedValue + "'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from oa_hyqc a" + sql);
            DataSet ds = SqlHelper.ExecuteDs("select a.*,d.hys_mc from oa_hyqc a left outer join oa_hys d on (a.zkdd=d.hys_id)" + sql + " order by a.fqsj desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        //查询
        protected void Ref_Click(object sender, EventArgs e)
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
