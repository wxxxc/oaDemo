using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.yhgl
{
    public partial class Wdyhqz_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10124", "0");

                BindAttr();

                //判断新增还是修改 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HK_QZDA WHERE QZID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        qzlx.SelectedValue = datar["qzlx"].ToString();
                        qzmc.Text = datar["qzmc"].ToString();
                        qzsm.Text = datar["qzsm"].ToString();
                        UserID.Text = datar["qzcyid"].ToString();
                        UserName.Text = datar["qzcymc"].ToString();
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
                    //新增页面 
                    lbltitle.Text = "新增";
                    SaveAddBtn.Visible = true;

                    //群组类型
                    SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT xh FROM hk_Init WHERE produID IN('O','E')");
                    if (datar1.Read())
                    {
                        qzlx.Enabled = true;
                    }
                    datar1.Close();
                }
            }
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (lbltitle.Text == "新增")
            {
                if (qzlx.SelectedValue != "通用群组")
                {
                    SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT qzid FROM HK_QZDA WHERE QZLX='" + qzlx.SelectedValue + "' AND CJR='" + this.Session["UserID"] + "'");
                    if (datar1.Read())
                    {
                        datar1.Close();

                        mydb.Alert("该群组类型已存在，不能重复添加！");
                        return;
                    }
                    datar1.Close();
                }

                SqlHelper.ExecuteSql("INSERT INTO HK_QZDA(QZMC,QZSM,QZCYID,QZCYMC,QZLX,CJR,CJSJ) VALUES('" + hkdb.GetStr(qzmc.Text) + "','" + hkdb.GetStr(qzsm.Text) + "','" + hkdb.GetStr(UserID.Text) + "','" + hkdb.GetStr(UserName.Text) + "','" + qzlx.SelectedValue + "','" + this.Session["userid"] + "',getdate())");
            }
            else
            {
                SqlHelper.ExecuteSql("UPDATE HK_QZDA SET qzmc='" + hkdb.GetStr(qzmc.Text) + "',qzsm='" + hkdb.GetStr(qzsm.Text) + "',qzcyid='" + hkdb.GetStr(UserID.Text) + "',qzcymc='" + hkdb.GetStr(UserName.Text) + "' WHERE QZID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            }

            //判断按钮 
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                Clear_Click();
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Wdyhqz.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！","Wdyhqz.aspx");
            }
        }

        //清空 
        protected void Clear_Click()
        {
            qzlx.SelectedValue = "通用群组";
            qzmc.Text = "";
            qzsm.Text = "";
            UserID.Text = "";
            UserName.Text = "";
        }
    }
}
