using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro
{
    public partial class DbSet : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("1");

            if (!IsPostBack)
            {
                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                GridViewBind();
            }
        }

        public void GridViewBind()
        {
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from  hk_MyDash a left outer join hk_Dashboard b on (a.ssdbid=b.id) where Username='" + this.Session["userid"] + "'");
            DataSet ds = SqlHelper.ExecuteDs("select a.*,b.name,b.id as bid from hk_MyDash a left outer join hk_Dashboard b on (a.ssdbid=b.id) where Username='" + this.Session["userid"] + "' order by orderid asc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo_Close("Y") == "true")
            {
                return;
            }

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
                SqlHelper.ExecuteSql("delete from hk_MyDash where id in ('" + cal + "')");
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

        public void Item_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }

        //gv行处理 
        public void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "shangyi")
            {
                int orderidId = Convert.ToInt32(e.CommandArgument);

                SqlDataReader datar = SqlHelper.ExecuteReader("select top 1 * from hk_MyDash where orderid<" + orderidId.ToString() + "  and Username='" + this.Session["userid"] + "' order by orderid desc");

                if (datar.Read())
                {
                    SqlHelper.ExecuteSql("Update hk_MyDash  Set orderid='" + datar["orderid"].ToString() + "'  where orderid='" + orderidId.ToString() + "'");
                    SqlHelper.ExecuteSql("Update hk_MyDash  Set orderid='" + orderidId.ToString() + "'  where id='" + datar["id"].ToString() + "'");
                }
                else
                {
                    mydb.Alert("移动失败,已经达到最顶部！");
                }
                datar.Close();
            }

            if (e.CommandName == "xiayi")
            {
                int orderidId = Convert.ToInt32(e.CommandArgument);

                SqlDataReader datar = SqlHelper.ExecuteReader("select top 1 * from hk_MyDash where orderid>" + orderidId.ToString() + "  and Username='" + this.Session["userid"] + "' order by orderid asc");

                if (datar.Read())
                {
                    SqlHelper.ExecuteSql("Update hk_MyDash  Set orderid='" + datar["orderid"].ToString() + "'  where orderid='" + orderidId.ToString() + "'");

                    SqlHelper.ExecuteSql("Update hk_MyDash  Set orderid='" + orderidId.ToString() + "'  where id='" + datar["id"].ToString() + "'");
                }
                else
                {
                    mydb.Alert("移动失败,已经达到最底部！");
                }
                datar.Close();
            }
            GridViewBind();
        }
    }
}
