using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.workflow.docu
{
    public partial class AdminDoc_Mod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public static string newname;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10909", "0");

                BindAttr();

                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_AdminDoc WHERE adID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (datar1.Read())
                {
                    newname = datar1["adNewName"].ToString();
                    Name.Text = datar1["adName"].ToString();

                    UserID.Text = datar1["adUserIDs"].ToString();
                    UserName.Text = datar1["adUserNames"].ToString();
                }
                datar1.Close();
            }
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");
            SaveBtn.Attributes["onclick"] = "javascript:return checkForm();";
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE hk_AdminDoc SET adName='" + hkdb.GetStr(Name.Text) + "', adUserIDs='" + hkdb.GetStr(UserID.Text) + "' , adUserNames='" + hkdb.GetStr(UserName.Text) + "'  WHERE adID='" + int.Parse(Request.QueryString["id"]) + "'");
            mydb.Alert_Goto("保存成功！", "AdminDoc.aspx");
        }
    }
}
