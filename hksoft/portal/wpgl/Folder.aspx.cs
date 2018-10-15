using System;
using haoke365;

namespace hkpro.portal.wpgl
{
    public partial class Folder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10109", "10109");
            }
        }
    }
}
