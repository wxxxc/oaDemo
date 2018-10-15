using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.app.portal
{
    public partial class Mod_Zl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT UI_ID,UI_DESC,UI_SEX,UI_BGDH,UI_YDDH,UI_CZDH,UI_MAIL,UI_CSRQ,UI_RZRQ,B.BM_MC,C.ZWMC,D.QY_QC FROM YH A LEFT OUTER JOIN BM B ON(A.UI_SSBM=B.BM_ID) LEFT OUTER JOIN ZW C ON(A.UI_ZW=C.ZWID) LEFT OUTER JOIN QY D ON (A.UI_SSGS=D.QY_ID) WHERE UI_ID='" + this.Session["userid"] + "'");
                if (dr.Read())
                {
                    txtyhbm.Text = dr["ui_id"].ToString();
                    txtxm.Text = dr["ui_desc"].ToString();
                    xb.Text= dr["ui_sex"].ToString();
                    bgdh.Text = dr["ui_bgdh"].ToString();
                    yddh.Text = dr["ui_yddh"].ToString();
                    czdh.Text = dr["ui_czdh"].ToString();
                    mail.Text = dr["ui_mail"].ToString();
                    //csrq.Text = hkdb.GetDate(dr["ui_csrq"].ToString());
                    txtbm.Text = dr["bm_mc"].ToString();
                    txtzw.Text = dr["zwmc"].ToString();
                    txtssgs.Text = dr["qy_qc"].ToString();
                    txtrzrq.Text = hkdb.GetDate(dr["ui_rzrq"].ToString());
                }
                dr.Close();
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //SqlHelper.ExecuteSql("UPDATE YH SET UI_SEX='" + xb.SelectedValue + "',UI_BGDH='" + bgdh.Text + "',UI_CZDH='" + czdh.Text + "',UI_YDDH='" + yddh.Text + "',UI_MAIL='" + mail.Text + "',UI_CSRQ='" + csrq.Text + "' WHERE UI_ID='" + this.Session["userid"] + "'");
            SqlHelper.ExecuteSql("UPDATE YH SET UI_SEX='" + xb.SelectedValue + "',UI_BGDH='" + bgdh.Text + "',UI_CZDH='" + czdh.Text + "',UI_YDDH='" + yddh.Text + "',UI_MAIL='" + mail.Text + "' WHERE UI_ID='" + this.Session["userid"] + "'");
            mydb.Alert_Goto("修改保存成功", "Set.aspx");

        }
    }
}
