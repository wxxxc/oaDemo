using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Wdkq_Bc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11714", "0");

                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KQ_AttenTime where CHARINDEX('" + this.Session["UserID"] + "',SyUsername)>0 AND QyType='正常' ");
                if (datar.Read())
                {
                    lblPbType.Text = datar["PbType"].ToString();
                    lblQyType.Text = datar["QyType"].ToString();
                    lblDjType_1.Text = datar["DjType_1"].ToString();
                    lblDjType_2.Text = datar["DjType_2"].ToString();
                    lblDjType_3.Text = datar["DjType_3"].ToString();
                    lblDjType_4.Text = datar["DjType_4"].ToString();
                    lblDjType_5.Text = datar["DjType_5"].ToString();
                    lblDjType_6.Text = datar["DjType_6"].ToString();

                    lblDjTime_1.Text = datar["DjTime_1"].ToString();
                    lblDjTime_2.Text = datar["DjTime_2"].ToString();
                    lblDjTime_3.Text = datar["DjTime_3"].ToString();
                    lblDjTime_4.Text = datar["DjTime_4"].ToString();
                    lblDjTime_5.Text = datar["DjTime_5"].ToString();
                    lblDjTime_6.Text = datar["DjTime_6"].ToString();
                    datar.Close();
                }
            }
        }
    }
}
