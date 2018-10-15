using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.workflow.flow
{
    public partial class WorkFlow_Show : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.*,B.fName,C.ffName FROM hk_WorkFlow A LEFT OUTER JOIN hk_Form B ON(A.FK_fid=B.fID) LEFT OUTER JOIN hk_WorkFlowFolder C ON(A.FK_ffid=C.ffID) WHERE wfID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (dr.Read())
                {
                    lblfNo.Text = dr["FK_fno"].ToString();
                    lblfName.Text = dr["fName"].ToString();
                    lblwfNo.Text = dr["wfNo"].ToString();
                    lblwfStatus.Text = dr["wfStatus"].ToString();
                    lblwfName.Text = dr["wfName"].ToString();
                    lblwfUserIDs.Text = dr["wfUserIDs"].ToString();
                    lblwfUserNames.Text = dr["wfUserNames"].ToString();
                    lblwfDeptIDs.Text = dr["wfDeptIDs"].ToString();
                    lblwfDept.Text = dr["wfDeptNames"].ToString();
                    lblFK_ffid.Text = dr["ffName"].ToString();
                    lblFileNo.Text = dr["FileNo"].ToString();
                    lblFileStartNo.Text = dr["FileStartNo"].ToString();
                    lblFileDigit.Text = dr["FileDigit"].ToString();
                    lblynModFileNo.Text = dr["ynModFileNo"].ToString();
                }
                dr.Close();
            }
        }
    }
}
