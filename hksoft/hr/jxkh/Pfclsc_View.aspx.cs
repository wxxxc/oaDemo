using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Pfclsc_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object Sender, EventArgs E)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("81106", "0");

                GridViewBind();
            }
        }

        //gv绑定 
        public void GridViewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("SELECT DISTINCT A.SSKPID,B.*,(SELECT SUM(FZ) FROM HR_Kpdf_Kpxm02 WHERE SSKPID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' AND SSBID=B.BID)AS GWF,(SELECT COUNT(*) FROM hk_AttUpload WHERE attClass='h21' AND attkey in (SELECT kpfj FROM HR_Kpdf_Kpxm03 WHERE sskpid=A.sskpid AND ssbid=B.bid))AS fjsl FROM HR_Kpdf_Kpxm02 A LEFT OUTER JOIN HR_Kpdf_Bkpr01 B ON(A.SSBID=B.BID) WHERE A.SSKPID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' ORDER BY B.BID");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //gv行处理 
        public void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}
