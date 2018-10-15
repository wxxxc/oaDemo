using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.jhgl
{
    public partial class Grjh_Gzx : System.Web.UI.Page
    {
        public string SendTo = "";
        public string SendToRealName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10201", "0");

                SqlDataReader dr = SqlHelper.ExecuteReader("select gzzt,gznr,jhkssj,jhwcsj,yqjg,sjwcsj,sjwcqk,cyz from oa_gzjh02 where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (dr.Read())
                {
                    gzzt.Text = dr["gzzt"].ToString();
                    gznr.Text = dr["gznr"].ToString();
                    jhkssj.Text = string.Format("{0:d}", dr["jhkssj"]);
                    jhwcsj.Text = string.Format("{0:d}", dr["jhwcsj"]);
                    yqjg.Text = dr["yqjg"].ToString();
                    sjwcsj.Text = dr["sjwcsj"].ToString();
                    sjwcjg.Text = dr["sjwcqk"].ToString();
                    //参与者 
                    SendTo = dr["cyz"].ToString() + ",";
                    SendToRealName = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + dr["cyz"].ToString() + "','1'"));
                    dr.Close();
                }
                else
                {
                    dr.Close();
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }
            }

            txtSendTo.Text = SendToRealName;
            hdnTxtSendTo.Text = SendTo;
        }
    }
}
