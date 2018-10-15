using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class ArrangeWork : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11405", "11405");

                BindTree(ListTreeView.Nodes, 0);
            }
        }

        private void BindTree(TreeNodeCollection Nds, int IDStr)
        {
            SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowFolder WHERE ffParid=" + IDStr.ToString() + " ORDER BY ffOrdid asc");
            while (datar1.Read())
            {
                if (IDStr == 0)
                {
                    TreeNode OrganizationNode = new TreeNode();
                    OrganizationNode.Text = " " + datar1["ffName"].ToString();
                    OrganizationNode.Value = datar1["ffID"].ToString();
                    int strId = int.Parse(datar1["ffID"].ToString());
                    OrganizationNode.ImageUrl = "../../Images/tv_par.gif";
                    OrganizationNode.NavigateUrl = "ArrangeWork_List.aspx?id=" + strId + "";
                    OrganizationNode.Expanded = false;
                    OrganizationNode.Target = "foldersform";
                    Nds.Add(OrganizationNode);
                    BindTree(Nds[Nds.Count - 1].ChildNodes, strId);
                }
                else
                {
                    TreeNode OrganizationNode = new TreeNode();
                    OrganizationNode.Text = " " + datar1["ffName"].ToString();
                    OrganizationNode.Value = datar1["ffID"].ToString();
                    int strId = int.Parse(datar1["ffID"].ToString());
                    OrganizationNode.ImageUrl = "../../Images/tv_par.gif";
                    OrganizationNode.NavigateUrl = "ArrangeWork_List.aspx?id=" + strId + "";
                    OrganizationNode.Expanded = false;
                    OrganizationNode.Target = "foldersform";
                    Nds.Add(OrganizationNode);
                    BindTree(Nds[Nds.Count - 1].ChildNodes, strId);
                }
            }
            datar1.Close();
        }
    }
}
