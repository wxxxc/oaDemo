using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class zshdShow : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        public static string Name;

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("12106", "0");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                GridViewBind();

                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KlAction where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (datar.Read())
                {
                    Name = datar["Title"].ToString();
                }
                datar.Close();

                SqlHelper.ExecuteSql("Update OA_KlAction  Set PointNum=PointNum+1  where id='" + int.Parse(Request.QueryString["id"]) + "'");
            }
        }

        protected void BtnB_Click(object sender, EventArgs e)
        {
            Response.Redirect("zshd.aspx");
        }

        public void GridViewBind()
        {
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) AS NUMS FROM OA_KlAction where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' or ParentNodesID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            DataSet ds = SqlHelper.ExecuteDs("select * from OA_KlAction where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' or ParentNodesID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' order by id asc ", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label ln2 = (Label)e.Row.FindControl("Lid2");
                Label ll2 = (Label)e.Row.FindControl("Label2");
                ll2.Text = null;

                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KlManger where  (CHARINDEX('," + this.Session["userid"].ToString() + ",',','+Username+',') > 0 ) ");
                if (datar.Read())
                {
                    //SqlDataReader dr = SqlHelper.ExecuteReader("select * from OA_KlAction where  id='" + ln2.Text + "' and Username='" + this.Session["userid"] + "' ");
                    SqlDataReader dr = SqlHelper.ExecuteReader("select * from OA_KlAction where  id='" + ln2.Text + "'");
                    if (dr.Read())
                    {
                        ll2.Text = "[<a href=zshdShowBack.aspx?Backid=" + Request.QueryString["id"] + "><font color=\"#3366ff\">回复</font></a>][<a href=zshdShowBj.aspx?id=" + dr["id"] + "&Backid=" + Request.QueryString["id"] + "><font color=\"#3366ff\">编辑</font></a>][<a href='javascript:void(0)' onclick='window.open (\"zshdShowDel.aspx?id=" + dr["id"] + "&Backid=" + Request.QueryString["id"] + "\", \"_blank\", \"height=1, width=1,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=110,left=110\")'><font color=\"#3366ff\">删除</font></a>]";
                    }
                    dr.Close();
                }
                else
                {
                    SqlDataReader dr2 = SqlHelper.ExecuteReader("select * from OA_KlAction where  id='" + ln2.Text + "' and Username='" + this.Session["userid"] + "' ");
                    if (dr2.Read())
                    {
                        ll2.Text = "[<a href=zshdShowBack.aspx?Backid=" + Request.QueryString["id"] + "><font color=\"#3366ff\">回复</font></a>][<a href=zshdShowBj.aspx?id=" + dr2["id"] + "&Backid=" + Request.QueryString["id"] + "><font color=\"#3366ff\">编辑</font></a>][<a href='javascript:void(0)' onclick='window.open (\"zshdShowDel.aspx?id=" + dr2["id"] + "&Backid=" + Request.QueryString["id"] + "\", \"_blank\", \"height=1, width=1,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=110,left=110\")'><font color=\"#3366ff\">删除</font></a>]";
                    }
                    else
                    {
                        ll2.Text = "[<a href=zshdShowBack.aspx?Backid=" + Request.QueryString["id"] + "><font color=\"#3366ff\">回复</font></a>]";
                    }
                    dr2.Close();
                }
                datar.Close();
            }
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }
    }
}
