using System;
using System.Data;
using haoke365;
using Microsoft.Reporting.WebForms;

namespace hkpro.oa.kqgl
{
    public partial class Ykqtj : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11720", "11720");

                DropDownListBind();

                //缺省月份
                if (Request.Cookies["haoke"].Values["sdate"].ToString() == "2001-01-01")
                {
                    kqrq.Text = "2015-01";
                }
                else
                {
                    kqrq.Text = string.Format("{0:yyyy-MM}", DateTime.Now);
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
            ReportDataSource rds = new ReportDataSource("Ykqtj_ds_DataTable1", dt);
            ReportViewer1.LocalReport.EnableHyperlinks = true;
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(rds);
            ReportViewer1.LocalReport.Refresh();
        }

        public void BindGrid_Null()
        {
            DataTable dt = GetData_Null();
            ReportDataSource rds = new ReportDataSource("Ykqtj_ds_DataTable1", dt);
            ReportViewer1.LocalReport.EnableHyperlinks = true;
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(rds);
            ReportViewer1.LocalReport.Refresh();
        }

        private DataTable GetData()
        {
            DataTable dt = new DataTable("dataname");
            dt.Columns.Add(new DataColumn("kqrq", typeof(string)));
            dt.Columns.Add(new DataColumn("rybh", typeof(string)));
            dt.Columns.Add(new DataColumn("xm", typeof(string)));
            dt.Columns.Add(new DataColumn("yhid", typeof(string)));
            dt.Columns.Add(new DataColumn("ui_desc", typeof(string)));
            dt.Columns.Add(new DataColumn("bm_mc", typeof(string)));
            dt.Columns.Add(new DataColumn("cd", typeof(string)));
            dt.Columns.Add(new DataColumn("zt", typeof(string)));
            dt.Columns.Add(new DataColumn("wqd", typeof(string)));
            dt.Columns.Add(new DataColumn("wqt", typeof(string)));
            dt.Columns.Add(new DataColumn("kg", typeof(string)));
            dt.Columns.Add(new DataColumn("qjlx", typeof(string)));
            dt.Columns.Add(new DataColumn("ynsm", typeof(string)));
            dt = ReportBind();
            return dt;
        }

        private DataTable GetData_Null()
        {
            DataTable dt = new DataTable("dataname");
            dt.Columns.Add(new DataColumn("kqrq", typeof(string)));
            dt.Columns.Add(new DataColumn("rybh", typeof(string)));
            dt.Columns.Add(new DataColumn("xm", typeof(string)));
            dt.Columns.Add(new DataColumn("yhid", typeof(string)));
            dt.Columns.Add(new DataColumn("ui_desc", typeof(string)));
            dt.Columns.Add(new DataColumn("bm_mc", typeof(string)));
            dt.Columns.Add(new DataColumn("cd", typeof(string)));
            dt.Columns.Add(new DataColumn("zt", typeof(string)));
            dt.Columns.Add(new DataColumn("wqd", typeof(string)));
            dt.Columns.Add(new DataColumn("wqt", typeof(string)));
            dt.Columns.Add(new DataColumn("kg", typeof(string)));
            dt.Columns.Add(new DataColumn("qjlx", typeof(string)));
            dt.Columns.Add(new DataColumn("ynsm", typeof(string)));
            //dt = ReportBind();
            return dt;
        }

        public DataTable ReportBind()
        {
            string sql = " WHERE SUBSTRING(CONVERT(CHAR(10),KQRQ,021),1,7)='" + hkdb.GetStr(kqrq.Text) + "' AND A.YNSBR='是'";

            if (!string.IsNullOrEmpty(bm.SelectedValue))
            {
                sql = sql + " and C.UI_SSBM='" + bm.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(ry.SelectedValue))
            {
                sql = sql + " AND C.UI_ID='" + ry.SelectedValue + "'";
            }

            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM(SELECT A.KQRQ,A.RYBH,A.XM,B.YHID,C.UI_DESC,D.BM_BM,D.BM_MC,(CASE WHEN (ISNULL(cdcs1,0)+ISNULL(cdcs2,0)+ISNULL(cdcs3,0))=0 THEN '' ELSE 'X' END)AS cd,(CASE WHEN (ISNULL(ztcs1,0)+ISNULL(ztcs2,0)+ISNULL(ztcs3,0))=0 THEN '' ELSE 'X' END)AS zt,(CASE WHEN (ISNULL(wqdcs1,0)+ISNULL(wqdcs2,0)+ISNULL(wqdcs3,0))=0 THEN '' ELSE 'X' END)AS wqd,(CASE WHEN (ISNULL(wqtcs1,0)+ISNULL(wqtcs2,0)+ISNULL(wqtcs3,0))=0 THEN '' ELSE 'X' END)AS wqt,(CASE WHEN (ISNULL(kgcs1,0)+ISNULL(kgcs2,0)+ISNULL(kgcs3,0))=0 THEN '' ELSE 'X' END)AS kg,(SELECT TOP 1 QJLX FROM OA_KQ_QJD01 WHERE QJZT='已确认' AND SQRID=b.YHID AND A.KQRQ BETWEEN qjkssj AND qjjssj) AS qjlx,(SELECT TOP 1 (CASE WHEN SID<>'' THEN 'X' ELSE '' END) FROM OA_KQ_SM01 WHERE SMZT='已确认' AND SQRID=b.YHID AND A.KQRQ=QDSJ) AS ynsm FROM oa_kqxx A LEFT OUTER JOIN oa_kq_qx B ON(A.RYBH=B.KQID) LEFT OUTER JOIN YH C ON(B.YHID=C.UI_ID) LEFT OUTER JOIN BM D ON(C.UI_SSBM=D.BM_ID) " + sql + ")T3 WHERE cd='X' OR zt='X' OR wqd='X' OR wqt='X' OR kg='X' ORDER BY bm_bm,yhid,kqrq");

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
            ry.SelectedValue = "";
        }

        //部门切换
        protected void bm_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(bm.SelectedValue))
            {
                ry.Items.Clear();

                string sql = "SELECT UI_ID,UI_ID+'-'+UI_DESC AS UI_DESC FROM YH WHERE UI_LX='企业' AND UI_SSBM='" + bm.SelectedValue + "' ORDER BY UI_ID";
                bd.Bind_DropDownList(ry, sql, "UI_ID", "UI_DESC", "", "");
            }
        }
    }
}
