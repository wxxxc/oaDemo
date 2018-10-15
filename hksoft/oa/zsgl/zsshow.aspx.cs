using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class zsshow : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public static string LittleName, ShowTitle, Realname, KeyWord, Content, AthourSay, PointNum, ScNum, DyNum, TjNum, LastTime, Username, IfTj;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                TitleContent.Attributes["onkeydown"] = "if (event.keyCode==13) { document.all.Btntjpl.click(); return false;}";

                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KlManger where  (CHARINDEX('," + this.Session["userid"].ToString() + ",',','+Username+',') > 0 ) ");

                if (!datar.Read())
                {
                    SqlDataReader dr = SqlHelper.ExecuteReader("select * from OA_KnowLedge where  ((CHARINDEX('," + this.Session["userid"].ToString() + ",',','+QxYdUsername+',') > 0 )  or QxYdUsername='全部用户') and id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (!dr.Read())
                    {
                        mydb.Alert_Close("对不起，您没有阅读权限！");
                        return;
                    }
                    dr.Close();

                    SqlDataReader dr2 = SqlHelper.ExecuteReader("select * from OA_KnowLedge where  State='正常' and id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

                    if (!dr2.Read())
                    {
                        mydb.Alert_Close("该知识的当前状态设置为不允许查看！");
                        return;
                    }
                    dr2.Close();
                }
                datar.Close();

                SqlHelper.ExecuteSql("Update OA_KnowLedge Set PointNum=PointNum+1 where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

                BindDT();
                GridViewBind();
                Btntjpl.Attributes["onclick"] = "javascript:return chknull();";

                if (IfTj == "是")
                {
                    Btntj.Text = "取消推荐";
                }
                else
                {
                    Btntj.Text = "强力推荐";
                }
            }
        }

        public void BindDT()
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("select * from OA_KnowLedge where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            if (dr.Read())
            {
                Number.Text = dr["Number"].ToString();
                LittleName = dr["LittleName"].ToString();
                ShowTitle = dr["Title"].ToString();
                Content = dr["Content"].ToString();
                AthourSay = dr["AthourSay"].ToString();
                PointNum = dr["PointNum"].ToString();
                ScNum = dr["ScNum"].ToString();
                DyNum = dr["DyNum"].ToString();
                TjNum = dr["TjNum"].ToString();
                LastTime = dr["LastTime"].ToString();
                Realname = dr["Realname"].ToString();
                Username = dr["Username"].ToString();
                IfTj = dr["IfTj"].ToString();
                KeyWord = dr["KeyWord"].ToString();
                lblUserName.Text = dr["Username"].ToString();
            }

            dr.Close();

            SqlDataReader dr2 = SqlHelper.ExecuteReader("select * from OA_KlManger where  (CHARINDEX('," + this.Session["username"].ToString() + ",',','+Realname+',') > 0 ) ");
            if (dr2.Read())
            {
                BtnS.Visible = true;
                Btntj.Visible = true;
            }
            else
            {
                BtnS.Visible = false;
                Btntj.Visible = false;
            }
            dr2.Close();
        }

        //gv绑定 
        public void GridViewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("select * from OA_KlComm where KmId='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' order by id desc ");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridViewBind();
        }

        //提交评论
        protected void Btntjpl_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("insert into OA_KlComm (KmId,Title,Username,Realname,UnitId,UnitName,Settime) values ('" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "','" + hkdb.GetStr(TitleContent.Text) + "','" + this.Session["userid"] + "','" + this.Session["username"] + "','" + this.Session["deptid"] + "','" + this.Session["deptname"] + "','" + System.DateTime.Now.ToString() + "')");
            TitleContent.Text = "";
            GridViewBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label ln2 = (Label)e.Row.FindControl("lid");
                Label lb2 = (Label)e.Row.FindControl("lb2");
                lb2.Text = null;

                SqlDataReader datar = SqlHelper.ExecuteReader("select id,Username from OA_KnowLedge  where  id=(select KmId from OA_KlComm where  id='" + hkdb.GetStr(ln2.Text) + "')  and Username='" + this.Session["userid"] + "' ");
                if (datar.Read())
                {
                    lb2.Text = null;
                    lb2.Text = "[<a href='javascript:void(0)' onclick='window.open (\"zsshowDel.aspx?id=" + ln2.Text + "&backid=" + Request.QueryString["id"] + "\", \"_blank\", \"height=1, width=1,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=0,left=0\")'>删除</a>]";
                }
                datar.Close();

                SqlDataReader dr = SqlHelper.ExecuteReader("select * from OA_KlManger where  (CHARINDEX('," + this.Session["userid"].ToString() + ",',','+Username+',') > 0 ) ");
                if (dr.Read())
                {
                    lb2.Text = null;
                    lb2.Text = "[<a href='javascript:void(0)' onclick='window.open (\"zsshowDel.aspx?id=" + ln2.Text + "&backid=" + Request.QueryString["id"] + "\", \"_blank\", \"height=1, width=1,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=0,left=0\")'>删除</a>]";

                }
                dr.Close();
            }
        }

        protected void Btnjrzj_Click(object sender, EventArgs e)
        {
            Response.Redirect("zsshowzj.aspx?Number=" + Number.Text + "&bid=" + Request.QueryString["id"] + "");
        }

        //推荐知识
        protected void Btntjzs_Click(object sender, EventArgs e)
        {
            SqlDataReader datar = SqlHelper.ExecuteReader("select count(KmId) as nums from  OA_KlRecNum where  Username='" + this.Session["userid"] + "' and convert(char(10),cast(Settime as datetime),120)=convert(char(10),cast('" + System.DateTime.Now.ToShortDateString() + "' as datetime),120) ");
            if (datar.Read())
            {
                if (int.Parse(datar["nums"].ToString()) >= 3)
                {
                    datar.Close();
                    mydb.Alert("您今天３次推荐票已使用完，请明天再推荐！");
                    return;
                }
            }

            SqlDataReader dr = SqlHelper.ExecuteReader("select * from OA_KnowLedge where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' and  (CHARINDEX('," + this.Session["userid"].ToString() + ",',','+TjUsername+',') > 0 ) ");
            if (dr.Read())
            {
                SqlHelper.ExecuteSql("update OA_KnowLedge  Set TjNum=TjNum+1  where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                mydb.Alert("推荐成功！");
            }

            else
            {
                SqlHelper.ExecuteSql("update OA_KnowLedge  Set TjNum=TjNum+1 ,TjUsername=TjUsername+'" + this.Session["userid"].ToString() + ",',TjRealname=TjRealname+'" + this.Session["username"].ToString() + ",'  where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                mydb.Alert("推荐成功！");
            }

            SqlHelper.ExecuteSql("insert into OA_KlRecNum (KmId,Username,Realname,Settime) values ('" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "','" + this.Session["userid"] + "','" + this.Session["username"] + "','" + System.DateTime.Now.ToString() + "')");
            dr.Close();
        }

        protected void Btndyzs_Click(object sender, EventArgs e)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("select * from OA_KnowLedge where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' and  (CHARINDEX('," + this.Session["userid"].ToString() + ",',','+DyUsername+',') > 0 ) ");
            if (dr.Read())
            {
                mydb.Alert("已订阅！");
                return;
            }
            else
            {
                SqlHelper.ExecuteSql("update OA_KnowLedge  Set DyNum=DyNum+1 ,DyUsername=DyUsername+'" + this.Session["userid"].ToString() + ",',DyRealname=DyRealname+'" + this.Session["username"].ToString() + ",'  where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                mydb.Alert("订阅成功！");
            }
            dr.Close();
        }

        protected void Btnsczs_Click(object sender, EventArgs e)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("select * from OA_KnowLedge where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' and  (CHARINDEX('," + this.Session["userid"].ToString() + ",',','+ScUsername+',') > 0 ) ");
            if (dr.Read())
            {
                mydb.Alert("已收藏！");
                return;
            }
            else
            {
                SqlHelper.ExecuteSql("update OA_KnowLedge  Set ScNum=ScNum+1 ,ScUsername=ScUsername+'" + this.Session["userid"].ToString() + ",',ScRealname=ScRealname+'" + this.Session["username"].ToString() + ",'  where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                mydb.Alert("收藏成功！");
            }
            dr.Close();
        }

        protected void BtnS_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + lblUserName.Text + "','管理员禁止您的知识[" + ShowTitle + "]发布，请注意查看！'");
            SqlHelper.ExecuteSql("Update OA_KnowLedge  Set State='禁止发布'  where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            mydb.Alert("禁止知识发布成功！");
        }

        protected void Btntj_Click(object sender, EventArgs e)
        {
            if (IfTj == "是")
            {
                SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + lblUserName.Text + "','管理员取消推荐了你的知识[" + ShowTitle + "]，请注意查看！'");
                SqlHelper.ExecuteSql("Update OA_KnowLedge  Set IfTj='否' ,TjTime='" + System.DateTime.Now.ToString() + "' where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                mydb.Alert("取消推荐成功！");
            }
            else
            {
                SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + lblUserName.Text + "','管理员推荐了你的知识[" + ShowTitle + "]，请注意查看！'");
                SqlHelper.ExecuteSql("update OA_KnowLedge  Set IfTj='是' ,TjTime='" + System.DateTime.Now.ToString() + "' where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                mydb.Alert("推荐成功！");
            }
        }
    }
}
