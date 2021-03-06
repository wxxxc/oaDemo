﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Pwpf : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object Sender, EventArgs E)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("81107", "81107");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //ksrq_s.Text = System.DateTime.Now.AddDays(-30).ToString("yyyy-MM-dd");
                ksrq_s.Text = Request.Cookies["haoke"].Values["sdate"].ToString();
                ksrq_e.Text = System.DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");

                GridViewBind();
            }
        }

        //刷新 
        public void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        public void GridViewBind()
        {
            string Str1 = " WHERE A.KPZT IN('已生效','已结束') AND CHARINDEX('" + this.Session["userid"] + "',A.CypwIDs)>0";

            if (!string.IsNullOrEmpty(kpqs.Text))
            {
                Str1 = Str1 + " AND A.KPQS LIKE '%" + hkdb.GetStr(kpqs.Text) + "%'";
            }

            if (!string.IsNullOrEmpty(ksrq_s.Text))
            {
                Str1 = Str1 + " AND A.Ksrq>='" + hkdb.GetStr(ksrq_s.Text) + "'";
            }

            if (!string.IsNullOrEmpty(ksrq_e.Text))
            {
                Str1 = Str1 + " AND A.Ksrq<='" + hkdb.GetStr(ksrq_e.Text) + "'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM HR_Kpdf_Kpxm01 A" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,B.UI_DESC,(SELECT COUNT(DISTINCT ssbid) FROM HR_Kpdf_Kpxm02 WHERE SSKPID=A.KPID)AS BKPRS,(SELECT COUNT(*) FROM HR_Kpdf_Kpxm02 WHERE SSKPID=A.KPID)AS YPF_NUMS,(SELECT COUNT(*) FROM HR_Kpdf_Kpxm04 WHERE SSKPID=A.KPID)AS SJPF_NUMS FROM HR_Kpdf_Kpxm01 A LEFT OUTER JOIN YH B ON (A.CJR=B.UI_ID)" + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        //gv行处理 
        public void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}
