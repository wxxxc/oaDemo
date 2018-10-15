using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.rwgl
{
    public partial class wddbrwj : System.Web.UI.Page
    {
        public mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10116", "0");

                //AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //txtSdate.Text = System.DateTime.Now.AddDays(-30).ToString("yyyy-MM-dd");
                txtSdate.Text = Request.Cookies["haoke"].Values["sdate"].ToString();
                txtEdate.Text = System.DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
                
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
            string Str1 = " where (b.rwzt='已发布' or b.rwzt='已完成') and jsr='" + this.Session["userid"] + "'and jszt='已办结' ";
            System.DateTime sdateStr = Convert.ToDateTime(txtSdate.Text);
            System.DateTime edateStr = Convert.ToDateTime(txtEdate.Text);
            Str1 = Str1 + " and fbsj>='" + sdateStr + "' and fbsj<='" + edateStr + "'";

            if (!string.IsNullOrEmpty(rysq.Text))
            {
                Str1 = Str1 + " and fbr = '" + hkdb.GetStr(rysq.Text) + "' ";
            }

            if (!string.IsNullOrEmpty(rwbt.Text))
            {

                Str1 = Str1 + " and " + query_tj.SelectedItem.Value + " like '%" + hkdb.GetStr(rwbt.Text) + "%'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from  OA_RWD02 a left outer join OA_RWD01 b on (a.ssrwid=b.rwid) left outer JOIN hk_ZDYLX c on (b.rwxz=c.id) left outer join yh d on (b.fbr=d.ui_id)" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select '按用户' as fblxmc,source,(select y.ui_desc+'等' from yh y where ui_id=(select SUBSTRING(convert(varchar(500), z.jsdx)+',',1,CHARINDEX(',',convert(varchar(500), z.jsdx)+',')-1) from OA_RWD01 z  where fblx='3' and a.ssrwid=z.rwid))as jsdxmc,a.jsid,a.ssrwid,a.jszt,a.jsr,a.thcs,b.fblx,b.rwid,b.rwdh,b.rwbt,b.rwnr,(case when b.jjcd='高' then '高' when b.jjcd='中' then '中' else '低' end)as jjcd,b.rwxz,(case when b.ynxs='是' then 'ch' else 'noch' end)as ynxs,b.rwzt,b.fbr,b.fbsj,b.wcsj,c.mc,case when( b.fjmc=''or b.fjmc is null) then null else 'y' end as fjmc01 ,case when ksrq='1900-01-01' then null else ksrq end as ksrq,case when jzrq='1900-01-01' then null else jzrq end as jzrq,d.ui_desc,e.ui_desc as spr,a.spsj,a.spyj,a.sppj,case when (ynxs='是' and jssj>jzrq) then 'yes' else 'no' end as cqzt from OA_RWD02 a left outer join OA_RWD01 b on (a.ssrwid=b.rwid) left outer JOIN hk_ZDYLX c on (b.rwxz=c.id) left outer join yh d on (b.fbr=d.ui_id) left outer join yh e on (a.spr=e.ui_id)" + Str1 + "order by fbsj desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
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
