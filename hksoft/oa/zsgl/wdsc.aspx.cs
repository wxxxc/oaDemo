using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class wdsc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");
            
            if (!IsPostBack)
            {
                hkdb.PassTo("10111", "0");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //页面绑定 
                GridViewBind();
            }
        }

        public void GridViewBind()
        {
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*)AS NUMS FROM OA_KnowLedge where (CHARINDEX('," + this.Session["userid"].ToString() + ",',','+ScUsername+',') > 0 )");
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM OA_KnowLedge  where (CHARINDEX('," + this.Session["userid"].ToString() + ",',','+ScUsername+',') > 0 ) order by LastTime desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";      //单击变色
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lbtn1 = (LinkButton)e.Row.FindControl("tuijian");
                LinkButton lbtn2 = (LinkButton)e.Row.FindControl("dingyue");
                LinkButton lbtn3 = (LinkButton)e.Row.FindControl("quxiaoshoucang");
                lbtn1.Attributes.Add("onclick", "javascript:return confirm('确认推荐知识[" + e.Row.Cells[1].Text.ToString() + "]吗？每天只能推荐3次')");
                lbtn2.Attributes.Add("onclick", "javascript:return confirm('确认订阅知识[" + e.Row.Cells[1].Text.ToString() + "]吗？')");
                lbtn3.Attributes.Add("onclick", "javascript:return confirm('确认取消收藏知识[" + e.Row.Cells[1].Text.ToString() + "]吗？')");

            }
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "tuijian")
            {
                int ID = Convert.ToInt32(e.CommandArgument);

                SqlDataReader datar = SqlHelper.ExecuteReader("select count(KmId) as nums from  OA_KlRecNum where  Username='" + this.Session["userid"] + "' and convert(char(10),cast(Settime as datetime),120)=convert(char(10),cast('" + System.DateTime.Now.ToShortDateString() + "' as datetime),120) ");

                if (datar.Read())
                {
                    if (int.Parse(datar["nums"].ToString()) >= 3)
                    {
                        mydb.Alert("您今天３次推荐票已使用完，请明天再推荐！");
                        return;
                    }
                    datar.Close();
                }

                SqlDataReader dr = SqlHelper.ExecuteReader("select * from OA_KnowLedge where id='" + ID + "' and  (CHARINDEX('," + this.Session["userid"].ToString() + ",',','+TjUsername+',') > 0 ) ");
                if (dr.Read())
                {
                    SqlHelper.ExecuteSql("Update OA_KnowLedge  Set TjNum=TjNum+1  where id='" + ID + "'");
                    mydb.Alert("推荐成功！");
                }

                else
                {
                    SqlHelper.ExecuteSql("Update OA_KnowLedge  Set TjNum=TjNum+1 ,TjUsername=TjUsername+'" + this.Session["userid"].ToString() + ",',TjRealname=TjRealname+'" + this.Session["username"].ToString() + ",'  where id='" + ID + "'");
                    mydb.Alert("推荐成功！");
                }

                SqlHelper.ExecuteSql("insert into OA_KlRecNum (KmId,Username,Realname,Settime) values ('" + ID + "','" + this.Session["userid"] + "','" + this.Session["username"] + "','" + System.DateTime.Now.ToString() + "')");
                dr.Close();

                GridViewBind();
            }



            if (e.CommandName == "dingyue")
            {
                int ID = Convert.ToInt32(e.CommandArgument);
                SqlDataReader datar2 = SqlHelper.ExecuteReader("select * from OA_KnowLedge where id='" + ID + "' and  (CHARINDEX('," + this.Session["userid"].ToString() + ",',','+DyUsername+',') > 0 ) ");

                if (datar2.Read())
                {
                    mydb.Alert("已订阅！");
                    return;
                }
                else
                {
                    SqlHelper.ExecuteSql("Update OA_KnowLedge  Set DyNum=DyNum+1 ,DyUsername=DyUsername+'" + this.Session["userid"].ToString() + ",',DyRealname=DyRealname+'" + this.Session["username"].ToString() + ",'  where id='" + ID + "'");
                    mydb.Alert("订阅成功！");
                }
                datar2.Close();

                GridViewBind();
            }


            if (e.CommandName == "quxiaoshoucang")
            {
                int ID = Convert.ToInt32(e.CommandArgument);
                SqlDataReader datar1 = SqlHelper.ExecuteReader("select * from OA_KnowLedge where id='" + ID + "' ");
                if (datar1.Read())
                {
                    string ScUsername = datar1["ScUsername"].ToString().Replace("" + this.Session["userid"].ToString() + ",", "");
                    string ScRealname = datar1["ScRealname"].ToString().Replace("" + this.Session["username"].ToString() + ",", "");

                     SqlHelper.ExecuteSql("Update OA_KnowLedge  Set ScNum=ScNum-1 ,ScUsername='" + ScUsername + "',ScRealname='" + ScRealname + "'  where id='" + ID + "'");
                    mydb.Alert("取消收藏成功！");
                }

                datar1.Close();

                GridViewBind();
            }
        }

    }
}
