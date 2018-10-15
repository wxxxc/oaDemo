using System;

namespace hkpro.workflow.work
{
    public partial class WorkAttDown : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("../../Attach/flow/work/" + Server.UrlDecode(Request.QueryString["number"]) + "");
        }
    }
}
