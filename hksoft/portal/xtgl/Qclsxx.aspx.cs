using System;
using System.Web.UI;
using haoke365;

namespace hkpro.portal.xtgl
{
    public partial class Qclsxx : System.Web.UI.Page
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

        protected void Del_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            SqlHelper.ExecuteSql("DELETE FROM HK_MESS_JS WHERE ID IN (SELECT ID FROM HK_MESS_FS WHERE FSSJ>='" + hkdb.GetStr(txtSdate.Text) + "' AND FSSJ<'" + hkdb.GetStr(txtEdate.Text) + "')");
            SqlHelper.ExecuteSql("DELETE FROM HK_MESS_FS WHERE FSSJ>='" + hkdb.GetStr(txtSdate.Text) + "' AND FSSJ<'" + hkdb.GetStr(txtEdate.Text) + "'");

            mydb.Alert("清除成功！");
        }
    }
}
