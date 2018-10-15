using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.mkgl
{
    public partial class Mk_l : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("60101", "0");

                string Sql = " where modu_lx<>'G'";
                if (this.Session["systype"].ToString() == "A")     //主登录页
                {
                    string str = null;
                    SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT ProduID FROM hk_Init");
                    while (datar1.Read())
                    {
                        str = str + "','" + datar1["ProduID"].ToString();
                    }
                    datar1.Close();

                    Sql = Sql + " and modu_lx in ('" + str + "')";
                }
                else  //子登录页
                {
                    Sql = Sql + " and (modu_lx='" + this.Session["systype"] + "' or modu_lx='P')";
                }

                int i = 0;
                int ParentNode;
                int NodeId;
                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT MODU_ID,MODU_MC,MODU_UPID FROM hk_Modu " + Sql + " ORDER BY ORDERID");
                TreeNode[] menuNodes = new TreeNode[100001];
                for (i = 0; i <= menuNodes.Length - 1; i++)
                {
                    menuNodes[i] = new TreeNode();
                }

                while (datar.Read())
                {
                    ParentNode = Convert.ToInt32(datar["modu_upid"]);
                    NodeId = Convert.ToInt32(datar["modu_id"]);
                    menuNodes[NodeId].Text = (string)datar["modu_mc"];
                    menuNodes[NodeId].NavigateUrl = "mk_r.aspx?ClassID=" + NodeId;
                    menuNodes[NodeId].Target = "rframe60101";
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