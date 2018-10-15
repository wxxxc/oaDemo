using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro
{
    public partial class YxSet : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("1");

            if (!IsPostBack)
            {
                if (this.Session["systype"].ToString() == "G")
                {
                    p_gys.Visible = false;
                }

                SqlDataReader datar = SqlHelper.ExecuteReader("select mail_qc,mail_smtp,mail_dlyh,mail_dlmm,mail_port,mail_fsr from hk_MySet where fk_uid='" + this.Session["userid"] + "'");
                if (datar.Read())
                {
                    yxdz.Text = datar["mail_qc"].ToString();
                    smtp.Text = datar["mail_smtp"].ToString();
                    dlm.Text = datar["mail_dlyh"].ToString();
                    dlmm.Text = datar["mail_dlmm"].ToString();
                    port.Text = datar["mail_port"].ToString();
                    qm.Text = datar["mail_fsr"].ToString();
                }

                datar.Close();
            }
        }

        //保存 
        protected void Save_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("update hk_MySet set mail_qc='" + hkdb.GetStr(yxdz.Text) + "',mail_smtp='" + hkdb.GetStr(smtp.Text) + "',mail_dlyh='" + hkdb.GetStr(dlm.Text) + "',mail_dlmm='" + hkdb.GetStr(dlmm.Text) + "',mail_port='" + hkdb.GetStr(port.Text) + "',mail_fsr='" + hkdb.GetStr(qm.Text) + "' where fk_uid='" + this.Session["userid"] + "'");

            mydb.Alert("保存成功！");
        }
    }
}
