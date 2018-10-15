using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class wdzsModule : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10111", "10111");

                BindTree("2");
            }
        }

        private void BindTree(string key)
        {
            FormTreeView.Nodes.Clear();
            if (key == "1")
            {
                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KlClass  order by id desc");
                while (datar.Read())
                {
                    SqlDataReader dr = SqlHelper.ExecuteReader("select * from OA_KnowLedge  where BigId='" + datar["id"] + "' and Username='" + this.Session["userid"] + "'");
                    if (dr.Read())
                    {
                        TreeNode OrganizationNode = new TreeNode();

                        OrganizationNode.Text = " " + datar["Name"].ToString();
                        OrganizationNode.Value = datar["Name"].ToString();
                        OrganizationNode.Expanded = false;
                        OrganizationNode.SelectAction = TreeNodeSelectAction.Expand;
                        OrganizationNode.ImageUrl = "../../Images/tv_par.gif";

                        SqlDataReader dr1 = SqlHelper.ExecuteReader("select id,Name from OA_KlClassSub where BigId='" + datar["id"].ToString() + "' and ((CHARINDEX('," + this.Session["userid"].ToString() + ",',','+SyUsername+',')   >   0 ) or SyUsername='全部用户')");
                        while (dr1.Read())
                        {
                            SqlDataReader dr2 = SqlHelper.ExecuteReader("select count(id) as nums from  OA_KnowLedge where LittleId='" + dr1["id"] + "' and Username='" + this.Session["userid"] + "' ");
                            string Counts = "";
                            if (dr2.Read())
                            {
                                Counts = dr2["nums"].ToString();
                            }
                            dr2.Close();

                            SqlDataReader dr3 = SqlHelper.ExecuteReader("select * from OA_KnowLedge  where LittleId='" + dr1["id"] + "' and Username='" + this.Session["userid"] + "' order by id desc");
                            if (dr3.Read())
                            {
                                TreeNode OrganizationNode1 = new TreeNode();

                                OrganizationNode1.Text = " " + dr1["Name"].ToString() + "(" + Counts + ")";
                                OrganizationNode1.Value = dr1["ID"].ToString();
                                int strId = int.Parse(dr1["ID"].ToString());
                                OrganizationNode1.NavigateUrl = "wdzs.aspx?LittleId=" + strId + "";
                                OrganizationNode1.Expanded = false;
                                OrganizationNode1.ImageUrl = "../../Images/tv_chi.gif";
                                OrganizationNode1.Target = "FormFrame";

                                OrganizationNode.ChildNodes.Add(OrganizationNode1);
                            }
                            dr3.Close();
                        }
                        dr1.Close();
                        FormTreeView.Nodes.Add(OrganizationNode);
                    }
                    dr.Close();
                }
                datar.Close();

            }
            else
            {
                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KlClass  order by id desc");
                while (datar.Read())
                {
                    TreeNode OrganizationNode = new TreeNode();
                    OrganizationNode.Text = " " + datar["Name"].ToString();
                    OrganizationNode.Value = datar["Name"].ToString();
                    OrganizationNode.Expanded = false;
                    OrganizationNode.SelectAction = TreeNodeSelectAction.Expand;
                    OrganizationNode.ImageUrl = "../../Images/tv_par.gif";

                    SqlDataReader dr = SqlHelper.ExecuteReader("select id,Name from OA_KlClassSub where BigId='" + datar["id"].ToString() + "'  and ((CHARINDEX('," + this.Session["userid"].ToString() + ",',','+SyUsername+',')   >   0 ) or SyUsername='全部用户')");
                    while (dr.Read())
                    {
                        SqlDataReader dr2 = SqlHelper.ExecuteReader("select count(id) as nums from  OA_KnowLedge where LittleId='" + dr["id"] + "' and Username='" + this.Session["userid"] + "' ");
                        string Counts = "";
                        if (dr2.Read())
                        {
                            Counts = dr2["nums"].ToString();
                        }
                        dr2.Close();

                        TreeNode OrganizationNode1 = new TreeNode();

                        OrganizationNode1.Text = " " + dr["Name"].ToString() + "(" + Counts + ")";
                        OrganizationNode1.Value = dr["ID"].ToString();
                        int strId = int.Parse(dr["ID"].ToString());
                        OrganizationNode1.NavigateUrl = "wdzs.aspx?LittleId=" + strId + "";
                        OrganizationNode1.Expanded = false;
                        OrganizationNode1.ImageUrl = "../../Images/tv_chi.gif";
                        OrganizationNode1.Target = "FormFrame";

                        OrganizationNode.ChildNodes.Add(OrganizationNode1);

                    }
                    dr.Close();
                    FormTreeView.Nodes.Add(OrganizationNode);
                }
                datar.Close();
            }
        }

        protected void Btnd_Click(object sender, EventArgs e)
        {
            BindTree("1");
        }

        protected void BtnA_Click(object sender, EventArgs e)
        {
            BindTree("2");
        }

    }
}
