using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Kqsjbg : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11730", "11730");

                DropDownListBind();

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                kqrq_s.Text = DateTime.Now.AddDays(-(DateTime.Now.Day) + 1).ToString("yyyy-MM-dd");
                //kqrq_s.Text = Request.Cookies["haoke"].Values["sdate"].ToString();
                kqrq_e.Text = System.DateTime.Now.AddDays(0).ToString("yyyy-MM-dd");

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
            string sql = " WHERE A.KQRQ BETWEEN '" + hkdb.GetStr(kqrq_s.Text) + "' AND '" + hkdb.GetStr(kqrq_e.Text) + "'";

            if (!string.IsNullOrEmpty(bm.SelectedValue))
            {
                sql = sql + " AND C.UI_SSBM='" + bm.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(ry.SelectedValue))
            {
                sql = sql + " AND C.UI_ID='" + ry.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(tjfw.SelectedValue))
            {
                sql = sql + " AND B.TSKQRY='是'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*)AS NUMS FROM OA_KQXX A LEFT OUTER JOIN OA_KQ_QX B ON(A.RYBH=B.KQID) LEFT OUTER JOIN YH C ON(B.YHID=C.UI_ID) " + sql);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,ISNULL(A.CDCS1,0)+ISNULL(A.CDCS2,0)+ISNULL(A.CDCS3,0) AS CDCS,ISNULL(A.ZTCS1,0)+ISNULL(A.ZTCS2,0)+ISNULL(A.ZTCS3,0) AS ZTCS,ISNULL(KGCS1,0)+ISNULL(KGCS2,0)+ISNULL(KGCS3,0) AS KGCS,ISNULL(WQDCS1,0)+ISNULL(WQDCS2,0)+ISNULL(WQDCS3,0) AS WQDCS,ISNULL(WQTCS1,0)+ISNULL(WQTCS2,0)+ISNULL(WQTCS3,0) AS WQTCS,C.UI_ID,C.UI_DESC FROM OA_KQXX A LEFT OUTER JOIN OA_KQ_QX B ON(A.RYBH=B.KQID) LEFT OUTER JOIN YH C ON(B.YHID=C.UI_ID) " + sql + " ORDER BY C.UI_ID,A.RYBH,A.KQRQ", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            bm.SelectedValue = "";
            ry.SelectedValue = "";
            tjfw.SelectedValue = "";
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

                Label ly = (Label)e.Row.FindControl("lblyh");
                Label lr = (Label)e.Row.FindControl("lblrq");
                Label ll = (Label)e.Row.FindControl("lbltxt");

                ll.Text = null;

                //考勤说明
                SqlDataReader dr_sm = SqlHelper.ExecuteReader("SELECT sid FROM OA_KQ_SM01 WHERE SMZT='已确认' AND SQRID='" + ly.Text + "' AND QDSJ='" + lr.Text + "'");
                if (dr_sm.Read())
                {
                    ll.Text += "<a href='#' onclick='window.open (\"Kqsmcx_View.aspx?id=" + dr_sm["sid"] + "\", \"_blank\", \"height=500, width=750,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=110,left=110\")' class='gvlink'>考勤说明</a>";
                }
                dr_sm.Close();

                //请假单
                SqlDataReader dr_qj = SqlHelper.ExecuteReader("SELECT qid FROM OA_KQ_QJD01 WHERE QJZT='已确认' AND SQRID='" + ly.Text + "' AND '" + lr.Text + "' BETWEEN QJKSSJ AND QJJSSJ");
                if (dr_qj.Read())
                {
                    ll.Text += "&nbsp;<a href='#' onclick='window.open (\"Qjdcx_View.aspx?id=" + dr_qj["qid"] + "\", \"_blank\", \"height=500, width=750,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=110,left=110\")' class='gvlink'>请假单</a>";
                }
                dr_qj.Close();
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
