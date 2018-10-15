using haoke365;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hksoft.app.task
{
    public partial class gzrz_a_show : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                hkdb.PassTo("10106", "0");
                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));             

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM HK_WDRC WHERE RCID='" + hkdb.GetStr(Request.QueryString["rcid"]) + "'");
                if (dr.Read())
                {
                    rzzt.Text = dr["rczt"].ToString();
                    //rcdd.Text = dr["rcdd"].ToString();
                    //rcfl.SelectedValue = dr["rcfl"].ToString();
                    //txtSdate.Text = string.Format("{0:d}", dr["kssj"]);
                    //ssf.SelectedValue = string.Format("{0:HH:mm:ss}", dr["kssj"]);
                    //txtEdate.Text = string.Format("{0:d}", dr["jssj"]);
                    //esf.SelectedValue = string.Format("{0:HH:mm:ss}", dr["jssj"]);
                    rzms.Text = dr["rcms"].ToString();
                    //zt.SelectedValue = dr["zt"].ToString();
                    //yxj.SelectedValue = dr["yxj"].ToString();
                    cjsj.Text = dr["cjsj"].ToString();
                    savefj.Text = dr["fjmc"].ToString();
                    //savelj.Text = dr["fjlj"].ToString();
                    savefj.NavigateUrl = (dr["fjlj"] == System.DBNull.Value ? "" : "../.." + dr["fjlj"].ToString()) + dr["fjmc"].ToString();

                    dr.Close();
                }
                else
                {
                    dr.Close();
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }
            }
        }
    }

}