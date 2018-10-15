using System;
using System.Web.UI;
using haoke365;

namespace hkpro.portal.xxgl
{
    public partial class Xxx : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10101,1001", "0");

                BindAttr();
            }
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");
        }

        //发送 
        protected void Send_Click(object sender, EventArgs e)
        {
            string upstr = nr.Text.Replace("'", "''");
            SqlHelper.ExecuteSql("EXEC sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + hkdb.GetStr(UserID.Text).TrimEnd(',') + "','" + hkdb.GetStr(upstr) + "'");

            UserID.Text = "";
            UserName.Text = "";
            nr.Text = "";

            mydb.Alert("消息发送成功！");
        }
    }
}
