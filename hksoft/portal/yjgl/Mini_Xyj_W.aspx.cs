using System;
using System.Data.SqlClient;
using System.Net.Mail;
using haoke365;

namespace hkpro.portal.yjgl
{
    public partial class Mini_Xyj_W : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("40103", "0");

                DropDownListBind();

                lblAttachSize.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT P_STRING FROM hk_CSDA WHERE PARAMT='P_fj_size'"));

                //邮箱
                SqlDataReader drMail = SqlHelper.ExecuteReader("SELECT * FROM hk_MySet WHERE FK_uid='" + this.Session["userid"] + "'");
                if (drMail.Read())
                {
                    lblQc.Text = drMail["mail_qc"].ToString();
                    lblSmtp.Text = drMail["mail_smtp"].ToString();
                    lblUser.Text = drMail["mail_dlyh"].ToString();
                    lblPwd.Text = drMail["mail_dlmm"].ToString();
                    lblPort.Text = drMail["mail_port"].ToString();
                    lblSender.Text = drMail["mail_fsr"].ToString();
                }
                drMail.Close();

                //判断调用页面
                switch (Request.QueryString["lx"])
                {
                    case "hy":
                        //从会员相关页面调用
                        string str1 = "";
                        if (!string.IsNullOrEmpty(Request.QueryString["tj"]))
                        {
                            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT QTJ FROM HK_QUERY WHERE QID=" + hkdb.GetStr(Request.QueryString["tj"]));
                            if (dr.Read())
                            {
                                str1 = str1 + dr["qtj"].ToString();
                            }
                            dr.Close();
                        }

                        SqlDataReader datar = SqlHelper.ExecuteReader("SELECT TOP 1000 DZYJ FROM VI_HYDA A LEFT OUTER JOIN HK_ZDYLX B ON(A.HYLX=B.ID) WHERE DZYJ<>''" + str1);
                        while (datar.Read())
                        {
                            if (string.IsNullOrEmpty(sjr.Text))
                            {
                                sjr.Text = datar["dzyj"].ToString();
                            }
                            else
                            {
                                sjr.Text = sjr.Text + "," + datar["dzyj"].ToString();
                            }
                        }
                        datar.Close();
                        break;
                    case "si":
                        //如果是传递过来一个单独的电子邮件地址
                        if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                        {
                            sjr.Text = hkdb.GetStr(Request.QueryString["id"]);
                        }
                        break;
                    case "sr":
                        //从会员生日问候页面中过来
                        if (!string.IsNullOrEmpty(Request.QueryString["tj"]))
                        {
                            SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT DZYJ FROM VI_HYDA WHERE DZYJ<>'' AND DATEADD(YEAR,YEAR(GETDATE())-YEAR(CSRQ),CSRQ) BETWEEN CONVERT(VARCHAR(10),GETDATE(),120) AND CONVERT(VARCHAR(10),GETDATE()+" + hkdb.GetStr(Request.QueryString["tj"]) + ",120)");
                            while (datar2.Read())
                            {
                                if (string.IsNullOrEmpty(sjr.Text))
                                {
                                    sjr.Text = datar2["dzyj"].ToString();
                                }
                                else
                                {
                                    sjr.Text = sjr.Text + "," + datar2["dzyj"].ToString();
                                }
                            }
                            datar2.Close();

                            //生成短讯
                            Subject.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT QY_JC FROM QY WHERE QY_ID='001'")) + "预祝您生日快乐！";
                        }
                        break;
                }
            }
        }

        public void DropDownListBind()
        {
            //贺卡模板
            string sql = "SELECT A.MBID,A.MBMC FROM VI_MBDA A LEFT OUTER JOIN VI_MBFL B ON (A.MBFL=B.FLID) WHERE B.BJ='sr'";
            bd.Bind_DropDownList(hkmb, sql, "MBID", "MBMC", "", "选择信纸模板");
        }

        protected void Mail_Click(object sender, EventArgs e)
        {
            //当出现smtp服务器关闭、认证信息无效等错误时，try...catch可以给出文字提示
            try
            {
                MailMessage myMail = new MailMessage();
                myMail.BodyEncoding = System.Text.Encoding.GetEncoding("gb2312");
                //补充:文本的编码格式
                myMail.SubjectEncoding = System.Text.Encoding.GetEncoding("gb2312");
                //补充:标题的编码格式
                myMail.From = new MailAddress(lblQc.Text, lblSender.Text);
                //发件人邮箱和名称，取自邮箱设定
                //开始按收件人群发，其他收件人的地址会出现全部收件人地址
                int i = 0;
                for (i = 0; i < (sjr.Text.Split(',')).Length; i++)
                //for (i = 0; i <= Information.UBound(Strings.Split(sjr.Text, ",")); i++)
                {
                    myMail.To.Add(new MailAddress(sjr.Text.Split(',')[i]));
                    // myMail.To.Add(new MailAddress(Strings.Split(sjr.Text, ",")[i]));
                    //myMail.To.Add(New MailAddress(Split(sjr.Text, ",")(i), "收件人姓名"))
                }

                myMail.Subject = Subject.Text;
                //取到邮件标题
                myMail.Body = editor.Value;
                //取到邮件内容
                myMail.IsBodyHtml = true;
                //设置邮件的格式支持HTML
                //设置邮件的优先级别，只用两种
                if (yxj.SelectedValue == "优先")
                {
                    myMail.Priority = MailPriority.High;
                }
                else
                {
                    myMail.Priority = MailPriority.Normal;
                }
                //开始判断并添加附件，同时根据参数控制单个附件的扩展名和大小
                if (!string.IsNullOrEmpty(fujian1.PostedFile.FileName))
                {
                    if (fujian1.PostedFile.ContentLength < 1024 * int.Parse(lblAttachSize.Text))
                    {
                        myMail.Attachments.Add(new Attachment(fujian1.PostedFile.InputStream, fujian1.FileName));
                    }
                    else
                    {
                        mydb.Alert("邮件发送失败！附件(一)大小超出 " + lblAttachSize.Text + " KB的限制！");
                        return;
                    }
                }

                //声明邮件smtp地址、25端口
                SmtpClient smtp = new SmtpClient(lblSmtp.Text, Convert.ToInt32(lblPort.Text));
                smtp.UseDefaultCredentials = true;
                //补充：发送身份验证信息
                //smtp.EnableSsl = True '补充：如果服务器不支持ssl则报"服务器不支持安全连接错误"
                //添加身份验证，发件人邮箱的登录名和密码
                smtp.Credentials = new System.Net.NetworkCredential(lblUser.Text, lblPwd.Text);
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Send(myMail);
                mydb.Alert("邮件发送成功！");
            }
            catch (SmtpException smtpEr)
            {
                mydb.Alert(smtpEr.Message);
            }
            catch (Exception err)
            {
                mydb.Alert(err.Message);
            }
        }

        //选择模板
        protected void Select_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(hkmb.SelectedValue))
            {
                editor.Value = (string)SqlHelper.ExecuteScalar("select mbnr from VI_MBDA where mbid=" + hkmb.SelectedValue);
            }
        }
    }
}
