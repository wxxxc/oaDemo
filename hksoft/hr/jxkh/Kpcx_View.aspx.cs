using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Kpcx_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object Sender, EventArgs E)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("81110", "0");

                //考评项目
                SqlDataReader dr_xm = SqlHelper.ExecuteReader("SELECT KPQS FROM HR_Kpdf_Kpxm01 WHERE KPID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (dr_xm.Read())
                {
                    lblxmmc.Text = dr_xm["KPQS"].ToString();
                }
                dr_xm.Close();

                //评委类型
                SqlDataReader dr_pw = SqlHelper.ExecuteReader("SELECT PWLX FROM HR_Kpdf_Pw WHERE PID='" + this.Session["userid"] + "'");
                if (dr_pw.Read())
                {
                    lblpwlx.Text = dr_pw["PWLX"].ToString();
                }
                dr_pw.Close();

                GridViewBind();
            }
        }

        //gv绑定 
        public void GridViewBind()
        {   
            //总经理、分管副主管、副主管的评分权重
            double dbZrbl = Convert.ToDouble(SqlHelper.ExecuteScalar("SELECT P_Value FROM HR_Kpdf_Paramt WHERE P_code='Percent_Zxzr'").ToString());
            double dbFgfzrbl = Convert.ToDouble(SqlHelper.ExecuteScalar("SELECT P_Value FROM HR_Kpdf_Paramt WHERE P_code='Percent_Fgfzr'").ToString());
            double dbFzrbl = Convert.ToDouble(SqlHelper.ExecuteScalar("SELECT P_Value FROM HR_Kpdf_Paramt WHERE P_code='Percent_Ffgfzr'").ToString());

            DataSet ds = SqlHelper.ExecuteDs("EXEC sp_HR_Kpdf_Kpjgcx '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'," + dbZrbl + "," + dbFgfzrbl + "," + dbFzrbl + "");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //gv行处理 
        public void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";

                Label ln = (Label)e.Row.FindControl("lblkpid");
                Label lb = (Label)e.Row.FindControl("lblbid");
                Label ll = (Label)e.Row.FindControl("lbltxt");

                ll.Text = null;

                //判断评委类型
                if (lblpwlx.Text == "总经理评委" | lblpwlx.Text == "考评管理员")
                {
                    ll.Text += "<a href='#' onclick=\"javascript:popAdd('Kpcx_View_Show.aspx?kpid=" + ln.Text + "&bid=" + lb.Text + "')\" class='gvlink'>查看明细</a>";
                }
            }
        }

        //导出
        protected void Exp_Click(object sender, EventArgs e)
        {
            //总经理、分管副主管、副主管的评分权重
            double dbZrbl = Convert.ToDouble(SqlHelper.ExecuteScalar("SELECT P_Value FROM HR_Kpdf_Paramt WHERE P_code='Percent_Zxzr'").ToString());
            double dbFgfzrbl = Convert.ToDouble(SqlHelper.ExecuteScalar("SELECT P_Value FROM HR_Kpdf_Paramt WHERE P_code='Percent_Fgfzr'").ToString());
            double dbFzrbl = Convert.ToDouble(SqlHelper.ExecuteScalar("SELECT P_Value FROM HR_Kpdf_Paramt WHERE P_code='Percent_Ffgfzr'").ToString());

            DataSet ds = SqlHelper.ExecuteDs("EXEC sp_HR_Kpdf_Kpjgcx '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'," + dbZrbl + "," + dbFgfzrbl + "," + dbFzrbl + "");
            
            string fileName = "Kpjgcx.xls";
            ExcelHelper.ExportDataSetToExcel(ds, fileName, lblxmmc.Text);
        }
    }
}
