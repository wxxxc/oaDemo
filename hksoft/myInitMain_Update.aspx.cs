using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro
{
    public partial class myInitMain_Update : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlDataReader datar = SqlHelper.ExecuteReader("select * from hk_MyDesk where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (datar.Read())
                {
                    topnum.Text = datar["topnum"].ToString();
                }
                datar.Close();
            }

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo_Close("Y") == "true")
            {
                return;
            }

            SqlHelper.ExecuteSql("update hk_MyDesk  Set topnum='" + hkdb.GetStr(topnum.Text) + "'  where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            mydb.Alert_Refresh_Close("保存成功！", "myInitMain.aspx");
        }
    }
}
