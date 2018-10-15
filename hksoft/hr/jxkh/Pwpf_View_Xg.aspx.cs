using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Pwpf_View_Xg : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("81107", "0");

                if (!string.IsNullOrEmpty(Request.QueryString["mxid"]))
                {
                    SqlDataReader dr = SqlHelper.ExecuteReader("SELECT PWLX FROM HR_Kpdf_Pw WHERE PID='" + this.Session["userid"] + "'");
                    if (dr.Read())
                    {
                        lblpwlx.Text = dr["PWLX"].ToString();
                        dr.Close();
                    }
                    else
                    {
                        dr.Close();
                        mydb.Alert_Close("对不起，您并未被设定为评委，无法评分！");
                    }

                    SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT SJPF,PFBZ FROM HR_Kpdf_Kpxm04 WHERE ssmxid='" + hkdb.GetStr(Request.QueryString["mxid"]) + "' AND pfrid='" + this.Session["UserID"] + "'");
                    if (datar1.Read())
                    {
                        sjpf.Text = datar1["sjpf"].ToString();
                        //pfbz.Text = datar1["pfbz"].ToString();
                    }
                    datar1.Close();

                    sjpf.Focus();
                }
                else
                {
                    mydb.Alert_Close("数据检索错误，无法进行评分！");
                }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //判断分值是否超限
            double dbFz = Convert.ToDouble(SqlHelper.ExecuteScalar("SELECT FZ FROM HR_Kpdf_Kpxm02 WHERE MXID='" + hkdb.GetStr(Request.QueryString["mxid"].ToString()) + "'").ToString());
            if (Convert.ToDouble(sjpf.Text) > dbFz)
            {
                mydb.Alert("保存失败，您输入的分值已超出了此项的最大分值！");
                sjpf.Text = "";
                sjpf.Focus();
                return;
            }

            SaveBtn.Enabled = false;

            SqlHelper.ExecuteSql("UPDATE HR_Kpdf_Kpxm04 SET SJPF='" + hkdb.GetStr(sjpf.Text) + "',PFBZ='',XGPFSJ=GETDATE(),XGPFCS=XGPFCS+1 WHERE SSMXID='" + hkdb.GetStr(Request.QueryString["mxid"].ToString()) + "' AND PFRID='" + this.Session["userid"] + "'");

            mydb.Alert_Refresh_Close("保存成功！", "Pwpf_View_Add.aspx?kpid=" + Request.QueryString["kpid"].ToString() + "&bid=" + Request.QueryString["bid"].ToString() + "");
        }
    }
}
