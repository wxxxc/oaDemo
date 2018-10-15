using System;
using System.Data;
using System.Data.SqlClient;
using haoke365;
using Microsoft.Reporting.WebForms;

namespace hkpro.oa.kqgl
{
    public partial class Bmnjhz : System.Web.UI.Page
    {
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11733", "11733");

                DropDownListBind();

                //缺省月份、季度
                if (Request.Cookies["haoke"].Values["sdate"].ToString() == "2001-01-01")
                {
                    nf.Text = "2015";
                    jd.SelectedValue = "1";
                }
                else
                {
                    nf.Text = string.Format("{0:yyyy}", DateTime.Now);

                    switch (string.Format("{0:MM}", DateTime.Now))
                    {
                        case "01":
                            jd.SelectedValue = "1";
                            break;
                        case "02":
                            jd.SelectedValue = "1";
                            break;
                        case "03":
                            jd.SelectedValue = "1";
                            break;
                        case "04":
                            jd.SelectedValue = "2";
                            break;
                        case "05":
                            jd.SelectedValue = "2";
                            break;
                        case "06":
                            jd.SelectedValue = "2";
                            break;
                        case "07":
                            jd.SelectedValue = "3";
                            break;
                        case "08":
                            jd.SelectedValue = "3";
                            break;
                        case "09":
                            jd.SelectedValue = "3";
                            break;
                        case "10":
                            jd.SelectedValue = "4";
                            break;
                        case "11":
                            jd.SelectedValue = "4";
                            break;
                        case "12":
                            jd.SelectedValue = "4";
                            break;
                    }
                }

                //判断部门考勤权限
                if (this.Session["UserID"].ToString() != "admin")
                {
                    SqlDataReader dr = SqlHelper.ExecuteReader("SELECT YHID FROM OA_KQ_QX WHERE YHID='" + this.Session["UserID"] + "' AND (Kqspry2='是' OR Kqspry3='是' OR Kqglry='是')");
                    if (!dr.Read())
                    {
                        bm.SelectedValue = this.Session["DeptID"].ToString();
                        bm.Enabled = false;
                    }
                    dr.Close();
                }

                //页面绑定 
                BindGrid_Null();
            }
            else
            {
                //BindGrid();
            }
        }

        public void DropDownListBind()
        {
            bd.Bind_DropDownList_bm(bm, "", "", "");
        }

        public void BindGrid()
        {
            DataTable dt = GetData();
            ReportDataSource rds = new ReportDataSource("Bmnjhz_ds_DataTable1", dt);
            ReportViewer1.LocalReport.EnableHyperlinks = true;
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(rds);
            ReportViewer1.LocalReport.Refresh();
        }

        public void BindGrid_Null()
        {
            DataTable dt = GetData_Null();
            ReportDataSource rds = new ReportDataSource("Bmnjhz_ds_DataTable1", dt);
            ReportViewer1.LocalReport.EnableHyperlinks = true;
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(rds);
            ReportViewer1.LocalReport.Refresh();
        }

        private DataTable GetData()
        {
            DataTable dt = new DataTable("dataname");
            dt.Columns.Add(new DataColumn("bm_mc", typeof(string)));
            dt.Columns.Add(new DataColumn("bnkx", typeof(double)));
            dt.Columns.Add(new DataColumn("bnyx", typeof(double)));
            dt.Columns.Add(new DataColumn("bnwx", typeof(double)));
            dt.Columns.Add(new DataColumn("bjkx", typeof(double)));
            dt.Columns.Add(new DataColumn("bjyx", typeof(double)));
            dt.Columns.Add(new DataColumn("bjwx", typeof(double)));
            dt = ReportBind();
            return dt;
        }

        private DataTable GetData_Null()
        {
            DataTable dt = new DataTable("dataname");
            dt.Columns.Add(new DataColumn("bm_mc", typeof(string)));
            dt.Columns.Add(new DataColumn("bnkx", typeof(double)));
            dt.Columns.Add(new DataColumn("bnyx", typeof(double)));
            dt.Columns.Add(new DataColumn("bnwx", typeof(double)));
            dt.Columns.Add(new DataColumn("bjkx", typeof(double)));
            dt.Columns.Add(new DataColumn("bjyx", typeof(double)));
            dt.Columns.Add(new DataColumn("bjwx", typeof(double)));
            //dt = ReportBind();
            return dt;
        }

        public DataTable ReportBind()
        {
            string strNd_s = nf.Text + "-01-01";
            string strNd_e = nf.Text + "-12-31";

            string strJd_s = "";
            string strJd_e = "";
            switch (jd.SelectedValue)
            {
                case "2":
                    strJd_s = nf.Text + "-04-01";
                    strJd_e = nf.Text + "-06-30";
                    break;
                case "3":
                    strJd_s = nf.Text + "-07-01";
                    strJd_e = nf.Text + "-09-30";
                    break;
                case "4":
                    strJd_s = nf.Text + "-10-01";
                    strJd_e = nf.Text + "-12-31";
                    break;
                default:
                    strJd_s = nf.Text + "-01-01";
                    strJd_e = nf.Text + "-03-31";
                    break;
            }

            DataSet ds = SqlHelper.ExecuteDs("EXEC sp_OA_KQ_BMNJHZ '" + strNd_s + "','" + strNd_e + "','" + strJd_s + "','" + strJd_e + "','" + bm.SelectedValue + "'");

            return ds.Tables[0];
        }

        //查询
        protected void Ref_Click(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            bm.SelectedValue = "";
        }
    }
}
