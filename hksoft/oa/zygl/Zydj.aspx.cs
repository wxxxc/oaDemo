using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zygl
{
    public partial class Zydj : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        protected void Page_Load(object sender, EventArgs e)
        {

            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10501", "10501");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                dropdownlistBind();
                //页面绑定
                GridViewBind();
            }
        }

        //dp绑定
        public void dropdownlistBind()
        {
            string sql_zyflxz = "select flmc,flid from OA_ZYFL order by flid";
            bd.Bind_DropDownList_NoBlank(zyflxz, sql_zyflxz, "flid", "flmc", "", "");
        }

        //查询 
        protected void ChangeType(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定
        public void GridViewBind()
        {
            if (!string.IsNullOrEmpty(zyflxz.SelectedValue))
            {
                string Str1 = " where a.zyfl= '" + zyflxz.SelectedValue + "'";

                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from OA_ZYDJ a" + Str1);
                DataSet ds = SqlHelper.ExecuteDs("select a.*,b.bm_mc from OA_ZYDJ a left outer JOIN BM b on (a.szbm=b.bm_id) " + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
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

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            string cal = "";
            int i = 0;
            for (i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Rows[i].Cells[1].FindControl("del");
                if (cb.Checked == true)
                {
                    if (string.IsNullOrEmpty(cal))
                    {
                        cal = GridView1.DataKeys[i].Value.ToString();
                    }
                    else
                    {
                        cal = cal + "','" + GridView1.DataKeys[i].Value.ToString();
                    }
                }
            }

            if (!string.IsNullOrEmpty(cal))
            {
                int j = 0;
                j = (int)SqlHelper.ExecuteScalar("select count(*) from oa_zysq where sqzy in ('" + cal + "')");
                if (j > 0)
                {
                    mydb.Alert("删除失败,要删除的资源已存在申请记录！");
                }
                else
                {
                    SqlHelper.ExecuteSql("delete from OA_ZYDJ where djid in ('" + cal + "')");
                    mydb.Alert("删除成功！");
                    GridViewBind();
                }
            }
            else
            {
                mydb.Alert("删除失败,请先选中记录！");
            }
        }
    }
}
