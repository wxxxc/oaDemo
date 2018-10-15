using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.workflow.flow
{
    public partial class WorkFlow_Seal_Mod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                BindAttr();
            }

            if (!IsPostBack)
            {
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowSeal WHERE fsID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (dr.Read())
                {
                    sealarea.Text = dr["fsName"].ToString();
                    chUserIDs.Text = dr["fsUserIDs"].ToString();
                    chUserNames.Text = dr["fsUserNames"].ToString();
                }
                dr.Close();
            }
        }

        public void BindAttr()
        {
            chUserNames.Attributes.Add("readonly", "readonly");
            sealarea.Attributes.Add("readonly", "readonly");
            SaveBtn.Attributes["onclick"] = "javascript:return chknull();";
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE hk_WorkFlowSeal SET fsUserIDs='" + hkdb.GetStr(chUserIDs.Text) + "',fsUserNames='" + hkdb.GetStr(chUserNames.Text) + "' WHERE fsID='" + int.Parse(Request.QueryString["id"]) + "' ");
            mydb.Alert_Close("保存成功！");
        }
    }
}
