using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class AddWork : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("1004,10105", "10105");

                BindTree();
            }

            SqlHelper.ExecuteSql("DELETE FROM hk_Work WHERE wStatus='等待送审' AND PromoterID='" + this.Session["UserID"].ToString() + "'");
        }

        private void BindTree()
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT fcID,fcName FROM hk_FormClass ORDER BY fcID DESC");
            while (dr.Read())
            {
                TreeNode OrganizationNode = new TreeNode();
                OrganizationNode.Text = " " + dr["fcName"].ToString();
                OrganizationNode.Value = dr["fcName"].ToString();
                //OrganizationNode.Expanded = false;
                OrganizationNode.SelectAction = TreeNodeSelectAction.Expand;
                OrganizationNode.ImageUrl = "../../Images/tv_par.gif";

                SqlDataReader dr2 = SqlHelper.ExecuteReader("SELECT fID,fName FROM hk_Form WHERE FK_fcid='" + dr["fcID"].ToString() + "' AND (fUserIDs='' OR fUserIDs IS NULL OR CHARINDEX('," + this.Session["userid"].ToString() + ",',','+fUserIDs+',') > 0)");
                while (dr2.Read())
                {
                    TreeNode OrganizationNode1 = new TreeNode();
                    OrganizationNode1.Text = " " + dr2["fName"].ToString();
                    OrganizationNode1.Value = dr2["fID"].ToString();
                    int strId = int.Parse(dr2["fID"].ToString());
                    OrganizationNode1.NavigateUrl = "AddWork_Show.aspx?FormId=" + strId + "";
                    OrganizationNode1.Expanded = false;
                    OrganizationNode1.ImageUrl = "../../Images/tv_chi.gif";
                    OrganizationNode1.Target = "foldersform";
                    OrganizationNode.ChildNodes.Add(OrganizationNode1);
                }
                dr2.Close();

                FormTreeView.Nodes.Add(OrganizationNode);
            }
            dr.Close();
        }
    }
}
