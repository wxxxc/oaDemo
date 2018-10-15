using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.hygl
{
    public partial class Hycx_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                GridViewBind();
            }
        }

        //绑定数据 
        public void GridViewBind()
        {
            SqlDataReader datar = SqlHelper.ExecuteReader("select a.*,b.mc,c.bm_mc,d.hys_mc from oa_hyqc a left outer JOIN hk_ZDYLX b on (a.hylx=b.id) left outer JOIN BM c on (a.zkbm=c.bm_id) left outer join oa_hys d on (a.zkdd=d.hys_id) where a.id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            if (datar.Read())
            {
                hyzt.Text = datar["hyzt"].ToString();
                hylx.Text = datar["mc"].ToString();
                kssj.Text = datar["kssj"].ToString();
                jssj.Text = datar["jssj"].ToString();
                zkbm.Text = datar["bm_mc"].ToString();
                zkdd.Text = datar["hys_mc"].ToString();
                cxfw.Text = datar["cxfw"].ToString();
                cjry.Text = (SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["cjry"] + "','1'") == System.DBNull.Value ? "" : (string)(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["cjry"] + "','1'")));
                fzr.Text = datar["zcr"].ToString();
                jysm.Text = datar["jysm"].ToString();
                savefj.Text = datar["hyzl"].ToString();
                savefj.NavigateUrl = (datar["path"] == System.DBNull.Value ? "" : "../.." + datar["path"].ToString()) + datar["hyzl"].ToString();

                hyjy.Text = datar["hyjy"].ToString();
                sjqk.Text = datar["sjqk"].ToString();
            }
            datar.Close();

            if (!string.IsNullOrEmpty(savefj.Text))
            {
                savefj.Text = "下载会议资料";
            }
        }
    }
}
