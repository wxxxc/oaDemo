using System;
using System.Data.SqlClient;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using haoke365;
using System.Web;

namespace hkpro
{
    public partial class Index_OA_A : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                HttpCookie login_cookies = Request.Cookies["info_login"];
                if (login_cookies != null)
                {
                    UserName.Text= login_cookies["UserName"];
                    //UserPass.Text= login_cookies["UserPass"];   //TextMode="Password"不会赋值
                    UserPass.Attributes.Add("value", login_cookies["UserPass"]);
                    chk_remember.Checked = true;
                }
                //测试
                string sql = "SELECT paramt FROM hk_CSDA WHERE paramt='P_sdate' AND p_string='0'";
                if (bd.CheckRepeat(sql) == "true")
                {
                    lblCs.Text = "试用帐号:oa&nbsp;&nbsp;密码:1<br>";
                    lblCs.Visible = true;
                }
            }
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(UserName.Text))
            {
                Msg.Text = "请输入用户名！";
                return;
            }

            if (string.IsNullOrEmpty(UserPass.Text))
            {
                Msg.Text = "请输入密码！";
                return;
            }

            //密码解密 
            byte[] data = System.Text.Encoding.Unicode.GetBytes(UserPass.Text.ToCharArray());
            System.Security.Cryptography.MD5CryptoServiceProvider md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] result = md5.ComputeHash(data);
            string sResult = System.Text.Encoding.Unicode.GetString(result);
            string EnPswdStr = Md5Hash(UserPass.Text.ToString());
            SqlDataReader dataR = SqlHelper.ExecuteReader("SELECT A.UI_ID,A.UI_DESC,A.UI_SSBM,A.UI_YNDX,UI_SDATE,UI_EDATE,A.UI_STATUS FROM YH A WHERE (A.UI_ID='" + hkdb.GetStr(UserName.Text) + "' OR A.UI_DESC='" + hkdb.GetStr(UserName.Text) + "') AND A.UI_PWD='" + EnPswdStr + "'");

            if (dataR.Read())
            {
                if (dataR["ui_status"].ToString() == "正常")
                {
                    if ((DateTime)dataR["ui_sdate"] < DateTime.Today & (DateTime)dataR["ui_edate"] > DateTime.Today)
                    {
                        //lbluid.Text = dataR["ui_id"].ToString();

                        this.Session["systype"] = "O";
                        this.Session["userid"] = dataR["ui_id"].ToString();
                        this.Session["username"] = dataR["ui_desc"].ToString();
                        this.Session["deptid"] = dataR["ui_ssbm"].ToString();
                        //this.Session["deptname"] = dataR["bm_mc"].ToString();
                        //this.Session["deptqx"] = dataR["dQxStr"].ToString();
                        //this.Session["qyid"] = dataR["ui_ssgs"].ToString();
                        this.Session["smsqx"] = dataR["ui_yndx"].ToString();
                        //this.Session["roleqx"] = dataR["role_qx"].ToString();
                        //this.Session["bmglqx"] = dataR["bmglqx"].ToString();
                        //this.Session["qyjc"] = dataR["qy_jc"].ToString();

                        //记住密码
                        HttpCookie login_cookies = new HttpCookie("info_login");
                        if (chk_remember.Checked)
                        {
                            login_cookies.Values.Add("UserName", UserName.Text.Trim());
                            login_cookies.Values.Add("UserPass", UserPass.Text.Trim());
                            login_cookies.Expires = System.DateTime.Now.AddDays(30.0);
                            HttpContext.Current.Response.Cookies.Add(login_cookies);
                        }
                        else
                        {
                            HttpCookie l_cookies = Request.Cookies["info_login"];
                            if (l_cookies != null)
                            {
                                Response.Cookies["info_login"].Expires = DateTime.Now;
                            }
                        }

                        //工作流专用
                        //this.Session["roleid"] = dataR["ui_role"].ToString();
                        //Response.Cookies["haoke"]["rolename"] = Server.UrlEncode(dataR["role_name"].ToString());
                        dataR.Close();

                        //默认查询日期
                        SqlDataReader drs = SqlHelper.ExecuteReader("SELECT p_string FROM hk_CSDA WHERE paramt='P_sdate' AND p_string='0'");
                        if (drs.Read())
                        {
                            this.Session["demo"] = "Y";
                        }
                        else
                        {
                            this.Session["demo"] = "N";
                        }
                        drs.Close();

                        //更新用户在线时间 
                        //SqlHelper.ExecuteSql("update yh set lasttime=getdate() where ui_id='" + lbluid.Text + "'");

                        //记录日志进入系统 
                        SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port,dl_rk) values('" + hkdb.GetStr(UserName.Text) + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','登录系统','" + Request.ServerVariables["REMOTE_PORT"] + "','WebAPP')");

                        //Server.Transfer("Main_a.aspx?from=O");
                        Response.Redirect("Main_a.aspx?from=O");
                    }
                    else
                    {
                        dataR.Close();
                        Msg.Text = "对不起，该用户不在有效期范围内，不能登录！";
                    }
                }
                else
                {
                    dataR.Close();
                    Msg.Text = "对不起，该用户目前属于非正常状态，不能登录！";
                }
            }
            else
            {
                dataR.Close();
                Msg.Text = "用户名或密码错误！";
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

        private static string Md5Hash(string input)
        {
            MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();
            byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));
            StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }
    }
}
