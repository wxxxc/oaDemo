using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.rwgl
{
    public partial class wddbrw : System.Web.UI.Page
    {
        public mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10116", "10116");

                //AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //ҳ��� 
                GridViewBind();
            }
        }

        //��ѯ 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv�� 
        public void GridViewBind()
        {
            string Str1 = " where b.rwzt='�ѷ���' and jsr='" + this.Session["userid"] + "'and (jszt='δ����' or jszt ='����˻�') ";
            if (!string.IsNullOrEmpty(query_tj.SelectedItem.Value))
            {
                Str1 = Str1 + " and jjcd = '" + query_tj.SelectedItem.Value + "' ";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from  OA_RWD02 a left outer join OA_RWD01 b on (a.ssrwid=b.rwid) left outer JOIN hk_ZDYLX c on (b.rwxz=c.id) left outer join yh d on (b.fbr=d.ui_id)" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select '���û�' as fblxmc,source,(select y.ui_desc+'��' from yh y where ui_id=(select SUBSTRING(convert(varchar(500), z.jsdx)+',',1,CHARINDEX(',',convert(varchar(500), z.jsdx)+',')-1) from OA_RWD01 z  where fblx='3' and a.ssrwid=z.rwid))as jsdxmc,a.jsid,a.ssrwid,a.jszt,a.jsr,a.thcs,b.fblx,b.rwid,b.rwdh,b.rwbt,b.rwnr,(case when b.jjcd='��' then '��' when b.jjcd='��' then '��' else '��' end)as jjcd,b.rwxz,(case when b.ynxs='��' then 'ch' else 'noch' end)as ynxs,b.fbr,b.fbsj,b.wcsj,c.mc,case when( b.fjmc=''or b.fjmc is null) then null else 'y' end as fjmc01 ,case when ksrq='1900-01-01' then null else ksrq end as ksrq,case when jzrq='1900-01-01' then null else jzrq end as jzrq,d.ui_desc,case when (ynxs='��' and getdate()>jzrq) then 'yes' else 'no' end as cqzt from OA_RWD02 a left outer join OA_RWD01 b on (a.ssrwid=b.rwid) left outer JOIN hk_ZDYLX c on (b.rwxz=c.id) left outer join yh d on (b.fbr=d.ui_id)" + Str1 + "order by fbsj desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        //gv�д��� 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}
