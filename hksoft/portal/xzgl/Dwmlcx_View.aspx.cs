using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Dwmlcx_View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["id"].ToString()))
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HK_DWML WHERE ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        dwmc.Text = datar["dwmc"].ToString();
                        dwdz.Text = datar["dwdz"].ToString();
                        dwlx.Text = datar["dwlx"].ToString();
                        dwjb.Text = datar["dwjb"].ToString();
                        sjbm.Text = datar["sjbm"].ToString();
                        fzr.Text = datar["fzr"].ToString();
                        yzbm.Text = datar["yzbm"].ToString();
                        dwdh.Text = datar["dwdh"].ToString();
                        czhm.Text = datar["czhm"].ToString();
                        dzyj.Text = datar["dzyj"].ToString();
                        jdjs.Text = datar["jdjs"].ToString();
                        bz.Text = datar["bz"].ToString();
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
