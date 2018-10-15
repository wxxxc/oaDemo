using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Kqsmlr : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11714", "11714");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //qdsj_s.Text = System.DateTime.Now.AddDays(-30).ToString("yyyy-MM-dd");
                qdsj_s.Text = Request.Cookies["haoke"].Values["sdate"].ToString();
                //qdsj_e.Text = System.DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");

                //页面绑定
                GridViewBind();
            }
        }

        //gv绑定 
        public void GridViewBind()
        {
            string sql = " WHERE A.SQRID='" + this.Session["userid"] + "'";

            if (!string.IsNullOrEmpty(smzt.SelectedValue))
            {
                sql = sql + " AND A.SMZT='" + smzt.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(kqqksm.Text))
            {
                sql = sql + " AND A.KQQKSM LIKE '%" + hkdb.GetStr(kqqksm.Text) + "%'";
            }

            if (!string.IsNullOrEmpty(qdsj_s.Text))
            {
                sql = sql + " AND QDSJ>='" + hkdb.GetStr(qdsj_s.Text) + "'";
            }

            if (!string.IsNullOrEmpty(qdsj_e.Text))
            {
                sql = sql + " AND QDSJ<='" + hkdb.GetStr(qdsj_e.Text) + "'";
            }

            if (!string.IsNullOrEmpty(qdqt.SelectedValue))
            {
                switch (qdqt.SelectedValue)
                {
                    case "1":
                        sql = sql + " AND (YNQD1='是' OR YNQD2='是' OR YNQD3='是')";
                        break;
                    case "2":
                        sql = sql + " AND (YNQT1='是' OR YNQT2='是' OR YNQT3='是')";
                        break;
                }
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*)AS NUMS FROM OA_KQ_SM01 A " + sql);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.* FROM OA_KQ_SM01 A " + sql + " ORDER BY SQSJ DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            smzt.SelectedValue = "";
            kqqksm.Text = "";
            qdqt.SelectedValue = "";
        }

        //查询 
        protected void Ref_Click(object sender, EventArgs e)
        {
            GridViewBind();
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
