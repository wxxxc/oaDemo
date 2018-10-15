using System;
using System.Collections;
using haoke365;

namespace hkpro.workflow.flow
{
    public partial class WorkFlow_Node_SaveLayOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string str1 = null;
            str1 = "" + Request.QueryString["str"].ToString() + "";
            ArrayList myarr = new ArrayList();
            string[] mystr = str1.Split(';');
            for (int s = 0; s < mystr.Length; s++)
            {
                try
                {
                    SqlHelper.ExecuteSql("UPDATE hk_WorkFlowNode SET " + mystr[s] + "");
                }
                catch
                {
                    //
                }
            }
            mydb.Alert_Reload_Close("保存成功");
        }
    }
}
