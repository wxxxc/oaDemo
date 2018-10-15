using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Qjdcx_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11725,11730", "0");

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * from OA_KQ_QJD01 WHERE QID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (dr.Read())
                    {
                        lblqjlx.Text = dr["qjlx"].ToString();
                        lblgjlb.Text = dr["gjlb"].ToString();
                        lblqjkssj.Text = hkdb.GetDate(dr["qjkssj"].ToString());
                        lblqjkssd.Text = dr["qjkssd"].ToString();
                        lblqjjssj.Text = hkdb.GetDate(dr["qjjssj"].ToString());
                        lblqjjssd.Text = dr["qjjssd"].ToString();
                        lblqjts.Text = dr["qjts"].ToString();
                        lblqjly.Text = dr["qjly"].ToString();
                        lblgztzqk.Text = dr["gztzqk"].ToString();
                        lblsqr.Text = dr["sqrmc"].ToString();
                        sssj.Text = dr["sssj"].ToString();
                        lblspr.Text = dr["jsrNames"].ToString();
                        lblsqbmmc.Text = dr["sqbmmc"].ToString();
                        lblsqsj.Text = dr["sqsj"].ToString();
                        Number.Text = dr["qjfj"].ToString();
                        dr.Close();

                        bd.GetAtt(Number.Text, "o2", "oa/qjd", fujian);

                        GridViewBind();
                    }
                    else
                    {
                        dr.Close();
                    }
                }
                else
                {
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }
            }
        }

        public void GridViewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM OA_KQ_QJD02 WHERE SSQID='" + hkdb.GetStr(Request.QueryString["id"]) + "' ORDER BY SPSJ DESC");
            GridView1.DataSource = ds;
            GridView1.DataBind();
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
