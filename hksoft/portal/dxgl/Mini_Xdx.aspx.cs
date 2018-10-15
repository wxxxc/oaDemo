using System;
using System.Collections;
using System.Data.SqlClient;
using System.Text;
using haoke365;

namespace hkpro.portal.dxgl
{
    public partial class Mini_Xdx : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10103", "10103");

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    jsr.Text = Request.QueryString["id"].ToString();
                }
            }
        }

        //发送
        protected void Send_Click(object sender, EventArgs e)
        {
            //短信内容
            string upstr = nr.Text.Replace("'", "''");

            //分割号码
            ArrayList arr = new ArrayList();
            string[] mystr = hkdb.GetStr(jsr.Text).Split(',');
            for (int s = 0; s < mystr.Length; s++)
            {
                int length = Encoding.Default.GetBytes(mystr[s]).Length;
                if (length == 11)
                {
                    //正常发送
                    SqlHelper.ExecuteSql("INSERT INTO TSMSSENDLOG(SSENDER,DBEGINTIME,NTIMINGTAG,DTIMINGTIME,SEXNO,SSENDNO,SSMSMESSAGE,SRECEIVE) VALUES('" + this.Session["userid"] + "',getdate(),0,getdate(),'','" + mystr[s] + "','" + upstr + "','群发短信')");
                }
                else
                {
                    //失败发送
                    SqlHelper.ExecuteSql("INSERT INTO TSMSSENDLOG(SSENDER,DBEGINTIME,NTIMINGTAG,DTIMINGTIME,SEXNO,SSENDNO,SSMSMESSAGE,SRECEIVE,nIsSend) VALUES('" + this.Session["userid"] + "',getdate(),0,getdate(),'','" + mystr[s] + "','" + upstr + "','群发短信','2')");
                }
            }
            
            mydb.Alert_Close("短信发送完成！");
        }
    }
}
