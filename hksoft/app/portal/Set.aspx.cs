using System;
using haoke365;
using System.Data;

namespace hkpro.app.portal
{
    public partial class Set : System.Web.UI.Page
    {
        public static string userImg, userName;

        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("9");
             if (!IsPostBack)
            {
                userImg = Convert.ToString(SqlHelper.ExecuteScalar("SELECT photo FROM YH WHERE ui_id='" + this.Session["userid"] + "'"));
                if (userImg.Equals(""))
                {
                    userImg = "../assets/images/users/1.jpg";
                }
                userName = Session["username"].ToString();

            }
        }
    }
}
