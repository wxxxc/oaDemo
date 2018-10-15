using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Qxwh_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Session判断
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                //模块权限
                hkdb.PassTo("11712", "0");

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT A.*,B.QY_QC,C.ROLE_NAME,D.ZWMC,E.BM_MC,F.* FROM YH A LEFT OUTER JOIN QY B ON(A.UI_SSGS=B.QY_ID) LEFT OUTER JOIN JS C ON(A.UI_ROLE=C.ROLE_ID) LEFT OUTER JOIN ZW D ON(UI_ZW=D.ZWID) LEFT OUTER JOIN BM E ON(A.UI_SSBM=E.BM_ID) LEFT OUTER JOIN OA_KQ_QX F ON(A.UI_ID=F.YHID) WHERE A.UI_ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        lblssgs.Text = datar["qy_qc"].ToString();
                        lblyhbm.Text = datar["ui_id"].ToString();
                        lblxm.Text = datar["ui_desc"].ToString();
                        lbljs.Text = datar["role_name"].ToString();
                        lblzt.Text = datar["ui_status"].ToString();
                        lblzw.Text = datar["zwmc"].ToString();
                        lblbm.Text = datar["bm_mc"].ToString();

                        kqid.Text = datar["kqid"].ToString();
                        ui_rzrq.Text = hkdb.GetDate(datar["ui_rzrq"].ToString());
                        kqspry1.Checked = hkdb.GetValueChk_Checked(datar["kqspry1"].ToString());
                        kqspry2.Checked = hkdb.GetValueChk_Checked(datar["kqspry2"].ToString());
                        kqspry3.Checked = hkdb.GetValueChk_Checked(datar["kqspry3"].ToString());
                        kqglry.Checked = hkdb.GetValueChk_Checked(datar["kqglry"].ToString());
                        tskqry.Checked = hkdb.GetValueChk_Checked(datar["tskqry"].ToString());
                        ynnjtj.Checked = hkdb.GetValueChk_Checked(datar["ynnjtj"].ToString());
                        datar.Close();
                    }
                    else
                    {
                        datar.Close();
                        mydb.Alert_Close("此记录不存在,可能已被删除！");
                    }
                }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string kqspry1Str = hkdb.GetValueChk_Str(kqspry1.Checked);
            string kqspry2Str = hkdb.GetValueChk_Str(kqspry2.Checked);
            string kqspry3Str = hkdb.GetValueChk_Str(kqspry3.Checked);
            string kqglryStr = hkdb.GetValueChk_Str(kqglry.Checked);
            string tskqryStr = hkdb.GetValueChk_Str(tskqry.Checked);
            string ynnjtjStr = hkdb.GetValueChk_Str(ynnjtj.Checked);

            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            //判断考勤ID(重复)
            string sql = "SELECT YHID FROM OA_KQ_QX WHERE KQID = '" + hkdb.GetStr(kqid.Text) + "' AND YHID<>'" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'";
            if (bd.CheckRepeat(sql) == "true")
            {
                mydb.Alert("该考勤ID已有员工使用，不能重复！");
                return;
            }

            SqlHelper.ExecuteSql("DELETE FROM OA_KQ_QX WHERE YHID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

            SqlHelper.ExecuteSql("INSERT INTO OA_KQ_QX(YHID,KQSPRY1,KQSPRY2,KQSPRY3,KQGLRY,KQID,TSKQRY,Ynnjtj) VALUES('" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "','" + kqspry1Str + "','" + kqspry2Str + "','" + kqspry3Str + "','" + kqglryStr + "','" + hkdb.GetStr(kqid.Text) + "','" + tskqryStr + "','" + ynnjtjStr + "')");

            SqlHelper.ExecuteSql("UPDATE YH SET UI_RZRQ='" + hkdb.GetStr(ui_rzrq.Text) + "' WHERE UI_ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

            mydb.Alert_Refresh_Close("保存成功！","Qxwh.aspx");
        }
    }
}
