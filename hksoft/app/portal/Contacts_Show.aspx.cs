using System;
using System.Data;
using haoke365;

namespace hkpro.app.portal
{
    public partial class Contacts_Show : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["id"].ToString()))
                {
                    //绑定数据 
                    ListViewBind();
                }
            }
        }

        public void ListViewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,(CASE WHEN SEX='女' THEN 'F' ELSE 'M' END)AS UI_PIC FROM hk_Ygtxl A WHERE ID='" + Request.QueryString["id"].ToString() + "'");
            ListView1.DataSource = ds;
            ListView1.DataBind();
        }
    }
}
