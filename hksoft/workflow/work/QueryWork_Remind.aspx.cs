using System;
using System.Collections;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class QueryWork_Remind : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                //短信
                dxtx.Visible = Convert.ToBoolean(hkdb.VeriSms());

                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_Work WHERE wID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (datar1.Read())
                {
                    mscContent.Text = "请尽快审批办理【" + datar1["wTitle"].ToString() + "】,催办人：" + this.Session["username"].ToString() + "";
                    wUserIDs.Text = datar1["wUserIDs"].ToString();
                    wUserNames.Text = datar1["wUserNames"].ToString();
                }
                datar1.Close();

                wUserIDs.Attributes.Add("readonly", "readonly");
            }
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            string strlist = null;
            string str1 = null;
            str1 = "" + wUserIDs.Text + "";
            ArrayList myarr = new ArrayList();
            string[] mystr = str1.Split(',');
            for (int s = 0; s < mystr.Length; s++)
            {
                strlist += "'" + mystr[s] + "',";
            }
            strlist += "'0'";

            //Msg 
            if (xxtx.Checked == true | dxtx.Checked == true)
            {
                SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT * FROM yh WHERE ui_id IN (" + strlist + ")");
                while (datar2.Read())
                {
                    hkdb.SendMsg(xxtx.Checked, dxtx.Checked, this.Session["userid"].ToString(), datar2["ui_id"].ToString(), mscContent.Text);
                }
                datar2.Close();
            }

            mydb.Alert_Close("催办成功！");
        }
    }
}
