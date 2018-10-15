using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Wdkq : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11714", "11714");

                //缺省月份
                if (hkdb.IsDemo("N") == "true")
                {
                    cxyf.Text = "2015-01";
                }
                else
                {
                    cxyf.Text = hkdb.SetDate("Y-M", 0);
                }

                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT KQID FROM OA_KQ_QX WHERE YHID='" + this.Session["UserID"] + "'");
                if (datar.Read())
                {
                    lblkqid.Text = datar["KQID"].ToString() + "&nbsp;&nbsp;";
                }
                datar.Close();

                lblrzrq.Text = SqlHelper.ExecuteScalar("SELECT convert(char(10),UI_RZRQ,111) FROM YH WHERE UI_ID='" + this.Session["UserID"] + "'").ToString();

                GridViewBind();
            }
        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " WHERE B.YHID='" + this.Session["UserID"] + "'";

            if (!string.IsNullOrEmpty(cxyf.Text))
            {
                Str1 = Str1 + " AND SUBSTRING(CONVERT(CHAR(10),a.kqrq,021),1,7)='" + hkdb.GetStr(cxyf.Text) + "'";
            }

            DataSet ds = SqlHelper.ExecuteDs("SELECT a.*,datename(weekday,a.kqrq)as xq,ISNULL(A.CDCS1,0)+ISNULL(A.CDCS2,0)+ISNULL(A.CDCS3,0) AS CDCS,ISNULL(A.ZTCS1,0)+ISNULL(A.ZTCS2,0)+ISNULL(A.ZTCS3,0) AS ZTCS,ISNULL(KGCS1,0)+ISNULL(KGCS2,0)+ISNULL(KGCS3,0) AS KGCS,ISNULL(WQDCS1,0)+ISNULL(WQDCS2,0)+ISNULL(WQDCS3,0) AS WQDCS,ISNULL(WQTCS1,0)+ISNULL(WQTCS2,0)+ISNULL(WQTCS3,0) AS WQTCS FROM oa_kqxx a LEFT OUTER JOIN oa_kq_qx b ON(a.rybh=b.kqid)" + Str1 + " ORDER BY A.KQRQ");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //gv行处理 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";

                string strxq = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "xq")).Trim();

                if (strxq == "星期六")
                {
                    e.Row.ForeColor = Color.Orange;
                }
                if (strxq == "星期日")
                {
                    e.Row.ForeColor = Color.Orange;
                }

            }
        }
    }
}
