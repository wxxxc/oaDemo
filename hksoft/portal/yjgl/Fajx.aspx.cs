using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.yjgl
{
    public partial class Fajx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10102,1002", "0");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                GridViewBind();
            }
        }

        //刷新
        protected void Receive_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        public void GridViewBind()
        {
            string str1 = " WHERE FSRID='" + this.Session["userid"] + "' AND SCBZ='否' AND YNCG='否'";

            if (!string.IsNullOrEmpty(jsfa.SelectedValue))
            {
                str1 += " AND ZYJB='" + jsfa.SelectedValue + "'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) AS NUMS FROM hk_Mail_FS A" + str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT *,ISNULL((SELECT TOP 1 'y' FROM hk_AttUpload WHERE attKey=A.yjfj),'n')AS FJBZ FROM hk_Mail_FS A" + str1 + " ORDER BY FSSJ DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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
                SqlHelper.ExecuteSql("UPDATE hk_Mail_FS SET SCBZ='是' WHERE YJID IN ('" + cal + "')");
                GridViewBind();
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
