using haoke365;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hksoft.app.task
{
    public partial class wddbrw_jsshow : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        public string rwid_nr;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("9");

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
                    rwid_nr = datar["rwid"].ToString();
                    //rwdh.Text = datar["rwdh"].ToString();
                    lblrwbt.Text = datar["rwbt"].ToString();
                    lbljjcd.Text = datar["jjcd"].ToString();
                    lblrwxzid.Text = datar["rwxz"].ToString();
                    lblrwxz.Text = datar["rwxz_mc"].ToString();
                    lbljsdx.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["jsdx"].ToString() + "','1'"));
                    qtld.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["qtld"].ToString() + "','1'"));
                    zrld.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["zrld"].ToString() + "','1'"));
                    zrr.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["zrr"].ToString() + "','1'"));
                    lblnr.Text = ReplaceHtmlTag(hkdb.GetStrTeOut(datar["rwnr"].ToString()));
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
                SqlHelper.ExecuteSql("update OA_RWD02 set jszt='已接收',jsr='" + this.Session["userid"] + "',jssj=GETDATE() where jsid='" + hkdb.GetStr(Request.QueryString["jsid"].ToString()) + "'");
                //JSBtn.Enabled = false;

                if (Request.QueryString["flag"] != null && Request.QueryString["flag"].Equals("index"))
                {
                    mydb.Alert_Goto("接收待办任务成功！", "dbrwwjs_a.aspx");
                }
                else
                {
                    mydb.Alert_Goto("接收待办任务成功！", "dbrwwjs_a.aspx");
                }

            }
            else
            {
                mydb.Alert("请先选中待办任务再执行接收！");
            }
        }

        /// <summary>
        /// 去除html
        /// </summary>
        /// <param name="html"></param>
        /// <param name="length"></param>
        /// <returns></returns>
        public static string ReplaceHtmlTag(string html, int length = 0)
        {
            string strText = System.Text.RegularExpressions.Regex.Replace(html, "<[^>]+>", "");
            strText = System.Text.RegularExpressions.Regex.Replace(strText, "&[^;]+;", "");

            if (length > 0 && strText.Length > length)
                return strText.Substring(0, length);

            return strText;
        }

    }
}
