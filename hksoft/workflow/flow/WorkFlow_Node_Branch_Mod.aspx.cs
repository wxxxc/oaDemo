using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.workflow.flow
{
    public partial class WorkFlow_Node_Branch_Mod : System.Web.UI.Page
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
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.*,B.fName,C.wfName FROM hk_WorkFlowBranch A LEFT OUTER JOIN hk_Form B ON(A.FK_fid=B.fID) LEFT OUTER JOIN hk_WorkFlow C ON(A.FK_wfid=C.wfID) WHERE fbID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (dr.Read())
                {
                    lblfid.Text = dr["FK_fid"].ToString();
                    FormNumber.Text = dr["FK_fno"].ToString();
                    lblfname.Text = dr["fName"].ToString();
                    lblwfid.Text = dr["FK_wfid"].ToString();
                    lblwfno.Text = dr["FK_wfno"].ToString();
                    lblwfname.Text = dr["wfName"].ToString();
                    lblno.Text = dr["fbNo"].ToString();
                    fbName.Text = dr["fbName"].ToString();
                    fbType.Text = dr["fbType"].ToString();
                    fbCondi.SelectedValue = dr["fbCondi"].ToString();
                    fbValue.Text = dr["fbValue"].ToString();
                }
                dr.Close();
            }
        }

        public void BindAttr()
        {
            fbName.Attributes.Add("readonly", "readonly");
            fbType.Attributes.Add("readonly", "readonly");

            SaveBtn.Attributes["onclick"] = "javascript:return chknull();";
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE hk_WorkFlowBranch SET fbNo='" + lblno.Text + "',fbName='" + hkdb.GetStr(fbName.Text) + "',fbType='" + hkdb.GetStr(fbType.Text) + "',fbCondi='" + fbCondi.SelectedValue + "' ,fbValue='" + hkdb.GetStr(fbValue.Text) + "' WHERE fbID='" + int.Parse(Request.QueryString["id"]) + "' ");
            mydb.Alert_Close("提交成功！");
        }
    }
}
