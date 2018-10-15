using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro
{
    public partial class MySet : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("1");

            if (!IsPostBack)
            {
                if (this.Session["systype"].ToString() == "G")
                {
                    p_gys1.Visible = false;
                    p_gys2.Visible = false;
                }

                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT MainPage,PageCount FROM hk_MySet WHERE FK_uid='" + this.Session["userid"] + "'");
                if (datar1.Read())
                {
                    mp.SelectedValue = datar1["MainPage"].ToString();
                    tb_PageCount.Text = datar1["PageCount"].ToString();
                }
                datar1.Close();
            }
        }

        //保存 
        protected void Save_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("update hk_MySet set MainPage='" + mp.SelectedValue + "',PageCount='" + hkdb.GetStr(tb_PageCount.Text) + "' where FK_uid='" + this.Session["userid"] + "'");

            mydb.Alert("保存成功！\\n注销并重新登录本系统后生效");
        }
    }
}
