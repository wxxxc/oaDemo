using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.oa.zygl
{
    public partial class Zydd_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10503", "0");

                //短信
                dxtz.Visible = Convert.ToBoolean(hkdb.VeriSms());

                SqlDataReader datar = SqlHelper.ExecuteReader("select a.*,b.bm_mc,c.zymc from OA_ZYSQ a left outer JOIN BM b on (a.sybm=b.bm_id) left outer join oa_zydj c on (a.sqzy=c.djid) where sqid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (datar.Read())
                {
                    sqbm.Text = datar["bm_mc"].ToString();
                    jysm.Text = datar["jysm"].ToString();
                    sysj.Text = string.Format("{0:d}", datar["sysj"]);
                    ghsj.Text = string.Format("{0:d}", datar["ghsj"]);
                    sqzy.Text = datar["zymc"].ToString();
                    ycxx.Text = datar["sqr"].ToString();
                    if (datar["zt"].ToString() != "审批中")
                    {
                        SpBtn.Visible = false;
                        ThBtn.Visible = false;
                        ShBtn.Visible = false;
                    }
                    datar.Close();
                }
                else
                {
                    datar.Close();
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }
            }
        }

        //同意申请 
        protected void shenpi_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(spyj.Text))
            {
                SqlHelper.ExecuteSql("update OA_ZYSQ set zt='已同意',spr='" + this.Session["userid"] + "',spsj=GETDATE(),spyj='" + hkdb.GetStr(spyj.Text) + "' where zt='审批中' and sqid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                Dxyj_Click("1");
                mydb.Alert_Refresh_Close("同意资源申请！", "Zydd.aspx");
            }
        }

        //拒绝申请
        protected void TuiHui_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(spyj.Text))
            {
                SqlHelper.ExecuteSql("update OA_ZYSQ set zt='已拒绝',spr='" + this.Session["userid"] + "',spsj=GETDATE(),spyj='" + hkdb.GetStr(spyj.Text) + "' where zt='审批中' and sqid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                Dxyj_Click("2");
                mydb.Alert_Refresh_Close("拒绝资源申请！", "Zydd.aspx");
            }
        }

        //已收回 
        protected void ShouHui_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(spyj.Text))
            {
                SqlHelper.ExecuteSql("update OA_ZYSQ set zt='已收回',spr='" + this.Session["userid"] + "',spsj=GETDATE(),spyj='" + hkdb.GetStr(spyj.Text) + "' where zt='审批中' and sqid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                Dxyj_Click("3");
                mydb.Alert_Refresh_Close("资源申请已收回！", "Zydd.aspx");
            }
        }

        protected void Dxyj_Click(string mess)
        {
            //Msg 
            if (xxtz.Checked == true | dxtz.Checked == true)
            {
                string message = null;

                switch (mess)
                {
                    case "1":
                        message = "您申请使用的[" + sqzy.Text + "]资源已被同意,请登录平台查看!" + this.Session["username"].ToString();
                        break;
                    case "2":
                        message = "您申请使用的[" + sqzy.Text + "]资源已被拒绝,请登录平台查看!" + this.Session["username"].ToString();
                        break;
                    default:
                        message = "您申请使用的[" + sqzy.Text + "]资源已被收回,请登录平台查看!" + this.Session["username"].ToString();
                        break;
                }

                hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), ycxx.Text, message);
            }
        }
    }
}
