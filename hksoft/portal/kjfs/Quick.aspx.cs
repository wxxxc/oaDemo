using System;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.kjfs
{
    public partial class Quick : System.Web.UI.Page
    {
        BindData bd = new BindData();
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                string sql = "SELECT * FROM HK_QUICK WHERE CJR='" + this.Session["userid"] + "' AND QJQM<>'" + Dns.GetHostName() + "'";
                if (bd.CheckRepeat(sql) == "true")
                {
                    mydb.Alert("提醒：下列快捷方式中有部分可能不是在这台电脑上创建的！！！如出现不能正常使用的快捷方式，请参照屏幕下方的步骤提示按顺序执行即可。");
                    //return;
                }
            }

            GridViewBind();
        }

        public void GridViewBind()
        {
            SqlDataSource1.SelectCommand = "";
            SqlDataSource1.SelectCommand = "SELECT *,(CASE WHEN QLB='2' THEN QCS+':' ELSE QLJ END)AS LINK,(CASE WHEN QLB='2' THEN '_self' ELSE '_blank' END)AS TAR FROM HK_QUICK WHERE CJR='" + this.Session["userid"] + "' OR QLX='Y' ORDER BY QLB,QLX DESC";
            SqlDataSource1.DeleteCommand = "";
            SqlDataSource1.DeleteCommand = "DELETE FROM HK_QUICK WHERE qid=@qid AND QLX='N'";
        }

        //生成注册文件
        protected void Reg_Click(object sender, EventArgs e)
        {
            string UserName = this.Session["userid"].ToString();

            if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\Attach\\portal\\quick\\" + UserName))))
            {
                System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\Attach\\portal\\quick\\" + UserName)));
            }

            if (!File.Exists(Server.MapPath("..\\..\\Attach\\portal\\quick\\" + UserName + "\\wit_quick.reg")))
            {
                FileStream NewText = default(FileStream);
                NewText = File.Create(Server.MapPath("..\\..\\Attach\\portal\\quick\\" + UserName + "\\wit_quick.reg"));
                NewText.Close();
            }

            string StrTxt = "Windows Registry Editor Version 5.00" + "\r\n" + "\r\n";
            SqlDataReader datar = SqlHelper.ExecuteReader("SELECT QCS,QLJ FROM HK_QUICK WHERE (CJR='" + UserName + "' OR QLX='Y')  AND QLB='2'");
            while (datar.Read())
            {
                StrTxt = StrTxt + "[HKEY_LOCAL_MACHINE\\SOFTWARE\\Classes\\" + datar["qcs"] + "]" + "\r\n";
                StrTxt = StrTxt + "@='" + datar["qcs"] + "'" + "\r\n";
                StrTxt = StrTxt + "'URL Protocol'='" + datar["qlj"] + "'" + "\r\n";
                StrTxt = StrTxt + "[HKEY_LOCAL_MACHINE\\SOFTWARE\\Classes\\" + datar["qcs"] + "\\Shell]" + "\r\n";
                StrTxt = StrTxt + "[HKEY_LOCAL_MACHINE\\SOFTWARE\\Classes\\" + datar["qcs"] + "\\Shell\\open]" + "\r\n";
                StrTxt = StrTxt + "[HKEY_LOCAL_MACHINE\\SOFTWARE\\Classes\\" + datar["qcs"] + "\\Shell\\open\\command]" + "\r\n";
                StrTxt = StrTxt + "@='" + datar["qlj"] + "'" + "\r\n" + "\r\n";
            }
            datar.Close();

            string upstr = StrTxt.Replace("'", "\"");
            StreamWriter WriteStream = default(StreamWriter);
            WriteStream = new StreamWriter(Server.MapPath("..\\..\\Attach\\portal\\quick\\" + UserName + "\\wit_quick.reg"));
            WriteStream.WriteLine(upstr);
            WriteStream.Close();

            downfj.Visible = true;
            downfj.NavigateUrl = "..\\..\\Attach\\portal\\quick\\" + UserName + "\\wit_quick.reg";
            mydb.Alert("注册文件已成功生成！请直接运行注册文件，或者下载到本地后手工执行导入注册表！");
        }

        protected void Item_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}
