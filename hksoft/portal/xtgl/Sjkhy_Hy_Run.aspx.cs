using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.portal.xtgl
{
    public partial class Sjkhy_Hy_Run : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public static string sDbName, sDbUrl, sUrl, sUser, sPwd, sName;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            //加载提示
            mydb.PageWait();

            if (!IsPostBack)
            {
                hkdb.PassTo("60109", "60109");

                //Demo
                mydb.IsDemo_Stop();

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM hk_DbBackUp WHERE buID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        lbldb.Text = "【" + datar["dbname"].ToString() + "】";
                        sDbName = datar["dbname"].ToString();
                        lblrq.Text = "【" + datar["settimes"].ToString() + "】";
                        sDbUrl = datar["dburl"].ToString();
                        datar.Close();
                    }
                    else
                    {
                        datar.Close();
                        mydb.Alert_Close("此记录不存在,可能已被删除！");
                    }

                    //备份参数
                    SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_DbSet");
                    if (datar1.Read())
                    {
                        sUrl = datar1["DbUrl"].ToString();
                        sUser = datar1["DbUser"].ToString();
                        sPwd = datar1["DbPwd"].ToString();
                        sName = datar1["DbName"].ToString();
                    }
                    datar1.Close();
                }
            }
        }

        //确定
        protected void Save_Click(object sender, EventArgs e)
        {
            if (exepro() != true)
            {
                Response.Write("执行失败，请重试！");
            }
            else
            {
                SQLDMO.Restore oRestore = new SQLDMO.RestoreClass();
                SQLDMO.SQLServer oSQLServer = new SQLDMO.SQLServerClass();
                try
                {
                    oSQLServer.LoginSecure = false;
                    oSQLServer.Connect("" + sUrl + "", "" + sUser + "", "" + sPwd + "");
                    oRestore.Action = SQLDMO.SQLDMO_RESTORE_TYPE.SQLDMORestore_Database;
                    oRestore.Database = "" + sName + "";
                    oRestore.Files = sDbUrl;
                    oRestore.FileNumber = 1;
                    oRestore.ReplaceDatabase = true;
                    oRestore.SQLRestore(oSQLServer);

                    //因进程被kill重连db
                    SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["haokeConnectionString"].ConnectionString);
                    sqlConn.Open();

                    SqlCommand sqlComm = new SqlCommand("INSERT INTO hk_DbRecovery(DbName,DbUrl,UserID,UserName,SetTimes) VALUES('" + sDbName + "','" + sDbUrl + "','" + this.Session["userid"] + "','" + this.Session["username"] + "',GETDATE())", sqlConn);
                    sqlComm.CommandType = System.Data.CommandType.Text;
                    sqlComm.ExecuteNonQuery();

                    //日志
                    SqlCommand sqlComm2 = new SqlCommand("INSERT INTO hk_SystemLog(LogContent,ModuId,UserID,UserName,Nowtime,IPAddress,DeptID,DeptName,QxStr) VALUES('还原数据库【" + sDbName + "】','" + 60109 + "','" + this.Session["userid"] + "','" + this.Session["username"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + this.Session["deptid"] + "','" + this.Session["deptname"] + "','" + this.Session["deptqx"] + "')", sqlConn);
                    sqlComm2.CommandType = System.Data.CommandType.Text;
                    sqlComm2.ExecuteNonQuery();

                    sqlConn.Close();

                    mydb.Alert_Close("还原数据库成功！");
                }
                catch
                {
                    mydb.Alert("还原数据库失败，请重试！");
                }
                finally
                {
                    oSQLServer.DisConnect();
                }
            }
        }

        //判断数据库是否在用
        private bool exepro()
        {
            string sql = null;

            SqlConnection conn1 = new SqlConnection("server=" + sUrl + ";uid=" + sUser + ";pwd=" + sPwd + ";database=master");
            conn1.Open();

            //是否存在存储过程
            SqlCommand cmd1 = new SqlCommand("SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[killspid]') AND OBJECTPROPERTY(id, N'IsProcedure')=1", conn1);
            cmd1.CommandType = System.Data.CommandType.Text;
            SqlDataReader dr = cmd1.ExecuteReader();
            if (!dr.Read())
            {
                dr.Close();

                sql += "CREATE PROC [dbo].[killspid](@dbname VARCHAR(20)) AS ";
                sql += "BEGIN ";
                sql += "DECLARE @sql NVARCHAR(500) ";
                sql += "DECLARE @spid INT ";
                sql += "SET @sql = 'declare getspid cursor for select spid from sysprocesses where dbid=db_id('''+@dbname+''')' ";
                sql += "EXEC (@sql) ";
                sql += "OPEN getspid ";
                sql += "FETCH NEXT FROM getspid INTO @spid ";
                sql += "WHILE @@fetch_status <> -1 ";
                sql += "BEGIN ";
                sql += "EXEC('kill '+@spid) ";
                sql += "FETCH NEXT FROM getspid INTO @spid ";
                sql += "END ";
                sql += "CLOSE getspid ";
                sql += "DEALLOCATE getspid ";
                sql += "END";

                SqlCommand cmd2 = new SqlCommand(sql, conn1);
                cmd2.CommandType = System.Data.CommandType.Text;
                cmd2.ExecuteNonQuery();
            }
            else
            {
                dr.Close();
            }

            //执行
            SqlCommand cmd = new SqlCommand("killspid", conn1);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@dbname", SqlDbType.VarChar, 20);
            cmd.Parameters["@dbname"].Value = sName;

            try
            {
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
                return false;
            }
            finally
            {
                conn1.Close();
            }
        }

        //获取SQL服务器列表
        public ArrayList GetSqlServerList()
        {
            ArrayList list = new ArrayList();
            SQLDMO.Application sqlApp = new SQLDMO.Application();
            SQLDMO.NameList ServerName = sqlApp.ListAvailableSQLServers();
            for (int i = 0; i < ServerName.Count; i++)
            {
                list.Add(ServerName.Item(i + 1));
            }
            return list;
        }

        //获取指定SQL服务器的全部数据库列表
        public ArrayList GetDataBaseList(string ServerName, string UserName, string Pwd)
        {
            ArrayList list = new ArrayList();
            SQLDMO.SQLServer oServer = new SQLDMO.SQLServer();
            oServer.Connect(ServerName, UserName, Pwd);
            foreach (SQLDMO.Database db in oServer.Databases)
            {
                if ((db.Name != null) && (db.SystemObject == false))
                    list.Add(db.Name);
            }
            return list;
        }
    }
}
