using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Qygg_View : System.Web.UI.Page
    {
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT A.*,B.MC FROM HK_QYGG A LEFT OUTER JOIN HK_ZDYLX B ON(A.GGFL=B.ID) WHERE A.GGID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (datar.Read())
                {
                    ggflmc.Text = datar["mc"].ToString();
                    kssj.Text = string.Format("{0:d}", datar["kssj"]) + " 至 " + string.Format("{0:d}", datar["jssj"]);
                    ggzt.Text = datar["ggzt"].ToString();
                    ggnr.Text = datar["ggnr"].ToString();
                    fqsj.Text = string.Format("{0:d}", datar["lrsj"]);
                    Number.Text = datar["ggfj"].ToString();
                    datar.Close();

                    //附件
                    bd.GetAtt(Number.Text, "p02", "portal/gg", fujian);
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
