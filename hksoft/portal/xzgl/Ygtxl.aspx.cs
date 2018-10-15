using System;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Ygtxl : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            hkdb.PassTo("11310", "11310");
        }
    }
}