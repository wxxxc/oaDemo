using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class AddWork_Show : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public static string Namefile;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT B.fName FROM hk_WorkFlow A LEFT OUTER JOIN hk_Form B ON (A.FK_fid=B.fID) WHERE (CHARINDEX('," + this.Session["deptid"] + ",',','+wfDeptIDs+',') > 0) AND FK_fid='" + hkdb.GetStr(Request.QueryString["FormId"]) + "'");
                if (dr.Read())
                {
                    Namefile = dr["fName"].ToString();
                }
                else
                {
                    Namefile = "暂无流程";
                }
                dr.Close();

                GridViewBind();
            }
        }

        public void GridViewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM hk_WorkFlow WHERE (CHARINDEX('," + this.Session["deptid"] + ",',','+wfDeptIDs+',') > 0) AND FK_fid='" + hkdb.GetStr(Request.QueryString["FormId"]) + "' ORDER BY wfID DESC");
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
