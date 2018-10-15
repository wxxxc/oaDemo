using System;
using System.Web.UI;
using haoke365;

namespace hkpro.portal.csxx
{
    public partial class Gzrsz : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("60104", "60104");
            }
        }

        //设置 
        protected void Set_Click(object sender, EventArgs e)
        {
            Server.Transfer("Gzrsz_Set.aspx?s=" + txtSdate.Text + "&e=" + txtEdate.Text + "");
        }
    }
}
