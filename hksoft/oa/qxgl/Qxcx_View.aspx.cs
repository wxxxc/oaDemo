using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.qxgl
{
    public partial class Qxcx_View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11724", "0");

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_QXDJ where djid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        bt.Text = datar["bt"].ToString();
                        kssj.Text = datar["kssj"].ToString();
                        jzsj.Text = datar["jzsj"].ToString();
                        UserName.Text = datar["wcrNames"].ToString();
                        lxff.Text = datar["lxff"].ToString();
                        sm.Text = datar["sm"].ToString();
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
    }
}
