﻿using System;

namespace hkpro.oa.zsgl
{
    public partial class zszj_down : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("../../Attach/oa/knowledge/" + Server.UrlDecode(Request.QueryString["number"]) + "");
        }
    }
}
