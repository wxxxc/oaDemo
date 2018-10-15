using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Wdyjx_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10114", "0");

                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HK_WDYJ WHERE YJID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (datar.Read())
                {
                    lblyjbt.Text = datar["yjbt"].ToString();
                    lblnr.Text = datar["yjnr"].ToString();
                    lblfbsj.Text = string.Format("{0:d}", datar["fbsj"]);
                    lblfbrmc.Text = datar["fbrmc"].ToString();
                    hfnr.Text = datar["hfnr"].ToString();
                    Number.Text = datar["fjmc"].ToString();

                    if (datar["zt"].ToString() == "待回复")
                    {
                        SaveBtn.Visible = true;
                        hfnr.Enabled = true;
                    }
                    datar.Close();
                }
                else
                {
                    datar.Close();
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }

                bd.GetAtt(hkdb.GetStr(Number.Text), "p03", "portal/yjx", fujian);
            }
        }

        //回复 
        protected void Save_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE HK_WDYJ SET ZT='已回复',HFNR='" + hkdb.GetStr(hfnr.Text) + "',HFRID='" + this.Session["UserID"] + "',HFRMC='" + this.Session["UserName"] + "',HFSJ=GETDATE() WHERE YJID = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

            mydb.Alert_Refresh_Close("回复成功！","Wdyjx.aspx");
        }
    }
}
