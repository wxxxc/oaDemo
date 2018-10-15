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
    public partial class wztb : System.Web.UI.Page
    {
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    mydb hkdb = new mydb();
        //    hkdb.VeriSess("1");
        //    if (!IsPostBack)
        //    {
        //        AspNetPager2.PageSize = 10;

        //        //绑定数据 
        //        GridViewBind2();
        //    }

        //}

        ////查询 


        ////gv绑定 

        //public void GridViewBind2()
        //{
        //    AspNetPager2.RecordCount = (int)SqlHelper.ExecuteScalar("select  count (distinct a.rwid) from OA_RwPunish b left join OA_Rwd01 a  on a.rwid=b.rwid");
        //    DataSet ds = SqlHelper.ExecuteDs("select  a.rwid,a.rwbt,a.fbsj from OA_RwPunish b  left join OA_Rwd01 a  on a.rwid=b.rwid group by a.rwid,a.rwbt,a.fbsj order by fbsj desc", AspNetPager2.PageSize * (AspNetPager2.CurrentPageIndex - 1), AspNetPager2.PageSize);
        //    GridView2.DataSource = ds;
        //    GridView2.DataBind();
        //}


        //protected void AspNetPager2_PageChanged(object sender, System.EventArgs e)
        //{
        //    GridViewBind2();
        //}

        //public string getnamebyid(string ids)
        //{
        //    string name = "";
        //    if (ids != "")
        //    {
        //        string[] arr_id = ids.Split(',');
        //        for (int i = 0; i < arr_id.Length; i++)
        //        {
        //            string name_item = Convert.ToString(SqlHelper.ExecuteScalar("select ui_desc from yh WHERE ui_id ='" + arr_id[i] + "'"));
        //            name += name_item + ",";
        //        }
        //        name = name.Substring(0, name.Length - 1);
        //    }
        //    return name;
        //}

        //protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
        //    }
        //}
      
             protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();

            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                AspNetPager1.PageSize = 5;

                //绑定数据 
                ListViewBind();
            }
        }

        private void ListViewBind()
        {
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select  count (distinct a.rwid) from OA_RwPunish b left join OA_Rwd01 a  on a.rwid=b.rwid");
            DataSet ds = SqlHelper.ExecuteDs("select  a.rwid,a.rwbt,a.fbsj, cast(a.zrr as varchar(4000)) as zrr from OA_RwPunish b  left join OA_Rwd01 a  on a.rwid=b.rwid where a.rwid is not null group by a.rwid,a.rwbt,a.fbsj,cast(a.zrr as varchar(4000)) order by fbsj desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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