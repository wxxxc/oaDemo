using System;
using haoke365;

namespace hkpro.portal.grbg
{
    public partial class Txl : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");
        }
    }
}
