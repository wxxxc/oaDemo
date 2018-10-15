using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.workflow.form
{
    public partial class FormDesign_Add_clmod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10907", "0");

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_FormColumn WHERE clNo='" + hkdb.GetStr(Request.QueryString["Number"]) + "'");
                if (dr.Read())
                {
                    Name.Text = dr["clName"].ToString();
                    Type.SelectedValue = dr["clType"].ToString();
                }
                dr.Close();
            }
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("Update hk_FormColumn SET clName='" + hkdb.GetStr(Name.Text) + "',clType='" + Type.SelectedValue + "'WHERE clNo='" + hkdb.GetStr(Request.QueryString["Number"]) + "'");
            mydb.Alert_Close("保存成功！");
        }
    }
}
