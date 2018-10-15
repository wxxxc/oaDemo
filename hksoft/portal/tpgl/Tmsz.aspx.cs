using System;
using haoke365;

namespace hkpro.portal.tpgl
{
    public partial class Tmsz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11307", "11307");
            }
        }
    }
}
