using System;
using haoke365;
using System.Data;

namespace hkpro.app.portal
{
    public partial class Notice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                //绑定数据 
                ListViewBind();
            }
        }

        public void ListViewBind()
        {
            //SqlDataSource1.SelectCommand = "";
            //SqlDataSource1.SelectCommand = "select A.ggid,'['+C.MC+']'+A.ggzt AS ggzt,A.lrsj,B.UI_DESC AS LRRMC from hk_QYGG A LEFT OUTER JOIN YH B ON(A.LRR=B.UI_ID) LEFT OUTER JOIN hk_ZDYLX C ON(A.GGFL=C.ID) where A.zt='已发布' and A.lx='企业' and gglb='1' order by A.lrsj desc";
            string Str1 = "where A.zt = '已发布' and A.lx = '企业' and gglb = '1'";

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from hk_QYGG A LEFT OUTER JOIN YH B ON(A.LRR = B.UI_ID) LEFT OUTER JOIN hk_ZDYLX C ON(A.GGFL = C.ID)" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("Select A.ggid,'['+C.MC+']'+A.ggzt AS ggzt,A.lrsj,B.UI_DESC AS LRRMC from hk_QYGG A LEFT OUTER JOIN YH B ON(A.LRR=B.UI_ID) LEFT OUTER JOIN hk_ZDYLX C ON(A.GGFL=C.ID) " + Str1 + " order by A.lrsj desc",
              AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            ListView1.DataSource = ds;
            ListView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            ListViewBind();
        }
    }
}
