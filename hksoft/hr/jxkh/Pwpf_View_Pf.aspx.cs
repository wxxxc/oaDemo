using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Pwpf_View_Pf : System.Web.UI.Page
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

            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM HR_Kpdf_Kpxm02 WHERE MXID='" + hkdb.GetStr(Request.QueryString["mxid"].ToString()) + "'");
            if (dr.Read())
            {
                SaveBtn.Enabled = false;

                SqlDataReader dr2 = SqlHelper.ExecuteReader("SELECT * FROM HR_Kpdf_Kpxm04 WHERE SSMXID='" + dr["MXID"].ToString() + "' AND sskpid='" + dr["SSKPID"].ToString() + "' AND SSBID='" + dr["SSBID"].ToString() + "' AND SSXMID='" + dr["SSXMID"].ToString() + "' AND PFRID='" + this.Session["userid"] + "'");
                if (dr2.Read())
                {
                    dr.Close();
                    dr2.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.close();<" + "/script>");
                }
                else
                {
                    dr2.Close();
                    SqlHelper.ExecuteSql("INSERT INTO HR_Kpdf_Kpxm04(ssmxid,sskpid,ssbid,ssxmid,ssxmmc,sjxmid,sjxmmc,sjpf,pfbz,pfrid,pfrmc,pfsj,pwlx) VALUES('" + dr["MXID"].ToString() + "','" + dr["SSKPID"].ToString() + "','" + dr["SSBID"].ToString() + "','" + dr["SSXMID"].ToString() + "','" + dr["SSXMMC"].ToString() + "','" + dr["SJXMID"].ToString() + "','" + dr["SJXMMC"].ToString() + "','" + hkdb.GetStr(sjpf.Text) + "','','" + this.Session["userid"] + "','" + this.Session["username"] + "',GETDATE(),'" + lblpwlx.Text + "')");
                    dr.Close();

                    mydb.Alert_Refresh_Close("保存成功！", "Pwpf_View_Add.aspx?kpid=" + Request.QueryString["kpid"].ToString() + "&bid=" + Request.QueryString["bid"].ToString() + "");
                }
            }
        }
    }
}
