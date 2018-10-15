using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.yhgl
{
    public partial class Yhcx_View : System.Web.UI.Page
    {
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                DropDownListBind();

                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT A.*,B.ZWMC,C.ROLE_NAME FROM YH A LEFT OUTER JOIN ZW B ON(A.UI_ZW=B.ZWID) LEFT OUTER JOIN JS C ON(A.UI_ROLE=C.ROLE_ID) WHERE UI_ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (datar.Read())
                {
                    yhbm.Text = datar["ui_id"].ToString();
                    xm.Text = datar["ui_desc"].ToString();
                    gwjs.Text = datar["role_name"].ToString();
                    xb.Text = datar["ui_sex"].ToString();
                    zt.Text = datar["ui_status"].ToString();
                    bz.Text = datar["ui_comm"].ToString();
                    zwmc.Text = datar["zwmc"].ToString();
                    bgdh.Text = datar["ui_bgdh"].ToString();
                    yddh.Text = datar["ui_yddh"].ToString();
                    czdh.Text = datar["ui_czdh"].ToString();
                    mail.Text = datar["ui_mail"].ToString();
                    txtSdate.Text = datar["ui_sdate"].ToString();
                    txtEdate.Text = datar["ui_edate"].ToString();
                    csrq.Text = datar["ui_csrq"].ToString();
                    bm.SelectedValue = datar["ui_ssbm"].ToString();
                    datar.Close();
                }
                else
                {
                    datar.Close();
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }
            }
        }

        //dp绑定 
        public void DropDownListBind()
        {
            //部门
            bd.Bind_DropDownList_bm(bm, "", "", "");
        }
    }
}
