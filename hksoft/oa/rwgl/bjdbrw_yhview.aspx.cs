using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.rwgl
{
    public partial class bjdbrw_yhview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10116", "0");
                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));

                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT A.*,B.UI_DESC,C.MC AS RWXZ_MC FROM OA_RWD01 A LEFT OUTER JOIN YH B ON (A.FBR=B.UI_ID) LEFT OUTER JOIN HK_ZDYLX C ON(A.RWXZ=C.ID) WHERE RWID='" + hkdb.GetStr(Request.QueryString["rwid"].ToString()) + "'");
                if (datar.Read())
                {

                    rwly.Text = datar["source"].ToString();
                    rwdh.Text = datar["rwdh"].ToString();
                    lblrwbt.Text = datar["rwbt"].ToString();
                    lbljjcd.Text = datar["jjcd"].ToString();
                    lblrwxz.Text = datar["RWXZ_MC"].ToString();
                    lbljsdx.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["jsdx"].ToString() + "','1'"));
                    qtld.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["qtld"].ToString() + "','1'"));
                    zrld.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["zrld"].ToString() + "','1'"));
                    zrr.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["zrr"].ToString() + "','1'"));
                    lblksrq.Text = datar["ksrq"].ToString();
                    lbljzrq.Text = datar["jzrq"].ToString();
                    lblnr.Text = hkdb.GetStrTeOut(datar["rwnr"].ToString());
                    lblynxs.Text = datar["ynxs"].ToString();

                    savefj.Text = datar["fjmc"].ToString();

                    fqsj.Text = string.Format("{0:d}", datar["fbsj"]);
                    fbrmc.Text = datar["ui_desc"].ToString();
                    savefj.Text = datar["fjmc"].ToString();
                    savefj.NavigateUrl = (datar["fjlj"] == System.DBNull.Value ? "" : "../.." + datar["fjlj"]) + datar["fjmc"].ToString();

                    datar.Close();

                    if (lblynxs.Text == "是")
                    {
                        Panelrq.Visible = true;
                    }

                    SqlDataReader dr = SqlHelper.ExecuteReader("select a.*,b.ui_desc,c.ui_desc as sprmc from OA_RWD02 a left outer join yh b on (a.clr=b.ui_id) left outer join yh c on (a.spr=c.ui_id) where jsid='" + hkdb.GetStr(Request.QueryString["jsid"].ToString()) + "'");
                    if (dr.Read())
                    {
                        //lblfpxs.Text = dr["fpxs"].ToString();
                        //lblfpry.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + dr["fpry"].ToString() + "','1'"));
                        //lblfpsm.Text = dr["fpsm"].ToString();
                        lblwcqk.Text = dr["bzsm"].ToString();
                        wcsjmc.Text = string.Format("{0:d}", dr["clsj"]);
                        wcrmc.Text = dr["ui_desc"].ToString();
                        savefj_yh.Text = dr["fjmc"].ToString();
                        savefj_yh.NavigateUrl = (dr["fjlj"] == System.DBNull.Value ? "" : "../.." + dr["fjlj"]) + dr["fjmc"].ToString();

                        lblspyj.Text = dr["spyj"].ToString();
                        lblsppj.Text = dr["sppj"].ToString();
                        spsjmc.Text = string.Format("{0:d}", dr["spsj"]);
                        sprmc.Text = dr["sprmc"].ToString();
                    }
                    dr.Close();
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
