using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.xwgl
{
    public partial class xwcx_view1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));

                SqlDataReader datar = SqlHelper.ExecuteReader("select a.*,b.flmc from OA_XWNR a,oa_xwfl b where a.fl=b.flid and xwid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (datar.Read())
                {
                    lblxwbt.Text = datar["xwbt"].ToString();
                    lblxwzy.Text = datar["xwzy"].ToString();
                    lblxwly.Text = datar["xwly"].ToString();
                    lblxwfl.Text = datar["flmc"].ToString();
                    lblxwzz.Text = datar["xwzz"].ToString();
                    lblnr.Text = datar["xwnr"].ToString();
                    lblxwsj.Text = hkdb.GetDate(datar["xwsj"].ToString());
                    savefj.Text = datar["fjmc"].ToString();
                    savelj.Text = datar["fjlj"].ToString();
                    savefj.NavigateUrl = (datar["fjlj"] == System.DBNull.Value ? "" : "../.." + datar["fjlj"].ToString()) + datar["fjmc"].ToString();

                    datar.Close();
                }
                else
                {
                    datar.Close();
                    mydb.Alert("此记录不存在,可能已被删除！");
                }
            }
        }
    }
}
