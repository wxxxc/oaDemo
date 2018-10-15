using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Kqsmbg_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11732", "0");

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.* FROM OA_KQ_SM01 A WHERE SID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (dr.Read())
                    {
                        qdsj.Text = hkdb.GetDate(dr["qdsj"].ToString());
                        ynqd1.Checked = hkdb.GetValueChk_Checked(dr["ynqd1"].ToString());
                        ynqt1.Checked = hkdb.GetValueChk_Checked(dr["ynqt1"].ToString());
                        ynqd2.Checked = hkdb.GetValueChk_Checked(dr["ynqd2"].ToString());
                        ynqt2.Checked = hkdb.GetValueChk_Checked(dr["ynqt2"].ToString());
                        ynqd3.Checked = hkdb.GetValueChk_Checked(dr["ynqd3"].ToString());
                        ynqt3.Checked = hkdb.GetValueChk_Checked(dr["ynqt3"].ToString());
                        lblkqqksm.Text = dr["kqqksm"].ToString();
                        lblsqr.Text = dr["sqrmc"].ToString();
                        lblsqbmmc.Text = dr["sqbmmc"].ToString();
                        Number.Text = dr["smfj"].ToString();
                        bgyy.Text = dr["bgyy"].ToString();
                        lblsscs.Text = dr["sscs"].ToString();
                        dr.Close();

                        bd.GetAtt(Number.Text, "o3", "oa/kqsm", fujian);
                    }
                    else
                    {
                        dr.Close();
                        mydb.Alert_Close("此记录不存在,可能已被删除！");
                    }
                }
                else
                {
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }
            }
        }

        //确认变更 
        protected void Save_Click(object sender, EventArgs e)
        {
            if (ynqd1.Checked == false && ynqt1.Checked == false && ynqd2.Checked == false && ynqt2.Checked == false && ynqd3.Checked == false && ynqt3.Checked == false)
            {
                mydb.Alert("签到类型必须至少选择一项！");
                return;
            }

            SqlHelper.ExecuteSql("UPDATE OA_KQ_SM01 SET QDSJ='" + hkdb.GetStr(qdsj.Text) + "',YNQD1='" + hkdb.GetValueChk_Str(ynqd1.Checked) + "',YNQT1='" + hkdb.GetValueChk_Str(ynqt1.Checked) + "',YNQD2='" + hkdb.GetValueChk_Str(ynqd2.Checked) + "',YNQT2='" + hkdb.GetValueChk_Str(ynqt2.Checked) + "',YNQD3='" + hkdb.GetValueChk_Str(ynqd3.Checked) + "',YNQT3='" + hkdb.GetValueChk_Str(ynqt3.Checked) + "',BGYY='" + hkdb.GetStr(bgyy.Text) + "',bgr='" + this.Session["UserID"] + "',bgsj=GETDATE() WHERE SID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");

            mydb.Alert_Refresh_Close("保存成功！","Kqsmbg.aspx");
        }

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("DELETE FROM OA_KQ_SM02 WHERE SSSID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");

            SqlHelper.ExecuteSql("DELETE FROM OA_KQ_SM01 WHERE SID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");

            mydb.Alert_Refresh_Close("删除成功！","Kqsmbg.aspx");
        }
    }
}
