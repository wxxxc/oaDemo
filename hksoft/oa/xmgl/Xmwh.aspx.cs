using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.xmgl
{
    public partial class Xmwh : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11505", "11505");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                GridViewBind();
            }
        }

        public void GridViewBind()
        {
            string str1 = "where 1=1 ";

            if (!string.IsNullOrEmpty(xmmc.Text))
            {
                str1 = str1 + " and xmmc like '%" + hkdb.GetStr(xmmc.Text) + "%'";
            }

            if (!string.IsNullOrEmpty(sssf.Text))
            {
                str1 = str1 + " and sssf like '%" + hkdb.GetStr(sssf.Text) + "%'";
            }

            if (!string.IsNullOrEmpty(sscs.Text))
            {
                str1 = str1 + " and sscs like '%" + hkdb.GetStr(sscs.Text) + "%'";
            }

            if (!string.IsNullOrEmpty(xmjd.SelectedValue))
            {
                str1 = str1 + " and xmjd like '%" + xmjd.SelectedValue + "%'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from OA_XMGL " + str1 + "");
            DataSet ds = SqlHelper.ExecuteDs("select * from OA_XMGL " + str1 + " order by cjsj desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            if (AspNetPager1.RecordCount == 0)
            {
                PrnBtn.Attributes.Add("onclick", "");
            }
            else
            {
                PrnBtn.Attributes.Add("onclick", "Javascript:popPrn('xm_prn.aspx?&i1=" + xmmc.Text + "&i2=" + sssf.Text + "&i3=" + sscs.Text + "&i4=" + xmjd.SelectedValue + "');");
            }
        }

        protected void Query_Click(object sender, EventArgs e)
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
                SqlHelper.ExecuteSql("delete from OA_XMGL_gzjl where xmid in ('" + cal + "')");
                SqlHelper.ExecuteSql("delete from OA_XMGL_lxr where xmid in ('" + cal + "')");
                SqlHelper.ExecuteSql("delete from OA_XMGL_fj where xmid in ('" + cal + "')");
                SqlHelper.ExecuteSql("delete from OA_XMGL where xmid in ('" + cal + "')");

                mydb.Alert("删除成功！");

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
