using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class WorkEnTrusted : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        public static string Name;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11406", "11406");

                BindAttr();
                Name = this.Session["username"].ToString();

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.*,B.ui_desc AS EnUserName FROM hk_WorkFlowEntrust A LEFT OUTER JOIN yh B ON(A.EnUserID=B.ui_id) WHERE feUserID='" + this.Session["userid"] + "'");
                if (dr.Read())
                {
                    ClientUserIDs.Text = dr["EnUserID"].ToString();
                    ClientUserNames.Text = dr["EnUserName"].ToString();
                    rb_status.SelectedValue = dr["feStatus"].ToString();
                }
                dr.Close();
            }
        }

        public void BindAttr()
        {
            ClientUserNames.Attributes.Add("readonly", "readonly");
            SaveBtn.Attributes["onclick"] = "javascript:return chknull();";
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowEntrust WHERE feUserID='" + this.Session["userid"] + "'");
            if (datar1.Read())
            {
                SqlHelper.ExecuteSql("UPDATE hk_WorkFlowEntrust SET EnUserID='" + hkdb.GetStr(ClientUserIDs.Text) + "',feStatus='" + rb_status.SelectedValue + "' WHERE feUserID='" + this.Session["userid"] + "'");
            }
            else
            {
                SqlHelper.ExecuteSql("INSERT INTO hk_WorkFlowEntrust(feUserID,EnUserID,feStatus) VALUES('" + this.Session["userid"] + "','" + hkdb.GetStr(ClientUserIDs.Text) + "','" + rb_status.SelectedValue + "')");
            }
            datar1.Close();

            mydb.Alert_Goto("保存成功！", "WorkEnTrusted.aspx");
        }
    }
}
