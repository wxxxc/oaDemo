using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro
{
    public partial class myInitMain : System.Web.UI.Page
    {
        public mydb hkdb = new mydb();
        public static string num1, num2, num3, num4, num5, num6, num7, num8, notice;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("1");
            if (!IsPostBack)
            {
                //公共信息
                if (this.Session["systype"].ToString() == "A")     //主登录页
                {

                }
                else  //子登录页
                {
                    if (this.Session["systype"].ToString() == "R")
                    {
                        mydb.Alert("提示:首次点击【报表示例】中的报表时，需要1分钟左右的加载时间，还请耐心等待！");
                    }
                }
                //页面绑定 
                GridViewBind();
                GridViewBind2();
                GridViewBind3();
                GridViewBind4();
                GridViewBind5();
                GridViewBind6();
                GridViewBind7();
                GridViewBind8();
            }
            else
            {
                string pageid = (Request["__EVENTTARGET"] == null) ? "" : Convert.ToString(Request["__EVENTTARGET"]);
                if (pageid.StartsWith("AspNetPager"))
                {
                    System.Web.UI.ScriptManager.RegisterStartupScript(this.up1, this.GetType(), "block", "click_block("+ pageid.Substring(11)+");", true);
                }
            }

            SqlDataReader datar = SqlHelper.ExecuteReader("select top 6 ggid,ggzt,lrr,lrsj from hk_QYGG  where zt='已发布' and lx='企业' and gglb='1' and getdate() between kssj and jssj order by lrsj desc");
            notice = "";
            while (datar.Read())
            {
                string title = "";
                if (datar["ggzt"].ToString().Length > 17)
                {
                    title = datar["ggzt"].ToString().Substring(0, 17) + "…";
                }
                else
                {
                    title = datar["ggzt"].ToString();
                }
                notice = notice + "<li>· <a class=\"gvlink\" href=#  onclick=javascript:popMod('portal/xzgl/qygg_view.aspx?id=" 
                    + datar["ggid"] + "')  title=\"录入人：" + datar["lrr"] + " \">" + title + "</a><span class=\"notice_date\">" 
                    + string.Format("{0:d}", datar["lrsj"]) + "</span></li>";
            }
            datar.Close();




            //8个框
            //获取未接收任务
            string sql1 = "select count(*) from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid where r2.jsr='" + this.Session["userid"].ToString() + "' and r2.jszt='未接收' and r1.rwzt='已发布'";
            //获取已接收任务
            string sql2 = "select count(*) from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid where r2.jsr='" + Session["userid"].ToString() + "' and r2.jszt='已接收' and r1.rwzt='已发布'";
            //获取送审中任务
            string sql3 = "select count(*) from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid where r2.jsr='" + Session["userid"].ToString() + "' and r2.jszt='送审中' and r1.rwzt='已发布'";
            //获取已办结任务
            string sql4 = "select count(*) from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid where r2.jsr='" + Session["userid"].ToString() + "' and r2.jszt='已办结' and (r1.rwzt='已发布'or r1.rwzt='已完成')";
            //获取高度紧急任务
            string sql5 = "select count(*) from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid where r2.jsr='" + this.Session["userid"].ToString() + "'and r1.jjcd='高' and r1.rwzt='已发布'";
            //获取已超时任务
            string sql6 = "select COUNT(*) from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid where  r1.ynxs='是' and r1.jzrq < CONVERT(DATE,GETDATE(),110) and r2.jszt!='已办结' and r2.jsr='" + this.Session["userid"].ToString() + "' and r1.rwzt='已发布'";
            //获取限时任务
            string sql7 = "select COUNT(*) from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid where r1.ynxs='是' and r2.jsr='" + this.Session["userid"].ToString() + "' and r1.rwzt='已发布'";
            //获取审核被退回任务
            string sql8 = "select count(*) from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid where jsr='" + this.Session["userid"].ToString() + "' and jszt='审核退回' and r1.rwzt='已发布'";

            num1 = SqlHelper.ExecuteScalar(sql1).ToString();
            num2 = SqlHelper.ExecuteScalar(sql2).ToString();
            num3 = SqlHelper.ExecuteScalar(sql3).ToString();
            num4 = SqlHelper.ExecuteScalar(sql4).ToString();
            num5 = SqlHelper.ExecuteScalar(sql5).ToString();
            num6 = SqlHelper.ExecuteScalar(sql6).ToString();
            num7 = SqlHelper.ExecuteScalar(sql7).ToString();
            num8 = SqlHelper.ExecuteScalar(sql8).ToString();
        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定 未接收任务
        public void GridViewBind()
        {
            string Str1 = " where b.rwzt='已发布' and jsr='" + this.Session["userid"] + "'and (jszt='未接收' or jszt ='审核退回') ";
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from  OA_RWD02 a left outer join OA_RWD01 b on (a.ssrwid=b.rwid) left outer JOIN hk_ZDYLX c on (b.rwxz=c.id) left outer join yh d on (b.fbr=d.ui_id)" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select '按用户' as fblxmc,(select y.ui_desc+'等' from yh y where ui_id=(select SUBSTRING(convert(varchar(500), z.jsdx)+',',1,CHARINDEX(',',convert(varchar(500), z.jsdx)+',')-1) from OA_RWD01 z  "
                + "where fblx='3' and a.ssrwid=z.rwid))as jsdxmc,a.jsid,a.ssrwid,a.jszt,a.jsr,a.thcs,b.fblx,b.rwid,b.rwdh,b.rwbt,b.rwnr,(case when b.jjcd='高' then '高' when b.jjcd='中' then '中' else '低' end)as jjcd,b.rwxz,"
                + "(case when b.ynxs='是' then 'ch' else 'noch' end)as ynxs,b.fbr,b.fbsj,b.wcsj,c.mc,case when( b.fjmc=''or b.fjmc is null) then null else 'y' end as fjmc01 ,case when ksrq='1900-01-01' then null else ksrq end as ksrq,"
                + "case when jzrq='1900-01-01' then null else jzrq end as jzrq,d.ui_desc,case when (ynxs='是' and getdate()>jzrq) then 'yes' else 'no' end as cqzt from OA_RWD02 a left outer join OA_RWD01 b on (a.ssrwid=b.rwid) "
                + "left outer JOIN hk_ZDYLX c on (b.rwxz=c.id) left outer join yh d on (b.fbr=d.ui_id)"
                + Str1
                + "order by fbsj desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            if (GridView1.HeaderRow != null)
            {
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        //gv绑定 办理中任务
        public void GridViewBind2()
        {
            string Str1 = " where b.rwzt='已发布' and jsr='" + this.Session["userid"] + "'and jszt='已接收' ";

            AspNetPager2.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from  OA_RWD02 a left outer join OA_RWD01 b on (a.ssrwid=b.rwid) left outer JOIN hk_ZDYLX c on (b.rwxz=c.id) left outer join yh d on (b.fbr=d.ui_id)" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select '按用户' as fblxmc,(select y.ui_desc+'等' from yh y where ui_id=(select SUBSTRING(convert(varchar(500), z.jsdx)+',',1,CHARINDEX(',',convert(varchar(500), z.jsdx)+',')-1) from OA_RWD01 z  "
                + "where fblx='3' and a.ssrwid=z.rwid))as jsdxmc,a.jsid,a.ssrwid,a.jszt,a.jsr,a.thcs,b.fblx,b.rwid,b.rwdh,b.rwbt,b.rwnr,(case when b.jjcd='高' then '高' when b.jjcd='中' then '中' else '低' end)as jjcd,b.rwxz,"
                + "(case when b.ynxs='是' then 'ch' else 'noch' end)as ynxs,(case when b.ynfp='是' then 'ch' else 'noch' end)as ynfp,b.fprwid,(case when b.ynfp='是' then '查看分配的任务单' else '' end)as lblfprwid,b.rwzt,b.fbr,b.fbsj,b.wcsj,c.mc,"
                + "case when( b.fjmc=''or b.fjmc is null) then null else 'y' end as fjmc01 ,case when ksrq='1900-01-01' then null else ksrq end as ksrq,case when jzrq='1900-01-01' then null else jzrq end as jzrq,d.ui_desc,e.ui_desc as jsr,a.jssj,"
                + "case when (ynxs='是' and jssj>jzrq) then 'yes' else 'no' end as cqzt from OA_RWD02 a left outer join OA_RWD01 b on (a.ssrwid=b.rwid) left outer JOIN hk_ZDYLX c on (b.rwxz=c.id)"
                + " left outer join yh d on (b.fbr=d.ui_id) left outer join yh e on (a.jsr=e.ui_id)" + Str1 + "order by fbsj desc", AspNetPager2.PageSize * (AspNetPager2.CurrentPageIndex - 1), AspNetPager2.PageSize);
            GridView2.DataSource = ds;
            GridView2.DataBind();
            if (GridView2.HeaderRow != null)
            {
                GridView2.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        public void GridViewBind3()
        {

            string Str1 = " where b.rwzt='已发布' and jsr='" + this.Session["userid"] + "'and jszt='送审中' ";

            AspNetPager3.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from  OA_RWD02 a left outer join OA_RWD01 b on (a.ssrwid=b.rwid) left outer JOIN hk_ZDYLX c on (b.rwxz=c.id) left outer join yh d on (b.fbr=d.ui_id)" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select '按用户' as fblxmc,(select y.ui_desc+'等' from yh y where ui_id=(select SUBSTRING(convert(varchar(500), z.jsdx)+',',1,CHARINDEX(',',convert(varchar(500), z.jsdx)+',')-1) from OA_RWD01 z  "
                + "where fblx='3' and a.ssrwid=z.rwid))as jsdxmc,a.jsid,a.ssrwid,a.jszt,a.jsr,a.thcs,b.fblx,b.rwid,b.rwdh,b.rwbt,b.rwnr,(case when b.jjcd='高' then '高' when b.jjcd='中' then '中' else '低' end)as jjcd,b.rwxz,"
                + "(case when b.ynxs='是' then 'ch' else 'noch' end)as ynxs,b.rwzt,b.fbr,b.fbsj,b.wcsj,c.mc,case when( b.fjmc=''or b.fjmc is null) then null else 'y' end as fjmc01 ,case when ksrq='1900-01-01' then null else ksrq end as ksrq,"
                + "case when jzrq='1900-01-01' then null else jzrq end as jzrq,d.ui_desc,e.ui_desc as clr,a.clsj,case when (ynxs='是' and jssj>jzrq) then 'yes' else 'no' end as cqzt from OA_RWD02 a "
                + "left outer join OA_RWD01 b on (a.ssrwid=b.rwid) left outer JOIN hk_ZDYLX c on (b.rwxz=c.id) left outer join yh d on (b.fbr=d.ui_id) left outer join yh e on (a.clr=e.ui_id)"
                + Str1 + "order by fbsj desc", AspNetPager3.PageSize * (AspNetPager3.CurrentPageIndex - 1), AspNetPager3.PageSize);
            GridView3.DataSource = ds;
            GridView3.DataBind();
            if (GridView3.HeaderRow != null)
            {
                GridView3.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
        public void GridViewBind4()
        {
            string Str1 = " where (b.rwzt='已发布' or b.rwzt='已完成') and jsr='" + this.Session["userid"] + "'and jszt='已办结' ";
            //DateTime datetime = DateTime.Today;
            //System.DateTime sdateStr = datetime.AddDays(1 - datetime.Day);
            //System.DateTime edateStr = datetime.AddDays(1 - datetime.Day).AddMonths(1).AddDays(-1);
            //Str1 = Str1 + " and fbsj>='" + sdateStr + "' and fbsj<='" + edateStr + "'";
            AspNetPager4.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from  OA_RWD02 a left outer join OA_RWD01 b on (a.ssrwid=b.rwid) left outer JOIN hk_ZDYLX c on (b.rwxz=c.id) left outer join yh d on (b.fbr=d.ui_id)" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select '按用户' as fblxmc,(select y.ui_desc+'等' from yh y where ui_id=(select SUBSTRING(convert(varchar(500), z.jsdx)+',',1,CHARINDEX(',',convert(varchar(500), z.jsdx)+',')-1) from OA_RWD01 z  "
                + "where fblx='3' and a.ssrwid=z.rwid))as jsdxmc,a.jsid,a.ssrwid,a.jszt,a.jsr,a.thcs,b.fblx,b.rwid,b.rwdh,b.rwbt,b.rwnr,(case when b.jjcd='高' then '高' when b.jjcd='中' then '中' else '低' end)as jjcd,b.rwxz,"
                + "(case when b.ynxs='是' then 'ch' else 'noch' end)as ynxs,b.rwzt,b.fbr,b.fbsj,b.wcsj,c.mc,case when( b.fjmc=''or b.fjmc is null) then null else 'y' end as fjmc01 ,case when ksrq='1900-01-01' then null else ksrq end as ksrq,"
                + "case when jzrq='1900-01-01' then null else jzrq end as jzrq,d.ui_desc,e.ui_desc as spr,a.spsj,a.spyj,a.sppj,case when (ynxs='是' and jssj>jzrq) then 'yes' else 'no' end as cqzt from OA_RWD02 a "
                + "left outer join OA_RWD01 b on (a.ssrwid=b.rwid) left outer JOIN hk_ZDYLX c on (b.rwxz=c.id) left outer join yh d on (b.fbr=d.ui_id) left outer join yh e on (a.spr=e.ui_id)"
                + Str1 + "order by fbsj desc", AspNetPager4.PageSize * (AspNetPager4.CurrentPageIndex - 1), AspNetPager4.PageSize);
            GridView4.DataSource = ds;
            GridView4.DataBind();
            if (GridView4.HeaderRow != null)
            {
                GridView4.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
        public void GridViewBind5()
        {
            string Str1 = "select case when (r1.ynxs='是' and r2.jssj>r1.jzrq) then 'yes' else 'no' end as cqzt,"
                + "(select y.ui_desc+'等' from yh y where ui_id=(select SUBSTRING(convert(varchar(500), z.jsdx)+',',1,CHARINDEX(',',convert(varchar(500), z.jsdx)+',')-1) from OA_RWD01 z  "
                + "where fblx='3' and r2.ssrwid=z.rwid))as jsdxmc,"
                + "(case when r1.ynxs='是' then 'ch' else 'noch' end)as ynxs,c.mc,d.ui_desc,*"
                + " from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid "
                + "left outer JOIN hk_ZDYLX c on r1.rwxz=c.id left outer join yh d on r1.fbr=d.ui_id"
                + " where r2.jsr='" + this.Session["userid"].ToString() + "'and r1.jjcd='高' and r1.rwzt='已发布' ";
            AspNetPager5.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid where r2.jsr='" + this.Session["userid"].ToString() + "'and r1.jjcd='高' and r1.rwzt='已发布'");
            DataSet ds = SqlHelper.ExecuteDs(Str1 + "order by r1.fbsj desc", AspNetPager5.PageSize * (AspNetPager5.CurrentPageIndex - 1), AspNetPager5.PageSize);
            GridView5.DataSource = ds;
            GridView5.DataBind();
            if (GridView5.HeaderRow != null)
            {
                GridView5.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
        public void GridViewBind6()
        {
            //string Str1 = "select * from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid where  r1.ynxs='是' and r1.jzrq < CONVERT(DATE,GETDATE(),110) and r2.jszt!='已办结' and r2.jsr='" + this.Session["userid"].ToString() + "' and r1.rwzt='已发布'";
            string Str1 = "select case when (r1.ynxs='是' and r2.jssj>r1.jzrq) then 'yes' else 'no' end as cqzt,"
                + "(select y.ui_desc+'等' from yh y where ui_id=(select SUBSTRING(convert(varchar(500), z.jsdx)+',',1,CHARINDEX(',',convert(varchar(500), z.jsdx)+',')-1) from OA_RWD01 z  "
                + "where fblx='3' and r2.ssrwid=z.rwid))as jsdxmc,"
                + "(case when r1.ynxs='是' then 'ch' else 'noch' end)as ynxs,c.mc,d.ui_desc,*"
                + " from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid "
                + "left outer JOIN hk_ZDYLX c on r1.rwxz=c.id left outer join yh d on r1.fbr=d.ui_id"
                + " where r1.ynxs='是' and r1.jzrq < CONVERT(DATE,GETDATE(),110) and r2.jszt!='已办结' and r2.jsr='" + this.Session["userid"].ToString() + "' and r1.rwzt='已发布'";
            AspNetPager6.RecordCount = (int)SqlHelper.ExecuteScalar("select COUNT(*) from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid where  r1.ynxs='是' and r1.jzrq < CONVERT(DATE,GETDATE(),110) and r2.jszt!='已办结' and r2.jsr='" + this.Session["userid"].ToString() + "' and r1.rwzt='已发布'");
            DataSet ds = SqlHelper.ExecuteDs(Str1 + "order by r1.fbsj desc", AspNetPager6.PageSize * (AspNetPager6.CurrentPageIndex - 1), AspNetPager6.PageSize);
            GridView6.DataSource = ds;
            GridView6.DataBind();
            if (GridView6.HeaderRow != null)
            {
                GridView6.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
        public void GridViewBind7()
        {
            //string Str1 = "select * from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid where r1.ynxs='是' and r2.jsr='" + this.Session["userid"].ToString() + "' and r1.rwzt='已发布'";
            string Str1 = "select case when (r1.ynxs='是' and r2.jssj>r1.jzrq) then 'yes' else 'no' end as cqzt,"
               + "(select y.ui_desc+'等' from yh y where ui_id=(select SUBSTRING(convert(varchar(500), z.jsdx)+',',1,CHARINDEX(',',convert(varchar(500), z.jsdx)+',')-1) from OA_RWD01 z  "
               + "where fblx='3' and r2.ssrwid=z.rwid))as jsdxmc,"
               + "(case when r1.ynxs='是' then 'ch' else 'noch' end)as ynxs,c.mc,d.ui_desc,*"
               + " from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid "
               + "left outer JOIN hk_ZDYLX c on r1.rwxz=c.id left outer join yh d on r1.fbr=d.ui_id"
               + " where r1.ynxs='是' and r2.jsr='" + this.Session["userid"].ToString() + "' and r1.rwzt='已发布'";

            AspNetPager7.RecordCount = (int)SqlHelper.ExecuteScalar("select COUNT(*) from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid where r1.ynxs='是' and r2.jsr='" + this.Session["userid"].ToString() + "' and r1.rwzt='已发布'");
            DataSet ds = SqlHelper.ExecuteDs(Str1 + "order by r1.fbsj desc", AspNetPager7.PageSize * (AspNetPager7.CurrentPageIndex - 1), AspNetPager7.PageSize);
            GridView7.DataSource = ds;
            GridView7.DataBind();
            if (GridView7.HeaderRow != null)
            {
                GridView7.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
        public void GridViewBind8()
        {
            // string Str1 = "select * from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid where jsr='" + this.Session["userid"].ToString() + "' and jszt='审核退回' and r1.rwzt='已发布'";
            string Str1 = "select case when (r1.ynxs='是' and r2.jssj>r1.jzrq) then 'yes' else 'no' end as cqzt,"
               + "(select y.ui_desc+'等' from yh y where ui_id=(select SUBSTRING(convert(varchar(500), z.jsdx)+',',1,CHARINDEX(',',convert(varchar(500), z.jsdx)+',')-1) from OA_RWD01 z  "
               + "where fblx='3' and r2.ssrwid=z.rwid))as jsdxmc,"
               + "(case when r1.ynxs='是' then 'ch' else 'noch' end)as ynxs,c.mc,d.ui_desc,*"
               + " from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid "
               + "left outer JOIN hk_ZDYLX c on r1.rwxz=c.id left outer join yh d on r1.fbr=d.ui_id"
               + " where jsr='" + this.Session["userid"].ToString() + "' and jszt='审核退回' and r1.rwzt='已发布'";

            AspNetPager8.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid where jsr='" + this.Session["userid"].ToString() + "' and jszt='审核退回' and r1.rwzt='已发布'");
            DataSet ds = SqlHelper.ExecuteDs(Str1 + "order by r1.fbsj desc", AspNetPager8.PageSize * (AspNetPager8.CurrentPageIndex - 1), AspNetPager8.PageSize);
            GridView8.DataSource = ds;
            GridView8.DataBind();
            if (GridView8.HeaderRow != null)
            {
                GridView8.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }


        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }
        protected void AspNetPager2_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind2();
        }
        protected void AspNetPager3_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind3();
        }
        protected void AspNetPager4_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind4();
        }
        protected void AspNetPager5_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind5();
        }
        protected void AspNetPager6_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind6();
        }
        protected void AspNetPager7_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind7();
        }
        protected void AspNetPager8_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind8();
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