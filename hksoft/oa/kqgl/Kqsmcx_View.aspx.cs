using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Kqsmcx_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11726,11730", "0");

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.* FROM OA_KQ_SM01 A WHERE SID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (dr.Read())
                    {
                        lblqdsj.Text = hkdb.GetDate(dr["qdsj"].ToString());
                        ynqd1.Checked = hkdb.GetValueChk_Checked(dr["ynqd1"].ToString());
                        ynqt1.Checked = hkdb.GetValueChk_Checked(dr["ynqt1"].ToString());
                        ynqd2.Checked = hkdb.GetValueChk_Checked(dr["ynqd2"].ToString());
                        ynqt2.Checked = hkdb.GetValueChk_Checked(dr["ynqt2"].ToString());
                        ynqd3.Checked = hkdb.GetValueChk_Checked(dr["ynqd3"].ToString());
                        ynqt3.Checked = hkdb.GetValueChk_Checked(dr["ynqt3"].ToString());
                        lblkqqksm.Text = dr["kqqksm"].ToString();
                        lblsqr.Text = dr["sqrmc"].ToString();
                        sssj.Text = dr["sssj"].ToString();
                        lblspr.Text = dr["jsrNames"].ToString();
                        lblsqbmmc.Text = dr["sqbmmc"].ToString();
                        lblsqsj.Text = dr["sqsj"].ToString();
                        Number.Text = dr["smfj"].ToString();
                        lblsscs.Text = dr["sscs"].ToString();
                        dr.Close();

                        bd.GetAtt(Number.Text, "o3", "oa/kqsm", fujian);

                        GridViewBind();
                    }
                    else
                    {
                        dr.Close();
                        mydb.Alert_Close("此记录不存在,可能已被删除！");
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
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM OA_KQ_SM02 WHERE SSSID='" + hkdb.GetStr(Request.QueryString["id"]) + "' ORDER BY SPSJ DESC");
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
