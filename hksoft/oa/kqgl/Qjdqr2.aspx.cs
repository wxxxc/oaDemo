﻿using System;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Qjdqr2 : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11716", "11716");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                GridViewBind();
            }
        }

        //查询 
        protected void Receive_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        public void GridViewBind()
        {
            string Str1 = " WHERE A.SPRID= '" + this.Session["userid"] + "' AND A.SPZT='确认完成'";

            if (!string.IsNullOrEmpty(qjlx.SelectedValue))
            {
                Str1 = Str1 + " AND B.QJLX='" + qjlx.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str1 = Str1 + " AND " + query_tj.SelectedItem.Value + " LIKE '%" + hkdb.GetStr(query_content.Text) + "%'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) AS NUMS FROM OA_KQ_QJD02 A LEFT OUTER JOIN OA_KQ_QJD01 B ON(A.SSQID=B.QID) " + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT DISTINCT * FROM OA_KQ_QJD02 A LEFT OUTER JOIN OA_KQ_QJD01 B ON (A.SSQID=B.QID) " + Str1 + " ORDER BY SPSJ DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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
                string spzt = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "spzt")).Trim();

                if (spzt == "审批退回")
                {
                    e.Row.ForeColor = Color.Red;
                }
            }
        }
    }
}
