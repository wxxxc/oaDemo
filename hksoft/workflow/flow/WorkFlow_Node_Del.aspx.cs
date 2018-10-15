using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.workflow.flow
{
    public partial class WorkFlow_Node_Del : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowNode WHERE fnID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            if (dr.Read())
            {
                fnNum.Text = dr["fnNum"].ToString();
                fnNo.Text = dr["fnNo"].ToString();
            }
            dr.Close();

            //Del流程步骤
            SqlHelper.ExecuteSql("DELETE FROM hk_WorkFlowNode WHERE fnID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");

            //Del条件设置
            SqlHelper.ExecuteSql("DELETE FROM hk_WorkFlowBranch WHERE fbTofnid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");

            //Del线
            SqlHelper.ExecuteSql("DELETE FROM hk_WorkFlowNodeLine WHERE StartNum='" + hkdb.GetStr(fnNum.Text) + "' AND FK_fnno='" + hkdb.GetStr(fnNo.Text) + "'");

            //Del删除线条件设置
            SqlHelper.ExecuteSql("DELETE FROM hk_WorkFlowNodeLine WHERE EndNum='" + hkdb.GetStr(fnNum.Text) + "' AND FK_fnno='" + hkdb.GetStr(fnNo.Text) + "'");

            mydb.Alert_Reload_Close("删除成功");
        }
    }
}
