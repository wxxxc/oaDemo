using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro
{
    public partial class View_Zl : System.Web.UI.Page
    {
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                DropDownListBind();

                SqlDataReader dr = SqlHelper.ExecuteReader("select ui_csrq,ui_desc,ui_zw,ui_ssbm,ui_id,ui_desc,ui_sex,ui_bgdh,ui_yddh,ui_czdh,ui_mail from yh where ui_id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (dr.Read())
                {
                    yhbm.Text = dr["ui_id"].ToString();
                    xm.Text = dr["ui_desc"].ToString();
                    xb.SelectedValue = dr["ui_sex"].ToString();
                    bgdh.Text = dr["ui_bgdh"].ToString();
                    yddh.Text = dr["ui_yddh"].ToString();
                    czdh.Text = dr["ui_czdh"].ToString();
                    mail.Text = dr["ui_mail"].ToString();
                    ssbm.SelectedValue = dr["ui_ssbm"].ToString();
                    zw.SelectedValue = dr["ui_zw"].ToString();
                    xmxm.Text = dr["ui_desc"].ToString();
                    csrq.Text = string.Format("{0:d}", dr["ui_csrq"]);
                }
                dr.Close();
            }
        }

        //dp绑定 
        public void DropDownListBind()
        {
            bd.Bind_DropDownList_bm(ssbm, "", "", "");

            string sql_zw = "select zwid,zwmc FROM ZW order by zwid";
            bd.Bind_DropDownList(zw, sql_zw, "zwid", "zwmc", "", "");
        }
    }
}
