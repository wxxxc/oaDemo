using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Pwwh_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object Sender, EventArgs E)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("81104", "0");

                BindAttr();

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";

                    if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                    {
                        SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HR_Kpdf_Pw WHERE PID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                        if (datar.Read())
                        {
                            pid.Text = datar["pid"].ToString();
                            pwxm.Text = datar["pwxm"].ToString();
                            pwlx.SelectedValue = datar["pwlx"].ToString();
                            bz.Text = datar["pwbz"].ToString();
                            datar.Close();

                            //Init
                            DelBtn.Visible = true;
                            SaveAddBtn.Visible = false;
                            img1.Visible = false;
                            pwlx.Enabled = false;
                        }
                        else
                        {
                            datar.Close();
                            mydb.Alert_Close("此记录不存在,可能已被删除！");
                        }
                    }
                }
                else
                {
                    lbltitle.Text = "新增";
                    SaveAddBtn.Visible = true;
                }
            }
        }

        public void BindAttr()
        {
            pwxm.Attributes.Add("readonly", "readonly");
        }

        public void Save_Click(object Sender, EventArgs E)
        {
            if (lbltitle.Text == "新增")
            {
                //编码判断（重复）
                if (bd.CheckRepeat("SELECT pid FROM HR_Kpdf_Pw WHERE pid='" + hkdb.GetStr(pid.Text) + "'") == "true")
                {
                    mydb.Alert("保存失败,此编码已经存在！");
                    return;
                }

                SqlHelper.ExecuteScalar("INSERT INTO HR_Kpdf_Pw(pid,pwxm,pwlx,pwbz,cxmy,cjr,cjsj) VALUES"
                    + "('" + hkdb.GetStr(pid.Text) + "','" + hkdb.GetStr(pwxm.Text) + "','" + pwlx.SelectedValue + "','" + hkdb.GetStr(bz.Text) + "','E10ADC3949BA59ABBE56E057F20F883E','" + this.Session["userid"] + "',GETDATE())");

                //判断btn 
                Button btn = (Button)Sender;
                string s = btn.ID;
                if (s == "SaveAddBtn")
                {
                    Clear_Click();
                    mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Pwwh.aspx");
                }
                else
                {
                    mydb.Alert_Refresh("保存成功！", "Pwwh.aspx");
                }
            }
            else
            {
                //判断该评委名下是否存在未结束的考评项目
                string sql1 = "SELECT KPID FROM HR_Kpdf_Kpxm01 WHERE CHARINDEX('" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "',CypwIDs)>0 AND KPZT<>'已结束'";
                if (bd.CheckRepeat(sql1) == "true")
                {
                    mydb.Alert("保存失败，该评委参与的考评项目中，存在未结束的记录！");
                    return;
                }

                SqlHelper.ExecuteSql("UPDATE HR_Kpdf_Pw SET pwlx='" + pwlx.SelectedValue + "',pwbz='" + hkdb.GetStr(bz.Text) + "',xgr='" + this.Session["userid"] + "',xgsj=GETDATE() WHERE pid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

                mydb.Alert_Refresh("保存成功！", "Pwwh.aspx");
            }
        }

        //清空 
        public void Clear_Click()
        {
            pid.Text = "";
            pwxm.Text = "";
            pwlx.SelectedValue = "";
            bz.Text = "";
        }

        //删除 
        public void Del_Click(object Sender, EventArgs E)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            string sql1 = "SELECT * FROM HR_Kpdf_Kpxm01 WHERE CHARINDEX('" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "',CypwIDs)>0 ";
            if (bd.CheckRepeat(sql1) == "true")
            {
                mydb.Alert("删除失败,在考评项目中已存在此评委！");
                return;
            }

            string sql2 = "SELECT * FROM HR_Kpdf_Kpxm04 WHERE PFRID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'";
            if (bd.CheckRepeat(sql2) == "true")
            {
                mydb.Alert("删除失败,该评委名下已存在历史评分记录！");
                return;
            }

            SqlHelper.ExecuteSql("DELETE FROM HR_Kpdf_Pw WHERE pid = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

            mydb.Alert_Refresh_Close("删除成功！", "Pwwh.aspx");
        } 
    }
}
