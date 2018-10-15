using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class Flow_Show : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.*,B.fName FROM hk_WorkFlow A LEFT OUTER JOIN hk_Form B ON(A.FK_fid=B.fID) WHERE wfNo='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "'");
                if (dr.Read())
                {
                    lblfid.Text = dr["wfID"].ToString();
                    lblfno.Text = dr["FK_fno"].ToString();
                    lblfname.Text = dr["fName"].ToString();
                }
                dr.Close();

                Random g = new Random();
                string rad = g.Next(10000).ToString();
                lblno.Text = "" + System.DateTime.Now.Year.ToString() + "" + System.DateTime.Now.Month.ToString() + "" + System.DateTime.Now.Day.ToString() + "" + System.DateTime.Now.Hour.ToString() + "" + System.DateTime.Now.Minute.ToString() + "" + System.DateTime.Now.Second.ToString() + "" + System.DateTime.Now.Millisecond.ToString() + "" + rad + "";
            }
        }
    }
}
