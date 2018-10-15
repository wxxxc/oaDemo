using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.dxgl
{
    public partial class Dxczjl : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11004", "11004");

                OperQx();

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //页面绑定
                GridViewBind();
            }
        }

        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(AddBtn, "11004a", Session["roleqx"].ToString());
            hkdb.QxValid(DelBtn, "11004d", Session["roleqx"].ToString());
        }

        //gv绑定 
        public void GridViewBind()
        {
            string sql = " WHERE 1=1";
            if (!string.IsNullOrEmpty(hkdb.GetStr(query_content.Text)))
            {
                sql = sql + " AND " + hkdb.GetStr(query_tj.Text) + " like '%" + hkdb.GetStr(query_content.Text) + "%'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) AS NUMS FROM HK_DXCZD A" + sql);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,B.UI_DESC FROM HK_DXCZD A LEFT OUTER JOIN YH B ON (A.CZR=B.UI_ID)" + sql, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
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
                SqlHelper.ExecuteSql("DELETE FROM HK_DXCZD WHERE CZDH IN('" + cal + "')");
                GridViewBind();
            }
            else
            {
                mydb.Alert("删除失败,请先选中记录！");
            }
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        //刷新
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
