using System;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Pwwh : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object Sender, EventArgs E)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("81104", "81104");

                DropDownListBind();

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                GridViewBind();
            }
        }

        //dp绑定 
        public void DropDownListBind()
        {
            //绑定部门
            bd.Bind_DropDownList_bm(ssbm,"","","");
        }

        //查询 
        public void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " WHERE 1=1";

            if (!string.IsNullOrEmpty(ssbm.SelectedValue))
            {
                Str1 = Str1 + " AND B.UI_SSBM= '" + ssbm.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str1 = Str1 + " AND " + query_tj.SelectedItem.Value + " LIKE '%" + hkdb.GetStr(query_content.Text) + "%'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM HR_Kpdf_Pw A LEFT OUTER JOIN YH B ON (A.PID=B.UI_ID)" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.* FROM HR_Kpdf_Pw A LEFT OUTER JOIN YH B ON (A.PID=B.UI_ID)" + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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
