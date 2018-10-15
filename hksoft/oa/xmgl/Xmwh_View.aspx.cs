using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.xmgl
{
    public partial class Xmwh_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11505", "0");

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";
                    SaveAddBtn.Visible = false;
                    if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                    {
                        SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_XMGL where xmid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                        if (datar.Read())
                        {
                            xmid.Text = datar["xmid"].ToString();
                            xmmc.Text = datar["xmmc"].ToString();
                            sssf.Text = datar["sssf"].ToString();
                            xmjd.SelectedValue = datar["xmjd"].ToString();
                            sscs.Text = datar["sscs"].ToString();
                            datar.Close();
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

        protected void Save_Click(object sender, EventArgs e)
        {
            if (lbltitle.Text == "新增")
            {
                int newID = (Int32)SqlHelper.ExecuteScalar("insert into OA_XMGL(xmmc,sssf,sscs,xmjd,cjr,cjsj) values('" + hkdb.GetStr(xmmc.Text) + "','" + hkdb.GetStr(sssf.Text) + "','" + hkdb.GetStr(sscs.Text) + "','" + xmjd.SelectedValue + "','" + this.Session["userid"] + "',GETDATE())" + "SELECT CAST(scope_identity() AS int)");
                xmid.Text = Convert.ToString(newID);

                //判断btn 
                Button btn = (Button)sender;
                string s = btn.ID;
                if (s == "SaveAddBtn")
                {
                    xmmc.Text = "";
                    sssf.Text = "";
                    xmjd.SelectedValue = "";
                    sscs.Text = "";
                    mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Xmwh.aspx");
                }
                else
                {
                    mydb.Alert_Refresh("保存成功！", "Xmwh.aspx");
                }
            }
            else
            {
                SqlHelper.ExecuteSql("update OA_XMGL set xmmc='" + hkdb.GetStr(xmmc.Text) + "', sssf='" + hkdb.GetStr(sssf.Text) + "', sscs='" + hkdb.GetStr(sscs.Text) + "', xmjd='" + xmjd.SelectedValue + "' where xmid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                mydb.Alert_Refresh("保存成功！", "Xmwh.aspx");
            }
        }
    }
}
