using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class wdzs_Show : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10111", "0");

                SqlDataReader datar = SqlHelper.ExecuteReader("select *  from OA_KnowLedge where ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (datar.Read())
                {
                    LittleName.Text = datar["LittleName"].ToString();
                    TitleName.Text = datar["Title"].ToString();
                    Content.Text = datar["Content"].ToString();
                    AthourSay.Text = datar["AthourSay"].ToString();
                    KeyWord.Text = datar["KeyWord"].ToString();
                    UserName.Text = datar["QxYdRealname"].ToString();
                    Settime.Text = datar["Settime"].ToString();
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
