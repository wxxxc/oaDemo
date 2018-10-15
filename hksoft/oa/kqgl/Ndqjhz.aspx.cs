using System;
using System.Data;
using haoke365;
using Microsoft.Reporting.WebForms;

namespace hkpro.oa.kqgl
{
    public partial class Ndqjhz : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11722", "11722");

                //缺省月份
                if (Request.Cookies["haoke"].Values["sdate"].ToString() == "2001-01-01")
                {
                    kqrq.Text = "2015";
                }
                else
                {
                    kqrq.Text = string.Format("{0:yyyy}", DateTime.Now);
                }

                //页面绑定 
                BindGrid_Null();
            }
            else
            {
                //BindGrid();
            }
        }

        public void BindGrid()
        {
            DataTable dt = GetData();
            ReportDataSource rds = new ReportDataSource("Ndqjhz_ds_DataTable1", dt);
            ReportViewer1.LocalReport.EnableHyperlinks = true;
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(rds);
            ReportViewer1.LocalReport.Refresh();
        }

        public void BindGrid_Null()
        {
            DataTable dt = GetData_Null();
            ReportDataSource rds = new ReportDataSource("Ndqjhz_ds_DataTable1", dt);
            ReportViewer1.LocalReport.EnableHyperlinks = true;
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(rds);
            ReportViewer1.LocalReport.Refresh();
        }

        private DataTable GetData()
        {
            DataTable dt = new DataTable("dataname");
            dt.Columns.Add(new DataColumn("nf", typeof(string)));
            dt.Columns.Add(new DataColumn("sqbmmc", typeof(string)));
            dt.Columns.Add(new DataColumn("sqrid", typeof(string)));
            dt.Columns.Add(new DataColumn("sqrmc", typeof(string)));
            dt.Columns.Add(new DataColumn("qjts_nj", typeof(double)));
            dt.Columns.Add(new DataColumn("qjts_tqj", typeof(double)));
            dt.Columns.Add(new DataColumn("qjts_hj", typeof(double)));
            dt.Columns.Add(new DataColumn("qjts_sj", typeof(double)));
            dt.Columns.Add(new DataColumn("qjts_cj", typeof(double)));
            dt.Columns.Add(new DataColumn("qjts_gj", typeof(double)));
            dt.Columns.Add(new DataColumn("qjts_shj", typeof(double)));
            dt.Columns.Add(new DataColumn("qjts_bj", typeof(double)));
            dt.Columns.Add(new DataColumn("njts", typeof(double)));
            dt.Columns.Add(new DataColumn("shjts", typeof(double)));
            dt.Columns.Add(new DataColumn("bjts", typeof(double)));
            dt = ReportBind();
            return dt;
        }

        private DataTable GetData_Null()
        {
            DataTable dt = new DataTable("dataname");
            dt.Columns.Add(new DataColumn("nf", typeof(string)));
            dt.Columns.Add(new DataColumn("sqbmmc", typeof(string)));
            dt.Columns.Add(new DataColumn("sqrid", typeof(string)));
            dt.Columns.Add(new DataColumn("sqrmc", typeof(string)));
            dt.Columns.Add(new DataColumn("qjts_nj", typeof(double)));
            dt.Columns.Add(new DataColumn("qjts_tqj", typeof(double)));
            dt.Columns.Add(new DataColumn("qjts_hj", typeof(double)));
            dt.Columns.Add(new DataColumn("qjts_sj", typeof(double)));
            dt.Columns.Add(new DataColumn("qjts_cj", typeof(double)));
            dt.Columns.Add(new DataColumn("qjts_gj", typeof(double)));
            dt.Columns.Add(new DataColumn("qjts_shj", typeof(double)));
            dt.Columns.Add(new DataColumn("qjts_bj", typeof(double)));
            dt.Columns.Add(new DataColumn("njts", typeof(double)));
            dt.Columns.Add(new DataColumn("shjts", typeof(double)));
            dt.Columns.Add(new DataColumn("bjts", typeof(double)));
            //dt = ReportBind();
            return dt;
        }

        public DataTable ReportBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("EXEC sp_OA_KQ_NDQJHZ '" + hkdb.GetStr(kqrq.Text) + "-01-01'");

            return ds.Tables[0];
        }

        //查询
        protected void Ref_Click(object sender, EventArgs e)
        {
            BindGrid();
        }
    }
}
