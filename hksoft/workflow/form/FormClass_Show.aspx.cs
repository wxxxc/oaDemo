using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.workflow.form
{
    public partial class FormClass_Show : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10906", "0");

                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT fcName,fcRemark from hk_FormClass WHERE fcID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (datar.Read())
                {
                    fcName.Text = datar["fcName"].ToString();
                    fcRemark.Text = hkdb.TbToLb(datar["fcRemark"].ToString());
                    datar.Close();
                }
                else
                {
                    datar.Close();
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }
            }
        }
    }
}
