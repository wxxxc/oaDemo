using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.bmgl
{
    public partial class Zwwh_Mod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("60303", "0");

                OperQx();

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT ZWMC,ZWMS,GWZZ FROM ZW WHERE ZWID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        zwmc.Text = datar["zwmc"].ToString();
                        zwms.Text = datar["zwms"].ToString();
                        editor.Value = datar["gwzz"].ToString();
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
            hkdb.QxValid(DelBtn, "60303d", Session["roleqx"].ToString());
            hkdb.QxValid(SaveBtn, "60303m", Session["roleqx"].ToString());
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE ZW SET ZWMC='" + hkdb.GetStr(zwmc.Text) + "',ZWMS='" + hkdb.GetStr(zwms.Text) + "',GWZZ='" + editor.Value + "' WHERE ZWID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

            //日志
            mydb.InsertLog("修改职位【" + hkdb.GetStr(zwmc.Text) + "】", "60303");

            mydb.Alert_Refresh_Close("保存成功！","zwwh.aspx");
        }

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM YH WHERE UI_ZW='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'";
            if (bd.CheckRepeat(sql) == "true")
            {
                mydb.Alert("删除失败,此职位下已有用户信息！");
                return;
            }

            SqlHelper.ExecuteSql("DELETE FROM ZW WHERE ZWID ='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

            //日志
            mydb.InsertLog("删除职位【" + hkdb.GetStr(zwmc.Text) + "】", "60303");

            mydb.Alert_Refresh_Close("删除成功！","zwwh.aspx");
        } 
    }
}
