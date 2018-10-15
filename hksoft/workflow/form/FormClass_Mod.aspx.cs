using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.workflow.form
{
    public partial class FormClass_Mod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10906", "0");

                SqlDataReader datar = SqlHelper.ExecuteReader("select fcName,fcRemark from hk_FormClass where fcID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (datar.Read())
                {
                    fcName.Text = datar["fcName"].ToString();
                    fcRemark.Text = datar["fcRemark"].ToString();
                    datar.Close();
                }
                else
                {
                    datar.Close();
                    mydb.Alert_Goto("此记录不存在，可能已被删除！", "FormClass.aspx");
                }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE hk_FormClass set fcName='" + hkdb.GetStr(fcName.Text) + "',fcRemark='" + hkdb.GetStr(fcRemark.Text) + "' where fcID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            mydb.Alert_Goto("保存成功！", "FormClass.aspx");
        }
    }
}
