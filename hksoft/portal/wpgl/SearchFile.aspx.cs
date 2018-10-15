using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.wpgl
{
    public partial class SearchFile : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10109", "0");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);
            }

            if (IsPostBack)
            {
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
            string Str1 = " WHERE (B.USERID='" + this.Session["userid"] + "' AND A.FILENAME LIKE '%" + hkdb.GetStr(cxtj.Text) + "%')";
            if (share.Checked == true)
            {
                Str1 = Str1 + " OR (A.FILENAME LIKE '%" + hkdb.GetStr(cxtj.Text) + "%' AND B.SHARE='是')";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM HK_NETDISK_URL A LEFT OUTER JOIN HK_NETDISK_DIR B ON (A.DIRID=B.DIRID)" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,ROUND(A.CONTAIN/1024,2)AS CONTAIN2,B.NAME,C.UI_DESC FROM HK_NETDISK_URL A LEFT OUTER JOIN HK_NETDISK_DIR B ON (A.DIRID=B.DIRID) LEFT OUTER JOIN YH C ON(B.USERID=C.UI_ID)" + Str1 + " ORDER BY A.CREATEDATE", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //返回 
        protected void ReturnBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShowDisk.aspx");
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
