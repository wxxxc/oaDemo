using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Kqsmqr : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11718", "11718");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                GridViewBind();
            }
        }

        //刷新 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        public void GridViewBind()
        {
            string Str1 = " WHERE CHARINDEX('" + this.Session["userid"] + "',jsrIDs)>0 AND SMZT='已审批'";

            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str1 = Str1 + " AND " + query_tj.SelectedItem.Value + " like '%" + hkdb.GetStr(query_content.Text) + "%'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*)AS NUMS FROM OA_KQ_SM01 A" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.* FROM OA_KQ_SM01 A " + Str1 + " ORDER BY SSSJ DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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
