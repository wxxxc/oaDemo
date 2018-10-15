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
    public partial class dbrwybj_a : System.Web.UI.Page
    {

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
            string Str1 = " where (b.rwzt='已发布' or b.rwzt='已完成') and jsr='" + this.Session["userid"] + "'and jszt='已办结' ";
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from  OA_RWD02 a left outer join OA_RWD01 b on (a.ssrwid=b.rwid) left outer JOIN hk_ZDYLX c on (b.rwxz=c.id) left outer join yh d on (b.fbr=d.ui_id)" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select '按用户' as fblxmc,source,(select y.ui_desc+'等' from yh y where ui_id=(select SUBSTRING(convert(varchar(500), z.jsdx)+',',1,CHARINDEX(',',convert(varchar(500), z.jsdx)+',')-1) from OA_RWD01 z  where fblx='3' and a.ssrwid=z.rwid))as jsdxmc,a.jsid,a.ssrwid,a.jszt,a.jsr,a.thcs,b.fblx,b.rwid,b.rwdh,b.rwbt,b.rwnr,(case when b.jjcd='高' then '高' when b.jjcd='中' then '中' else '低' end)as jjcd,b.rwxz,(case when b.ynxs='是' then 'ch' else 'noch' end)as ynxs,b.rwzt,b.fbr,b.fbsj,b.wcsj,c.mc,case when( b.fjmc=''or b.fjmc is null) then null else 'y' end as fjmc01 ,case when ksrq='1900-01-01' then null else ksrq end as ksrq,case when jzrq='1900-01-01' then null else jzrq end as jzrq,d.ui_desc,e.ui_desc as spr,a.spsj,a.spyj,a.sppj,case when (ynxs='是' and jssj>jzrq) then 'yes' else 'no' end as cqzt from OA_RWD02 a left outer join OA_RWD01 b on (a.ssrwid=b.rwid) left outer JOIN hk_ZDYLX c on (b.rwxz=c.id) left outer join yh d on (b.fbr=d.ui_id) left outer join yh e on (a.spr=e.ui_id)" + Str1 + "order by fbsj desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);

            ListView1.DataSource = ds;
            ListView1.DataBind();

        }
        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            ListViewBind();
        }
    }
}