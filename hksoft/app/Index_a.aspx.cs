using haoke365;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hksoft.app
{
    public partial class Index_a : System.Web.UI.Page
    {
        public mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("9");
            if (!IsPostBack)
            {
                //公共信息
                if (this.Session["systype"].ToString() == "A")
                {

                }
                else  //子登录页
                {
                    if (this.Session["systype"].ToString() == "R")
                    {
                        mydb.Alert("提示:首次点击【报表示例】中的报表时，需要1分钟左右的加载时间，还请耐心等待！");
                    }
                }
              
             ////获取办理任务
             //       string sql1 = "select count(*) from OA_Rwd01 where rwzt='已发布'";
             //       num1.Value = SqlHelper.ExecuteScalar(sql1).ToString();
              
             //       //获取高度紧急任务
             //       string sql2 = "select count(*) from OA_Rwd01 where jjcd='高' and rwzt='已发布'";
             //      num2.Value = SqlHelper.ExecuteScalar(sql2).ToString();
           
             //       //获取已超时任务
             //       //string sql3 = "select COUNT(*) from OA_Rwd01 where ynxs='是' and jzrq < CONVERT(DATE,GETDATE(),110) and rwzt!='已完成' and rwzt='已发布'";
             //       //获取限时任务
             //       string sql3 = "select COUNT(*) from OA_Rwd01 where ynxs='是'";
             //     num3 .Value = SqlHelper.ExecuteScalar(sql3).ToString();
              
             //       //获取已完成任务
             //       string sql4 = "select count(*) from OA_Rwd01 where rwzt='已完成'";
             //      num4.Value = SqlHelper.ExecuteScalar(sql4).ToString();
               

                //页面绑定 
                ListViewBind();
                //GridViewBind2();
                //GridViewBind3();
            }

        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            ListViewBind();
        }

        //gv绑定 
        public void ListViewBind()
        {
            string Str1 = " where rwzt!='录入'";

            //if (rwyl.SelectedItem.Value == "bl") {
            //    Str1 = Str1 + " and rwzt like '%已发布%' ";
            //}
            //if (rwyl.SelectedItem.Value == "jj")
            //{
            //    Str1 = Str1 + " and jjcd like '%高%' ";
            //}
            //if (rwyl.SelectedItem.Value == "ls") {
            //    Str1 = Str1 + " and ynxs like '%是%' ";
            //}
            //if (rwyl.SelectedItem.Value == "bj")
            //{
            //    Str1 = Str1 + " and rwzt like '%已完成%' ";
            //}

            if (txt_query.Text == "bl")
            {
                Str1 = Str1 + " and rwzt like '%已发布%' ";
            }
            if (txt_query.Text == "jj")
            {
                Str1 = Str1 + " and jjcd like '%高%' ";
            }
            if (txt_query.Text == "ls")
            {
                Str1 = Str1 + " and ynxs like '%是%' ";
            }
            if (txt_query.Text == "bj")
            {
                Str1 = Str1 + " and rwzt like '%已完成%' ";
            }
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from OA_RWD01" + Str1);
           DataSet ds = SqlHelper.ExecuteDs("select (case when ynxs='是' then 'ch' else 'noch' end) as ynxs,* from OA_RWD01 a left outer join YH b on(a.fbr=b.ui_id) left outer join hk_ZDYLX c on (a.rwxz=c.id)" + Str1 + " order by fbsj desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
 
            //DataSet ds = SqlHelper.ExecuteDs("select (case when ynxs='是' then 'ch' else 'noch' end) as ynxs,* from (select a.rwid, 'wz' as wz from OA_Rwd01 a left join OA_RwPunish b on a.rwid = b.rwid where b.rwid = a.rwid group by a.rwid, a.rwbt) as c right join OA_Rwd01 d on c.rwid = d.rwid left join hk_ZDYLX e on d.rwxz = e.id" + Str1 + " order by fbsj desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);

             ListView1.DataSource = ds;
            ListView1.DataBind();
        }
        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
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
    }
}
