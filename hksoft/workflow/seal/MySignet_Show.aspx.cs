using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.workflow.seal
{
    public partial class MySignet_Show : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM hk_Seal WHERE sID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            if (datar.Read())
            {
                lblsName.Text = datar["sName"].ToString();
                lblsType.Text = datar["sType"].ToString();
                lblsStatus.Text = datar["sStatus"].ToString();
                lblsRemark.Text = hkdb.TbToLb(datar["sRemark"].ToString());
                sPicNewName.ImageUrl = "../../Attach/flow/Seal/" + datar["sPicNewName"].ToString();
            }
            datar.Close();
        }
    }
}
