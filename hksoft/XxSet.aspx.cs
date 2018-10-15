using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro
{
    public partial class XxSet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("1");

            if (!IsPostBack)
            {
                //获取当前消息设置 
                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT ynRemind,RemindTime,RemindSound,RemindMode FROM hk_MySet WHERE FK_uid='" + this.Session["userid"] + "'");
                if (datar.Read())
                {
                    ynRemind.SelectedValue = datar["ynRemind"].ToString();
                    RemindTime.SelectedValue = datar["RemindTime"].ToString();
                    RemindSound.SelectedValue = datar["RemindSound"].ToString();
                    RemindMode.SelectedValue = datar["RemindMode"].ToString();
                }
                datar.Close();
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE hk_MySet SET ynRemind = '" + ynRemind.SelectedValue + "',RemindTime = '" + RemindTime.SelectedValue + "',RemindSound = '" + RemindSound.SelectedValue + "',RemindMode = '" + RemindMode.SelectedValue + "' WHERE FK_uid='" + this.Session["userid"] + "'");
            mydb.Alert("保存成功！\\n注销并重新登录本系统后生效");
        }
    }
}
