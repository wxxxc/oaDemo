using haoke365;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hksoft.oa.rwgl
{
    public partial class gryj : System.Web.UI.Page
    {
        public mydb hkdb = new mydb();
        public static int num;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("13803", "13803");


                //页面绑定 
                GridViewBind();
                GridViewBind2();
                num = AspNetPager1.RecordCount + AspNetPager2.RecordCount;

            }
        }


        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = "where b.jszt='未接收' and a.fbsj+1<GETDATE() and a.rwzt='已发布' and b.jsr='" + this.Session["userid"] + "'";
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from OA_Rwd01 a left join OA_Rwd02 b on a .rwid=b.ssrwid " + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select case when(ynxs = '是' and getdate() > jzrq) then 'wz' else 'wz' end as cqzt,datediff(day,fbsj,GETDATE()) as day,rwid,rwbt,fbsj,jsr,jszt,jzrq,ynxs from OA_Rwd01 a left join OA_Rwd02 b on a .rwid=b.ssrwid " + Str1 + " order by a.fbsj asc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }
        public void GridViewBind2()
        {
            string Str1 = "where  b.jszt!='已办结' and a.ynxs='是' and a.jzrq<GETDATE() and b.jsr='" + this.Session["userid"] + "'";

            AspNetPager2.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from OA_Rwd01 a left join OA_Rwd02 b on a .rwid=b.ssrwid " + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select case when(ynxs = '是' and getdate() > jzrq) then 'yes' else 'yes' end as cqzt,datediff(day,fbsj,GETDATE()) as day,rwid,rwbt,fbsj,jsr,jszt,jzrq,ynxs from OA_Rwd01 a left join OA_Rwd02 b on a .rwid=b.ssrwid " + Str1 + " order by a.fbsj asc", AspNetPager2.PageSize * (AspNetPager2.CurrentPageIndex - 1), AspNetPager2.PageSize);
            GridView2.DataSource = ds;
            GridView2.DataBind();
        }

        protected void AspNetPager2_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind2();
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

        public string timediff(string d)

        {

            DateTime d1 = Convert.ToDateTime(d);

            DateTime d2 = DateTime.Now;

            TimeSpan d3 = d2.Subtract(d1);

            var a = ""

            + d3.Days.ToString() + "天"

            + d3.Hours.ToString() + "小时"

            + d3.Minutes.ToString() + "分钟"

            + d3.Seconds.ToString() + "秒";
            return a;
        }
    }
}