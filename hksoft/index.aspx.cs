using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;
using System.Data;

namespace hksoft
{
    public partial class index : System.Web.UI.Page
    {
        public mydb hkdb = new mydb();
        public static string num1,num2,num3,num4;
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
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
                //获取办理任务
                string sql1 = "select count(*) from OA_Rwd01 where rwzt='已发布'";
                //获取高度紧急任务
                string sql2 = "select count(*) from OA_Rwd01 where jjcd='高' and rwzt!='录入'";
                //获取已超时任务
                //string sql3 = "select COUNT(*) from OA_Rwd01 where ynxs='是' and jzrq < CONVERT(DATE,GETDATE(),110) and rwzt!='已完成' and rwzt='已发布'";
                //获取限时任务
                string sql3 = "select COUNT(*) from OA_Rwd01 where ynxs='是'";
                //获取已完成任务
                string sql4 = "select count(*) from OA_Rwd01 where rwzt='已完成'";
                num1= SqlHelper.ExecuteScalar(sql1).ToString();
                num2 = SqlHelper.ExecuteScalar(sql2).ToString();
                num3 = SqlHelper.ExecuteScalar(sql3).ToString();
                num4 = SqlHelper.ExecuteScalar(sql4).ToString();

                //页面绑定 
                GridViewBind();
                GridViewBind2();
                GridViewBind3();
            }

        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " where rwzt!='录入'";
            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str1 = Str1 + " and " + query_tj.SelectedItem.Value + " like '%" + hkdb.GetStr(query_content.Text) + "%' ";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from OA_RWD01" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select (case when ynxs='是' then 'ch' else 'noch' end) as ynxs,* from OA_RWD01 a left join hk_ZDYLX c on a.rwxz=c.id " + Str1 + " order by fbsj desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            //DataSet ds = SqlHelper.ExecuteDs("select (case when ynxs='是' then 'ch' else 'noch' end) as ynxs,* from (select a.rwid, 'wz' as wz from OA_Rwd01 a left join OA_RwPunish b on a.rwid = b.rwid where b.rwid = a.rwid group by a.rwid, a.rwbt) as c right join OA_Rwd01 d on c.rwid = d.rwid left join hk_ZDYLX e on d.rwxz = e.id" + Str1 + " order by fbsj desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);

            GridView1.DataSource = ds;
            GridView1.DataBind();
            if (GridView1.HeaderRow != null)
            {
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
        public void GridViewBind2()
        {

            AspNetPager2.RecordCount = (int)SqlHelper.ExecuteScalar("select  count (distinct a.rwid) from OA_RwPunish b left join OA_Rwd01 a  on a.rwid=b.rwid");
            DataSet ds = SqlHelper.ExecuteDs("select  a.rwid,a.rwbt,a.fbsj from OA_RwPunish b  left join OA_Rwd01 a  on a.rwid=b.rwid group by a.rwid,a.rwbt,a.fbsj order by fbsj desc", AspNetPager2.PageSize * (AspNetPager2.CurrentPageIndex - 1), AspNetPager2.PageSize);
            GridView2.DataSource = ds;
            GridView2.DataBind();
        }
        public void GridViewBind3()
        {
            AspNetPager3.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from YH");
            DataSet ds = SqlHelper.ExecuteDs("select b.zwmc as zw,* from YH a left join zw b on a.ui_zw=b.zwid order by score desc ,ui_desc", AspNetPager3.PageSize * (AspNetPager3.CurrentPageIndex - 1), AspNetPager3.PageSize);
            GridView3.DataSource = ds;
            GridView3.DataBind();
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
        public string getnamebyid(string ids)
        {
            string name = "";
            if (ids != "")
            {
                string[] arr_id = ids.Split(',');
                for (int i = 0; i < arr_id.Length; i++)
                {
                    string name_item = Convert.ToString(SqlHelper.ExecuteScalar("select ui_desc from yh WHERE ui_id ='" + arr_id[i] + "'"));
                    name += name_item + ",";
                }
                name = name.Substring(0, name.Length - 1);
            }
            return name;
        }

        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}