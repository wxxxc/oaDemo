using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hksoft.choose.oa
{
    public partial class Jggl : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static string showtitle;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                BindTree(ListTreeView.Nodes, 0);

                SqlDataReader mydr = SqlHelper.ExecuteReader("select * from BM");
                if (mydr.Read())
                {
                    showtitle = "";
                }
                else
                {
                    showtitle = "未找到机构名称，请在机构管理中设置";
                }
                mydr.Close();
            }
        }

        private void BindTree(TreeNodeCollection Nds, int IDStr)
        {
            SqlDataReader mydr = SqlHelper.ExecuteReader("select * from BM where bm_sjbm=" + IDStr.ToString() + " order by bm_id asc");
            while (mydr.Read())
            {
                if (IDStr == 0)
                {
                    TreeNode OrganizationNode = new TreeNode();
                    OrganizationNode.Text = " " + mydr["bm_mc"].ToString();
                    OrganizationNode.Value = mydr["bm_id"].ToString();
                    int strId = int.Parse(mydr["bm_id"].ToString());
                    OrganizationNode.ImageUrl = "../../images/oa/tree_par.gif";
                    OrganizationNode.NavigateUrl = "Xzjgmc.aspx?id=" + strId + "";
                    OrganizationNode.Expanded = true;
                    //OrganizationNode.SelectAction = TreeNodeSelectAction.Expand;
                    OrganizationNode.Target = "rform";
                    Nds.Add(OrganizationNode);
                    BindTree(Nds[Nds.Count - 1].ChildNodes, strId);
                }
                else
                {
                    TreeNode OrganizationNode = new TreeNode();
                    OrganizationNode.Text = " " + mydr["bm_mc"].ToString();
                    OrganizationNode.Value = mydr["bm_id"].ToString();
                    int strId = int.Parse(mydr["bm_id"].ToString());
                    OrganizationNode.ImageUrl = "../../images/oa/tree_chi.gif";
                    OrganizationNode.NavigateUrl = "Xzjgmc.aspx?id=" + strId + "";
                    OrganizationNode.Expanded = false;
                    //OrganizationNode.SelectAction = TreeNodeSelectAction.Expand;
                    OrganizationNode.Target = "rform";
                    Nds.Add(OrganizationNode);
                    BindTree(Nds[Nds.Count - 1].ChildNodes, strId);
                }
            }
            mydr.Close();
        }
    }
}