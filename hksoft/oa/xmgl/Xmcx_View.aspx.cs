using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.xmgl
{
    public partial class Xmcx_View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11506", "0");

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "查看";
                    if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                    {
                        SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_XMGL where xmid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                        if (datar.Read())
                        {
                            xmid.Text = datar["xmid"].ToString();
                            xmmc.Text = datar["xmmc"].ToString();
                            sssf.Text = datar["sssf"].ToString();
                            xmjd.SelectedValue = datar["xmjd"].ToString();
                            sscs.Text = datar["sscs"].ToString();
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
}
