using System;
using System.Web.UI;
using haoke365;

namespace hkpro.portal.xtgl
{
    public partial class Qcrz : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("60111", "60111");
            }
        }

        //登录日志
        protected void Del_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            SqlHelper.ExecuteSql("DELETE FROM HK_DLRZ WHERE DL_RQ>='" + hkdb.GetStr(txtSdate.Text) + "' AND DL_RQ<='" + hkdb.GetStr(txtEdate.Text) + "'");
            mydb.Alert("清除成功！");
        }

        //操作日志
        protected void DelCz_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            SqlHelper.ExecuteSql("DELETE FROM HK_SYSTEMLOG WHERE NOWTIME>='" + hkdb.GetStr(txtSdate.Text) + "' AND NOWTIME<='" + hkdb.GetStr(txtEdate.Text) + "'");
            mydb.Alert("清除成功！");
        }
    }
}
