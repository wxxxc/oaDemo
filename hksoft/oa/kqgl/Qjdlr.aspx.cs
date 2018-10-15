using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Qjdlr : System.Web.UI.Page
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

                //qjkssj_s.Text = System.DateTime.Now.AddDays(-30).ToString("yyyy-MM-dd");
                qjkssj_s.Text = Request.Cookies["haoke"].Values["sdate"].ToString();
                //qjkssj_e.Text = System.DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");

                JqBind();

                //页面绑定
                GridViewBind();
            }
        }

        //假期绑定 
        public void JqBind()
        {
            //可用事假、病假
            lblkyjq.Text = "本年可用假期：";
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT TOP 1 * FROM OA_KQ_JQFZ WHERE JQNF='" + string.Format("{0:yyyy}", DateTime.Now) + "-01-01' AND CHARINDEX('" + this.Session["UserID"] + "',UserIDs)>0 ");
            if (dr.Read())
            {
                lblkyjq.Text += "事假" + dr["shjts"].ToString() + "天&nbsp;";
                lblkyjq.Text += "病假" + dr["bjts"].ToString() + "天&nbsp;";


                shj.Text = dr["shjts"].ToString();
                bj.Text = dr["bjts"].ToString();
            }
            dr.Close();

            //可用年假：1年以内0天；1(含)-10年5天；10(含)至20年:10天；20年(含)以上：15天
            SqlDataReader dr_nj = SqlHelper.ExecuteReader("SELECT (CASE WHEN nian>=1 AND nian<10 THEN 5 WHEN nian>=10 AND nian<20 THEN 10 WHEN nian>=20 THEN 15 ELSE 0 END)AS njts FROM (SELECT ISNULL(DATEDIFF(YEAR,CONVERT(VARCHAR(4),ui_rzrq,112)+'.1.1',DATEADD(DAY,-DATEDIFF(DAY,CONVERT(VARCHAR(4),ui_rzrq,112)+'.1.1',ui_rzrq),convert(char(10),getdate(),111))),0)AS nian FROM yh WHERE ui_id='" + this.Session["UserID"] + "')Z");
            if (dr_nj.Read())
            {
                lblkyjq.Text += "年假" + dr_nj["njts"].ToString() + "天";
                nj.Text = dr_nj["njts"].ToString();
            }
            dr_nj.Close();


            //剩余假期
            SqlDataReader dr3 = SqlHelper.ExecuteReader("SELECT QJLX,ISNULL(SUM(QJTS),0)AS QJTS FROM OA_KQ_QJD01 WHERE SQRID='" + this.Session["UserID"] + "' AND QJZT='已确认' AND DATEADD(yy, DATEDIFF(yy,0,QJKSSJ), 0)='" + string.Format("{0:yyyy}", DateTime.Now) + "-01-01' GROUP BY QJLX");
            while (dr3.Read())
            {
                switch (dr3["QJLX"].ToString())
                {
                    case "年假":
                        double iNj = Convert.ToDouble(nj.Text) - Convert.ToDouble(dr3["QJTS"].ToString());
                        nj.Text = iNj.ToString();
                        break;
                    case "事假":
                        double iShj = Convert.ToDouble(shj.Text) - Convert.ToDouble(dr3["QJTS"].ToString());
                        shj.Text = iShj.ToString();
                        break;
                    case "病假":
                        double iBj = Convert.ToDouble(bj.Text) - Convert.ToDouble(dr3["QJTS"].ToString());
                        bj.Text = iBj.ToString();
                        break;
                }
            }
            dr3.Close();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string sql = " WHERE A.SQRID='" + this.Session["userid"] + "'";

            if (!string.IsNullOrEmpty(qjlx.Text))
            {
                sql = sql + " AND A.QJLX='" + hkdb.GetStr(qjlx.Text) + "'";
            }

            if (!string.IsNullOrEmpty(qjzt.SelectedValue))
            {
                sql = sql + " AND A.QJZT='" + qjzt.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(qjly.Text))
            {
                sql = sql + " AND A.QJLY LIKE '%" + hkdb.GetStr(qjly.Text) + "%'";
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
            qjly.Text = "";
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
