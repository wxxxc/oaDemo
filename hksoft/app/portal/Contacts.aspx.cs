using System;
using System.Data;
using haoke365;

namespace hkpro.app.portal
{
    public partial class Contacts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                AspNetPager1.PageSize = 10;

                //绑定数据 
                ListViewBind();
            }
        }

        public void ListViewBind()
        {
            string Sql = " where 1=1";
            if (!string.IsNullOrEmpty(tj.Text))
            {
                Sql = Sql + " AND (name like '%" + tj.Text + "%' or unit like '%" + tj.Text + "%' or post like '%" + tj.Text + "%')";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) AS NUMS FROM hk_Ygtxl A" + Sql);
            DataSet ds = SqlHelper.ExecuteDs("SELECT id,name+'('+sex+')'as name,unit,post FROM hk_Ygtxl a" + Sql + " ORDER BY name", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            ListView1.DataSource = ds;
            ListView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            ListViewBind();
        }

        protected void Query_Click(object sender, EventArgs e)
        {
            ListViewBind();
        }
    }
}
