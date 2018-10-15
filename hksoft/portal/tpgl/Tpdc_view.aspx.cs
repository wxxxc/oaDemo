using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.portal.tpgl
{
    public partial class Tpdc_view : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11306", "0");

                //类型
                if (this.Session["systype"].ToString() == "A")     //主登录页
                {
                    SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT xh FROM hk_Init WHERE produID IN('M','V','F')");
                    if (datar1.Read())
                    {
                        lx.Visible = true;
                    }
                    datar1.Close();
                }
                else  //子登录页
                {
                    if (this.Session["systype"].ToString() == "M" | this.Session["systype"].ToString() == "V" | this.Session["systype"].ToString() == "F")
                    {
                        lx.Visible = true;
                    }
                }

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HK_POLL_PROJECT WHERE ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        xmmc.Text = datar["ProjectName"].ToString();
                        sm.Text = datar["ProjectCom"].ToString();
                        lx.SelectedValue = datar["ProjectType"].ToString();
                        datar.Close();
                        //Init 
                        SetBtn.Visible = true;
                        lx.Enabled = false;
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
                }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (lbltitle.Text == "新增")
            {
                SqlHelper.ExecuteScalar("INSERT INTO HK_POLL_PROJECT(PROJECTNAME,PROJECTTYPE,PROJECTCOM,CJR,CJSJ) VALUES('" + hkdb.GetStr(xmmc.Text) + "','" + lx.SelectedValue + "','" + hkdb.GetStr(sm.Text) + "','" + this.Session["userid"] + "',GETDATE())");
            }
            else
            {
                SqlHelper.ExecuteSql("UPDATE HK_POLL_PROJECT SET ProjectName='" + hkdb.GetStr(xmmc.Text) + "',ProjectType='" + lx.SelectedValue + "',ProjectCom='" + hkdb.GetStr(sm.Text) + "' WHERE ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            }

            mydb.Alert_Refresh_Close("保存成功！","Tpdc.aspx");
        }

        //置为有效 
        protected void Set_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE HK_POLL_PROJECT SET PROJECTTAG='0' WHERE PROJECTTYPE = (SELECT PROJECTTYPE FROM HK_POLL_PROJECT WHERE ID = " + hkdb.GetStr(Request.QueryString["id"].ToString()) + ")");
            SqlHelper.ExecuteSql("UPDATE HK_POLL_PROJECT SET PROJECTTAG='1' WHERE ID=" + hkdb.GetStr(Request.QueryString["id"].ToString()));

            mydb.Alert_Refresh_Close("项目生效成功！","Tpdc.aspx");
        }

    }
}
