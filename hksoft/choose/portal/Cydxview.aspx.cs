using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.Choose.portal
{
    public partial class Cydxview : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("2");

            if (!IsPostBack)
            {
                DropDownListBind();
            }

            DataSet ds = SqlHelper.ExecuteDs("select nr from hk_CYDX where lx='" + dxlx.SelectedValue + "'");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //dp绑定 
        public void DropDownListBind()
        {
            string sql_dxlx = "select id,mc from hk_ZDYLX where fl='p04' and zt='正常'";
            bd.Bind_DropDownList_NoBlank(dxlx, sql_dxlx, "id", "mc", "", "");
        }

        //gv行处理 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
                e.Row.Attributes.Add("onclick", "javascript:chuan(this)");
            }
        }

        protected void set_null(object sender, EventArgs e)
        {
            Response.Write("<script language=javascript>");
            Response.Write("window.opener.document.getElementById(\"nr\").value='';");
            Response.Write("window.close();<");
            Response.Write("/script>");
        }
    }
}
