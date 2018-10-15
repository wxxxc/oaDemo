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
    public partial class gzrzyl_a_show : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                hkdb.PassTo("10120", "10120");

                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));

                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT b.ui_desc as ui_desc,a.cjsj as cjsj,c.bm_mc as bm_mc,d.zwmc as zwmc,a.rczt as rczt,a.rcms as rcms,a.fjmc as fjmc,a.fjlj as fjlj from hk_Wdrc a left join yh b on a.syz=b.ui_id left join BM c on b.ui_ssbm=c.bm_id left join ZW d on b.ui_zw=d.zwid  WHERE RCID='" + hkdb.GetStr(Request.QueryString["rcid"].ToString()) + "'");
                if (datar.Read())
                {
                    rzr.Text = datar["ui_desc"].ToString();
                    //cjsj.Text=hkdb.GetDate(datar["cjsj"].ToString());
                    cjsj.Text = datar["cjsj"].ToString();
                    szbm.Text = datar["bm_mc"].ToString();
                    zw.Text = datar["zwmc"].ToString();
                    rzzt.Text = datar["rczt"].ToString();
                    rzms.Text = hkdb.GetStrTeOut(datar["rcms"].ToString());
                    savefj.Text = datar["fjmc"].ToString();
                    savefj.NavigateUrl = (datar["fjlj"] == System.DBNull.Value ? "" : "../.." + datar["fjlj"]) + datar["fjmc"].ToString();
                    datar.Close();

                }
                else
                {
                    datar.Close();
                    mydb.Alert_Close("此记录不存在,可能已被完成或删除！");
                    return;
                }
            }
        }
    }

}