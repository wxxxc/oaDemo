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
    public partial class gzpf : System.Web.UI.Page
    {
        public mydb hkdb = new mydb();
        public static string num1, num2, num3, num4;
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("9");
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
                string sql2 = "select count(*) from OA_Rwd01 where jjcd='高' and rwzt='已发布'";
                //获取已超时任务
                //string sql3 = "select COUNT(*) from OA_Rwd01 where ynxs='是' and jzrq < CONVERT(DATE,GETDATE(),110) and rwzt!='已完成' and rwzt='已发布'";
                //获取限时任务
                string sql3 = "select COUNT(*) from OA_Rwd01 where ynxs='是'";
                //获取已完成任务
                string sql4 = "select count(*) from OA_Rwd01 where rwzt='已完成'";
                num1 = SqlHelper.ExecuteScalar(sql1).ToString();
                num2 = SqlHelper.ExecuteScalar(sql2).ToString();
                num3 = SqlHelper.ExecuteScalar(sql3).ToString();
                num4 = SqlHelper.ExecuteScalar(sql4).ToString();


                listViewBind();
            }

        }

       
       
       
        public void listViewBind()
        {
            AspNetPager3.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from YH");
            DataSet ds = SqlHelper.ExecuteDs("select b.zwmc as zw,* from YH a left join zw b on a.ui_zw=b.zwid order by score desc ,ui_desc", AspNetPager3.PageSize * (AspNetPager3.CurrentPageIndex - 1), AspNetPager3.PageSize);
            ListView1.DataSource = ds;
            ListView1.DataBind();
        }
      
        protected void AspNetPager3_PageChanged(object sender, System.EventArgs e)
        {
            listViewBind();
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