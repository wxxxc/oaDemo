using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.clgl
{
    public partial class Jsyda : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10802", "10802");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //页面绑定
                GridViewBind();
            }
        }

        //gv绑定 
        public void GridViewBind()
        {
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from OA_JSYDA ");
            DataSet ds = SqlHelper.ExecuteDs("select * from OA_JSYDA", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
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
                j = (int)SqlHelper.ExecuteScalar("select count(*) from oa_clsq where jsy in ('" + cal + "')");
                if (j > 0)
                {
                    mydb.Alert("删除失败,要删除的驾驶员已存在记录！");
                }
                else
                {
                    SqlHelper.ExecuteSql("delete from OA_JSYDA where id in ('" + cal + "')");
                    mydb.Alert("删除成功！");
                    GridViewBind();
                }
            }
            else
            {
                mydb.Alert("删除失败,请先选中记录！");
            }
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
