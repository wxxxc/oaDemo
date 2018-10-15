using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.khgl
{
    public partial class Khwh01 : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                //Init 
                hkdb.PassTo("11701", "11701");

                //txtSdate.Text = DateTime.Now.AddDays(-30).ToString("yyyy-MM-dd");
                txtSdate.Text = Request.Cookies["haoke"].Values["sdate"].ToString();
                txtEdate.Text = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                GridViewBind();
            }
        }

        public void GridViewBind()
        {
            string str1 = "where 1=1 ";

            if (!string.IsNullOrEmpty(gmr.Text))
            {
                str1 = str1 + " and gmr like '%" + hkdb.GetStr(gmr.Text) + "%'";
            }

            if (!string.IsNullOrEmpty(sf.Text))
            {
                str1 = str1 + " and sf like '%" + hkdb.GetStr(sf.Text) + "%'";
            }

            if (!string.IsNullOrEmpty(cs.Text))
            {
                str1 = str1 + " and cs like '%" + hkdb.GetStr(cs.Text) + "%'";
            }

            if (!string.IsNullOrEmpty(gmrdw.Text))
            {
                str1 = str1 + " and gmrdw like '%" + hkdb.GetStr(gmrdw.Text) + "%'";
            }

            if (!string.IsNullOrEmpty(spmc.Text))
            {
                str1 = str1 + " and spmc like '%" + hkdb.GetStr(spmc.Text) + "%'";
            }

            if (!string.IsNullOrEmpty(gmsls.Text) & !string.IsNullOrEmpty(gmsle.Text))
            {
                str1 = str1 + " and gmsl between '" + hkdb.GetStr(gmsls.Text) + "'and'" + hkdb.GetStr(gmsle.Text) + "' ";
            }

            if (!string.IsNullOrEmpty(txtEdate.Text) & !string.IsNullOrEmpty(txtSdate.Text))
            {
                System.DateTime sdateStr = Convert.ToDateTime(txtSdate.Text);
                System.DateTime edateStr = Convert.ToDateTime(txtEdate.Text);

                str1 = str1 + " and gmrq>='" + sdateStr + "' and gmrq<='" + edateStr + "'";

                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from OA_KHDA01 " + str1 + "");
                DataSet ds = SqlHelper.ExecuteDs("select * from OA_KHDA01 " + str1 + " order by gmrq desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from OA_KHDA01 " + str1 + "");
                DataSet ds = SqlHelper.ExecuteDs("select * from OA_KHDA01 " + str1 + " order by gmrq desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }

        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            gmr.Text = "";
            sf.Text = "";
            cs.Text = "";
            gmrdw.Text = "";
            gmsls.Text = "";
            gmsle.Text = "";
            spmc.Text = "";
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
                SqlHelper.ExecuteSql("delete from OA_KHDA01 where khid in ('" + cal + "')");
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
