using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class HandleWork_Finished : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11402", "11402");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                BindDplist();
            }

            GridviewBind();
        }

        public void BindDplist()
        {
            string sql_fname = "SELECT fID,fName FROM hk_Form ORDER BY fID DESC";
            bd.Bind_DropDownList(dp_fname, sql_fname, "fID", "fName", "0", "所有表单类型");
        }

        public void GridviewBind()
        {
            string Str1 = string.Empty;
            if (dp_fname.SelectedValue != "0")
            {
                Str1 = Str1 + " and A.FK_fid ='" + dp_fname.SelectedValue + "'";
            }

            if (fName.Text != "")
            {
                Str1 = Str1 + " and B.fName like '%" + hkdb.GetStr(fName.Text) + "%'";
            }

            if (wName.Text != "")
            {
                Str1 = Str1 + " and A.wName like '%" + hkdb.GetStr(wName.Text) + "%'";
            }

            if (fnName.Text != "")
            {
                Str1 = Str1 + " and C.fnName like '%" + hkdb.GetStr(fnName.Text) + "%'";
            }

            if (wTitle.Text != "")
            {
                Str1 = Str1 + " and A.wTitle like '%" + hkdb.GetStr(wTitle.Text) + "%'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM hk_Work A LEFT OUTER JOIN hk_Form B ON(A.FK_fid=B.fID) LEFT OUTER JOIN hk_WorkFlowNode C ON(A.FK_fnno=C.fnNo) WHERE (CHARINDEX('," + this.Session["userid"].ToString() + ",',','+EndUserIDs+',') > 0)" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,B.fName,C.fnName,D.ui_desc FROM hk_Work A LEFT OUTER JOIN hk_Form B ON(A.FK_fid=B.fID) LEFT OUTER JOIN hk_WorkFlowNode C ON(A.FK_fnno=C.fnNo) LEFT OUTER JOIN yh D ON(A.PromoterID=D.ui_id) WHERE (CHARINDEX('," + this.Session["userid"].ToString() + ",',','+EndUserIDs+',') > 0)" + Str1 + " ORDER BY A.wID DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void Query_Click(object sender, EventArgs e)
        {
            GridviewBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridviewBind();
        }

        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}
