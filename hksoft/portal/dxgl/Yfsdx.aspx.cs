using System;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.dxgl
{
    public partial class Yfsdx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                string b = "";
                if (Request.QueryString["i"] != "2")
                {
                    b = "10103";
                }
                else
                {
                    b = "0";
                }

                hkdb.PassTo("10103", b);

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                GridViewBind();
            }
        }

        //刷新
        protected void Receive_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) AS NUMS FROM TSMSSENDLOG WHERE SSENDER = '" + this.Session["userid"] + "' AND NISSEND<>0");
            DataSet ds = SqlHelper.ExecuteDs("SELECT ID,SSENDNO,DTIMINGTIME,SSMSMESSAGE,(CASE WHEN NISSEND=1 THEN '已发送' ELSE '发送失败' END)AS NISSEND FROM TSMSSENDLOG WHERE SSENDER = '" + this.Session["userid"] + "' AND NISSEND<>0 ORDER BY DTIMINGTIME DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        //gv行处理 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";

                string strnIsSend = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "nIsSend")).Trim();
                if (strnIsSend == "发送失败")
                {
                    e.Row.ForeColor = Color.Red;
                }
            }
        }
    }
}
