using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Dwml_Mod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11302", "0");

                OperQx();

                if (!string.IsNullOrEmpty(Request.QueryString["id"].ToString()))
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HK_DWML WHERE ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        dwmc.Text = datar["dwmc"].ToString();
                        dwdz.Text = datar["dwdz"].ToString();
                        dwlx.Text = datar["dwlx"].ToString();
                        dwjb.Text = datar["dwjb"].ToString();
                        sjbm.Text = datar["sjbm"].ToString();
                        fzr.Text = datar["fzr"].ToString();
                        yzbm.Text = datar["yzbm"].ToString();
                        dwdh.Text = datar["dwdh"].ToString();
                        czhm.Text = datar["czhm"].ToString();
                        dzyj.Text = datar["dzyj"].ToString();
                        jdjs.Text = datar["jdjs"].ToString();
                        bz.Text = datar["bz"].ToString();
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

        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(SaveBtn, "11302m", Session["roleqx"].ToString());
            hkdb.QxValid(DelBtn, "11302d", Session["roleqx"].ToString());
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE HK_DWML SET dwmc='" + hkdb.GetStr(dwmc.Text) + "',dwdz='" + hkdb.GetStr(dwdz.Text) + "',dwlx='" + hkdb.GetStr(dwlx.Text) + "',dwjb='" + hkdb.GetStr(dwjb.Text) + "',sjbm='" + hkdb.GetStr(sjbm.Text) + "',fzr='" + hkdb.GetStr(fzr.Text) + "',yzbm='" + hkdb.GetStr(yzbm.Text) + "',dwdh='" + hkdb.GetStr(dwdh.Text) + "',czhm='" + hkdb.GetStr(czhm.Text) + "',dzyj='" + hkdb.GetStr(dzyj.Text) + "',jdjs='" + hkdb.GetStr(jdjs.Text) + "',bz='" + hkdb.GetStr(bz.Text) + "' WHERE ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            
            mydb.Alert_Refresh_Close("保存成功！","Dwml.aspx");
        }

        protected void Del_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"].ToString()))
            {
                SqlHelper.ExecuteSql("DELETE FROM HK_DWML WHERE ID IN('" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "')");

                mydb.Alert_Refresh_Close("删除成功！","Dwml.aspx");
            }
        }
    }
}
