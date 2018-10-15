using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.workflow.seal
{
    public partial class SignetAudi_Do : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            SqlDataReader datar = SqlHelper.ExecuteReader("SELECT A.*,B.ui_desc FROM hk_Seal A LEFT OUTER JOIN yh B ON(A.sUser=B.ui_id) WHERE sID='" + hkdb.GetStr(Request.QueryString["id"]) + "' AND sStatus='待审'");
            if (datar.Read())
            {
                lblsName.Text = datar["sName"].ToString();
                lblsType.Text = datar["sType"].ToString();
                lblsStatus.Text = datar["sStatus"].ToString();
                lbluID.Text = datar["sUser"].ToString();
                lblsUser.Text = datar["ui_desc"].ToString();
                lblsRemark.Text = hkdb.TbToLb(datar["sRemark"].ToString());
                sPicNewName.ImageUrl = "../../Attach/flow/Seal/" + datar["sPicNewName"].ToString();
            }
            datar.Close();
        }

        protected void AudiY_Click(object sender, EventArgs e)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("Update hk_Seal SET sStatus='正常' WHERE sID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");

            SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + lbluID.Text + "','请注意，您的[" + lblsName.Text + "]印章已经通过审批。'");

            mydb.Alert_Goto("审批成功！", "SignetAudi.aspx");
        }

        protected void AudiN_Click(object sender, EventArgs e)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("Update hk_Seal SET sStatus='退回' WHERE sID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");

            SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + lbluID.Text + "','请注意，您的[" + lblsName.Text + "]印章已经被审批退回。'");

            mydb.Alert_Goto("审批退回！", "SignetAudi.aspx");
        }
    }
}
