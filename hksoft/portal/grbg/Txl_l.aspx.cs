using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.grbg
{
    public partial class Txl_l : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                BindTree(ListTreeView.Nodes, 0);
            }
        }

        private void BindTree(TreeNodeCollection Nds, int IDStr)
        {
            SqlDataReader mydr = SqlHelper.ExecuteReader("select * from hk_Ygtxl_lb where ParentNodesID=" + IDStr.ToString() + " order by PxNum asc");
            while (mydr.Read())
            {
                if (IDStr == 0)
                {
                    TreeNode OrganizationNode = new TreeNode();
                    OrganizationNode.Value = mydr["ID"].ToString();
                    int strId = int.Parse(mydr["ID"].ToString());
                    OrganizationNode.ImageUrl = "../../images/portal/parent.gif";
                    OrganizationNode.Text = " <a href='txl_r.aspx?typeId=" + strId + "' target='rformtxl' class=gvlink>" + mydr["name"].ToString() + "</a>";
                    OrganizationNode.Expanded = true;
                    OrganizationNode.Target = "rformtxl";
                    Nds.Add(OrganizationNode);
                    BindTree(Nds[Nds.Count - 1].ChildNodes, strId);
                }
                else
                {
                    TreeNode OrganizationNode = new TreeNode();
                    OrganizationNode.Value = mydr["ID"].ToString();
                    int strId = int.Parse(mydr["ID"].ToString());
                    OrganizationNode.ImageUrl = "../../images/portal/child.gif";
                    OrganizationNode.Text = " <a href='txl_r.aspx?typeId=" + strId + "' target='rformtxl' class=gvlink>" + mydr["name"].ToString() + "</a>";
                    OrganizationNode.Expanded = false;
                    OrganizationNode.Target = "rformtxl";
                    Nds.Add(OrganizationNode);
                    BindTree(Nds[Nds.Count - 1].ChildNodes, strId);
                }
            }
            mydr.Close();
        }
    }
}