using System;
using System.Collections;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.Choose_A.portal
{
    public partial class ChooseUser : System.Web.UI.Page
    {
        public string str, strNew, strUser, rqstrNew, strList;
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("0");

            if (!IsPostBack)
            {
                DataBindToDownList("按部门");   //缺省
                tbType.Text = "按部门";
                BindTreeView(DeptTreeView.Nodes, 0);

                //取得已选人员
                rqstr.Text = Server.UrlDecode(Request.QueryString["rqstr"].ToString());
                rqstrNew = "" + rqstr.Text + "";
                ArrayList arr = new ArrayList();
                string[] mystr = rqstrNew.Split(',');
                for (int s = 0; s < mystr.Length; s++)
                {
                    strList += "'" + mystr[s] + "',";
                }
                strList += "'0'";

                //显示已选人员
                if (Request.QueryString["rqstr"] != null)
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT ui_id,ui_desc FROM yh WHERE ui_id IN (" + strList + ")");
                    while (datar.Read())
                    {
                        ListItem theItem = new ListItem();
                        theItem.Text = datar["ui_desc"].ToString();
                        theItem.Value = datar["ui_id"].ToString();
                        SelectedListBox.Items.Add(theItem);
                    }
                    datar.Close();
                }
            }
        }

        public void DataBindToDownList(string sqlType)
        {
            if (sqlType == "按人员")
            {
                QueryListBox.Items.Clear();
                SelectListBox.Items.Clear();

                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT ui_id,ui_desc FROM yh WHERE ui_lx='企业' ");
                while (datar.Read())
                {
                    ListItem theItem = new ListItem();
                    theItem.Text = datar["ui_desc"].ToString();
                    theItem.Value = datar["ui_id"].ToString();
                    SelectListBox.Items.Add(theItem);
                }
                datar.Close();
            }

            if (sqlType == "按部门")
            {
                SelectListBox.Items.Clear();
                QueryListBox.Items.Clear();

                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT bm_id,bm_mc FROM BM");
                while (datar.Read())
                {
                    ListItem theItem = new ListItem();
                    theItem.Text = datar["bm_mc"].ToString();
                    theItem.Value = datar["bm_id"].ToString();
                    QueryListBox.Items.Add(theItem);
                }
                datar.Close();

                /*默认显示当前用户所属部门的人员*/
                SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT ui_id,ui_desc FROM yh WHERE ui_lx='企业' and ui_ssbm='" + this.Session["Deptid"] + "'");
                while (datar2.Read())
                {
                    ListItem theItem = new ListItem();
                    theItem.Text = datar2["ui_desc"].ToString();
                    theItem.Value = datar2["ui_id"].ToString();
                    SelectListBox.Items.Add(theItem);
                }
                datar2.Close();
            }

            if (sqlType == "按角色")
            {
                SelectListBox.Items.Clear();
                QueryListBox.Items.Clear();

                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT role_id,role_name FROM JS");
                while (datar.Read())
                {
                    ListItem theItem = new ListItem();
                    theItem.Text = datar["role_name"].ToString();
                    theItem.Value = datar["role_id"].ToString();
                    QueryListBox.Items.Add(theItem);
                }
                datar.Close();
            }

            if (sqlType == "按职位")
            {
                SelectListBox.Items.Clear();
                QueryListBox.Items.Clear();

                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT zwid,zwmc FROM ZW");
                while (datar.Read())
                {
                    ListItem theItem = new ListItem();
                    theItem.Text = datar["zwmc"].ToString();
                    theItem.Value = datar["zwid"].ToString();
                    QueryListBox.Items.Add(theItem);
                }
                datar.Close();
            }

            if (sqlType == "按群组")
            {
                SelectListBox.Items.Clear();
                QueryListBox.Items.Clear();

                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT qzid,qzmc FROM hk_QZDA WHERE cjr='" + this.Session["userid"] + "' AND QZLX='通用群组'");
                while (datar.Read())
                {
                    ListItem theItem = new ListItem();
                    theItem.Text = datar["qzmc"].ToString();
                    theItem.Value = datar["qzid"].ToString();
                    QueryListBox.Items.Add(theItem);
                }
                datar.Close();
            }
        }

        //部门
        private void BindTreeView(TreeNodeCollection Nds, int IDStr)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT bm_id,bm_mc FROM BM WHERE bm_sjbm='" + IDStr.ToString() + "'");
            while (dr.Read())
            {
                if (IDStr == 0)
                {
                    TreeNode OrganizationNode = new TreeNode();

                    OrganizationNode.Text = " " + dr["bm_mc"].ToString();
                    OrganizationNode.Value = dr["bm_id"].ToString();
                    int strId = int.Parse(dr["bm_id"].ToString());
                    OrganizationNode.ImageUrl = "../../Images/tv_par.gif";
                    //OrganizationNode.Expanded = false;
                    Nds.Add(OrganizationNode);
                    BindTreeView(Nds[Nds.Count - 1].ChildNodes, strId);
                }
                else
                {
                    TreeNode OrganizationNode = new TreeNode();

                    OrganizationNode.Text = " " + dr["bm_mc"].ToString();
                    OrganizationNode.Value = dr["bm_id"].ToString();
                    int strId = int.Parse(dr["bm_id"].ToString());
                    OrganizationNode.ImageUrl = "../../Images/tv_chi.gif";
                    //OrganizationNode.Expanded = false;
                    Nds.Add(OrganizationNode);
                    BindTreeView(Nds[Nds.Count - 1].ChildNodes, strId);
                }
            }
            dr.Close();
        }

        //待选人员
        public void BindUser(string sqlType)
        {
            if (tbType.Text == "按部门")
            {
                SelectListBox.Items.Clear();

                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT ui_id,ui_desc FROM yh WHERE ui_ssbm='" + DeptTreeView.SelectedValue + "'");
                while (datar.Read())
                {
                    ListItem theItem = new ListItem();
                    theItem.Text = datar["ui_desc"].ToString();
                    theItem.Value = datar["ui_id"].ToString();
                    SelectListBox.Items.Add(theItem);
                }
                datar.Close();
            }

            if (tbType.Text == "按角色")
            {
                SelectListBox.Items.Clear();

                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT ui_id,ui_desc FROM yh WHERE ui_role='" + QueryListBox.SelectedValue + "'");
                while (datar.Read())
                {
                    ListItem theItem = new ListItem();
                    theItem.Text = datar["ui_desc"].ToString();
                    theItem.Value = datar["ui_id"].ToString();
                    SelectListBox.Items.Add(theItem);
                }
                datar.Close();
            }

            if (tbType.Text == "按职位")
            {
                SelectListBox.Items.Clear();

                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT ui_id,ui_desc FROM yh WHERE ui_zw='" + QueryListBox.SelectedValue + "'");
                while (datar.Read())
                {
                    ListItem theItem = new ListItem();
                    theItem.Text = datar["ui_desc"].ToString();
                    theItem.Value = datar["ui_id"].ToString();
                    SelectListBox.Items.Add(theItem);
                }
                datar.Close();
            }

            if (tbType.Text == "按群组")
            {
                SelectListBox.Items.Clear();

                string strQzcy = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qzcyid FROM hk_QZDA WHERE QZID='" + QueryListBox.SelectedValue + "'"));
                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT ui_id,ui_desc FROM yh WHERE CHARINDEX(ui_id,'" + strQzcy + "')>0 ");
                while (datar.Read())
                {
                    ListItem theItem = new ListItem();
                    theItem.Text = datar["ui_desc"].ToString();
                    theItem.Value = datar["ui_id"].ToString();
                    SelectListBox.Items.Add(theItem);
                }
                datar.Close();
            }
        }

        //全选
        protected void mSelect_Click(object sender, EventArgs e)
        {
            if (SelectListBox.Items.Count > 0)
            {
                //原写法：不判断重复
                //foreach (ListItem MyItem in SelectListBox.Items)
                //    SelectedListBox.Items.Add(MyItem);
                //SelectListBox.Items.Clear();

                //新写法：判断重复
                foreach (ListItem MyItem in SelectListBox.Items)
                {
                    if (SelectedListBox.Items.IndexOf(MyItem) >= 0)
                    {
                        //this.Response.Write("<script language=javascript>alert('此人员已经选择！');</script>");
                        //return;
                    }
                    else
                    {
                        SelectedListBox.Items.Add(MyItem);
                    }
                }

                SelectListBox.Items.Clear();
            }
        }


        //单选
        protected void sSelect_Click(object sender, EventArgs e)
        {
            int i = 0;

            while (i <= SelectListBox.Items.Count - 1)
            {
                if (SelectListBox.Items[i].Selected)
                {
                    if (SelectedListBox.Items.IndexOf(SelectListBox.Items[i]) >= 0)
                    {
                        this.Response.Write("<script language=javascript>alert('此人员已经选择！');</script>");
                        return;
                    }

                    SelectedListBox.Items.Add(new ListItem(SelectListBox.Items[i].Text, SelectListBox.Items[i].Value));
                    SelectListBox.Items.Remove(SelectListBox.Items[i]);
                }
                else
                    i += 1;
            }
        }

        //单消
        protected void sNoSelect_Click(object sender, EventArgs e)
        {
            int i = 0;

            while (i <= SelectedListBox.Items.Count - 1)
            {
                if (SelectedListBox.Items[i].Selected)
                {
                    SelectListBox.Items.Add(new ListItem(SelectedListBox.Items[i].Text, SelectedListBox.Items[i].Value));
                    SelectedListBox.Items.Remove(SelectedListBox.Items[i]);
                }
                else
                    i += 1;
            }
        }

        //全消
        protected void mNoSelect_Click(object sender, EventArgs e)
        {
            if (SelectedListBox.Items.Count > 0)
            {
                foreach (ListItem MyItem in SelectedListBox.Items)
                    SelectListBox.Items.Add(MyItem);

                SelectedListBox.Items.Clear();
            }
        }

        //按人员
        protected void User_Click(object sender, EventArgs e)
        {
            tbType.Text = null;
            SelectListBox.Items.Clear();
            DataBindToDownList("按人员");
            tbType.Text = "按人员";
            QueryListBox.Visible = true;
            DeptTreeView.Visible = false;
            p_dept.Visible = false;
        }

        //按部门
        protected void Dept_Click(object sender, EventArgs e)
        {
            tbType.Text = null;
            SelectListBox.Items.Clear();
            tbType.Text = "按部门";
            QueryListBox.Visible = false;
            DeptTreeView.Visible = true;
            p_dept.Visible = true;
        }

        //按角色
        protected void Role_Click(object sender, EventArgs e)
        {
            tbType.Text = null;
            SelectListBox.Items.Clear();
            DataBindToDownList("按角色");
            tbType.Text = "按角色";
            QueryListBox.Visible = true;
            DeptTreeView.Visible = false;
            p_dept.Visible = false;
        }

        //按职位
        protected void Posi_Click(object sender, EventArgs e)
        {
            tbType.Text = null;
            SelectListBox.Items.Clear();
            DataBindToDownList("按职位");
            tbType.Text = "按职位";
            QueryListBox.Visible = true;
            DeptTreeView.Visible = false;
            p_dept.Visible = false;
        }

        //按群组
        protected void Qz_Click(object sender, EventArgs e)
        {
            tbType.Text = null;
            SelectListBox.Items.Clear();
            DataBindToDownList("按群组");
            tbType.Text = "按群组";
            QueryListBox.Visible = true;
            DeptTreeView.Visible = false;
            p_dept.Visible = false;
        }

        protected void QueryListBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindUser(QueryListBox.SelectedValue);
        }

        protected void DeptTreeView_SelectedNodeChanged(object sender, EventArgs e)
        {
            BindUser(DeptTreeView.SelectedValue);
        }
    }
}
