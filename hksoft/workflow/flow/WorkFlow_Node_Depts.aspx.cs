using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.workflow.flow
{
    public partial class WorkFlow_Node_Depts : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public string str;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                BindAttr();

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowNode WHERE fnID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (dr.Read())
                {
                    fnNum.Text = dr["fnNum"].ToString();
                    fnName.Text = dr["fnName"].ToString();
                    fnDeptIDs.Text = dr["fnDeptIDs"].ToString();
                    fnDeptNames.Text = dr["fnDeptNames"].ToString();
                }
                dr.Close();
            }
        }

        public void BindAttr()
        {
            fnNum.Attributes.Add("readonly", "readonly");
            fnName.Attributes.Add("readonly", "readonly");
            fnDeptNames.Attributes.Add("readonly", "readonly");
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE hk_WorkFlowNode SET fnDeptIDs='" + hkdb.GetStr(fnDeptIDs.Text) + "',fnDeptNames='" + hkdb.GetStr(fnDeptNames.Text) + "' WHERE fnID='" + int.Parse(Request.QueryString["id"]) + "'");
            mydb.Alert_Reload_Close("保存成功");
        }
    }
}
