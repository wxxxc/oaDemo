using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro
{
    public partial class Mod_Zl : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("1");

            if (!IsPostBack)
            {
                if (this.Session["systype"].ToString() == "G")
                {
                    p_gys.Visible = false;
                }

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT photo,UI_ID,UI_DESC,UI_SEX,UI_BGDH,UI_YDDH,UI_CZDH,UI_MAIL,UI_CSRQ,UI_RZRQ,B.BM_MC,C.ZWMC,D.QY_QC FROM YH A LEFT OUTER JOIN BM B ON(A.UI_SSBM=B.BM_ID) LEFT OUTER JOIN ZW C ON(A.UI_ZW=C.ZWID) LEFT OUTER JOIN QY D ON (A.UI_SSGS=D.QY_ID) WHERE UI_ID='" + this.Session["userid"] + "'");
                if (dr.Read())
                {
                    yhbm.Text = dr["ui_id"].ToString();
                    xm.Text = dr["ui_desc"].ToString();
                    xb.SelectedValue = dr["ui_sex"].ToString();
                    bgdh.Text = dr["ui_bgdh"].ToString();
                    yddh.Text = dr["ui_yddh"].ToString();
                    czdh.Text = dr["ui_czdh"].ToString();
                    mail.Text = dr["ui_mail"].ToString();
                    csrq.Text = hkdb.GetDate(dr["ui_csrq"].ToString());
                    bm.Text = dr["bm_mc"].ToString();
                    zw.Text = dr["zwmc"].ToString();
                    ssgs.Text = dr["qy_qc"].ToString();
                    rzrq.Text = hkdb.GetDate(dr["ui_rzrq"].ToString());
                    fjNumber.Text = dr["photo"].ToString();
                }
                dr.Close();
            }
        }

        //保存 
        protected void Save_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE YH SET UI_SEX='" + xb.SelectedValue + "',UI_BGDH='" + hkdb.GetStr(bgdh.Text) + "',UI_CZDH='" + hkdb.GetStr(czdh.Text) + "',UI_YDDH='" + hkdb.GetStr(yddh.Text) + "',UI_MAIL='" + hkdb.GetStr(mail.Text) + "',UI_CSRQ='" + hkdb.GetStr(csrq.Text) + "',photo='" + hkdb.GetStr(fj.Text) +"' WHERE UI_ID='" + this.Session["userid"] + "'");
            
            mydb.Alert("保存成功！");
        }
    }
}
