using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jhgl
{
    public partial class Bmjhzd : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10203", "10203");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);
            }

            //页面绑定
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string sql = " where jhz='" + this.Session["userid"] + "' and jhsx='1'";

            if (!string.IsNullOrEmpty(jhnf.Text))
            {
                sql = sql + " and a.jhnf='" + hkdb.GetStr(jhnf.Text) + "'";
            }

            if (!string.IsNullOrEmpty(jhcq.Text))
            {
                sql = sql + " and a.jhyf like '%" + hkdb.GetStr(jhcq.Text) + "%'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) as nums from OA_GZJH01 a" + sql);
            DataSet ds = SqlHelper.ExecuteDs("select a.*,b.mc from OA_GZJH01 a left outer JOIN hk_ZDYLX b on (a.jhlx=b.id)" + sql + "order by jhnf,jhyf ", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
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
