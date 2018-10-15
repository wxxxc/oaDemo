using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.Choose.oa
{
    public partial class ChoosePwS : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("2");

            if (!IsPostBack)
            {
                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);
            }

            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " WHERE PWLX='副主管评委'";

            if (!string.IsNullOrEmpty(pwxm.Text))
            {
                Str1 = Str1 + " and PWXM like '%" + hkdb.GetStr(pwxm.Text) + "%' ";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*)AS NUMS FROM HR_Kpdf_Pw" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM HR_Kpdf_Pw" + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //查询 
        public void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        public void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";      //单击变色
            }
        }
    }
}
