using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;
using System.Web;
using System.IO;

namespace hkpro.portal.yhgl
{
    public partial class Yh_Add : System.Web.UI.Page
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

                //操作权限
                OperQx();

                //dp绑定
                DropDownListBind();

                //公司判断
                if (this.Session["qyid"].ToString() != "001")
                {
                    ssgs.SelectedValue = this.Session["qyid"].ToString();
                    ssgs.Enabled = false;
                }

                //Init 
                txtSdate.Text = DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd");
                txtEdate.Text = DateTime.Now.AddDays(365).ToString("yyyy-MM-dd");
            }
        }

        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(SaveBtn, "60305a", Session["roleqx"].ToString());
            hkdb.QxValid(SaveAddBtn, "60305a", Session["roleqx"].ToString());
        }

        //dp绑定 
        public void DropDownListBind()
        {
            //所属公司
            string sql_ssgs = "SELECT QY_ID,QY_QC FROM QY ORDER BY QY_ID";
            bd.Bind_DropDownList(ssgs, sql_ssgs, "qy_id", "qy_qc", "", "");

            //角色 
            string sql_js = "SELECT ROLE_ID,ROLE_NAME FROM JS WHERE ROLE_LX='企业' AND ROLE_ID<>'1' ORDER BY ROLE_ID";
            bd.Bind_DropDownList(gwjs, sql_js, "role_id", "role_name", "", "");

            //职位
            string sql_zw = "SELECT ZWID,ZWMC FROM ZW ORDER BY ZWID";
            bd.Bind_DropDownList(zwmc, sql_zw, "zwid", "zwmc", "", "");

            //部门
            bd.Bind_DropDownList_bm(bm, "", "", "");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //Portal
            string ynbmglzStr = hkdb.GetValueChk_Str(ynbmglz.Checked);

            //编码判断（重复）
            if (bd.CheckRepeat("SELECT UI_ID FROM YH WHERE UI_ID='" + hkdb.GetStr(yhbm.Text) + "'") == "true")
            {
                mydb.Alert("保存失败，该用户编码已存在！");
                return;
            }

            //编码判断（包含）
            //if (bd.CheckRepeat("SELECT UI_ID FROM YH WHERE CHARINDEX('" + hkdb.GetStr(yhbm.Text) + "',ui_id)>0") == "true")
            //{
            //    mydb.Alert("保存失败，该用户编码与系统中已有的编码存在包含关系！请重新输入");
            //    return;
            //}

            //姓名判断（重复）
            if (bd.CheckRepeat("SELECT UI_ID FROM YH WHERE UI_DESC='" + hkdb.GetStr(xm.Text) + "' AND UI_LX='企业'") == "true")
            {
                mydb.Alert("保存失败，该用户姓名已存在！");
                return;
            }

            //姓名判断（与编码重复）
            //if (bd.CheckRepeat("SELECT UI_ID FROM YH WHERE UI_ID='" + hkdb.GetStr(xm.Text) + "' AND UI_LX='企业'") == "true")
            //{
            //    mydb.Alert("保存失败，该用户姓名与已有的用户编码相同！");
            //    return;
            //}

           
            //MD5加密 
            byte[] data = System.Text.Encoding.Unicode.GetBytes(dlmm.Text.ToCharArray());
            System.Security.Cryptography.MD5CryptoServiceProvider md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] result = md5.ComputeHash(data);
            string sResult = System.Text.Encoding.Unicode.GetString(result);
            string EnPswdStr = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(dlmm.Text.ToString(), "MD5");
            
            SqlHelper.ExecuteSql("INSERT INTO hk_MySet(FK_uid,ynRemind,RemindTime,RemindMode,RemindSound,Mail_Qc,Mail_Smtp,Mail_Dlyh,Mail_Dlmm,Mail_Port,Mail_Fsr,PageCount) VALUES('" + hkdb.GetStr(yhbm.Text) + "','是','60000','否','1.swf','ok8209@sohu.com','smtp.sohu.com','ok8209','haokee3000','25','系统管理员',15)");

            SqlHelper.ExecuteSql("INSERT INTO YH(UI_ID,UI_DESC,UI_SEX,UI_ROLE,UI_STATUS,UI_COMM,UI_PWD,UI_LX,UI_ZW,UI_BGDH,UI_YDDH,UI_CZDH,UI_MAIL,UI_SDATE,UI_EDATE,CJR,CJSJ,UI_CSRQ,UI_SSBM,YN_BMGLZ,UI_SSGS,photo,score,khscore) VALUES('" + hkdb.GetStr(yhbm.Text) + "','" + hkdb.GetStr(xm.Text) + "','" + xb.SelectedValue + "','" + gwjs.SelectedValue + "','" + zt.SelectedValue + "','" + hkdb.GetStr(bz.Text) + "','" + EnPswdStr + "','企业','" + zwmc.SelectedValue + "','" + hkdb.GetStr(bgdh.Text) + "','" + hkdb.GetStr(yddh.Text) + "','" + hkdb.GetStr(czdh.Text) + "','" + hkdb.GetStr(mail.Text) + "','" + hkdb.GetStr(txtSdate.Text) + "','" + hkdb.GetStr(txtEdate.Text) + "','" + this.Session["userid"] + "',GETDATE(),'" + hkdb.GetStr(csrq.Text) + "','" + bm.SelectedValue + "','" + ynbmglzStr + "','" + ssgs.SelectedValue + "','" +hkdb.GetStr(fj.Text)  + "',0,100)");

            string sql_kms = "SELECT * FROM hk_Init WHERE ProduID='K'";
            if (bd.CheckRepeat(sql_kms) == "true")
            {
                SqlHelper.ExecuteSql("INSERT INTO YH_KMS(SSYHID,YN_CGSP,YN_CGRY) VALUES('" + hkdb.GetStr(yhbm.Text) + "','否','否')");
            }

            string sql_report = "SELECT * FROM hk_Init WHERE ProduID='R'";
            if (bd.CheckRepeat(sql_report) == "true")
            {
                SqlHelper.ExecuteSql("INSERT INTO YH_Report(SSYHID,YN_SL) VALUES('" + hkdb.GetStr(yhbm.Text) + "','否')");
            }

            string sql_scm = "SELECT * FROM hk_Init WHERE ProduID='G'";
            if (bd.CheckRepeat(sql_scm) == "true")
            {
                SqlHelper.ExecuteSql("INSERT INTO YH_SCM(SSYHID) VALUES('" + hkdb.GetStr(yhbm.Text) + "')");
            }

            string sql_eam = "SELECT * FROM hk_Init WHERE ProduID='E'";
            if (bd.CheckRepeat(sql_eam) == "true")
            {
                SqlHelper.ExecuteSql("INSERT INTO YH_EAM(SSYHID) VALUES('" + hkdb.GetStr(yhbm.Text) + "')");
            }

            string sql_hr = "SELECT * FROM hk_Init WHERE ProduID='H'";
            if (bd.CheckRepeat(sql_hr) == "true")
            {
                SqlHelper.ExecuteSql("INSERT INTO YH_HR(SSYHID) VALUES('" + hkdb.GetStr(yhbm.Text) + "')");
            }

            //桌面
            int k = 1;
            SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM hk_desktop WHERE ProduID='P'");
            while (datar.Read())
            {
                SqlHelper.ExecuteSql("INSERT INTO HK_MYDESK(SSDMID,ORDERID,USERNAME,TOPNUM) VALUES('" + datar["id"].ToString() + "'," + k + ",'" + hkdb.GetStr(yhbm.Text) + "','5')");
                k = k + 1;
            }
            datar.Close();

            //驾驶舱
            int m = 1;
            SqlDataReader datarm = SqlHelper.ExecuteReader("SELECT * FROM hk_Dashboard WHERE ProduID='P'");
            while (datarm.Read())
            {
                SqlHelper.ExecuteSql("INSERT INTO HK_MYDASH(SSDBID,ORDERID,USERNAME,TOPNUM) VALUES('" + datarm["id"].ToString() + "'," + k + ",'" + hkdb.GetStr(yhbm.Text) + "','10')");
                m = m + 1;
            }
            datarm.Close();

            //日志
            mydb.InsertLog("新增用户【" + xm.Text + "】", "60305");

            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                Clear_Click();
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "yh.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！","yh.aspx");
            }
        }

        //清空 
        protected void Clear_Click()
        {
            yhbm.Text = "";
            xm.Text = "";
            dlmm.Text = "";
            zt.Text = "";
            bz.Text = "";
            zwmc.SelectedValue = "";
            bm.SelectedValue = "";
            bgdh.Text = "";
            yddh.Text = "";
            czdh.Text = "";
            mail.Text = "";
            csrq.Text = "";
            ynbmglz.Checked = false;
            ssgs.SelectedValue = "";
        }
        
       
    }
}
