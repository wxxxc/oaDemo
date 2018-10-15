using System;
using System.Data;
using haoke365;

namespace hkpro.app.portal
{
    public partial class Msg : System.Web.UI.Page
    {

        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {

            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                //AspNetPager1.PageSize = 5;

                //绑定数据 
                ListViewBind();
            }
        }

        public void ListViewBind()
        {
            string Sql = "";
            DataSet ds;

            if (txt_query.Text == "sj")
            {
                //收件箱
                Sql = " WHERE JSR='" + this.Session["userid"] + "'";

                //if (!string.IsNullOrEmpty(ddlZt.SelectedValue))
                //{
                //    Sql = Sql + " AND ZT='0'";
                //}

                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) AS NUMS FROM hk_Mess_JS A " + Sql);
                ds = SqlHelper.ExecuteDs("SELECT A.ID,A.ZT,B.NR,B.FSR,B.FSSJ,'发件人:'+C.UI_DESC AS UI_DESC,'Msg_Show.aspx?id='+CAST(A.ID AS VARCHAR(10)) AS LJ FROM HK_MESS_JS A LEFT OUTER JOIN HK_MESS_FS B ON (A.ID=B.ID) LEFT OUTER JOIN YH C ON (B.FSR=C.UI_ID) " + Sql + " ORDER BY B.FSSJ DESC",
                    AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                ListView1.DataSource = ds;
                ListView1.DataBind();
            }
            if (txt_query.Text == "fj")
            {
                //发件箱
                Sql = " WHERE FSR='" + this.Session["userid"] + "'";

                //if (!string.IsNullOrEmpty(ddlZt.SelectedValue))
                //{
                //    Sql = Sql + " AND ZT='0'";
                //}

                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) AS NUMS FROM HK_MESS_FS A LEFT OUTER JOIN HK_MESS_JS B ON (A.ID=B.ID) " + Sql);
                ds = SqlHelper.ExecuteDs("SELECT A.ID,B.JSR,A.NR,B.ZT,A.FSSJ,'收件人:' + C.UI_DESC AS UI_DESC,'#' AS LJ FROM HK_MESS_FS A LEFT OUTER JOIN HK_MESS_JS B ON (A.ID=B.ID) LEFT OUTER JOIN YH C ON (B.JSR=C.UI_ID)" + Sql + " ORDER BY FSSJ DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                ListView1.DataSource = ds;
                ListView1.DataBind();
            }
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
