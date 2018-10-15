using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Pfxm_l : System.Web.UI.Page
    {
        public void Page_Load(object Sender, EventArgs E)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("81102", "0");

                int i = 0;
                int ParentNode;
                int NodeId;
                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT XMID,XMMC,FZ,UPID FROM HR_Kpdf_Pfxm ORDER BY Pxh");
                TreeNode[] menuNodes = new TreeNode[100001];
                for (i = 0; i <= menuNodes.Length - 1; i++)
                {
                    menuNodes[i] = new TreeNode();
                }

                while (datar.Read())
                {
                    ParentNode = Convert.ToInt32(datar["UPID"]);
                    NodeId = Convert.ToInt32(datar["XMID"]);
                    menuNodes[NodeId].Text = datar["XMMC"].ToString() + "(" + datar["FZ"].ToString() + ")";
                    menuNodes[NodeId].NavigateUrl = "Pfxm_r.aspx?id=" + NodeId;
                    menuNodes[NodeId].Target = "rframe81102";
                    if (ParentNode != 0)
                    {
                        menuNodes[ParentNode].ChildNodes.Add(menuNodes[NodeId]);
                    }
                    else
                    {
                        TreeView1.Nodes.Add(menuNodes[NodeId]);
                    }
                }
                datar.Close();
            }
        }

        protected void TreeView1_SelectedNodeChanged(object sender, System.EventArgs e)
        {

        }
    }
}
