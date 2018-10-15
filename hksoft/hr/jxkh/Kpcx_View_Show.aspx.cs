using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Kpcx_View_Show : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object Sender, EventArgs E)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("81110", "0");

                //被考评人
                SqlDataReader dr_xm = SqlHelper.ExecuteReader("SELECT XM FROM HR_Kpdf_Bkpr01 WHERE BID='" + hkdb.GetStr(Request.QueryString["bid"].ToString()) + "'");
                if (dr_xm.Read())
                {
                    lblbkpr.Text = dr_xm["xm"].ToString();
                }
                dr_xm.Close();

                GridViewBind();
            }
        }

        //gv绑定 
        public void GridViewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("SELECT (CASE WHEN pwlx='一般评委' THEN '******' ELSE pfrid END)AS pfrid,pwlx,SUM(sjpf)AS sjpf FROM HR_Kpdf_Kpxm04 A WHERE sskpid='" + hkdb.GetStr(Request.QueryString["kpid"].ToString()) + "' AND ssbid='" + hkdb.GetStr(Request.QueryString["bid"].ToString()) + "' AND pwlx IN('一般评委','工作人员评委') GROUP BY pfrid,pwlx ORDER BY pwlx DESC,sjpf DESC");
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
