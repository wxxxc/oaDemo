using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class ArrangeWork_Mod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowFolder WHERE ffID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (datar1.Read())
                {
                    Name.Text = datar1["ffName"].ToString();
                    txt_ordid.Text = datar1["ffOrdid"].ToString();
                }
                datar1.Close();

                BindAttr();
            }
        }

        public void BindAttr()
        {
            SaveBtn.Attributes["onclick"] = "javascript:return chknull();";
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE hk_WorkFlowFolder SET ffName='" + hkdb.GetStr(Name.Text) + "',ffOrdid='" + hkdb.GetStr(txt_ordid.Text) + "' WHERE ffID='" + int.Parse(Request.QueryString["id"]) + "'");

            mydb.Alert_Parent("保存成功！", "ArrangeWork.aspx");
        }
    }
}
