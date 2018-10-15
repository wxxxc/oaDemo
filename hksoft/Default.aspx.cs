using System;
using System.Data.SqlClient;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using FineUI;
using haoke365;

namespace hksoft
{
    public partial class Index_OA : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            //PageTitle.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT ProduName + Version FROM hk_Init WHERE ProduID='O'"));
            //Window1.Title = PageTitle.Text + "＿系统登录";

            if (!IsPostBack)
            {
                //验证码
                LoadData();

                //测试
                string sql = "SELECT paramt FROM hk_CSDA WHERE paramt='P_sdate' AND p_string='0'";
                if (bd.CheckRepeat(sql) == "true")
                {
                    lblCs.Text = SqlHelper.ExecuteScalar("SELECT DemoText1 FROM hk_Init WHERE ProduID='O'").ToString();
                    lblCs.Visible = true;
                }

                //流程自动结束
                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT paramt FROM hk_CSDA WHERE paramt='P_sdate' AND p_string<>'0'");
                if (datar.Read())
                {
                    SqlHelper.ExecuteSql("Update hk_Work Set wStatus='自动结束',wUserIDs='自动结束',wUserNames='自动结束',LastTime=GETDATE() where datediff(hh,LastTime,getdate())>TimeLimit  and wStatus='正在办理'");
                }
                datar.Close();
            }
            else
            {
                Response.Cookies["haoke"].Expires = new DateTime(2020, 1, 1);
            }
        }

        private void LoadData()
        {
            InitCaptchaCode();
        }

        /// <summary>
        /// 初始化验证码
        /// </summary>
        private void InitCaptchaCode()
        {
            // 创建一个 6 位的随机数并保存在 Session 对象中
            Session["CaptchaImageText"] = GenerateRandomCode();
            imgCaptcha.ImageUrl = "~/captcha/captcha.ashx?w=150&h=30&t=" + DateTime.Now.Ticks;
        }

        /// <summary>
        /// 创建一个 6 位的随机数
        /// </summary>
        /// <returns></returns>
        private string GenerateRandomCode()
        {
            string s = String.Empty;
            Random random = new Random();
            for (int i = 0; i < 6; i++)
            {
                s += random.Next(10).ToString();
            }
            return s;
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            InitCaptchaCode();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (tbxCaptcha.Text != Session["CaptchaImageText"].ToString())
            {
                Alert.ShowInTop("验证码错误！", MessageBoxIcon.Error);
                return;
            }

            //判断日期
            string sdstr = Convert.ToString(SqlHelper.ExecuteScalar("select p_string from hk_CSDA where paramt='screen_size_x'"));
            string edstr = Convert.ToString(SqlHelper.ExecuteScalar("select p_string from hk_CSDA where paramt='screen_size_y'"));

            DateTime sdstr2 = Convert.ToDateTime(DESDecrypt(sdstr, "Aa123456"));
            DateTime edstr2 = Convert.ToDateTime(DESDecrypt(edstr, "Aa123456"));
            if (DateTime.Today < sdstr2 | DateTime.Today > edstr2)
            {
                Alert.ShowInTop("警告：本系统已过期，请联系技术支持！", MessageBoxIcon.Error);
                return;
            }

            //判断注册用户数
            string ucount = Convert.ToString(SqlHelper.ExecuteScalar("select p_string from hk_CSDA where paramt='screen_browse'"));
            int tcount = Convert.ToInt32(SqlHelper.ExecuteScalar("select count(*) from yh"));
            int ucount_m = Convert.ToInt32(DESDecrypt(ucount, "Aa123456"));
            if (tcount > ucount_m)
            {
                Alert.ShowInTop("警告：注册用户数超限，请联系技术支持！", MessageBoxIcon.Error);
                return;
            }

            //密码解密 
            byte[] data = System.Text.Encoding.Unicode.GetBytes(tbxPassword.Text.ToCharArray());
            System.Security.Cryptography.MD5CryptoServiceProvider md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] result = md5.ComputeHash(data);
            string sResult = System.Text.Encoding.Unicode.GetString(result);
            string EnPswdStr = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(tbxPassword.Text.ToString(), "MD5");
            SqlDataReader dataR = SqlHelper.ExecuteReader("SELECT A.*,B.BM_MC,B.DQXSTR,B.BMGLQX,isnull(cast(C.ROLE_QX as varchar(1000)),'')+ isnull(stuff((select ','+CAST(role_qx AS VARCHAR(1000)) from js b,yh_js c where b.role_id=c.role_id and c.ui_id=a.ui_id for xml path('')),1,1,''),'')AS ROLE_QX,C.ROLE_NAME,D.PAGECOUNT,E.QY_JC FROM YH A LEFT OUTER JOIN BM B ON (A.UI_SSBM=B.BM_ID) LEFT OUTER JOIN JS C ON(A.UI_ROLE=C.ROLE_ID) LEFT OUTER JOIN HK_MYSET D ON(A.UI_ID=D.FK_UID) LEFT OUTER JOIN QY E ON(A.UI_SSGS=E.QY_ID) WHERE (UI_ID='" + hkdb.GetStr(tbxUserName.Text) + "' OR UI_DESC='" + hkdb.GetStr(tbxUserName.Text) + "') AND UI_PWD='" + EnPswdStr + "'");
            if (dataR.Read())
            {
                if (dataR["ui_status"].ToString() == "正常")
                {
                    if ((DateTime)dataR["ui_sdate"] < DateTime.Today & (DateTime)dataR["ui_edate"] > DateTime.Today)
                    {
                        uid.Text = dataR["ui_id"].ToString();

                        this.Session["systype"] = "O";
                        this.Session["userid"] = dataR["ui_id"].ToString();
                        this.Session["username"] = dataR["ui_desc"].ToString();
                        this.Session["deptid"] = dataR["ui_ssbm"].ToString();
                        this.Session["deptname"] = dataR["bm_mc"].ToString();
                        this.Session["deptqx"] = dataR["dQxStr"].ToString();
                        this.Session["qyid"] = dataR["ui_ssgs"].ToString();
                        this.Session["smsqx"] = dataR["ui_yndx"].ToString();
                        this.Session["roleqx"] = dataR["role_qx"].ToString();
                        this.Session["bmglqx"] = dataR["bmglqx"].ToString();
                        this.Session["qyjc"] = dataR["qy_jc"].ToString();
                        Response.Cookies["haoke"]["pagecount"] = Server.UrlEncode(dataR["PageCount"].ToString());

                        //OA专用
                        this.Session["roleid"] = dataR["ui_role"].ToString();
                        this.Session["sysfield"] = "1";
                        Response.Cookies["haoke"]["rolename"] = Server.UrlEncode(dataR["role_name"].ToString());
                        dataR.Close();

                        //默认查询日期
                        SqlDataReader drs = SqlHelper.ExecuteReader("SELECT p_string FROM hk_CSDA WHERE paramt='P_sdate'");
                        if (drs.Read())
                        {
                            switch (drs["p_string"].ToString())
                            {
                                case "1":
                                    Response.Cookies["haoke"]["sdate"] = string.Format("{0:yyyy-MM}", DateTime.Now) + "-01";  //本月初
                                    break;
                                case "2":
                                    Response.Cookies["haoke"]["sdate"] = string.Format("{0:yyyy}", DateTime.Now) + "-01-01";  //本年初
                                    break;
                                default:
                                    Response.Cookies["haoke"]["sdate"] = "2001-01-01";  //测试环境
                                    break;
                            }
                        }
                        drs.Close();

                        //更新用户在线时间 
                        SqlHelper.ExecuteSql("update yh set lasttime=getdate() where ui_id='" + uid.Text + "'");

                        //记录日志进入系统 
                        SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port) values('" + uid.Text + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','登录系统','" + Request.ServerVariables["REMOTE_PORT"] + "')");

                        //欢迎消息
                        SqlHelper.ExecuteSql("update hk_Mess_JS set zt='0' where id in(select id from hk_Mess_FS where fssj='2099-1-1' and fsr='" + hkdb.GetStr(uid.Text) + "')");

                        //判断委托
                        SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowEntrust WHERE feUserID='" + this.Session["userid"] + "' AND feStatus='启用'");
                        if (datar1.Read())
                        {
                            SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'系统消息','" + this.Session["userid"] + "','您在工作审批中设置了委托人员，请注意！'");
                        }
                        datar1.Close();

                        //OA专用：附件类型
                        SqlDataReader dr_fjlx = SqlHelper.ExecuteReader("SELECT p_string FROM hk_csda WHERE paramt='P_AttType'");
                        if (dr_fjlx.Read())
                        {
                            this.Session["fjlx"] = dr_fjlx["p_string"];
                        }
                        dr_fjlx.Close();

                        Response.Redirect("myMain.aspx?from=O");
                    }
                    else
                    {
                        dataR.Close();
                        Alert.ShowInTop("对不起，该用户不在有效期范围内，不能登录！", MessageBoxIcon.Error);
                    }
                }
                else
                {
                    dataR.Close();
                    Alert.ShowInTop("对不起，该用户目前属于非正常状态，不能登录！", MessageBoxIcon.Error);
                }
            }
            else
            {
                dataR.Close();
                Alert.ShowInTop("用户名或密码错误！", MessageBoxIcon.Error);
            }
        }

        public string DESDecrypt(string pToDecrypt, string sKey)
        {
            byte[] inputByteArray = Convert.FromBase64String(pToDecrypt);
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            try
            {
                des.Key = ASCIIEncoding.ASCII.GetBytes(sKey);
                des.IV = ASCIIEncoding.ASCII.GetBytes(sKey);
                System.IO.MemoryStream ms = new System.IO.MemoryStream();
                CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(), CryptoStreamMode.Write);
                try
                {
                    cs.Write(inputByteArray, 0, inputByteArray.Length);
                    cs.FlushFinalBlock();
                    cs.Close();
                }
                finally
                {
                    cs.Dispose();
                }
                string str = Encoding.UTF8.GetString(ms.ToArray());
                ms.Close();
                return str;
            }
            finally
            {

            }
            //des.Dispose()
        }
    }
}