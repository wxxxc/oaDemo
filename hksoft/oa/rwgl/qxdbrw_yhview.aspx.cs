using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.rwgl
{
    public partial class qxdbrw_yhview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10302", "0");
                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));

                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT A.*,C.MC AS RWXZ_MC FROM OA_RWD01 A LEFT OUTER JOIN HK_ZDYLX C ON(A.RWXZ=C.ID) WHERE A.RWID='" + hkdb.GetStr(Request.QueryString["rwid"].ToString()) + "'");
                if (datar.Read())
                {

                    rwly.Text = datar["source"].ToString();
                    rwdh.Text = datar["rwdh"].ToString();
                    lblrwbt.Text = datar["rwbt"].ToString();
                    lbljjcd.Text = datar["jjcd"].ToString();
                    lblrwxz.Text = datar["rwxz_mc"].ToString();
                    lbljsdx.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["jsdx"].ToString() + "','1'"));
                    qtld.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["qtld"].ToString() + "','1'"));
                    zrld.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["zrld"].ToString() + "','1'"));
                    zrr.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["zrr"].ToString() + "','1'"));
                    lblnr.Text = hkdb.GetStrTeOut(datar["rwnr"].ToString());
                    lblksrq.Text = datar["ksrq"].ToString();
                    lbljzrq.Text = datar["jzrq"].ToString();
                    lblynxs.Text = datar["ynxs"].ToString();

                    savefj.Text = datar["fjmc"].ToString();

                    fqsj.Text = string.Format("{0:d}", datar["fbsj"]);
                    savefj.Text = datar["fjmc"].ToString();
                    savefj.NavigateUrl = (datar["fjlj"] == System.DBNull.Value ? "" : "../.." + datar["fjlj"]) + datar["fjmc"].ToString();

                    datar.Close();

                    if (lblynxs.Text == "是")
                    {
                        Panelrq.Visible = true;
                    }
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
