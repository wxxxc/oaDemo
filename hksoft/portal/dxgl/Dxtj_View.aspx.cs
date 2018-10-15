using System;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.dxgl
{
    public partial class Dxtj_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11002", "0");

                OperQx();

                zymc.Text =Request.QueryString["mc"].ToString() + " " + Request.QueryString["sd"].ToString() + "至" + Request.QueryString["ed"].ToString();
            }

            GridViewBind();
        }

        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(OutBtn, "11002e", Session["roleqx"].ToString());
        }

        //gv绑定 
        public void GridViewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("SELECT ID,SSENDNO,DTIMINGTIME,SSMSMESSAGE,(CASE WHEN nIsSend='1' THEN '发送成功' WHEN nIsSend='2' THEN '发送失败' ELSE '待发送' END)AS nIsSend FROM TSMSSENDLOG WHERE SSENDER = '" + hkdb.GetStr(Request.QueryString["yh"].ToString()) + "' AND dTimingTime BETWEEN '" + hkdb.GetStr(Request.QueryString["sd"].ToString()) + "' AND '" + hkdb.GetStr(Request.QueryString["ed"].ToString()) + "' ORDER BY DTIMINGTIME DESC");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //gv行处理 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";

                string strnIsSend = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "nIsSend")).Trim();
                if (strnIsSend == "发送成功")
                {
                    e.Row.ForeColor = Color.Green;
                }

                if (strnIsSend == "发送失败")
                {
                    e.Row.ForeColor = Color.Red;
                }
            }
        }

        //导出
        protected void Out_Click(object sender, EventArgs e)
        {
            DataSet ds = SqlHelper.ExecuteDs("SELECT ID AS '编码',SSENDNO AS '接收号码',DTIMINGTIME AS '发送时间',(CASE WHEN nIsSend='1' THEN '发送成功' WHEN nIsSend='2' THEN '发送失败' ELSE '待发送' END)AS '发送结果',SSMSMESSAGE AS '短信内容' FROM TSMSSENDLOG WHERE SSENDER = '" + hkdb.GetStr(Request.QueryString["yh"].ToString()) + "' AND dTimingTime BETWEEN '" + hkdb.GetStr(Request.QueryString["sd"].ToString()) + "' AND '" + hkdb.GetStr(Request.QueryString["ed"].ToString()) + "'");

            string fileName = "dxtj.xls";
            ExcelHelper.ExportDataSetToExcel(ds, fileName, "短信统计");
        }
    }
}
