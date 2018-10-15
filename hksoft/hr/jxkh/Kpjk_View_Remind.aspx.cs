using System;
using System.Collections;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Kpjk_View_Remind : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("81109", "0");

                //短信
                dxtx.Visible = Convert.ToBoolean(hkdb.VeriSms());

                lblcbry.Text = SqlHelper.ExecuteScalar("SELECT PWXM FROM HR_Kpdf_Pw WHERE PID='" + hkdb.GetStr(Request.QueryString["bid"]) + "'").ToString();

                txnr.Text = "关于【" + SqlHelper.ExecuteScalar("SELECT KPQS FROM HR_Kpdf_Kpxm01 WHERE KPID='" + hkdb.GetStr(Request.QueryString["kpid"]) + "'").ToString() + "】的绩效考评项目，请您尽快完成评分，谢谢！";
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //Msg 
            if (xxtx.Checked == true | dxtx.Checked == true)
            {
                hkdb.SendMsg(xxtx.Checked, dxtx.Checked, this.Session["userid"].ToString(), Request.QueryString["bid"].ToString(), hkdb.GetStr(txnr.Text));
            }

            mydb.Alert_Close("催办提醒成功！");
        }
    }
}
