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
    public partial class fbdbrw : System.Web.UI.Page
    {
        public mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                hkdb.PassTo("10301", "10301");

                //AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //短信
                //dxtz.Visible = Convert.ToBoolean(hkdb.VeriSms());

                //页面绑定 
                ListViewBind();
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
            string Str1 = " where rwzt='录入' and fbr='" + this.Session["userid"] + "' ";

            //if (!string.IsNullOrEmpty(query_content.Text))
            //{
            //    Str1 = Str1 + "and " + query_tj.SelectedItem.Value + " like '%" + hkdb.GetStr(query_content.Text) + "%' ";
            //}

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from OA_RWD01 a left outer join yh b on (a.fbr=b.ui_id) left outer JOIN hk_ZDYLX c on (a.rwxz=c.id)" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select fblx,'按用户' as fblxmc,source,((select y.ui_desc+'等' from yh y where ui_id=(select SUBSTRING(convert(varchar(500), z.jsdx)+',',1,CHARINDEX(',',convert(varchar(500), z.jsdx)+',')-1) from OA_RWD01 z  where fblx='3' and a.rwid=z.rwid)))as jsdxmc,rwid,rwdh,rwbt,rwnr,(case when jjcd='高' then '高' when jjcd='中' then '中' else '低' end)as jjcd,rwxz,(case when ynxs='是' then 'ch' else 'noch' end)as ynxs,rwzt,fbr,fbsj,wcsj,b.ui_desc,c.mc,case when( fjmc=''or fjmc is null) then null else 'y' end as fjmc,case when ksrq='1900-01-01' then null else ksrq end as ksrq,case when jzrq='1900-01-01' then null else jzrq end as jzrq from OA_RWD01 a left outer join yh b on (a.fbr=b.ui_id) left outer JOIN hk_ZDYLX c on (a.rwxz=c.id)" + Str1 + "order by fbsj desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            ListView1.DataSource = ds;
            ListView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            ListViewBind();
        }

        //gv行处理 
        //protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
        //    }

        //}
    }

}