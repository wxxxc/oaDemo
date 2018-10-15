using System;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.xmgl
{
    public partial class Xmcx_Fj : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            xmid.Text = (string)Request.QueryString["id"].ToString();
            
            if (!IsPostBack)
            {
                hkdb.PassTo("11506", "0");
            }

            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            SqlDataSource1.SelectCommand = "";
            SqlDataSource1.SelectCommand = "select * from OA_XMGL_FJ where xmid='" + hkdb.GetStr(Request.QueryString["id"]) + "'";
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
