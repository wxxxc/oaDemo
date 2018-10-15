using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.flow
{
    public partial class WorkFlowManage : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10908", "10908");

                BindTree();
            }
        }

        private void BindTree()
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT fcID,fcName FROM hk_FormClass ORDER BY fcID DESC");
            while (dr.Read())
            {
                TreeNode OrganizationNode = new TreeNode();
                OrganizationNode.Text = " " + dr["fcName"].ToString();
                OrganizationNode.Value = dr["fcName"].ToString();
                OrganizationNode.Expanded = false;
                OrganizationNode.SelectAction = TreeNodeSelectAction.Expand;
                OrganizationNode.ImageUrl = "../../Images/tv_par.gif";

                SqlDataReader dr2 = SqlHelper.ExecuteReader("SELECT fID,fName FROM hk_Form WHERE FK_fcid='" + dr["fcID"].ToString() + "'");
                while (dr2.Read())
                {
                    TreeNode OrganizationNode1 = new TreeNode();

                    OrganizationNode1.Text = " " + dr2["fName"].ToString();
                    OrganizationNode1.Value = dr2["fID"].ToString();
                    int strId = int.Parse(dr2["fID"].ToString());
                    OrganizationNode1.NavigateUrl = "WorkFlow.aspx?FormId=" + strId + "";
                    OrganizationNode1.Expanded = false;
                    OrganizationNode1.ImageUrl = "../../Images/tv_chi.gif";
                    OrganizationNode1.Target = "FormFrame";

                    OrganizationNode.ChildNodes.Add(OrganizationNode1);
                }
                dr2.Close();

                FormTreeView.Nodes.Add(OrganizationNode);
            }
            dr.Close();
        }
    }
}
