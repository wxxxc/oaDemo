using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Dwml_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11302", "0");

                OperQx();
            }
        }

        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(SaveAddBtn, "11302a", Session["roleqx"].ToString());
            hkdb.QxValid(SaveBtn, "11302a", Session["roleqx"].ToString());
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;

            SqlHelper.ExecuteSql("INSERT INTO HK_DWML(DWMC,DWDZ,DWLX,DWJB,SJBM,FZR,YZBM,DWDH,CZHM,DZYJ,JDJS,BZ,LRR,LRSJ) VALUES('" + hkdb.GetStr(dwmc.Text) + "','" + hkdb.GetStr(dwdz.Text) + "','" + hkdb.GetStr(dwlx.Text) + "','" + hkdb.GetStr(dwjb.Text) + "','" + hkdb.GetStr(sjbm.Text) + "','" + hkdb.GetStr(fzr.Text) + "','" + hkdb.GetStr(yzbm.Text) + "','" + hkdb.GetStr(dwdh.Text) + "','" + hkdb.GetStr(czhm.Text) + "','" + hkdb.GetStr(dzyj.Text) + "','" + hkdb.GetStr(jdjs.Text) + "','" + hkdb.GetStr(bz.Text) + "','" + this.Session["userid"] + "',GETDATE())");
            if (s == "SaveAddBtn")
            {
                dwmc.Text = "";
                dwdz.Text = "";
                dwlx.Text = "";
                dwjb.Text = "";
                sjbm.Text = "";
                fzr.Text = "";
                yzbm.Text = "";
                dwdh.Text = "";
                czhm.Text = "";
                dzyj.Text = "";
                jdjs.Text = "";
                bz.Text = "";
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Dwml.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！","Dwml.aspx");
            }
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            dwmc.Text = "";
            dwdz.Text = "";
            dwlx.Text = "";
            dwjb.Text = "";
            sjbm.Text = "";
            fzr.Text = "";
            yzbm.Text = "";
            dwdh.Text = "";
            czhm.Text = "";
            dzyj.Text = "";
            jdjs.Text = "";
            bz.Text = "";
        }
    }
}
