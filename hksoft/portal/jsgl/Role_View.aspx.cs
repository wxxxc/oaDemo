using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.jsgl
{
    public partial class Role_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("60302", "0");

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    if (Request.QueryString["id"].ToString() == "1")
                    {
                        mydb.Alert_Close("为避免误操作，系统将不允许修改【超级管理员】角色！");
                    }

                    lbltitle.Text = "修改";
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT ROLE_NAME,ROLE_COMM FROM JS WHERE ROLE_ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        jsmc.Text = datar["role_name"].ToString();
                        bz.Text = datar["role_comm"].ToString();
                        datar.Close();

                        DelBtn.Visible = true;
                    }
                    else
                    {
                        datar.Close();
                        mydb.Alert_Close("此记录不存在,可能已被删除！");
                    }
                }
                else
                {
                    lbltitle.Text = "新增";
                    SaveAddBtn.Visible = true;
                }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (lbltitle.Text == "新增")
            {
                //名称判断（包含）
                if (bd.CheckRepeat("SELECT ROLE_NAME FROM JS WHERE CHARINDEX('" + hkdb.GetStr(jsmc.Text) + "',role_name)>0") == "true")
                {
                    mydb.Alert("保存失败，该角色名称与系统中已有的角色名称存在包含关系！请重新输入");
                    return;
                }
                
                int newID = (Int32)SqlHelper.ExecuteScalar("INSERT INTO JS(ROLE_NAME,ROLE_LX,ROLE_COMM,CJR,CJSJ) VALUES('" + hkdb.GetStr(jsmc.Text) + "','企业','" + hkdb.GetStr(bz.Text) + "','" + this.Session["userid"] + "',GETDATE())" + "SELECT CAST(scope_identity() AS int)");
                //日志
                mydb.InsertLog("新增角色【" + hkdb.GetStr(jsmc.Text) + "】", "60302");
            }
            else
            {
                //名称判断（包含）
                if (bd.CheckRepeat("SELECT ROLE_NAME FROM JS WHERE CHARINDEX('" + hkdb.GetStr(jsmc.Text) + "',role_name)>0 AND ROLE_ID<>'" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'") == "true")
                {
                    mydb.Alert("保存失败，该角色名称与系统中已有的角色名称存在包含关系！请重新输入");
                    return;
                }

                SqlHelper.ExecuteSql("UPDATE JS SET ROLE_NAME='" + hkdb.GetStr(jsmc.Text) + "',ROLE_COMM='" + hkdb.GetStr(bz.Text) + "' WHERE ROLE_ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                //日志
                mydb.InsertLog("修改角色【" + hkdb.GetStr(jsmc.Text) + "】", "60302");
            }

            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                Clear_Click();
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Role.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！","Role.aspx");
            }
        }

        //清空 
        protected void Clear_Click()
        {
            jsmc.Text = "";
            bz.Text = "";
        }

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            string sql = "SELECT UI_ID FROM YH WHERE UI_ROLE='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'";
            if (bd.CheckRepeat(sql) == "true")
            {
                mydb.Alert("删除失败,该角色下已存在用户！");
                return;
            }

            SqlHelper.ExecuteSql("DELETE FROM YH_JS WHERE ROLE_ID = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            SqlHelper.ExecuteSql("DELETE FROM QX WHERE ROLE_ID = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            SqlHelper.ExecuteSql("DELETE FROM JS WHERE ROLE_ID = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            
            //日志
            mydb.InsertLog("删除角色【" + hkdb.GetStr(jsmc.Text) + "】", "60302");
            mydb.Alert_Refresh_Close("删除成功！","Role.aspx");
        }
    }
}
