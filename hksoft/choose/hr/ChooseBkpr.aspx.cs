using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.Choose.oa
{
    public partial class ChooseBkpr : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object Sender, EventArgs E)
        {
            hkdb.VeriSess("2");

            if (!IsPostBack)
            {
                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                DropDownListBind();

                GridViewBind();
            }
        }

        //dp绑定 
        public void DropDownListBind()
        {
            bd.Bind_DropDownList_bm(Dept, "", "", "");
        }

        //查询 
        public void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " WHERE a.UI_LX='企业'";

            if (!string.IsNullOrEmpty(Dept.SelectedValue))
            {
                Str1 = Str1 + " and ui_ssbm='" + Dept.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str1 = Str1 + " and " + query_tj.SelectedValue + " like '%" + hkdb.GetStr(query_content.Text) + "%' ";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*)AS NUMS FROM yh A " + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.ui_id,A.ui_desc,B.bm_mc,C.zwmc FROM yh A LEFT OUTER JOIN BM B ON (a.ui_ssbm=B.bm_id) LEFT OUTER JOIN ZW C ON(A.ui_zw=C.zwid)" + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        //gv行处理 
        public void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}
