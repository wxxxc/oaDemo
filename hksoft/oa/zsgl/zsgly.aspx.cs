using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class zsgly : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("12108", "12108");

                BindAttr();

                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KlManger");
                if (datar.Read())
                {
                    UserName.Text = datar["Realname"].ToString();
                    UserID.Text = datar["Username"].ToString();
                    datar.Close();
                }
            }
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteScalar("delete from OA_KlManger");
            SqlHelper.ExecuteScalar("insert into OA_KlManger(Username,Realname) values('" + hkdb.GetStr(UserID.Text) + "','" + hkdb.GetStr(UserName.Text) + "')");
            mydb.Alert_Close("保存成功！");
        }
    }
}