using System;
using haoke365;

namespace hkpro.portal.mkgl
{
    public partial class Mk : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("60101", "60101");
            }
        }
    }
}
