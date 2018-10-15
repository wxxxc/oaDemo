using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class zshdShowBj : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("12106", "0");

                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KlAction where id='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (datar.Read())
                {
                    title.Text = datar["title"].ToString();
                    editor.Value = datar["Content"].ToString();
                }
                datar.Close();
            }
        }

        protected void BtnS_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("Update OA_KlAction  Set title='" + hkdb.GetStr(title.Text) + "',Content='" + editor.Value + "',Settime='" + System.DateTime.Now.ToString() + "'  where id='" + int.Parse(Request.QueryString["id"]) + "'");

            mydb.Alert_Goto("提交成功！", "zshdShow.aspx?id=" + Request.QueryString["Backid"] + "");
        }

        protected void BtnF_Click(object sender, EventArgs e)
        {
            Response.Redirect("zshdShow.aspx?id=" + Request.QueryString["Backid"] + "");
        }
    }
}
