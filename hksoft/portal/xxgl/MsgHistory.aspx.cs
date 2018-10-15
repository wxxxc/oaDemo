using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.xxgl
{
    public partial class MsgHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("2");

            if (!IsPostBack)
            {
                GridViewBind();
            }
        }

        public void GridViewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("select b.fssj,c.ui_desc,b.nr from hk_Mess_JS a,hk_Mess_FS b left outer join yh c on (b.fsr=c.ui_id) where a.id=b.id and jsr='" + this.Session["userid"] + "' order by fssj desc");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}