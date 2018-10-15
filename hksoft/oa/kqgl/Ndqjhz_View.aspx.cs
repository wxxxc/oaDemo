using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Ndqjhz_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11722", "0");

                if (!string.IsNullOrEmpty(Request.QueryString["yhid"]))
                {
                    lblnf.Text = Request.QueryString["rq"].ToString().Substring(0, 4);
                    lblyhmc.Text = SqlHelper.ExecuteScalar("SELECT UI_DESC from YH WHERE UI_ID='" + hkdb.GetStr(Request.QueryString["yhid"].ToString()) + "'").ToString();

                    GridViewBind();
                }
                else
                {
                    mydb.Alert_Close("参数传递错误！");
                }
            }
        }

        public void GridViewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("SELECT qjlx,qjkssj,qjkssd,qjjssj,qjjssd,qjts,qjly FROM oa_kq_qjd01 A WHERE A.QJZT='已确认' AND YEAR(qjkssj)='" + lblnf.Text + "' AND sqrid='" + hkdb.GetStr(Request.QueryString["yhid"].ToString()) + "' order by qjkssj");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //gv行处理
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}
