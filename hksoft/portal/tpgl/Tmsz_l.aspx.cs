using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.tpgl
{
    public partial class Tmsz_l : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            int i = 0;
            int NodeId;
            if (!IsPostBack)
            {
                hkdb.PassTo("11307", "0");

                SqlDataReader dataR = SqlHelper.ExecuteReader("SELECT ID,PROJECTNAME,PROJECTTYPE FROM HK_POLL_PROJECT ORDER BY PROJECTTYPE,ID");
                TreeNode[] menuNodes = new TreeNode[1001];
                for (i = 0; i <= menuNodes.Length - 1; i++)
                {
                    menuNodes[i] = new TreeNode();
                }

                while (dataR.Read())
                {
                    NodeId = (int)dataR["id"];
                    menuNodes[NodeId].Text = "[" + dataR["ProjectType"].ToString() + "]" + dataR["ProjectName"].ToString();
                    menuNodes[NodeId].NavigateUrl = "tmsz_r.aspx?ClassID=" + dataR["ProjectName"].ToString() + "&id=" + NodeId + "";
                    menuNodes[NodeId].Target = "rframe11307";
                    TreeView1.Nodes.Add(menuNodes[NodeId]);
                }
                dataR.Close();
            }
        }

        protected void TreeView1_SelectedNodeChanged(object sender, System.EventArgs e)
        {

        }
    }
}