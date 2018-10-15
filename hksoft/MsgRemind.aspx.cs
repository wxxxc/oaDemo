using System;
using System.Data.SqlClient;
using haoke365;

namespace hksoft
{
    public partial class MsgRemind : System.Web.UI.Page
    {
        public static string RemTimeStr, ynRemindStr, RemSoundStr, RemindModeStr;
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("1");

            //消息提醒参数
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT ynRemind,RemindSound,RemindTime,RemindMode FROM hk_MySet WHERE FK_uid='" + this.Session["userid"] + "'");
            if (dr.Read())
            {
                ynRemindStr = dr["ynRemind"].ToString();
                RemSoundStr = dr["RemindSound"].ToString();
                RemTimeStr = dr["RemindTime"].ToString();
                RemindModeStr = dr["RemindMode"].ToString();
            }
            dr.Close();
        }
    }
}