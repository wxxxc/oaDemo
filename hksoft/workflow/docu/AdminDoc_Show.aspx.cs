using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.workflow.docu
{
    public partial class AdminDoc_Show : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public static string adnewname;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10909", "0");

                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_AdminDoc WHERE adID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (datar1.Read())
                {
                    adnewname = datar1["adNewName"].ToString();
                    Name.Text = datar1["adName"].ToString();
                    UserName.Text = datar1["adUserNames"].ToString();
                }
                datar1.Close();
            }
        }
    }
}
