using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.rwgl
{
    public partial class jsdbrw_yhview : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10116", "0");
                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));

                if (Request.QueryString["jszt"] != "未接收")
                {
                    if (Request.QueryString["jszt"] != "审核退回")
                    {
                        JSBtn.Enabled = false;
                    }
                    else
                    {
                        SqlDataReader dr = SqlHelper.ExecuteReader("select a.*,b.ui_desc,c.ui_desc as sprmc from OA_RWD02 a left outer join yh b on (a.clr=b.ui_id)  left outer join yh c on (a.spr=c.ui_id) where jsid='" + hkdb.GetStr(Request.QueryString["jsid"].ToString()) + "'");
                        if (dr.Read())
                        {
                            wcqk.Text = dr["bzsm"].ToString();
                            wcsjmc.Text = string.Format("{0:d}", dr["clsj"]);
                            wcrmc.Text = dr["ui_desc"].ToString();
                            savefj_lb.Text = dr["fjmc"].ToString();
                            savelj_lb.Text = dr["fjlj"].ToString();
                            savefj_lb.NavigateUrl = (dr["fjlj"] == System.DBNull.Value ? "" : "../.." + dr["fjlj"]) + dr["fjmc"].ToString();
                            spyj.Text = dr["spyj"].ToString();
                            spsjmc.Text = string.Format("{0:d}", dr["spsj"]);
                            sprmc.Text = dr["sprmc"].ToString();
                        }
                        dr.Close();
                    }
                }
                else
                {
                    panelyc.Visible = false;
                    //wcqk.Visible = false;
                    //wcsjid.Visible = false;
                    //wcsjmc.Visible = false;
                    //wcrid.Visible = false;
                    //wcrmc.Visible = false;
                    //savefj_lb.Visible = false;
                    //savelj_lb.Visible = false;
                    //spyj.Visible = false;
                    //spsjid.Visible = false;
                    //spsjmc.Visible = false;
                    //sprid.Visible = false;
                    //sprmc.Visible = false;
                    //wcfjid.Visible = false;
                    //lblwcqk.Visible = false;
                    //lblspyj.Visible = false;
                }

                //dp绑定 
                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT A.*,B.UI_DESC,C.MC AS RWXZ_MC FROM OA_RWD01 A LEFT OUTER JOIN YH B ON (A.FBR=B.UI_ID) LEFT OUTER JOIN HK_ZDYLX C ON(A.RWXZ=C.ID) WHERE RWID='" + hkdb.GetStr(Request.QueryString["rwid"].ToString()) + "'");
                if (datar.Read())
                {

                    rwly.Text = datar["source"].ToString();
                    rwidstr.Text = datar["rwid"].ToString();
                    rwdh.Text = datar["rwdh"].ToString();
                    lblrwbt.Text = datar["rwbt"].ToString();
                    lbljjcd.Text = datar["jjcd"].ToString();
                    lblrwxzid.Text = datar["rwxz"].ToString();
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
                    fbrmc.Text = datar["ui_desc"].ToString();
                    savefj.Text = datar["fjmc"].ToString();
                    lblfjmc.Text = datar["fjmc"].ToString();
                    lblfjlj.Text = datar["fjlj"].ToString();
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

        //接收 
        protected void JS_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["jsid"]))
            {
                if (fpxs.Checked == true)
                {
                    //分解出其它任务单
                    string unitcode = null;

                    //任务单号
                    unitcode = DateTime.Now.Year.ToString("D2").Substring(0, 4) + DateTime.Now.Month.ToString("D2").Substring(0, 2) + DateTime.Now.Day.ToString("D2").Substring(0, 2);
                    SqlDataReader datar = SqlHelper.ExecuteReader("select rwdh from OA_RWD01 where left(rwdh,8)='" + unitcode + "' order by rwdh desc");

                    if (datar.Read())
                    {
                        unitcode = unitcode.Trim() + (Convert.ToInt32(datar["rwdh"].ToString().Substring(8, 3)) + 1).ToString("D3");
                    }
                    else
                    {
                        unitcode = unitcode + "001";
                    }
                    datar.Close();

                    int newID = (Int32)SqlHelper.ExecuteScalar("insert into OA_RWD01(rwdh,rwbt,rwnr,jjcd,rwxz,ynxs,ksrq,jzrq,rwzt,fbr,fbsj,fjmc,fjlj,jsdx,fblx) values('" + unitcode + "', '" + lblrwbt.Text + "', '" + lblnr.Text + "', '" + lbljjcd.Text + "', '" + lblrwxzid.Text + "', '" + lblynxs.Text + "', '" + lblksrq.Text + "', '" + lbljzrq.Text + "', '已发布', '" + this.Session["userid"] + "', GETDATE(), '" + lblfjmc.Text + "', '" + lblfjlj.Text + "','" + hkdb.GetStr(jsdx.Text) + "','3')" + "SELECT CAST(scope_identity() AS int)");
                    SqlHelper.ExecuteSql("update OA_RWD01 set ynfp='是',fprwid=" + newID + " where rwid='" + hkdb.GetStr(Request.QueryString["rwid"].ToString()) + "'");

                    int i = 0;
                    for (i = 0; i < (jsdx.Text.Split(',')).Length; i++)
                    {
                        SqlHelper.ExecuteSql("insert into OA_RWD02(ssrwid,jsr,jszt,fpxs,fpry,fpsm) values('" + newID + "','" + jsdx.Text.Split(',')[i] + "','未接收','分入','" + hkdb.GetStr(jsdx.Text) + "','" + hkdb.GetStr(fpsm.Text) + "')");
                    }

                    //更新原有任务单的接收状态和被分配人员信息
                    SqlHelper.ExecuteSql("update OA_RWD02 set jszt='已接收',jsr='" + this.Session["userid"] + "',jssj=GETDATE(),fpxs='分出',fpry='" + hkdb.GetStr(jsdx.Text) + "',fpsm='" + hkdb.GetStr(fpsm.Text) + "' where jsid='" + hkdb.GetStr(Request.QueryString["jsid"].ToString()) + "'");
                    if (Request.QueryString["flag"]!=null&&Request.QueryString["flag"].Equals("index"))
                    {
                        mydb.Alert_Reload_Close("已成功接收待办任务，并分配给其它人员办理！");
                    }
                    else
                    {
                        mydb.Alert_Refresh_Close("已成功接收待办任务，并分配给其它人员办理！", "wddbrw.aspx");
                    }


                }
                else
                {
                    SqlHelper.ExecuteSql("update OA_RWD02 set jszt='已接收',jsr='" + this.Session["userid"] + "',jssj=GETDATE() where jsid='" + hkdb.GetStr(Request.QueryString["jsid"].ToString()) + "'");
                    //JSBtn.Enabled = false;

                    if (Request.QueryString["flag"] != null && Request.QueryString["flag"].Equals("index"))
                    {
                        mydb.Alert_Reload_Close("接收待办任务成功！");
                    }
                    else
                    {
                        mydb.Alert_Refresh_Close("接收待办任务成功！", "wddbrw.aspx");
                    }
                }
            }
            else
            {
                mydb.Alert("请先选中待办任务再执行接收！");
            }
        }

        protected void fpxs_Checked(object sender, EventArgs e)
        {
            if (fpxs.Checked == true)
            {
                fpry.Visible = true;
            }
            else
            {
                fpry.Visible = false;
            }
        }
    }
}
