using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class zshd : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("12106", "12106");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //页面绑定 
                GridViewBind();
            }
        }

        public void GridViewBind()
        {
            string Str1 = "and 1=1";

            if (!string.IsNullOrEmpty(title.Text))
            {
                Str1 = Str1 + " and title like '%" + hkdb.GetStr(title.Text) + "%'";

                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select COUNT(*) AS NUMS  from  OA_KlAction where  ParentNodesID='0'" + Str1);
                DataSet ds = SqlHelper.ExecuteDs("select * from OA_KlAction where ParentNodesID='0'" + Str1 + " order by id desc ", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select COUNT(*) AS NUMS  from  OA_KlAction where  ParentNodesID='0'" + Str1);
                DataSet ds = SqlHelper.ExecuteDs("select * from OA_KlAction where ParentNodesID='0' " + Str1 + "order by id desc ", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            DataControlRowType itemType = e.Row.RowType;
            if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label ln1 = (Label)e.Row.FindControl("lblid1");
                Label ln2 = (Label)e.Row.FindControl("lblid2");

                Label ll1 = (Label)e.Row.FindControl("Label1");
                Label ll2 = (Label)e.Row.FindControl("Label2");


                ll1.Text = null; ll2.Text = null;

                SqlDataReader dr = SqlHelper.ExecuteReader("select * from OA_KlAction where id='" + ln1.Text + "'");
                if (dr.Read())
                {
                    SqlDataReader datarl = SqlHelper.ExecuteReader("select count(id) as nums from OA_KlAction where  ParentNodesID='" + ln1.Text + "'");
                    if (datarl.Read())
                    {
                        string ll1_count = datarl["nums"].ToString();
                        ll1.Text = "" + ll1_count + "/" + dr["PointNum"].ToString() + "";
                    }
                    datarl.Close();
                }
                dr.Close();


                SqlDataReader datar = SqlHelper.ExecuteReader("select top 1 * from OA_KlAction where ParentNodesID='" + ln1.Text + "' order by Settime desc");
                if (datar.Read())
                {
                    ll2.Text = "" + datar["Settime"].ToString() + "<br>by " + datar["Realname"].ToString() + "";
                }
                datar.Close();
            }
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        protected void FtBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("zshdAdd.aspx");
        }

        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }
    }
}
