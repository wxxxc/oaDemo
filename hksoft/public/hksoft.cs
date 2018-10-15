

using System;
using System.Data.SqlClient;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace haoke365
{
    public class mydb
    {
        public string set_table_label_color(string jjcd)
        {
            string outcss = "";
            switch (jjcd)
            {
                case "高":
                    outcss = "label label-danger";
                    break;
                case "中":
                    outcss = "label label-warning";
                    break;
                case "低":
                    outcss = "label label-info";
                    break;
                default:
                    outcss = "label label-default";
                    break;
            }
            return outcss;
        }

        //超时
        public string VeriSess(string str1)
        {
            if (HttpContext.Current.Session["userid"] == null)
            {
                switch (str1)
                {
                    case "9":   //APP
                        //HttpContext.Current.Response.Write("<br>&nbsp;<img src=../../images/clock.gif></img><font size=2pt color=red>对不起，系统已超时，请 <a href=../app/Default_A.aspx target=self>重新登录</a> ！</font>");
                        HttpContext.Current.Response.Redirect("/app/Default_A.aspx");
                        break;
                    case "3":
                        HttpContext.Current.Response.Write("<br>&nbsp;<img src=../../images/clock.gif></img><font size=2pt color=red>对不起，系统已超时，请 <a href=../../Default.aspx target=_parent>重新登录</a> ！</font>");
                        break;
                    case "2":
                        HttpContext.Current.Response.Write("<br>&nbsp;<img src=../images/clock.gif></img><font size=2pt color=red>对不起，系统已超时，<a href=../../Default.aspx target=_parent>重新登录</a> ！！</font>");
                        break;
                    case "1":
                        //mydb.Alert_Parent("对不起，系统已超时，请重新登录！", "Default.aspx");
                        HttpContext.Current.Response.Write("<br>&nbsp;<img src=images/clock.gif></img><font size=2pt color=red>对不起，系统已超时，<a href=../../Default.aspx target=_parent>重新登录</a> ！！</font>");
                        break;
                    default:    //PC + APP
                        HttpContext.Current.Response.Write("<br>&nbsp;<img src=../../images/clock.gif></img><font size=2pt color=red>对不起，系统已超时，<a href=../../Default.aspx target=_parent>重新登录</a> ！ ！</font>");
                        break;
                }

                HttpContext.Current.Response.End();
            }

            return "true";
        }

        //初始化
        public string PassTo(string p_str1, string p_str2)
        {
            //权限
            SqlConnection p_cnn = default(SqlConnection);
            SqlCommand p_cmd = default(SqlCommand);
            SqlDataReader p_dr = default(SqlDataReader);

            p_cnn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["haokeDataLink"]);
            p_cnn.Open();

            if (HttpContext.Current.Session["userid"].ToString() != "admin")
            {
                //p_cmd = new SqlCommand("SELECT UI_ID FROM YH A LEFT OUTER JOIN QX B ON (A.UI_ROLE=B.ROLE_ID) WHERE A.UI_ID='" + HttpContext.Current.Session["userid"] + "' AND B.MODU_ID IN(" + p_str1 + ")", p_cnn);
                p_cmd = new SqlCommand("SELECT TOP 1 MODU_ID FROM QX WHERE MODU_ID IN(" + p_str1 + ") AND (ROLE_ID=(SELECT UI_ROLE FROM YH WHERE UI_ID='" + HttpContext.Current.Session["userid"] + "') OR ROLE_ID IN(SELECT ROLE_ID FROM YH_JS WHERE UI_ID='" + HttpContext.Current.Session["userid"] + "'))", p_cnn);
                p_dr = p_cmd.ExecuteReader();
                if (!p_dr.Read())
                {
                    p_dr.Close();
                    p_cnn.Close();
                    HttpContext.Current.Response.Write("<br>&nbsp;<img src=../../images/error_b.gif></img><font size=2pt color=red>您无权使用该页面，详情可咨询系统管理人员！</font>");
                    HttpContext.Current.Response.End();
                }
                p_dr.Close();
            }

            //登录日志
            if (p_str2 != "0")
            {
                //服务器端口号
                //string strServerPort = HttpContext.Current.Request.Url.Port.ToString();

                p_cmd = new SqlCommand("INSERT INTO HK_DLRZ(DL_ID,DL_RQ,DL_IP,DL_JQM,OPEN_MK,DL_PORT) VALUES('" + HttpContext.Current.Session["userid"] + "',GETDATE(),'" + HttpContext.Current.Request.UserHostAddress + "','" + Dns.GetHostName() + "','" + p_str2 + "','" + HttpContext.Current.Request.ServerVariables["REMOTE_PORT"] + "')", p_cnn);
                p_cmd.ExecuteNonQuery();
            }
            p_cnn.Close();

            return "true";
        }

        //操作权限
        public void QxValid(System.Web.UI.Control ctl, string qxmc, string qxstr)
        {
            if (!StrIx(qxmc, qxstr))
            {
                ctl.Visible = false;
            }
            else
            {
                ctl.Visible = true;
            }
        }
        public bool StrIx(string Str1, string Str2)
        {
            if (Str2.IndexOf(Str1) < 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        //短信权限
        public string VeriSms()
        {
            if (HttpContext.Current.Session["smsqx"] == null)
            {
                return "false";
            }
            else if (HttpContext.Current.Session["smsqx"].ToString() == "Y")
            {
                return "true";
            }
            else
            {
                return "false";
            }
        }

        //Demo判断_提示
        public string IsDemo(string str)
        {
            if (HttpContext.Current.Request.Cookies["haoke"].Values["sdate"].ToString() == "2001-01-01")
            {
                if (str == "Y")
                {
                    mydb.Alert("对不起。为确保其它用户的测试体验，试用环境下不能执行此操作！");
                }
                return "true";
            }
            else
            {
                return "false";
            }
        }

        //Demo判断_禁入
        public static void IsDemo_Stop()
        {
            if (HttpContext.Current.Request.Cookies["haoke"].Values["sdate"].ToString() == "2001-01-01")
            {
                HttpContext.Current.Response.Write("<br>&nbsp;<img src=../../images/clock.gif></img><font size=2pt color=red>对不起。为确保其它用户的测试体验，试用环境下不能执行此操作 ！</font>");
                HttpContext.Current.Response.End();
            }
        }

        //Demo判断_关闭
        public string IsDemo_Close(string str)
        {
            if (HttpContext.Current.Request.Cookies["haoke"].Values["sdate"].ToString() == "2001-01-01")
            {
                if (str == "Y")
                {
                    mydb.Alert_Close("对不起。为确保其它用户的测试体验，试用环境下不能执行此操作！");
                }
                return "true";
            }
            else
            {
                return "false";
            }
        }

        //Demo判断_Other
        public string IsDemo_Other(string str)
        {
            string strType = "";
            switch (str)
            {
                case "yz":
                    strType = HttpContext.Current.Request.Cookies["haoke_yz"].Values["sdate"].ToString();   //PMS业主
                    break;
                case "zh":
                    strType = HttpContext.Current.Request.Cookies["haoke_zh"].Values["sdate"].ToString();   //PMS租户
                    break;
                case "hy":
                    strType = HttpContext.Current.Request.Cookies["haoke_hy"].Values["sdate"].ToString();   //VIP会员
                    break;
            }

            if (strType == "2001-01-01")
            {
                mydb.Alert("对不起。为确保其它用户的测试体验，试用环境下不能执行此操作！");
                return "true";
            }
            else
            {
                return "false";
            }
        }

        //操作日志
        public static void InsertLog(string LogContent, string ModuId)
        {
            SqlHelper.ExecuteSql("INSERT INTO hk_SystemLog(LogContent,ModuId,UserID,UserName,Nowtime,IPAddress,DeptID,DeptName,QxStr) "
                                      + "VALUES ('" + LogContent + "','" + ModuId + "','" + HttpContext.Current.Session["userid"] + "','" + HttpContext.Current.Session["username"] + "',GETDATE(),'" + HttpContext.Current.Request.UserHostAddress + "','" + HttpContext.Current.Session["deptid"] + "','" + HttpContext.Current.Session["deptname"] + "','" + HttpContext.Current.Session["deptqx"] + "')");
        }

        //阿里云发送短信
        public void SendAliSMS(bool xx, bool dx, string sender, string receiver, string msg, string templateParam)
        {
            AliSMS alisms = new AliSMS();
            if (dx)
            {
                string[] arr_jsids = receiver.Split(',');
                for (int i = 0; i < arr_jsids.Length; i++)
                {
                    string phone = Convert.ToString(SqlHelper.ExecuteScalar("select ui_yddh from yh where ui_id='" + arr_jsids[i] + "'"));
                    if (phone != "" && System.Text.RegularExpressions.Regex.IsMatch(phone, @"^1\d{10}$"))
                    {
                        string result = alisms.SendSMS(phone, templateParam);
                    }
                }
            }
            SqlHelper.ExecuteSql("EXEC sp_Send_Mess " + GetValueChk_Int(xx) + "," + GetValueChk_Int(dx) + ",'" + sender + "','" + receiver + "','" + msg + "'");
        }
        //发送信息
        public void SendMsg(bool xx, bool dx, string sender, string receiver, string msg)
        {
            SqlHelper.ExecuteSql("EXEC sp_Send_Mess " + GetValueChk_Int(xx) + "," + GetValueChk_Int(dx) + ",'" + sender + "','" + receiver + "','" + msg + "'");
        }

        //格式化字符串:通用
        public string GetStr(string str)
        {
            if (string.IsNullOrEmpty(str))
                return "";
            else
            {
                //关键字
                string msg = "";
                string word = "and|char|chr|declare|drop|delete|exec|insert|join|master|mid|or|select|truncate|update";
                foreach (string i in word.Split('|'))
                {
                    if ((str.ToLower().IndexOf(i + " ") > -1) || (str.ToLower().IndexOf(" " + i) > -1))
                    {
                        //记录日志
                        msg = "非法操作！";
                        msg += "关键字:" + i;
                        //msg += "操作IP:" + HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"] + "";
                        msg += ";页面:" + HttpContext.Current.Request.ServerVariables["URL"].ToLower() + "";

                        SqlHelper.ExecuteSql("INSERT INTO hk_SystemLog(LogContent,ModuId,UserID,UserName,Nowtime,IPAddress,DeptID,DeptName,QxStr) "
                          + "VALUES ('" + msg + "','00000','','',GETDATE(),'" + HttpContext.Current.Request.UserHostAddress + "','','','')");

                        str = str.Replace(i, "");
                    }
                }

                //字符
                str = str.Trim();
                str = str.Replace("'", "’");
                //str = str.Replace("'", "''");
                str = str.Replace(";", "；");
                //str = str.Replace(";--", "");
                str = str.Replace("<", "〈");
                str = str.Replace(">", "〉");
                str = str.Replace("=", "＝");

                return str;
            }
        }

        //格式化字符串:清除
        public string GetStrClr(string str)
        {
            if (string.IsNullOrEmpty(str))
                return "";
            else
            {
                str = str.Trim();
                str = str.Replace("'", "");
                return str;
            }
        }

        //格式化字符串:文本编辑器输入
        public string GetStrTeIn(string str)
        {
            if (string.IsNullOrEmpty(str))
                return "";
            else
            {
                str = str.Replace("'", "’");
                return str;
            }
        }

        //格式化字符串:文本编辑器输出
        public string GetStrTeOut(string str)
        {
            if (string.IsNullOrEmpty(str))
                return "";
            else
            {
                str = str.Replace("’", "'");
                return str;
            }
        }

        //格式化字符串:过滤文件名中的非法字符
        public string GetStr_Rename(string str)
        {
            if (string.IsNullOrEmpty(str))
                return "";
            else
            {
                str = str.Trim();
                str = str.Replace("，", "");
                str = str.Replace("。", "");
                str = str.Replace("'", "");
                str = str.Replace("%", "");
                str = str.Replace("@", "");
                str = str.Replace("!", "");
                str = str.Replace("#", "");
                str = str.Replace("$", "");
                str = str.Replace("^", "");
                str = str.Replace("&", "");
                str = str.Replace("〈", "");
                str = str.Replace("〉", "");
                str = str.Replace("=", "");
                str = str.Replace("~", "");
                return str;
            }
        }

        //格式化Numeric数值文本框
        public string GetNum(string str)
        {
            if (string.IsNullOrEmpty(str))
                return "0";
            else
            {
                return str;
            }
        }

        //格式化Date日期文本框：只取年-月-日
        public string GetDate(string str)
        {
            if ("1900-1-1 0:00:00" == str | "1900/1/1 0:00:00" == str | "1900-1-1 00:00:00" == str | "1900/1/1 00:00:00" == str | string.IsNullOrEmpty(str))
                return "";
            else
            {
                str = str.Substring(0, str.IndexOf(" "));
                //str = str.Replace("/", "-");
                return str;
            }
        }

        //TextBox转换为Label
        public string TbToLb(string str)
        {
            if (string.IsNullOrEmpty(str))
                return "";
            else
            {
                str = str.Replace("\n", "<br>");
                str = str.Replace(" ", "&nbsp;&nbsp;");
                return str;
            }
        }

        //返回CheckBox值：返回 是或否
        public string GetValueChk_Str(bool str)
        {
            if (str == true)
                return "是";
            else
            {
                return "否";
            }
        }

        //返回CheckBox值：返回 0或1
        public int GetValueChk_Int(bool str)
        {
            if (str == true)
                return 1;
            else
            {
                return 0;
            }
        }

        //返回CheckBox值：返回 true或false
        public bool GetValueChk_Checked(string str)
        {
            if (str == "是")
                return true;
            else
            {
                return false;
            }
        }

        //批量设置CheckBox_赋值
        public string SetChecked(System.Web.UI.WebControls.CheckBoxList checkList, string selval)
        {
            for (int i = 0; i < checkList.Items.Count; i++)
            {
                checkList.Items[i].Selected = false;
                string val = "," + checkList.Items[i].Value + ",";
                if (selval.IndexOf(val) != -1)
                {
                    checkList.Items[i].Selected = true;
                }
            }
            return selval;
        }

        //批量设置CheckBox_取值
        public string GetChecked(System.Web.UI.WebControls.CheckBoxList checkList)
        {
            string selval = "";
            for (int i = 0; i < checkList.Items.Count; i++)
            {
                if (checkList.Items[i].Selected)
                {
                    selval += "" + checkList.Items[i].Value + ",";
                }
            }
            selval += "0";
            return selval;
        }

        //提示信息
        public static void Alert(string content)
        {
            Page page = (Page)System.Web.HttpContext.Current.Handler;
            page.ClientScript.RegisterStartupScript(page.GetType(), "", "<script language='javascript'>alert('" + content + "');</script>");
        }

        //提示信息、关闭
        public static void Alert_Close(string content)
        {
            Page page = (Page)System.Web.HttpContext.Current.Handler;
            page.ClientScript.RegisterStartupScript(page.GetType(), "", "<script language='javascript'>alert('" + content + "');window.close();</script>");
        }

        //提示信息、刷新父页
        public static void Alert_Refresh(string content, string url)
        {
            Page page = (Page)System.Web.HttpContext.Current.Handler;
            page.ClientScript.RegisterStartupScript(page.GetType(), "", "<script language='javascript'>alert('" + content + "');window.opener.location.href='" + url + "';</script>");
        }

        //提示信息、刷新父页、关闭
        public static void Alert_Refresh_Close(string content, string url)
        {
            Page page = (Page)System.Web.HttpContext.Current.Handler;
            page.ClientScript.RegisterStartupScript(page.GetType(), "", "<script language='javascript'>alert('" + content + "');window.opener.location.href='" + url + "';window.close();</script>");
        }

        //提示信息、跳转
        public static void Alert_Goto(string content, string url)
        {
            Page page = (Page)System.Web.HttpContext.Current.Handler;
            page.ClientScript.RegisterStartupScript(page.GetType(), "", "<script language='javascript'>alert('" + content + "');window.location.href='" + url + "';</script>");
        }

        //提示信息、reload、关闭
        public static void Alert_Reload_Close(string content)
        {
            Page page = (Page)System.Web.HttpContext.Current.Handler;
            page.ClientScript.RegisterStartupScript(page.GetType(), "", "<script language='javascript'>alert('" + content + "');window.opener.location.reload();window.close();</script>");
        }

        //提示信息、reload、跳转
        public static void Alert_Reload_Goto(string content, string url)
        {
            Page page = (Page)System.Web.HttpContext.Current.Handler;
            page.ClientScript.RegisterStartupScript(page.GetType(), "", "<script language='javascript'>alert('" + content + "');window.opener.location.reload();window.location.href='" + url + "';</script>");
        }

        //提示信息、刷新Parent
        public static void Alert_Parent(string content, string url)
        {
            Page page = (Page)System.Web.HttpContext.Current.Handler;
            page.ClientScript.RegisterStartupScript(page.GetType(), "", "<script language='javascript'>alert('" + content + "');window.parent.location='" + url + "';</script>");
        }

        //提示信息、回退
        public static void Alert_Back(string content)
        {
            Page page = (Page)System.Web.HttpContext.Current.Handler;
            page.ClientScript.RegisterStartupScript(page.GetType(), "", "<script language='javascript'>alert('" + content + "');history.go(-2);</script>");
        }

        //刷新父页、关闭
        public static void Refresh_Close(string url)
        {
            Page page = (Page)System.Web.HttpContext.Current.Handler;
            page.ClientScript.RegisterStartupScript(page.GetType(), "", "<script language='javascript'>window.opener.location.href='" + url + "';window.close();</script>");
        }

        //本页跳转
        public static void Goto(string url)
        {
            Page page = (Page)System.Web.HttpContext.Current.Handler;
            page.ClientScript.RegisterStartupScript(page.GetType(), "", "<script language='javascript'>window.location.href='" + url + "';</script>");
        }

        //父页跳转
        public static void Goto_Parent(string url)
        {
            Page page = (Page)System.Web.HttpContext.Current.Handler;
            page.ClientScript.RegisterStartupScript(page.GetType(), "", "<script language='javascript'>window.parent.location.href='" + url + "';</script>");
        }

        //缺省日期
        public string SetDate(string str, int days)
        {
            switch (str)
            {
                case "auto":
                    return HttpContext.Current.Request.Cookies["haoke"].Values["sdate"].ToString();
                case "D":
                    return System.DateTime.Now.AddDays(days).ToString("yyyy-MM-dd");
                case "Y-M":
                    return string.Format("{0:yyyy-MM}", DateTime.Now);
                case "Y":
                    return string.Format("{0:yyyy}", DateTime.Now);
                case "M":
                    return string.Format("{0:MM}", DateTime.Now);
                default:
                    return System.DateTime.Now.AddDays(days).ToString("yyyy-MM-dd");
            }
        }

        //DES加密
        public string DESEncrypt(string pToEncrypt, string sKey)
        {
            using (DESCryptoServiceProvider des = new DESCryptoServiceProvider())
            {
                byte[] inputByteArray = Encoding.UTF8.GetBytes(pToEncrypt);
                des.Key = ASCIIEncoding.ASCII.GetBytes(sKey);
                des.IV = ASCIIEncoding.ASCII.GetBytes(sKey);
                System.IO.MemoryStream ms = new System.IO.MemoryStream();
                using (CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(inputByteArray, 0, inputByteArray.Length);
                    cs.FlushFinalBlock();
                    cs.Close();
                }
                string str = Convert.ToBase64String(ms.ToArray());
                ms.Close();
                return str;
            }
        }

        //定位DropDownList
        public string Find_Drop(string _FindName, DropDownList _Ddl)
        {
            int row = _Ddl.Items.Count;//得到总行数 
            int _length = _FindName.Trim().Length;

            for (int i = 0; i < row; i++)//得到总行数并在之内循环             
            {
                //精确查找定位                    
                if (_FindName.Trim() == _Ddl.Items[i].Text.ToString().Trim())
                { //对比TexBox中的值是否与DropDownList中的值相同（上面这句）                          
                    _Ddl.SelectedIndex = i;//定位到行

                    return "1";//返回                    
                }

                //模糊查找定位（连续长度相同才认为是相似） 
                /*************模糊查找定位算法 * 从1到对应的表格内容长度查找 * 先找到第一个字符与要查找的内容对应的第一个字符相同的然后查找后面的相同长度的内容是否相同，相同则定位到此行 */
                for (int k = 0; k < _Ddl.Items[i].Text.ToString().Trim().Length; k++)
                {
                    if (_length <= _Ddl.Items[i].Text.ToString().Trim().Length - k)//判断要查找内容的长度是否小于对比的内容的长度                         
                    {
                        if (_FindName.Trim().Substring(0, 1) == _Ddl.Items[i].Text.ToString().Trim().Substring(k, 1))//判断第一个字符是否与要对比的内容的第一个字符相同                             
                        {
                            if (_FindName.Trim() == _Ddl.Items[i].Text.ToString().Trim().Substring(k, _length))//判断是查找内容与对比内容否相等                                 
                            {
                                _Ddl.SelectedIndex = i;//定位到行

                                return "1";//返回                                 
                            }
                        }
                    }
                }
            }

            return "0";
        }

        //转化为大写人民币
        //负数调用示例
        //if (float.Parse(datar1["je"].ToString()) >= 0)
        //{
        //    lbldx.Text = " " + hkdb.ConvertToRMB(datar1["je"].ToString()) + " ";
        //}
        //else
        //{
        //    float fje = float.Parse(datar1["je"].ToString()) * -1;
        //    lbldx.Text = " 负" + hkdb.ConvertToRMB(fje.ToString()) + " ";
        //}
        public string ConvertToRMB(string inputString)
        {
            string numList = "零壹贰叁肆伍陆柒捌玖";
            string rmbList = "分角元拾佰仟万拾佰仟亿拾佰仟万";
            double number = 0;
            string tempOutString = "";
            try
            {
                number = double.Parse(inputString);
            }
            catch
            {
                return "传入参数非数字";
            }
            // MessageBox.Show("")
            if (number > 9999999999999.99)
            {
                return "超出范围的人民币值";
            }
            string tempNumberString = Convert.ToInt64(number * 100).ToString();
            int tempNmberLength = tempNumberString.Length;
            int i = 0;
            while (i < tempNmberLength)
            {
                int oneNumber = Int32.Parse(tempNumberString.Substring(i, 1));
                string oneNumberChar = numList.Substring(oneNumber, 1);
                string oneNumberUnit = rmbList.Substring(tempNmberLength - i - 1, 1);
                if (!(oneNumberChar == "零"))
                {
                    tempOutString += oneNumberChar + oneNumberUnit;
                }
                else
                {
                    if (oneNumberUnit == "亿" || oneNumberUnit == "万" || oneNumberUnit == "元" || oneNumberUnit == "零")
                    {
                        while (tempOutString.EndsWith("零"))
                        {
                            tempOutString = tempOutString.Substring(0, tempOutString.Length - 1);
                        }
                    }
                    if (oneNumberUnit == "亿" || (oneNumberUnit == "万" && !tempOutString.EndsWith("亿")) || oneNumberUnit == "元")
                    {
                        tempOutString += oneNumberUnit;
                    }
                    else
                    {
                        if ((tempOutString != null))
                        {
                            bool tempEnd = tempOutString.EndsWith("亿");
                            bool zeroEnd = tempOutString.EndsWith("零");
                            if (tempOutString.Length > 1)
                            {
                                bool zeroStart = tempOutString.Substring(tempOutString.Length - 2, 2).StartsWith("零");
                                if (!zeroEnd && (zeroStart || !tempEnd))
                                {
                                    tempOutString += oneNumberChar;
                                }
                            }
                            else
                            {
                                if (!zeroEnd && !tempEnd)
                                {
                                    tempOutString += oneNumberChar;
                                }
                            }

                        }
                    }
                }
                i += 1;
            }
            if ((tempOutString != null))
            {
                while (tempOutString.EndsWith("零"))
                {
                    tempOutString = tempOutString.Substring(0, tempOutString.Length - 1);
                }
                while (tempOutString.EndsWith("元"))
                {
                    tempOutString = tempOutString + "整";
                }
                return tempOutString;
            }
            else
            {
                return "";
            }
        }

        /// <summary>
        /// 页面加载中效果
        /// </summary>
        public static void PageWait()
        {
            HttpContext.Current.Response.Write(" <script language=JavaScript type=text/javascript>");
            HttpContext.Current.Response.Write("var t_id = setInterval(animate,20);");
            HttpContext.Current.Response.Write("var pos=0;var dir=2;var len=0;");
            HttpContext.Current.Response.Write("function animate(){");
            HttpContext.Current.Response.Write("var elem = document.getElementById('progress');");
            HttpContext.Current.Response.Write("if(elem != null) {");
            HttpContext.Current.Response.Write("if (pos==0) len += dir;");
            HttpContext.Current.Response.Write("if (len>32 || pos>79) pos += dir;");
            HttpContext.Current.Response.Write("if (pos>79) len -= dir;");
            HttpContext.Current.Response.Write(" if (pos>79 && len==0) pos=0;");
            HttpContext.Current.Response.Write("elem.style.left = pos;");
            HttpContext.Current.Response.Write("elem.style.width = len;");
            HttpContext.Current.Response.Write("}}");
            HttpContext.Current.Response.Write("function remove_load() {");
            HttpContext.Current.Response.Write(" this.clearInterval(t_id);");
            HttpContext.Current.Response.Write("var targelem = document.getElementById('loader_container');");
            HttpContext.Current.Response.Write("targelem.style.display='none';");
            HttpContext.Current.Response.Write("targelem.style.visibility='hidden';");
            HttpContext.Current.Response.Write("}");
            HttpContext.Current.Response.Write("</script>");
            HttpContext.Current.Response.Write("<style>");
            HttpContext.Current.Response.Write("#loader_container {text-align:center; position:absolute; top:40%; width:100%; left: 0;}");
            HttpContext.Current.Response.Write("#loader {font-family:Tahoma, Helvetica, sans; font-size:11.5px; color:#000000; background-color:#FFFFFF; padding:10px 0 16px 0; margin:0 auto; display:block; width:130px; border:1px solid #5a667b; text-align:left; z-index:2;}");
            HttpContext.Current.Response.Write("#progress {height:5px; font-size:1px; width:1px; position:relative; top:1px; left:0px; background-color:#8894a8;}");
            HttpContext.Current.Response.Write("#loader_bg {background-color:#e4e7eb; position:relative; top:8px; left:8px; height:7px; width:113px; font-size:1px;}");
            HttpContext.Current.Response.Write("</style>");
            HttpContext.Current.Response.Write("<div id=loader_container>");
            HttpContext.Current.Response.Write("<div id=loader>");
            HttpContext.Current.Response.Write("<div align=center>数据提交中，请稍候 ...</div>");
            HttpContext.Current.Response.Write("<div id=loader_bg><div id=progress> </div></div>");
            HttpContext.Current.Response.Write("</div></div>");
            HttpContext.Current.Response.Flush();
        }

        //用时
        public string ShowDateTime(double strSecond)
        {
            string strDate = string.Empty;

            if (strSecond >= 0)
            {
                Int64 intSecond = Convert.ToInt64(strSecond);

                strDate = intSecond / 86400 + "天" + intSecond % 86400 / 3600 + "小时" + intSecond % 86400 % 3600 / 60 + "分钟" + intSecond % 86400 % 3600 % 60 % 60 + "秒";
            }
            return strDate;
        }

        //导出excel
        public void ToExcel(System.Web.UI.Control ctl, string FileName)
        {
            HttpContext.Current.Response.Charset = "UTF-8";
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.Default;
            HttpContext.Current.Response.ContentType = "application/ms-excel";
            HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment;filename=" + "" + FileName + ".xls");
            ctl.Page.EnableViewState = false;
            System.IO.StringWriter tw = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(tw);
            ctl.RenderControl(hw);
            HttpContext.Current.Response.Write(tw.ToString());
            HttpContext.Current.Response.End();
        }

        //表纪录条数
        public int GetCount(string Sql)
        {
            SqlDataReader result = SqlHelper.ExecuteReader(Sql);
            int i = 0;
            while (result.Read())
            {
                i = result.GetInt32(0);
            }
            result.Close();

            return i;
        }
    }
}
