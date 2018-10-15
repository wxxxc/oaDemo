using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.yhgl
{
    public partial class Dbsxfz_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("60306", "0");

                //公共信息
                if (this.Session["systype"].ToString() == "A")     //主登录页
                {
                    SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT xh FROM hk_Init WHERE produID='G'");
                    if (datar1.Read())
                    {
                        lx.Visible = true;
                    }
                    datar1.Close();
                }
                else  //子登录页
                {
                    if (this.Session["systype"].ToString() == "M")
                    {
                        lx.Visible = true;
                    }
                }

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HK_GROUPS WHERE GID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        gname.Text = datar["gname"].ToString();
                        gdesc.Text = datar["gdesc"].ToString();
                        datar.Close();

                        lx.Enabled = false;
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
                int newID = (Int32)SqlHelper.ExecuteScalar("INSERT INTO HK_GROUPS(GNAME,GTYPE,GDESC,CJR,CJSJ) VALUES('" + hkdb.GetStr(gname.Text) + "','" + lx.SelectedValue + "','" + hkdb.GetStr(gdesc.Text) + "','" + this.Session["userid"] + "',GETDATE())" + "SELECT CAST(scope_identity() AS int)");
                //日志
                mydb.InsertLog("新增待办事项分组【" + gname.Text + "】", "60306");
            }
            else
            {
                SqlHelper.ExecuteSql("UPDATE HK_GROUPS SET gname='" + hkdb.GetStr(gname.Text) + "',gdesc='" + hkdb.GetStr(gdesc.Text) + "',xgr='" + this.Session["userid"] + "',xgsj=GETDATE() WHERE GID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                //日志
                mydb.InsertLog("修改待办事项分组【" + gname.Text + "】", "60306");
            }

            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                Clear_Click();
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Dbsxfz.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！","Dbsxfz.aspx");
            }
        }

        //清空 
        protected void Clear_Click()
        {
            gname.Text = "";
            gdesc.Text = "";
        }

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            SqlHelper.ExecuteSql("DELETE FROM HK_GROUPS_TODO WHERE SSGID = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            SqlHelper.ExecuteSql("DELETE FROM HK_GROUPS_USER WHERE SSGID = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            SqlHelper.ExecuteSql("DELETE FROM HK_GROUPS WHERE GID = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            
            //日志
            mydb.InsertLog("删除待办事项分组【" + gname.Text + "】", "60306");
            mydb.Alert_Refresh_Close("删除成功！","Dbsxfz.aspx");
        }
    }
}
