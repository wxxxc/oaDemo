using System;
using System.Data.SqlClient;
using haoke365;
using jmail;

namespace hkpro.portal.yjgl
{
    public partial class Xyj_W : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10102,1002", "0");

                lblAttachSize.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT P_STRING FROM hk_CSDA WHERE PARAMT='P_fj_size'"));

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    sjr.Text = hkdb.GetStr(Request.QueryString["id"].ToString());
                }

                //邮箱
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_MySet WHERE FK_uid='" + this.Session["userid"] + "'");
                if (dr.Read())
                {
                    lblQc.Text = dr["mail_qc"].ToString();
                    lblSmtp.Text = dr["mail_smtp"].ToString();
                    lblUser.Text = dr["mail_dlyh"].ToString();
                    lblPwd.Text = dr["mail_dlmm"].ToString();
                    lblPort.Text = dr["mail_port"].ToString();
                    lblSender.Text = dr["mail_fsr"].ToString();
                }
                dr.Close();

                //刚打开窗口时不显示抄送和密送文本框、附件 
                csholder.Visible = false;
                msholder.Visible = false;
            }

            if (viewcs.Checked == true)
            {
                csholder.Visible = true;
            }
            else
            {
                csholder.Visible = false;
            }

            if (viewms.Checked == true)
            {
                msholder.Visible = true;
            }
            else
            {
                msholder.Visible = false;
            }
        }

        protected void Mail_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(lblSmtp.Text))
            {
                mydb.Alert("您尚未维护SMTP邮件参数，请先通过【个人设定->邮箱配置】设定后再发送！");
                return;
            }

            //当出现smtp服务器关闭、认证信息无效等错误时，try...catch可以给出文字提示 
            try
            {
                jmail.Message myMail = new Message();
                myMail.Charset = "gb2312";
                //补充:标题的编码格式 
                //myMail.ContentType = "text/html" '表示邮件正文的类型 ,设置邮件的格式支持HTML 要发送附件时，不能设置ContentType属性 
                myMail.From = lblQc.Text;
                //发件人邮箱，取自邮箱设定 
                myMail.FromName = lblUser.Text;
                //表示发件人的名称 

                //发件人邮箱和登录密码 
                myMail.MailServerUserName = lblQc.Text;
                myMail.MailServerPassWord = lblPwd.Text;

                //开始按收件人群发，其他收件人的地址会出现全部收件人地址 
                int i = 0;
                for (i = 0; i < (sjr.Text.Split(',')).Length; i++)
                {
                    // myMail.AddRecipient(sjr.Text.Split(',')[i]);
                    myMail.AddRecipient(sjr.Text.Split(',')[i], null, null);
                }

                //判断是否要群发抄送人邮件，抄送人地址可以让其他收件人看到 
                if (!string.IsNullOrEmpty(cs.Text))
                {
                    int j = 0;
                    for (j = 0; j < (cs.Text.Split(',')).Length; j++)
                    {
                        myMail.AddRecipientCC(cs.Text.Split(',')[j], null, null);
                    }
                }

                //判断是否要群发密送人邮件，密送人地址别人是看不到的 
                if (!string.IsNullOrEmpty(ms.Text))
                {
                    int k = 0;
                    for (k = 0; k < (ms.Text.Split(',')).Length; k++)
                    {
                        //myMail.AddRecipientBCC(ms.Text.Split(',')[k], null, null);
                        myMail.AddRecipientBCC(ms.Text.Split(',')[k], null);
                    }
                }

                //取到邮件标题 
                myMail.Subject = hkdb.GetStr(Subject.Text);
                //取到邮件内容 
                myMail.HTMLBody = editor.Value;
                //设置邮件的优先级，1为最快，5为最慢，3为默认值 
                if (yxj.SelectedValue == "优先")
                {
                    myMail.Priority = 1;
                }
                else
                {
                    myMail.Priority = 3;
                }

                //开始判断并添加附件，同时根据参数控制单个附件的扩展名和大小 
                if (!string.IsNullOrEmpty(fujian1.PostedFile.FileName))
                {
                    if (fujian1.PostedFile.ContentLength < 1024 * int.Parse(lblAttachSize.Text))
                    {
                        myMail.AddCustomAttachment(fujian1.FileName, fujian1.FileContent.ToString(), true);
                    }
                    else
                    {
                        mydb.Alert("邮件发送失败！附件(一)大小超出 " + lblAttachSize.Text + " KB的限制！");
                        return;
                    }
                }
                if (!string.IsNullOrEmpty(fujian2.PostedFile.FileName))
                {
                    if (fujian2.PostedFile.ContentLength < 1024 * int.Parse(lblAttachSize.Text))
                    {
                        myMail.AddCustomAttachment(fujian2.FileName, "Contents of file", true);
                    }
                    else
                    {
                        mydb.Alert("邮件发送失败！附件(二)大小超出 " + lblAttachSize.Text + " KB的限制！");
                        return;
                    }
                }
                if (!string.IsNullOrEmpty(fujian3.PostedFile.FileName))
                {
                    if (fujian3.PostedFile.ContentLength < 1024 * int.Parse(lblAttachSize.Text))
                    {
                        myMail.AddCustomAttachment(fujian3.FileName, "Contents of file", true);
                    }
                    else
                    {
                        mydb.Alert("邮件发送失败！附件(三)大小超出 " + lblAttachSize.Text + " KB的限制！");
                        return;
                    }
                }

                //声明邮件smtp地址、25端口 
                myMail.Send(lblSmtp.Text, false);
                myMail.Silent = true;
                myMail.ClearRecipients();
                //清除已发送的收信人 

                if ((myMail.Send(lblSmtp.Text, false) != true))
                {
                    //发邮件服务器 
                    mydb.Alert("邮件发送成功！");
                    sjr.Text = "";
                    cs.Text = "";
                    viewcs.Checked = false;
                    ms.Text = "";
                    viewms.Checked = false;
                    Subject.Text = "";
                    yxj.SelectedValue = "普通";
                    editor.Value = "";
                }
                else
                {
                    // mydb.Alert("连接网络超时，请重试！");
                }
            }
            catch (Exception JMailerror)
            {
                mydb.Alert(JMailerror.Message);
            }
        }

        //变更类型
        protected void Change_Click(object sender, EventArgs e)
        {
            if (inout.SelectedValue == "内部")
            {
                Server.Transfer("xyj.aspx");
            }
        }
    }
}
