using System;
using System.Data.SqlClient;
using System.Net;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.kjfs
{
    public partial class Quick_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                DropDownListBind();

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HK_QUICK WHERE QID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        mc.Text = datar["qmc"].ToString();
                        tb.SelectedValue = datar["qtb"].ToString();
                        fj.Text = (datar["qlj"] == System.DBNull.Value ? "" : datar["qlj"].ToString()).Replace("\\" + "\\", "\\");
                        Image1.ImageUrl = "..\\..\\attach\\portal\\quick\\" + tb.SelectedValue;
                        qlb.SelectedValue = datar["qlb"].ToString();

                        //公共快捷方式
                        if (datar["qlx"].ToString() == "Y")
                        {
                            SaveBtn.Visible = false;
                        }
                        datar.Close();
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
                    Image1.ImageUrl = "..\\..\\attach\\portal\\quick\\null.gif";
                }
            }
        }

        public void DropDownListBind()
        {
            string sql = "SELECT TBLJ,TBMC FROM HK_KJTB ORDER BY TBMC";
            bd.Bind_DropDownList(tb, sql, "tblj", "tbmc", "null.gif", "缺省图标");
        }

        protected void View_Pic(object sender, EventArgs e)
        {
            Image1.ImageUrl = "..\\..\\attach\\portal\\quick\\" + tb.SelectedValue;
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string FileName = "";
            if (lbltitle.Text == "新增")
            {
                if (qlb.SelectedValue == "2")
                {
                    string fjtype1 = fj.Text.Substring((fj.Text.LastIndexOf(".") + 1));
                    if (fjtype1 == "exe" | fjtype1 == "EXE" | fjtype1 == "Exe")
                    {
                        FileName = (fj.Text).Replace("\\", "\\" + "\\");

                        int newID = (Int32)SqlHelper.ExecuteScalar("INSERT INTO HK_QUICK(QMC,QLJ,QTB,QJQM,CJR,CJSJ,QLX,QLB) VALUES('" + hkdb.GetStr(mc.Text) + "','" + FileName + "','" + tb.SelectedValue + "','" + Dns.GetHostName() + "','" + this.Session["userid"].ToString() + "',GETDATE(),'N','" + qlb.SelectedValue + "')" + "SELECT CAST(scope_identity() AS int)");

                        string csStr = "wit." + this.Session["userid"].ToString() + "." + newID;
                        SqlHelper.ExecuteSql("UPDATE HK_QUICK SET QCS='" + csStr + "' WHERE QID=" + newID + "");
                    }
                    else
                    {
                        mydb.Alert("必须录入扩展名为.exe的可执行文件！");
                        return;
                    }
                }
                else
                {
                    
                    SqlHelper.ExecuteSql("INSERT INTO HK_QUICK(QMC,QLJ,QTB,QJQM,CJR,CJSJ,QLX,QLB) VALUES('" + hkdb.GetStr(mc.Text) + "','" + hkdb.GetStr(fj.Text) + "','" + tb.SelectedValue + "','" + Dns.GetHostName() + "','" + this.Session["userid"].ToString() + "',GETDATE(),'N','" + qlb.SelectedValue + "')");
                }
            }
            else
            {
                if (qlb.SelectedValue == "2")
                {
                    string fjtype1 = fj.Text.Substring((fj.Text.LastIndexOf(".") + 1));
                    if (fjtype1 == "exe" | fjtype1 == "EXE" | fjtype1 == "Exe")
                    {
                        FileName = (fj.Text).Replace("\\", "\\" + "\\");

                        SqlHelper.ExecuteSql("UPDATE HK_QUICK SET QMC='" + hkdb.GetStr(mc.Text) + "',QLJ='" + FileName + "',QTB='" + tb.SelectedValue + "',QJQM='" + Dns.GetHostName() + "',CJSJ=GETDATE(),QLB='" + qlb.SelectedValue + "' WHERE QID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    }
                    else
                    {
                        mydb.Alert("必须录入扩展名为.exe的可执行文件！");
                        return;
                    }
                }
                else
                {
                    
                    SqlHelper.ExecuteSql("UPDATE HK_QUICK SET QMC='" + hkdb.GetStr(mc.Text) + "',QLJ='" + hkdb.GetStr(fj.Text) + "',QTB='" + tb.SelectedValue + "',QJQM='" + Dns.GetHostName() + "',CJSJ=GETDATE(),QLB='" + qlb.SelectedValue + "' WHERE QID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                }
            }

            //判断点击的按钮id 
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                Clear_Click();
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Quick.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！","Quick.aspx");
            }
        }

        //清空 
        protected void Clear_Click()
        {
            mc.Text = "";
            fj.Text = "";
        }
    }
}
