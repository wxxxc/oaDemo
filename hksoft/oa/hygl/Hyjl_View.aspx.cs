using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.hygl
{
    public partial class Hyjl_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10506", "0");
                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));

                //短信
                dxtz.Visible = Convert.ToBoolean(hkdb.VeriSms());
                GridViewBind();
                CheckBtn.Enabled = false;
                xxtz.Enabled = false;
                dxtz.Enabled = false;
            }
        }

        //绑定数据 
        public void GridViewBind()
        {
            SqlDataReader datar = SqlHelper.ExecuteReader("select a.*,b.mc,c.bm_mc,d.hys_mc from oa_hyqc a left outer JOIN hk_ZDYLX b on (a.hylx=b.id) left outer JOIN BM c on (a.zkbm=c.bm_id) left outer join oa_hys d on (a.zkdd=d.hys_id) where a.id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' and a.zt='已审批'");
            if (datar.Read())
            {
                hyzt.Text = datar["hyzt"].ToString();
                hylx.Text = datar["mc"].ToString();
                kssj.Text = datar["kssj"].ToString();
                jssj.Text = datar["jssj"].ToString();
                zkbm.Text = datar["bm_mc"].ToString();
                zkdd.Text = datar["hys_mc"].ToString();
                cxfw.Text = datar["cxfw"].ToString();
                cjry.Text = datar["cjry"].ToString();
                //将人员编码转为名称 
                cjry_view.Text = (SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["cjry"] + "','1'") == System.DBNull.Value ? "" : (string)(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["cjry"] + "','1'")));
                fzr.Text = datar["zcr"].ToString();
                savefj.Text = datar["hyzl"].ToString();
                savefj.NavigateUrl = (datar["path"] == System.DBNull.Value ? "" : "../.." + datar["path"].ToString()) + datar["hyzl"].ToString();
                sjqk.Text = datar["sjqk"].ToString();
                hyjy.Text = datar["hyjy"].ToString();
                vsdate.Text = datar["kssj"].ToString();
                vedate.Text = datar["jssj"].ToString();
                datar.Close();
            }
            else
            {
                datar.Close();
                mydb.Alert_Close("该会议已记录完成！");
            }

            if (!string.IsNullOrEmpty(savefj.Text))
            {
                savefj.Text = "下载会议资料";
            }
        }

        //保存 
        protected void Save_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("update oa_hyqc set sjqk='" + hkdb.GetStr(sjqk.Text) + "',hyjy='" + hkdb.GetStr(hyjy.Text) + "',jlr='" + this.Session["userid"] + "',jlsj=GETDATE() where zt='已审批' and id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            CheckBtn.Enabled = true;
            xxtz.Enabled = true;
            dxtz.Enabled = true;

            mydb.Alert_Refresh("保存成功,请在确认无误后点击「记录完成」按钮！", "Hyjl.aspx");
        }

        //完成
        protected void Over_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("update oa_hyqc set zt='已完成',sjqk='" + hkdb.GetStr(sjqk.Text) + "',hyjy='" + hkdb.GetStr(hyjy.Text) + "',jlr='" + this.Session["userid"] + "',jlsj=GETDATE() where zt='已审批' and id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            string message = vsdate.Text + "举行的<" + hyzt.Text + ">的会议纪要已经整理完毕,请查阅!" + this.Session["username"].ToString();

            if (xxtz.SelectedValue == "xx1" | dxtz.SelectedValue == "dx1")
            {
                int a = 0;
                int b = 0;
                if (xxtz.SelectedValue == "xx1")
                {
                    a = 1;
                }
                if (dxtz.SelectedValue == "dx1")
                {
                    b = 1;
                }
                SqlHelper.ExecuteSql("exec sp_Send_Mess " + a + "," + b + ",'" + this.Session["userid"] + "','" + cjry.Text + "','" + message + "'");
            }

            if (xxtz.SelectedValue == "xx2" | dxtz.SelectedValue == "dx2")
            {
                int a = 0;
                int b = 0;
                if (xxtz.SelectedValue == "xx2")
                {
                    a = 1;
                }
                if (dxtz.SelectedValue == "dx2")
                {
                    b = 1;
                }
                string yhbmstr = "";
                //正常状态、有移动电话的用户编
                SqlDataReader datar = SqlHelper.ExecuteReader("select distinct ui_id from yh where ui_lx='企业' and ui_status='正常' and ui_yddh<>''");
                //用,号分开 
                while (datar.Read())
                {
                    yhbmstr = datar["ui_id"] + "," + yhbmstr;
                }
                datar.Close();
                SqlHelper.ExecuteSql("exec sp_Send_Mess " + a + "," + b + ",'" + this.Session["userid"] + "','" + yhbmstr + "','" + message + "'");
            }

            mydb.Alert_Refresh_Close("会议记录已完成！", "Hyjl.aspx");
        }
    }
}
