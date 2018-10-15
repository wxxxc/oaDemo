using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Kqspsm_Show : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                //dp绑定 
                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KQ_SPSM where smid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (datar.Read())
                {
                    smmc.Text = datar["smmc"].ToString();
                    smnr.Text = datar["smnr"].ToString();
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
