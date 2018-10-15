using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.workflow.flow
{
    public partial class WorkFlow_Node_Users : System.Web.UI.Page
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
                    fnUserIDs.Text = dr["fnUserIDs"].ToString();
                    fnUserNames.Text = dr["fnUserNames"].ToString();
                }
                dr.Close();
            }
        }

        public void BindAttr()
        {
            fnNum.Attributes.Add("readonly", "readonly");
            fnName.Attributes.Add("readonly", "readonly");
            fnUserNames.Attributes.Add("readonly", "readonly");
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE hk_WorkFlowNode SET fnUserIDs='" + hkdb.GetStr(fnUserIDs.Text) + "',fnUserNames='" + hkdb.GetStr(fnUserNames.Text) + "' WHERE fnID='" + int.Parse(Request.QueryString["id"]) + "'");
            mydb.Alert_Reload_Close("保存成功");
        }
    }
}
