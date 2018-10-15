using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Spdbcx_View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));

                if (!string.IsNullOrEmpty(Request.QueryString["id"].ToString()))
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT A.*,B.MC FROM HK_SPDB A LEFT OUTER JOIN HK_ZDYLX B ON (A.SPLX=B.ID) WHERE A.SPID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        spmc.Text = datar["spmc"].ToString();
                        sply.Text = datar["sply"].ToString();
                        splx.Text = datar["mc"].ToString();
                        spjj.Text = datar["spjj"].ToString();
                        savefj1.Text = datar["jmmc"].ToString();
                        savelj.Text = datar["jmlj"].ToString();
                        savefj1.NavigateUrl = (datar["jmlj"] == System.DBNull.Value ? "" : "../.." + datar["jmlj"].ToString()) + datar["jmmc"].ToString();

                        savefj.MediaUrl = (datar["jmlj"] == System.DBNull.Value ? "" : "../.." + datar["jmlj"].ToString()) + datar["jmmc"].ToString();
                        datar.Close();
                    }
                    else
                    {
                        datar.Close();
                        mydb.Alert_Close("此记录不存在,可能已被删除！");
                    }
                }
            }
        }
    }
}
