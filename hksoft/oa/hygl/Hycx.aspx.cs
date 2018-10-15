using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.hygl
{
    public partial class Hycx : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10507", "10507");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //页面绑定
                GridViewBind();
            }
        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        public void GridViewBind()
        {
            string Str1 = " where a.zt<>'起草中'";
            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str1 = Str1 + " and " + query_tj.SelectedItem.Value + " like '%" + hkdb.GetStr(query_content.Text) + "%' ";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) as nums from oa_hyqc a" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select a.*,d.hys_mc,e.ui_desc,f.ui_desc as ui_desc2 from oa_hyqc a left outer join oa_hys d on (a.zkdd=d.hys_id) left outer join yh e on (a.fqr=e.ui_id) left outer join yh f on (a.spr=f.ui_id)" + Str1 + " order by a.fqsj desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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
