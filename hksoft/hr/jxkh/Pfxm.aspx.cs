using System;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Pfxm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("81102", "81102");
            }
        }
    }
}
