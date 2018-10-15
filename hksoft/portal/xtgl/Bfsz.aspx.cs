using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.portal.xtgl
{
    public partial class Bfsz : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("60109", "60109");

                //Demo
                mydb.IsDemo_Stop();

                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM hk_DbSet");
                if (datar.Read())
                {
                    dburl.Text = datar["dburl"].ToString();
                    dbname.Text = datar["dbname"].ToString();
                    dbuser.Text = datar["dbuser"].ToString();
                    //dbpwd.Text = datar["dbpwd"].ToString();
                    savepath.Text = datar["savepath"].ToString();
                    savename.Text = datar["savename"].ToString();
                }
                datar.Close();
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE hk_DbSet SET DbUrl='" + hkdb.GetStr(dburl.Text) + "',DbName='" + hkdb.GetStr(dbname.Text) + "',DbUser='" + hkdb.GetStr(dbuser.Text) + "',DbPwd='" + hkdb.GetStr(dbpwd.Text) + "',SavePath='" + hkdb.GetStr(savepath.Text) + "',SaveName='" + hkdb.GetStr(savename.Text) + "'");

            mydb.Alert("保存成功！");
        }
    }
}
