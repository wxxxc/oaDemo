using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.portal.xtgl
{
    public partial class Sjkbf_Bf : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public static string sSaveName, sDbUrl, sUrl, sUser, sPwd, sName;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            //加载提示
            mydb.PageWait();

            if (!IsPostBack)
            {
                hkdb.PassTo("60109", "0");

                //Demo
                mydb.IsDemo_Stop();

                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_DbSet");
                if (datar1.Read())
                {
                    sSaveName = datar1["SaveName"].ToString();
                    sDbUrl = "" + sSaveName + "_" + System.DateTime.Now.Year.ToString() + "_" + System.DateTime.Now.Month.ToString() + "_" + System.DateTime.Now.Day.ToString() + "";
                    dburl.Text = "" + datar1["SavePath"].ToString() + "" + sSaveName + "_" + System.DateTime.Now.Year.ToString() + "_" + System.DateTime.Now.Month.ToString() + "_" + System.DateTime.Now.Day.ToString() + "";

                    sUrl = datar1["DbUrl"].ToString();
                    sUser = datar1["DbUser"].ToString();
                    sPwd = datar1["DbPwd"].ToString();
                    sName = datar1["DbName"].ToString();
                }
                datar1.Close();
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //try
            //{
                SQLDMO.Backup backup = new SQLDMO.BackupClass();
                SQLDMO.SQLServer sqlserver = new SQLDMO.SQLServerClass();
                sqlserver.LoginSecure = false;
                sqlserver.Connect("" + sUrl + "", "" + sUser + "", "" + sPwd + "");    //连接
                backup.Action = SQLDMO.SQLDMO_BACKUP_TYPE.SQLDMOBackup_Database;
                backup.Database = "" + sName + "";                                        //数据库
                string str1 = this.dburl.Text;
                backup.Files = str1;                                                        //路径
                backup.BackupSetName = "" + sDbUrl + "";                                  //数据库名
                backup.BackupSetDescription = "数据库备份";
                backup.Initialize = true;
                backup.SQLBackup(sqlserver);

                SqlHelper.ExecuteSql("INSERT INTO hk_DbBackUp(DbName,DbUrl,UserID,UserName,SetTimes) VALUES('" + sDbUrl + "','" + hkdb.GetStr(dburl.Text) + "','" + this.Session["userid"] + "','" + this.Session["username"] + "',GETDATE())");

                //日志
                mydb.InsertLog("备份数据库【" + sDbUrl + "】", "60109");

                mydb.Alert_Refresh_Close("备份成功！","Sjkbf.aspx");
            //}
            //catch
            //{
            //    mydb.Alert("备份失败，请检查备份路径及相关参数后重试！");
            //}
        }
    }
}
