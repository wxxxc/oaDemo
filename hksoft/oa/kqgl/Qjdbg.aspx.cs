using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Qjdbg : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11728", "11728");

                DropDownListBind();

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //qjkssj_s.Text = System.DateTime.Now.AddDays(-30).ToString("yyyy-MM-dd");
                qjkssj_s.Text = Request.Cookies["haoke"].Values["sdate"].ToString();
                //qjkssj_e.Text = System.DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");

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

            if (!string.IsNullOrEmpty(qjlx.Text))
            {
                sql = sql + " AND A.QJLX='" + hkdb.GetStr(qjlx.Text) + "'";
            }

            if (!string.IsNullOrEmpty(qjzt.SelectedValue))
            {
                sql = sql + " AND A.QJZT='" + qjzt.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(bm.SelectedValue))
            {
                sql = sql + " AND A.SQBMID='" + bm.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(ry.SelectedValue))
            {
                sql = sql + " AND A.SQRID='" + ry.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(qjkssj_s.Text))
            {
                sql = sql + " AND QJKSSJ>='" + hkdb.GetStr(qjkssj_s.Text) + "'";
            }

            if (!string.IsNullOrEmpty(qjkssj_e.Text))
            {
                sql = sql + " AND QJKSSJ<='" + hkdb.GetStr(qjkssj_e.Text) + "'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*)AS NUMS FROM OA_KQ_QJD01 A " + sql);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.* FROM OA_KQ_QJD01 A " + sql + " ORDER BY SQSJ DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            qjlx.SelectedValue = "";
            qjzt.SelectedValue = "";
            bm.SelectedValue = "";
            ry.SelectedValue = "";
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
    }
}
