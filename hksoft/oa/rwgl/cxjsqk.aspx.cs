using System;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.rwgl
{
    public partial class cxjsqk : System.Web.UI.Page
    {
        public mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10303", "10303");

                //AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //页面绑定 
                GridViewBind();
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
            string Str1 = " where (rwzt='已暂停' or rwzt='已发布') and fbr='" + this.Session["userid"] + "' ";
            
            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str1 = Str1 + "and " + query_tj.SelectedItem.Value + " like '%" + hkdb.GetStr(query_content.Text) + "%' ";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from OA_RWD01 a left outer join yh b on (a.fbr=b.ui_id) left outer JOIN hk_ZDYLX c on (a.rwxz=c.id)" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select fblx,'按用户' as fblxmc,(select y.ui_desc+'等' from yh y where ui_id=(select SUBSTRING(convert(varchar(500), z.jsdx)+',',1,CHARINDEX(',',convert(varchar(500), z.jsdx)+',')-1) from OA_RWD01 z  where fblx='3' and a.rwid=z.rwid))as jsdxmc,rwid,rwdh,rwbt,rwnr,(case when jjcd='高' then '高' when jjcd='中' then '中' else '低' end)as jjcd,rwxz,(case when ynxs='是' then 'ch' else 'noch' end)as ynxs,rwzt,fbr,fbsj,wcsj,b.ui_desc,c.mc,case when( fjmc=''or fjmc is null) then null else 'y' end as fjmc,case when ksrq='1900-01-01' then null else ksrq end as ksrq,case when jzrq='1900-01-01' then null else jzrq end as jzrq from OA_RWD01 a left outer join yh b on (a.fbr=b.ui_id) left outer JOIN hk_ZDYLX c on (a.rwxz=c.id)" + Str1 + "order by fbsj desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
                string rwzt = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "rwzt")).Trim();

                if (rwzt == "已暂停")
                {
                    e.Row.ForeColor = Color.Red;
                }

                if (rwzt == "已完成")
                {
                    e.Row.ForeColor = Color.Green;
                }

                if (rwzt == "已关闭")
                {
                    e.Row.ForeColor = Color.LightGray;
                }
            }
        }
    }
}
