using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.wpgl
{
    public partial class Folder_L : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            int i = 0;
            int ParentNode;
            int NodeId;
            if (!IsPostBack)
            {
                hkdb.PassTo("10109", "0");

                //定义节点数组 
                TreeNode[] menuNodes = new TreeNode[5001];
                for (i = 0; i <= menuNodes.Length - 1; i++)
                {
                    menuNodes[i] = new TreeNode();
                }

                //循环加载
                SqlDataReader dataR = SqlHelper.ExecuteReader("SELECT DirID,Name,ParentID FROM hk_NetDisk_Dir WHERE UserID='" + this.Session["userid"] + "'");
                while (dataR.Read())
                {
                    ParentNode = (int)dataR["ParentID"];
                    NodeId = (int)dataR["DirID"];
                    menuNodes[NodeId].Text = (string)dataR["Name"];
                    menuNodes[NodeId].NavigateUrl = "folder_r.aspx?ClassID=" + NodeId;
                    menuNodes[NodeId].Target = "rframe10109";
                    if (ParentNode != 0)
                    {
                        //设为子节点 
                        menuNodes[ParentNode].ChildNodes.Add(menuNodes[NodeId]);
                    }
                    else
                    {
                        //直接加载 
                        TreeView1.Nodes.Add(menuNodes[NodeId]);
                    }
                }
                dataR.Close();
            }
        }

        protected void TreeView1_SelectedNodeChanged(object sender, System.EventArgs e)
        {

        }
    }
}
