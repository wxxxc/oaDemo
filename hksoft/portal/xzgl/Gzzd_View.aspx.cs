using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Gzzd_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            //hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));

                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT A.*,B.MC FROM HK_GZZD A LEFT OUTER JOIN HK_ZDYLX B ON(A.ZDFL=B.ID) WHERE ZDID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (datar.Read())
                {
                    lblzdfl.Text = datar["mc"].ToString();
                    lblzdbt.Text = datar["zdbt"].ToString();
                    lblnr.Text = datar["zdnr"].ToString();
                    lblwh.Text = datar["zdwh"].ToString();
                    lblfwdw.Text = datar["fwdw"].ToString();
                    lblzddj.Text = datar["zddj"].ToString();
                    lblmj.Text = datar["mj"].ToString();
                    lblztc.Text = datar["ztc"].ToString();
                    cjsj.Text = string.Format("{0:d}", datar["cjsj"]);
                    savefj.Text = datar["fjmc"].ToString();
                    savelj.Text = datar["fjlj"].ToString();
                    savefj.NavigateUrl = (datar["fjlj"] == System.DBNull.Value ? "" : "../.." + datar["fjlj"].ToString()) + datar["fjmc"].ToString();
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
