using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class zsshowzj : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public static string CountsLabel, AllPageLabel, CurrentlyPageLabel, Namefile;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KnowLedge   where  Number='" + hkdb.GetStr(Request.QueryString["Number"]) + "' ");
                if (datar.Read())
                {
                    Namefile = datar["Title"].ToString();
                }
                datar.Close();

                GridViewBind();
            }
        }

        public void GridViewBind()
        {
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) AS NUMS FROM OA_KlChap  where  KmNumber='" + hkdb.GetStr(Request.QueryString["Number"]) + "' ");
            DataSet ds = SqlHelper.ExecuteDs("select * from OA_KlChap where  KmNumber='" + hkdb.GetStr(Request.QueryString["Number"]) + "' order by id desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
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
                Label lblid = (Label)e.Row.FindControl("lblid");
                Label lbl = (Label)e.Row.FindControl("Label1");
                lbl.Text = " <a href=\"javascript:void(0)\" onclick=\"showfrom(" + lblid.Text + ");\"class=\"gvlink\">查看</a>";
            }
        }

        protected void Btnfhzs_Click(object sender, EventArgs e)
        {
            Response.Redirect("zsshow.aspx?id=" + Request.QueryString["bid"] + "");
        }

        protected void Btntjzs_Click(object sender, EventArgs e)
        {
            int ID = 0;
            SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KnowLedge where Number='" + hkdb.GetStr(Request.QueryString["Number"]) + "' ");
            if (datar.Read())
            {
                ID = int.Parse(datar["id"].ToString());
            }
            datar.Close();

            SqlDataReader dr = SqlHelper.ExecuteReader("select count(KmId) as nums from OA_KlRecNum where Username='" + this.Session["userid"] + "' and convert(char(10),cast(Settime as datetime),120)=convert(char(10),cast('" + System.DateTime.Now.ToShortDateString() + "' as datetime),120) ");
            if (dr.Read())
            {
                if (int.Parse(dr["nums"].ToString()) >= 3)
                {
                    mydb.Alert("您今天３次推荐票已使用完，请明天再推荐！");
                    return;
                }
                dr.Close();
            }

            SqlDataReader datar2 = SqlHelper.ExecuteReader("select * from OA_KnowLedge where id='" + ID + "' and (CHARINDEX('," + this.Session["userid"].ToString() + ",',','+TjUsername+',') > 0 ) ");
            if (datar2.Read())
            {
                SqlHelper.ExecuteSql("Update OA_KnowLedge Set TjNum=TjNum+1 where id='" + ID + "'");
                mydb.Alert("推荐成功！");
            }
            else
            {
                SqlHelper.ExecuteSql("Update OA_KnowLedge Set TjNum=TjNum+1 ,TjUsername=TjUsername+'" + this.Session["userid"].ToString() + ",',TjRealname=TjRealname+'" + this.Session["username"].ToString() + ",'  where id='" + ID + "'");
                mydb.Alert("推荐成功！");
            }
            datar2.Close();

            SqlHelper.ExecuteSql("insert into OA_KlRecNum (KmId,Username,Realname,Settime) values ('" + ID + "','" + this.Session["userid"] + "','" + this.Session["username"] + "','" + System.DateTime.Now.ToString() + "')");
        }

        protected void Btndyzs_Click(object sender, EventArgs e)
        {
            int ID = 0;
            SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KnowLedge   where  Number='" + hkdb.GetStr(Request.QueryString["Number"]) + "' ");
            if (datar.Read())
            {
                ID = int.Parse(datar["id"].ToString());
            }
            datar.Close();

            SqlDataReader dr = SqlHelper.ExecuteReader("select * from OA_KnowLedge where id='" + ID + "' and  (CHARINDEX('," + this.Session["userid"].ToString() + ",',','+DyUsername+',') > 0 ) ");
            if (dr.Read())
            {
                mydb.Alert("已订阅！");
                return;
            }
            else
            {
                SqlHelper.ExecuteSql("Update OA_KnowLedge  Set DyNum=DyNum+1 ,DyUsername=DyUsername+'" + this.Session["userid"].ToString() + ",',DyRealname=DyRealname+'" + this.Session["username"].ToString() + ",'  where id='" + ID + "'");
                mydb.Alert("订阅成功！");
            }
            dr.Close();
        }

        protected void Btnsczs_Click(object sender, EventArgs e)
        {
            int ID = 0;
            SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KnowLedge   where  Number='" + hkdb.GetStr(Request.QueryString["Number"]) + "' ");
            if (datar.Read())
            {
                ID = int.Parse(datar["id"].ToString());
            }
            datar.Close();

            SqlDataReader dr = SqlHelper.ExecuteReader("select * from OA_KnowLedge where id='" + ID + "' and  (CHARINDEX('," + this.Session["userid"].ToString() + ",',','+ScUsername+',') > 0 ) ");
            if (dr.Read())
            {
                mydb.Alert("已收藏！");
                return;
            }
            else
            {
                SqlHelper.ExecuteSql("Update OA_KnowLedge  Set ScNum=ScNum+1 ,ScUsername=ScUsername+'" + this.Session["userid"].ToString() + ",',ScRealname=ScRealname+'" + this.Session["username"].ToString() + ",'  where id='" + ID + "'");
                mydb.Alert("收藏成功！");
            }
            dr.Close();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }
    }
}
