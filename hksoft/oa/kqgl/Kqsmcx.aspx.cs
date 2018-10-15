using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Kqsmcx : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11726", "11726");

                DropDownListBind();

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //qdsj_s.Text = System.DateTime.Now.AddDays(-30).ToString("yyyy-MM-dd");
                qdsj_s.Text = Request.Cookies["haoke"].Values["sdate"].ToString();
                //qdsj_e.Text = System.DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");

                //页面绑定
                GridViewBind();
            }
        }

        public void DropDownListBind()
        {
            bd.Bind_DropDownList_bm(bm, "", "", "");
        }

        //gv绑定 
        public void GridViewBind()
        {
            string sql = " WHERE 1=1";

            if (!string.IsNullOrEmpty(smzt.SelectedValue))
            {
                sql = sql + " AND A.SMZT='" + smzt.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(bm.SelectedValue))
            {
                sql = sql + " AND A.SQBMID='" + bm.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(ry.SelectedValue))
            {
                sql = sql + " AND A.SQRID='" + ry.SelectedValue + "'";
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
            bm.SelectedValue = "";
            ry.SelectedValue = "";
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

        //导出
        protected void Exp_Click(object sender, EventArgs e)
        {
            string sql = " WHERE 1=1";

            if (!string.IsNullOrEmpty(smzt.SelectedValue))
            {
                sql = sql + " AND A.SMZT='" + smzt.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(bm.SelectedValue))
            {
                sql = sql + " AND A.SQBMID='" + bm.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(ry.SelectedValue))
            {
                sql = sql + " AND A.SQRID='" + ry.SelectedValue + "'";
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

            DataSet ds = SqlHelper.ExecuteDs("SELECT SQRMC AS '申请人',QDSJ AS '日期',YNQD1 AS '上午签到',YNQT1 AS '上午签退',YNQD2 AS '下午签到',YNQT2 AS '下午签退',YNQD3 AS '晚上签到',YNQT3 AS '晚上签退',SMZT AS '状态',KQQKSM as '考勤情况说明',SQBMMC AS '所属部门',SQSJ AS '录入时间',A.SSCS AS '送审次数' FROM OA_KQ_SM01 A " + sql + " ORDER BY SQSJ DESC");

            string fileName = "Kqsmcx.xls";
            ExcelHelper.ExportDataSetToExcel(ds, fileName, "考勤说明查询");
        }
    }
}
