using haoke365;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hksoft.app.task
{
    public partial class gryj_a : System.Web.UI.Page
    {
        public mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("9");

            if (!IsPostBack)
            {              


                //页面绑定 
                ListViewBind();
            }
        }


        //gv绑定 
        public void ListViewBind()
        {
            string Str1 = "";
            DataSet ds;

            if (txt_query.Text == "wjs")
            {
                Str1 = "where b.jszt='未接收' and a.fbsj+1<GETDATE() and a.rwzt='已发布' and b.jsr='" + this.Session["userid"] + "'";
                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from OA_Rwd01 a left join OA_Rwd02 b on a .rwid=b.ssrwid " + Str1);
                ds = SqlHelper.ExecuteDs("select case when(ynxs = '是' and getdate() > jzrq) then 'wz' else 'wz' end as cqzt,datediff(day,fbsj,GETDATE()) as day,rwid,rwbt,fbsj,jsr,jszt,jzrq,ynxs from OA_Rwd01 a left join OA_Rwd02 b on a .rwid=b.ssrwid " + Str1 + " order by a.fbsj asc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                ListView1.DataSource = ds;
                ListView1.DataBind();
            }
            if (txt_query.Text == "ycs")
            {
                Str1 = "where b.jszt!='已办结' and a.ynxs='是' and a.jzrq<GETDATE() and b.jsr='" + this.Session["userid"] + "'";
                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from OA_Rwd01 a left join OA_Rwd02 b on a .rwid=b.ssrwid " + Str1);
                ds = SqlHelper.ExecuteDs("select case when(ynxs = '是' and getdate() > jzrq) then 'yes' else 'yes' end as cqzt,datediff(day,fbsj,GETDATE()) as day,rwid,rwbt,fbsj,jsr,jszt,jzrq,ynxs from OA_Rwd01 a left join OA_Rwd02 b on a .rwid=b.ssrwid " + Str1 + " order by a.fbsj asc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                ListView1.DataSource = ds;
                ListView1.DataBind();
            }
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            ListViewBind();
        }

        protected void Query_Click(object sender, EventArgs e)
        {
            ListViewBind();
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
