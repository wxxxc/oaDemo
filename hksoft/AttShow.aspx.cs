using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hksoft
{
    public partial class AttShow : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                //附件
                bd.GetAtt(Request.QueryString["number"].ToString(), Request.QueryString["class"].ToString(), Request.QueryString["folder"].ToString(), fujian);
            }
        }
    }
}