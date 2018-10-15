using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.yhgl
{
    public partial class Yh_Mod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Session判断
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                //模块权限
                hkdb.PassTo("60305", "0");

                //dp绑定
                DropDownListBind();

                //公司判断
                if (this.Session["qyid"].ToString() != "001")
                {
                    ssgs.SelectedValue = this.Session["qyid"].ToString();
                    ssgs.Enabled = false;
                }

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM YH WHERE UI_ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        yhbm.Text = datar["ui_id"].ToString();
                        xm.Text = datar["ui_desc"].ToString();
                        gwjs.SelectedValue = datar["ui_role"].ToString();
                        xb.SelectedValue = datar["ui_sex"].ToString();
                        zt.SelectedValue = datar["ui_status"].ToString();
                        bz.Text = datar["ui_comm"].ToString();
                        zwmc.SelectedValue = datar["ui_zw"].ToString();
                        bm.SelectedValue = datar["ui_ssbm"].ToString();
                        bgdh.Text = datar["ui_bgdh"].ToString();
                        yddh.Text = datar["ui_yddh"].ToString();
                        czdh.Text = datar["ui_czdh"].ToString();
                        mail.Text = datar["ui_mail"].ToString();
                        txtSdate.Text = string.Format("{0:d}", datar["ui_sdate"]);
                        txtEdate.Text = string.Format("{0:d}", datar["ui_edate"]);
                        csrq.Text = hkdb.GetDate(datar["ui_csrq"].ToString());
                        ssgs.SelectedValue = datar["ui_ssgs"].ToString();
                        ynbmglz.Checked = hkdb.GetValueChk_Checked(datar["yn_bmglz"].ToString());
                        fjNumber.Text= datar["photo"].ToString();
                        datar.Close();

                        //子公司用户不允许删除、修改总部或其它子公司的信息
                        if (this.Session["qyid"].ToString() != "001" && this.Session["qyid"].ToString() != ssgs.SelectedValue)
                        {
                            DelBtn.Visible = false;
                            SaveBtn.Visible = false;
                        }
                        else
                        {
                            //操作权限
                            OperQx();
                        }

                        if (Request.QueryString["id"].ToString() == "admin")
                        {
                            gwjs.Enabled = false;
                            txtSdate.Enabled = false;
                            txtEdate.Enabled = false;
                            zt.Enabled = false;
                            DelBtn.Enabled = false;

                            mydb.Alert("为避免误操作，系统将不允许删除或修改【admin】用户的角色、日期和状态属性！");
                        }
                    }
                    else
                    {
                        datar.Close();
                        mydb.Alert_Close("该用户编码不存在，可能已被删除！");
                    }
                }
            }
        }

        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(SaveBtn, "60305m", Session["roleqx"].ToString());
            hkdb.QxValid(DelBtn, "60305d", Session["roleqx"].ToString());
        }

        //dp绑定 
        public void DropDownListBind()
        {
            //所属公司
            string sql_ssgs = "SELECT QY_ID,QY_QC FROM QY ORDER BY QY_ID";
            bd.Bind_DropDownList(ssgs, sql_ssgs, "qy_id", "qy_qc", "", "");

            //角色 
            string sql_js = null;
            if (Request.QueryString["id"].ToString() == "admin")
            {
                sql_js = "SELECT ROLE_ID,ROLE_NAME FROM JS WHERE ROLE_LX='企业' ORDER BY ROLE_ID";
            }
            else
            {
                sql_js = "SELECT ROLE_ID,ROLE_NAME FROM JS WHERE ROLE_LX='企业' AND ROLE_ID<>'1' ORDER BY ROLE_ID";
            }

            bd.Bind_DropDownList(gwjs, sql_js, "role_id", "role_name", "", "");

            //职位
            string sql_zw = "SELECT ZWID,ZWMC FROM ZW ORDER BY ZWID";
            bd.Bind_DropDownList(zwmc, sql_zw, "zwid", "zwmc", "", "");

            //部门
            bd.Bind_DropDownList_bm(bm, "", "", "");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            //Portal
            string ynbmglzStr = hkdb.GetValueChk_Str(ynbmglz.Checked);

            //姓名判断（重复）
            if (bd.CheckRepeat("SELECT UI_ID FROM YH WHERE UI_DESC='" + hkdb.GetStr(xm.Text) + "' AND UI_LX='企业' AND UI_ID<>'" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'") == "true")
            {
                mydb.Alert("保存失败，该用户姓名已存在！");
                return;
            }

            //姓名判断（与编码重复）
            if (bd.CheckRepeat("SELECT UI_ID FROM YH WHERE UI_ID='" + hkdb.GetStr(xm.Text) + "' AND UI_LX='企业' AND UI_ID<>'" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'") == "true")
            {
                mydb.Alert("保存失败，该用户姓名与已有的用户编码相同！");
                return;
            }

            SqlHelper.ExecuteSql("UPDATE YH SET ui_desc='" + hkdb.GetStr(xm.Text) + "',ui_sex='" + xb.SelectedValue + "',ui_role='" + gwjs.SelectedValue + "',ui_status='" + zt.SelectedValue + "',ui_comm='" + hkdb.GetStr(bz.Text) + "',ui_zw='" + zwmc.SelectedValue + "',ui_bgdh='" + hkdb.GetStr(bgdh.Text) + "',ui_czdh='" + hkdb.GetStr(czdh.Text) + "',ui_yddh='" + hkdb.GetStr(yddh.Text) + "',ui_mail='" + hkdb.GetStr(mail.Text) + "',ui_sdate='" + hkdb.GetStr(txtSdate.Text) + "',ui_edate='" + hkdb.GetStr(txtEdate.Text) + "',ui_csrq='" + hkdb.GetStr(csrq.Text) + "',ui_ssbm='" + bm.SelectedValue + "',yn_bmglz='" + ynbmglzStr + "',ui_ssgs='" + ssgs.SelectedValue + "',photo='"+ hkdb.GetStr(fj.Text)+"' WHERE UI_ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

            //日志
            mydb.InsertLog("修改用户【" + hkdb.GetStr(xm.Text) + "】", "60305");

            mydb.Alert_Refresh_Close("用户保存成功！","yh.aspx");
        }

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            string sql_kms = "SELECT * FROM hk_Init WHERE ProduID='K'";
            if (bd.CheckRepeat(sql_kms) == "true")
            {
                SqlHelper.ExecuteSql("DELETE FROM YH_KMS WHERE ssyhid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            }

            string sql_report = "SELECT * FROM hk_Init WHERE ProduID='R'";
            if (bd.CheckRepeat(sql_report) == "true")
            {
                SqlHelper.ExecuteSql("DELETE FROM YH_Report WHERE ssyhid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            }

            string sql_scm = "SELECT * FROM hk_Init WHERE ProduID='G'";
            if (bd.CheckRepeat(sql_scm) == "true")
            {
                SqlHelper.ExecuteSql("DELETE FROM YH_SCM WHERE ssyhid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            }

            string sql_eam = "SELECT * FROM hk_Init WHERE ProduID='E'";
            if (bd.CheckRepeat(sql_eam) == "true")
            {
                SqlHelper.ExecuteSql("DELETE FROM YH_EAM WHERE ssyhid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            }

            string sql_hr = "SELECT * FROM hk_Init WHERE ProduID='H'";
            if (bd.CheckRepeat(sql_hr) == "true")
            {
                SqlHelper.ExecuteSql("DELETE FROM YH_HR WHERE ssyhid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            }

            SqlHelper.ExecuteSql("DELETE FROM YH_JS WHERE UI_ID = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            SqlHelper.ExecuteSql("DELETE FROM YH_BM WHERE UI_ID = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            SqlHelper.ExecuteSql("DELETE FROM hk_MySet WHERE FK_uid = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            SqlHelper.ExecuteSql("DELETE FROM hk_MyDesk WHERE UserName = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            SqlHelper.ExecuteSql("DELETE FROM hk_MyDash WHERE UserName = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            SqlHelper.ExecuteSql("DELETE FROM YH WHERE UI_ID = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

            //日志
            mydb.InsertLog("删除用户【" + xm.Text + "】", "60305");

            mydb.Alert_Refresh_Close("用户已删除！", "yh.aspx");
        } 
    }
}
