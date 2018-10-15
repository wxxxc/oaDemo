using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.hygl
{
    public partial class Hysp_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10505", "0");
                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));

                //短信
                dxtz.Visible = Convert.ToBoolean(hkdb.VeriSms());
                GridViewBind();

                SpBtn.Enabled = false;
            }
        }

        //绑定数据 
        public void GridViewBind()
        {
            SqlDataReader datar = SqlHelper.ExecuteReader("select a.*,b.mc,c.bm_mc,d.hys_mc from oa_hyqc a left outer JOIN hk_ZDYLX b on (a.hylx=b.id) left outer JOIN BM c on (a.zkbm=c.bm_id) left outer join oa_hys d on (a.zkdd=d.hys_id) where a.id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' and a.zt='送审中'");
            if (datar.Read())
            {
                hyzt.Text = datar["hyzt"].ToString();
                hylx.Text = datar["mc"].ToString();
                kssj.Text = datar["kssj"].ToString();
                jssj.Text = datar["jssj"].ToString();
                zkbm.Text = datar["bm_mc"].ToString();
                zkdd.Text = datar["hys_mc"].ToString();
                cxfw.Text = datar["cxfw"].ToString();
                //将人员编码转化为名称 
                cjry.Text = (SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["cjry"] + "','1'") == System.DBNull.Value ? "" : (string)(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["cjry"] + "','1'")));
                fzr.Text = datar["zcr"].ToString();
                jysm.Text = datar["jysm"].ToString();
                savefj.Text = datar["hyzl"].ToString();
                savefj.NavigateUrl = (datar["path"] == System.DBNull.Value ? "" : "../.." + datar["path"].ToString()) + datar["hyzl"].ToString();
                vsdate.Text = datar["kssj"].ToString();
                vedate.Text = datar["jssj"].ToString();
                ycxx.Text = datar["fqr"].ToString();
                ycdd.Text = datar["zkdd"].ToString();
                datar.Close();
            }
            else
            {
                datar.Close();
                mydb.Alert_Close("此会议已审批完成！");
            }
            if (!string.IsNullOrEmpty(savefj.Text))
            {
                savefj.Text = "下载会议资料";
            }
        }

        //审批
        protected void shenpi_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(spyj.Text))
            {
                SqlHelper.ExecuteSql("update oa_hyqc set zt='已审批',spr='" + this.Session["userid"] + "',spsj=GETDATE(),spyj='" + hkdb.GetStr(spyj.Text) + "' where zt='送审中' and id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                Dxxx_Click("yes");
                mydb.Alert_Refresh_Close("会议申请审批成功！", "hysp.aspx");
            }
        }

        //退回
        protected void TuiHui_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(spyj.Text))
            {
                SqlHelper.ExecuteSql("update oa_hyqc set zt='已退回',spr='" + this.Session["userid"] + "',spsj=GETDATE(),spyj='" + hkdb.GetStr(spyj.Text) + "' where zt='送审中' and id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                Dxxx_Click("no");
                mydb.Alert_Refresh_Close("已退回该申请！", "hysp.aspx");
            }
        }

        protected void Dxxx_Click(string mess)
        {
            //Msg 
            if (xxtz.Checked == true | dxtz.Checked == true)
            {
                string message = null;
                if (mess == "yes")
                {
                    message = "您申请的会议<" + hkdb.GetStr(hyzt.Text) + ">已经审批通过!" + this.Session["username"].ToString();
                }
                else
                {
                    message = "您申请的会议<" + hkdb.GetStr(hyzt.Text) + ">已经被退回!" + this.Session["username"].ToString();
                }

                hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), ycxx.Text, message);
            }
        }

        //检测冲突 
        protected void Check_Click(object sender, EventArgs e)
        {
            int i = 0;
            i = (int)SqlHelper.ExecuteScalar("select count(*) from oa_hyqc where zt='已审批' and zkdd='" + hkdb.GetStr(ycdd.Text) + "' and id<>'" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' and (('" + hkdb.GetStr(vsdate.Text) + "'>=kssj and '" + hkdb.GetStr(vsdate.Text) + "'<jssj) or ('" + hkdb.GetStr(vedate.Text) + "'>=kssj and '" + hkdb.GetStr(vedate.Text) + "'<jssj))");
            if (i > 0)
            {
                mydb.Alert("警告！本次会议在相同地点、相同时间段内与已审批会议存在冲突，请协调好以后再审批！");
            }
            else
            {
                mydb.Alert("无任何冲突，可以正常进行此会议！");
            }
            SpBtn.Enabled = true;
        }
    }
}
