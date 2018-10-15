using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.bmgl
{
    public partial class Qyda_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("60308", "0");

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM QY WHERE QY_ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        gsbm.Text = datar["qy_id"].ToString();
                        gsmc.Text = datar["qy_qc"].ToString();
                        gsjc.Text = datar["qy_jc"].ToString();
                        gsdh.Text = datar["qy_dh"].ToString();
                        gscz.Text = datar["qy_cz"].ToString();
                        gsdz.Text = datar["qy_dz"].ToString();
                        yzbm.Text = datar["qy_yzbm"].ToString();
                        mail.Text = datar["qy_mail"].ToString();
                        //khyh.Text = datar["qy_khyh"].ToString();
                        //yhzh.Text = datar["qy_yhzh"].ToString();
                        bz.Text = datar["qy_bz"].ToString();
                        datar.Close();

                        gsbm.ReadOnly = true;
                        //Init 
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
                int i = Convert.ToInt32(SqlHelper.ExecuteScalar("SELECT 1 FROM QY WHERE QY_ID='" + hkdb.GetStr(gsbm.Text) + "'"));
                if (i == 1)
                {
                    mydb.Alert("此单位编码已存在，请重试！");
                    return;
                }
                else
                {
                    //SqlHelper.ExecuteSql("INSERT INTO QY(QY_ID,QY_QC,QY_JC,QY_DZ,QY_YZBM,QY_DH,QY_CZ,QY_MAIL,QY_KHYH,QY_YHZH,QY_BZ,QY_PP) VALUES('" + hkdb.GetStr(gsbm.Text) + "','" + hkdb.GetStr(gsmc.Text) + "','" + hkdb.GetStr(gsjc.Text) + "','" + hkdb.GetStr(gsdz.Text) + "','" + hkdb.GetStr(yzbm.Text) + "','" + hkdb.GetStr(gsdh.Text) + "','" + hkdb.GetStr(gscz.Text) + "','" + hkdb.GetStr(mail.Text) + "','" + hkdb.GetStr(khyh.Text) + "','" + hkdb.GetStr(yhzh.Text) + "','" + hkdb.GetStr(bz.Text) + "','')");
                    SqlHelper.ExecuteSql("INSERT INTO QY(QY_ID,QY_QC,QY_JC,QY_DZ,QY_YZBM,QY_DH,QY_CZ,QY_MAIL,QY_KHYH,QY_YHZH,QY_BZ,QY_PP) VALUES('" + hkdb.GetStr(gsbm.Text) + "','" + hkdb.GetStr(gsmc.Text) + "','" + hkdb.GetStr(gsjc.Text) + "','" + hkdb.GetStr(gsdz.Text) + "','" + hkdb.GetStr(yzbm.Text) + "','" + hkdb.GetStr(gsdh.Text) + "','" + hkdb.GetStr(gscz.Text) + "','" + hkdb.GetStr(mail.Text)  + "','" + hkdb.GetStr(bz.Text) + "','')");
                }
            }
            else
            {
                //SqlHelper.ExecuteSql("UPDATE QY SET QY_ID='" + hkdb.GetStr(gsbm.Text) + "',QY_QC='" + hkdb.GetStr(gsmc.Text) + "',QY_JC='" + hkdb.GetStr(gsjc.Text) + "',QY_DZ='" + hkdb.GetStr(gsdz.Text) + "',qy_yzbm='" + hkdb.GetStr(yzbm.Text) + "',qy_dh='" + hkdb.GetStr(gsdh.Text) + "',qy_cz='" + hkdb.GetStr(gscz.Text) + "',qy_mail='" + hkdb.GetStr(mail.Text) + "',qy_khyh='" + hkdb.GetStr(khyh.Text) + "',qy_yhzh='" + hkdb.GetStr(yhzh.Text) + "',qy_bz='" + hkdb.GetStr(bz.Text) + "' WHERE QY_ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                SqlHelper.ExecuteSql("UPDATE QY SET QY_ID='" + hkdb.GetStr(gsbm.Text) + "',QY_QC='" + hkdb.GetStr(gsmc.Text) + "',QY_JC='" + hkdb.GetStr(gsjc.Text) + "',QY_DZ='" + hkdb.GetStr(gsdz.Text) + "',qy_yzbm='" + hkdb.GetStr(yzbm.Text) + "',qy_dh='" + hkdb.GetStr(gsdh.Text) + "',qy_cz='" + hkdb.GetStr(gscz.Text) + "',qy_mail='" + hkdb.GetStr(mail.Text) + "',qy_bz='" + hkdb.GetStr(bz.Text) + "' WHERE QY_ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            }

            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                Clear_Click();
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Qyda.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！","Qyda.aspx");
            }
        }

        //清空 
        protected void Clear_Click()
        {
            gsbm.Text = "";
            gsjc.Text = "";
            gsmc.Text = "";
            gsdz.Text = "";
            yzbm.Text = "";
            gsdh.Text = "";
            gscz.Text = "";
            mail.Text = "";
            //yhzh.Text = "";
            //khyh.Text = "";
            bz.Text = "";
        }

        protected void Del_Click(object sender, EventArgs e)
        {
            //int str2 = Convert.ToInt32(SqlHelper.ExecuteScalar("select 1 from fc_lp where ssgs='" + hkdb.GetStr() + "'"));
            //if (str2 == 1)
            //{Request.QueryString["id"].ToString()
            //    mydb.Alert("删除失败,当前子公司下已存在楼盘信息！");
            //}
            //else
            //{
            int str3 = Convert.ToInt32(SqlHelper.ExecuteScalar("SELECT 1 FROM YH WHERE UI_SSGS='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'"));
            if (str3 == 1)
            {
                mydb.Alert("删除失败,当前子单位下已存在用户信息！");
            }
            else
            {
                SqlHelper.ExecuteSql("DELETE FROM QY WHERE QY_ID ='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                mydb.Alert_Refresh_Close("删除成功！","Qyda.aspx");
            }
            //}
        }
    }
}
