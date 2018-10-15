using System;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.mpgl
{
    public partial class Wdmp_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10104", "0");
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            SqlHelper.ExecuteSql("insert into OA_MPJ(xm,zw,gsdh,czdh,gsmc,gsdz,yzbm,w_mail,hylb,xz,mplx,gswz,bmmc,zzdh,h_mail,yddh,msn,qq,lrr,lrsj) values('" + hkdb.GetStr(xm.Text) + "','" + hkdb.GetStr(zw.Text) + "','" + hkdb.GetStr(gsdh.Text) + "','" + hkdb.GetStr(czdh.Text) + "','" + hkdb.GetStr(gsmc.Text) + "','" + hkdb.GetStr(gsdz.Text) + "','" + hkdb.GetStr(yzbm.Text) + "','" + hkdb.GetStr(w_mail.Text) + "','" + hkdb.GetStr(hylb.Text) + "','" + xz.SelectedValue + "','" + mplx.SelectedValue + "','" + hkdb.GetStr(gswz.Text) + "','" + hkdb.GetStr(bmmc.Text) + "','" + hkdb.GetStr(zzdh.Text) + "','" + hkdb.GetStr(h_mail.Text) + "','" + hkdb.GetStr(yddh.Text) + "','" + hkdb.GetStr(msn.Text) + "','" + hkdb.GetStr(qq.Text) + "','" + this.Session["userid"] + "',GETDATE())");
            if (s == "SaveAddBtn")
            {
                xm.Text = "";
                zw.Text = "";
                gsdh.Text = "";
                czdh.Text = "";
                gsmc.Text = "";
                gsdz.Text = "";
                yzbm.Text = "";
                w_mail.Text = "";
                hylb.Text = "";
                xz.SelectedValue = "";
                gswz.Text = "";
                bmmc.Text = "";
                zzdh.Text = "";
                h_mail.Text = "";
                yddh.Text = "";
                msn.Text = "";
                qq.Text = "";

                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Wdmp.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！","Wdmp.aspx");
            }
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            xm.Text = "";
            zw.Text = "";
            gsdh.Text = "";
            czdh.Text = "";
            gsmc.Text = "";
            gsdz.Text = "";
            yzbm.Text = "";
            w_mail.Text = "";
            hylb.Text = "";
            xz.SelectedValue = "";
            gswz.Text = "";
            bmmc.Text = "";
            zzdh.Text = "";
            h_mail.Text = "";
            yddh.Text = "";
            msn.Text = "";
            qq.Text = "";
        }
    }
}
