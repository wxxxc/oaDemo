using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.bmgl
{
    public partial class Gwzz_View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT B.ZWMC,B.GWZZ FROM YH A LEFT OUTER JOIN ZW B ON(A.UI_ZW=B.ZWID) WHERE UI_ID='" + this.Session["userid"] + "'");
                if (datar.Read())
                {
                    zwmc.Text = datar["ZWMC"].ToString();
                    editor.Value = datar["GWZZ"].ToString();
                    datar.Close();
                }
                else
                {
                    datar.Close();
                    mydb.Alert_Close("您的岗位职责没有登记！");
                }
            }
        }
    }
}
