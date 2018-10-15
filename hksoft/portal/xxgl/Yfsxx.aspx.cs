using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.xxgl
{
    public partial class Yfsxx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10101,1001", "0");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                GridViewBind();
            }
        }

        //刷新 
        protected void Receive_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //收消息
        public void GridViewBind()
        {
            string str1 = " WHERE FSR='" + this.Session["userid"] + "'";

            switch (jsfa.SelectedValue)
            {
                case "0":
                    str1 = str1 + " AND ZT='0'";
                    break;
                case "1":
                    str1 = str1 + " AND ZT='1'";
                    break;
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) AS NUMS FROM HK_MESS_FS A LEFT OUTER JOIN HK_MESS_JS B ON (A.ID=B.ID)" + str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.ID,B.JSR,A.NR,B.ZT,A.FSSJ,C.UI_DESC FROM HK_MESS_FS A LEFT OUTER JOIN HK_MESS_JS B ON (A.ID=B.ID) LEFT OUTER JOIN YH C ON (B.JSR=C.UI_ID)" + str1 + " ORDER BY FSSJ DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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
