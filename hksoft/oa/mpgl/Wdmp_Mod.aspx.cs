using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.mpgl
{
    public partial class Wdmp_Mod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10104", "0");

                SqlDataReader datar = SqlHelper.ExecuteReader("select a.*,b.ui_desc from OA_MPJ a left outer join yh b on (a.lrr=b.ui_id) where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (datar.Read())
                {
                    xm.Text = datar["xm"].ToString();
                    zw.Text = datar["zw"].ToString();
                    gsdh.Text = datar["gsdh"].ToString();
                    czdh.Text = datar["czdh"].ToString();
                    gsmc.Text = datar["gsmc"].ToString();
                    gsdz.Text = datar["gsdz"].ToString();
                    yzbm.Text = datar["yzbm"].ToString();
                    w_mail.Text = datar["w_mail"].ToString();
                    hylb.Text = datar["hylb"].ToString();
                    xz.SelectedValue = datar["xz"].ToString();
                    mplx.SelectedValue = datar["mplx"].ToString();
                    gswz.Text = datar["gswz"].ToString();
                    bmmc.Text = datar["bmmc"].ToString();
                    zzdh.Text = datar["zzdh"].ToString();
                    h_mail.Text = datar["h_mail"].ToString();
                    yddh.Text = datar["yddh"].ToString();
                    msn.Text = datar["msn"].ToString();
                    qq.Text = datar["qq"].ToString();
                    lrr.Text = datar["ui_desc"].ToString();
                    if (datar["lrr"].ToString() != this.Session["userid"].ToString())
                    {
                        SaveBtn2.Visible = false;
                        SaveBtn.Visible = false;
                        DelBtn.Visible = false;
                    }
                    lrsj.Text = string.Format("{0:d}", datar["lrsj"]);
                    datar.Close();
                }
                else
                {
                    datar.Close();
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            SqlHelper.ExecuteSql("update OA_MPJ set xm='" + hkdb.GetStr(xm.Text) + "',zw='" + hkdb.GetStr(zw.Text) + "',gsdh='" + hkdb.GetStr(gsdh.Text) + "',czdh='" + hkdb.GetStr(czdh.Text) + "',gsmc='" + hkdb.GetStr(gsmc.Text) + "',gsdz='" + hkdb.GetStr(gsdz.Text) + "',yzbm='" + hkdb.GetStr(yzbm.Text) + "',w_mail='" + hkdb.GetStr(w_mail.Text) + "',hylb='" + hkdb.GetStr(hylb.Text) + "',xz='" + xz.SelectedValue + "',mplx='" + mplx.SelectedValue + "',gswz='" + hkdb.GetStr(gswz.Text) + "',bmmc='" + hkdb.GetStr(bmmc.Text) + "',zzdh='" + hkdb.GetStr(zzdh.Text) + "',h_mail='" + hkdb.GetStr(h_mail.Text) + "',yddh='" + hkdb.GetStr(yddh.Text) + "',msn='" + hkdb.GetStr(msn.Text) + "',qq='" + hkdb.GetStr(qq.Text) + "',lrr='" + this.Session["userid"] + "',lrsj=GETDATE() where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' and (lrr= '" + this.Session["userid"] + "')");
            if (s == "SaveBtn")
            {
                mydb.Alert_Refresh("保存成功！", "Wdmp.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！", "Wdmp.aspx");
            }
        }

        protected void Del_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"].ToString()))
            {
                SqlHelper.ExecuteSql("delete from OA_MPJ where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' and lrr= '" + this.Session["userid"] + "'");
                mydb.Alert_Refresh_Close("删除成功！", "Wdmp.aspx");
            }
        }
    }
}
