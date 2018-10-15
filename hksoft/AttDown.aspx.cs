using System;
using haoke365;

namespace hkpro
{
    public partial class AttDown : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("Attach/" + Request.QueryString["fname"] + "/" + Server.UrlDecode(Request.QueryString["number"]) + "");
        }
    }
}
