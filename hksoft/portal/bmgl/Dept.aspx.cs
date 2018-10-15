using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.bmgl
{
    public partial class Dept : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("60301", "60301");

                OperQx();

                BindTree(DeptTreeView.Nodes, 0);
            }
        }

        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(AddBtn, "60301a", Session["roleqx"].ToString());
        }

        private void BindTree(TreeNodeCollection Nds, int IDStr)
        {
            SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM BM WHERE BM_SJBM='" + IDStr.ToString() + "' AND JGLB<>'2'");
            while (datar.Read())
            {
                if (IDStr == 0)
                {
                    TreeNode DeptNode = new TreeNode();

                    DeptNode.Text = " " + datar["bm_mc"].ToString();
                    DeptNode.Value = datar["bm_id"].ToString();
                    int strId = int.Parse(datar["bm_id"].ToString());
                    DeptNode.ImageUrl = "../../Images/tv_par.gif";
                    DeptNode.NavigateUrl = "Dept_Show.aspx?id=" + strId + "";
                    DeptNode.Expanded = false;
                    DeptNode.Target = "DeptFrame";
                    Nds.Add(DeptNode);
                    BindTree(Nds[Nds.Count - 1].ChildNodes, strId);
                }
                else
                {
                    TreeNode DeptNode = new TreeNode();

                    DeptNode.Text = " " + datar["bm_mc"].ToString();
                    DeptNode.Value = datar["bm_id"].ToString();
                    int strId = int.Parse(datar["bm_id"].ToString());
                    DeptNode.ImageUrl = "../../Images/tv_chi.gif";
                    DeptNode.NavigateUrl = "Dept_Show.aspx?id=" + strId + "";
                    DeptNode.Expanded = false;
                    DeptNode.Target = "DeptFrame";
                    Nds.Add(DeptNode);
                    BindTree(Nds[Nds.Count - 1].ChildNodes, strId);
                }
            }
            datar.Close();
        }
    }
}
