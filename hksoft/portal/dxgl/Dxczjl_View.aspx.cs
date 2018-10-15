using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.portal.dxgl
{
    public partial class Dxczjl_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11004", "0");

                OperQx();

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT A.*,B.UI_DESC FROM HK_DXCZD A LEFT OUTER JOIN YH B ON (A.CZR=B.UI_ID) WHERE CZDH='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        zh.Text = datar["czzh"].ToString();
                        czje.Text = datar["czje"].ToString();
                        czsm.Text = datar["czsm"].ToString();
                        cz.Text = "充值人：" + datar["ui_desc"].ToString() + " 充值时间：" + string.Format("{0:d}", datar["czrq"]);
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
                    lbltitle.Text = "新增";
                }
            }
        }

        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(SaveBtn, "11004m", Session["roleqx"].ToString());
        }

        //保存 
        protected void Save_Click(object sender, EventArgs e)
        {
            if (lbltitle.Text == "新增")
            {
                SqlHelper.ExecuteSql("INSERT INTO HK_DXCZD(CZZH,CZJE,CZSM,CZR,CZRQ) VALUES('" + hkdb.GetStr(zh.Text) + "','" + hkdb.GetStr(czje.Text) + "','" + hkdb.GetStr(czsm.Text) + "','" + this.Session["userid"] + "',GETDATE())");
            }
            else
            {
                SqlHelper.ExecuteSql("UPDATE HK_DXCZD SET CZZH='" + hkdb.GetStr(zh.Text) + "',CZJE='" + hkdb.GetStr(czje.Text) + "',CZSM='" + hkdb.GetStr(czsm.Text) + "' WHERE CZDH='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            }

            mydb.Alert_Refresh_Close("保存成功！","Dxczjl.aspx");
        }
    }
}
