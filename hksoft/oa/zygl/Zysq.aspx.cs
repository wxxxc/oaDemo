using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zygl
{
    public partial class Zysq : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10108", "10108");

                dropdownlistBind();
            }

            GridViewBindzy();
            GridViewBindcl();
        }

        //dp绑定 
        public void dropdownlistBind()
        {
            string sql_zyflxz = "select flmc,flid from OA_ZYFL order by flid";
            bd.Bind_DropDownList_NoBlank(zyflxz, sql_zyflxz, "flid", "flmc", "", "");

        }

        //车辆
        public void GridViewBindcl()
        {
            SqlDataSource2.SelectCommand = "";
            SqlDataSource2.SelectCommand = "select * from OA_CLSQ where sqr='" + this.Session["userid"] + "'";
        }

        //查询 
        protected void ChangeType(object sender, EventArgs e)
        {
            GridViewBindzy();
            GridViewBindcl();
        }

        //资源 
        public void GridViewBindzy()
        {
            if (!string.IsNullOrEmpty(zyflxz.SelectedValue))
            {
                SqlDataSource1.SelectCommand = "";
                SqlDataSource1.SelectCommand = "select (case when(getdate()>ghsj) then '已过期' else a.zt end)as ztmc,a.sqid,a.sysj,a.ghsj,a.zt,b.bm_mc,c.zymc from OA_ZYSQ a left outer JOIN BM b on (a.sybm=b.bm_id) left outer join OA_ZYDJ c on (a.sqzy=c.djid) where sqr='" + this.Session["userid"] + "' and c.zyfl='" + zyflxz.SelectedValue + "' and c.zt='可用'";
            }
        }

        protected void OnRow_Boundzy(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }

        //gv行处理 
        protected void OnRow_Boundcl(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }

        //排序
        protected void GridViewzy_DataBound(object sender, System.EventArgs e)
        {
            GridViewRow headerRow = GridViewzy.HeaderRow;
            string strSortExpression = GridViewzy.SortExpression;
            int i = 0;
            for (i = 0; i <= GridViewzy.Columns.Count - 1; i += i + 1)
            {
                string strColumnExpression = GridViewzy.Columns[i].SortExpression;
                if ((strSortExpression == strColumnExpression) & (!string.IsNullOrEmpty(strSortExpression)))
                {
                    Image img = new Image();
                    if (GridViewzy.SortDirection.ToString() == "Ascending")
                    {
                        img.ImageUrl = "../../images/Up.gif";
                        img.ToolTip = "Ascending";
                    }
                    else
                    {
                        img.ImageUrl = "../../images/Down.gif";
                        img.ToolTip = "Descending";
                    }
                    try
                    {
                        headerRow.Cells[i].Controls.Add(new LiteralControl(" "));
                        headerRow.Cells[i].Controls.Add(img);
                    }
                    catch (Exception ex)
                    {
                        this.Response.Write("Error Message:" + ex.Message.ToString());
                        this.Response.End();
                    }
                }
            }
        }

        //排序
        protected void GridViewcl_DataBound(object sender, System.EventArgs e)
        {
            GridViewRow headerRow = GridViewcl.HeaderRow;
            string strSortExpression = GridViewcl.SortExpression;
            int i = 0;
            for (i = 0; i <= GridViewcl.Columns.Count - 1; i += i + 1)
            {
                string strColumnExpression = GridViewcl.Columns[i].SortExpression;
                if ((strSortExpression == strColumnExpression) & (!string.IsNullOrEmpty(strSortExpression)))
                {
                    Image img = new Image();
                    if (GridViewcl.SortDirection.ToString() == "Ascending")
                    {
                        img.ImageUrl = "../../images/Up.gif";
                        img.ToolTip = "Ascending";
                    }
                    else
                    {
                        img.ImageUrl = "../../images/Down.gif";
                        img.ToolTip = "Descending";
                    }
                    try
                    {
                        headerRow.Cells[i].Controls.Add(new LiteralControl(" "));
                        headerRow.Cells[i].Controls.Add(img);
                    }
                    catch (Exception ex)
                    {
                        this.Response.Write("Error Message:" + ex.Message.ToString());
                        this.Response.End();
                    }
                }
            }
        }
    }
}
