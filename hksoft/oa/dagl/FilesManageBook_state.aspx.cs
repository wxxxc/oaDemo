using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.dagl
{
    public partial class FilesManageBook_state : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static string JrUsername;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                //hkdb.PassTo("11803", "0");

                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_FilesManageBook where id='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (datar.Read())
                {
                    JrUsername = datar["JrRealname"].ToString();
                }
                datar.Close();
            }
        }
    }
}
