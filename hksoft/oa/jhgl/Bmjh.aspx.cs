using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jhgl
{
    public partial class Bmjh : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10202", "10202");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);
            }

            //页面绑定
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string sql = " where jhsx='1' and CHARINDEX('" + this.Session["userid"] + "',sprIDs)>0";

            if (!string.IsNullOrEmpty(zt.SelectedValue))
            {
                sql = sql + " and a.zt='" + zt.SelectedValue + "'";
            }
            if (!string.IsNullOrEmpty(jhnf.Text))
            {
                sql = sql + " and a.jhnf='" + hkdb.GetStr(jhnf.Text) + "'";
            }
            if (!string.IsNullOrEmpty(jhcq.Text))
            {
                sql = sql + " and a.jhyf like '%" + hkdb.GetStr(jhcq.Text) + "%'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) as nums from OA_GZJH01 a" + sql);
            DataSet ds = SqlHelper.ExecuteDs("select a.*,b.mc,c.ui_desc from OA_GZJH01 a left outer JOIN hk_ZDYLX b on (a.jhlx=b.id) left outer join yh c on (a.jhz=c.ui_id)" + sql + "order by jhnf,jhyf ", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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
