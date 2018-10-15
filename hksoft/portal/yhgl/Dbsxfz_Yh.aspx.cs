using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.yhgl
{
    public partial class Dbsxfz_Yh : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        protected void Page_Load(object sender, System.EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("60306", "0");

                labTitle.Text = Request.QueryString["gname"];

                if (Request.QueryString["tid"].ToString() == "G")
                {
                    lbltid.Text = "供应商";
                    lstAllPosition.Enabled = false;
                    cmdAddPositon.Enabled = false;
                    cmdDeletePosition.Enabled = false;
                    lstCurPosition.Enabled = false;
                }
                else
                {
                    lbltid.Text = "企业";
                }

                ListBoxBind();
            }
        }

        //绑定
        public void ListBoxBind()
        {
            InitCurRole();
            InitAllRole();

            InitCurPosition();
            InitAllPosition();

            InitCurStaff();
            InitAllStaff();

            InitAllMember();
        }

        //已选角色
        public void InitCurRole()
        {
            lstCurRole.Items.Clear();
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT B.ROLE_ID,B.ROLE_NAME FROM HK_GROUPS_USER A ,JS B WHERE A.OBJ_ID = B.ROLE_ID AND A.SSGID = " + hkdb.GetStr(Request.QueryString["id"]) + " AND A.OBJ_TYPE = 3");
            while (dr.Read())
            {
                ListItem item = new ListItem();
                lstCurRole.Items.Add(new ListItem(dr["role_name"].ToString(), dr["role_id"].ToString()));
            }
            dr.Close();
        }

        //全部角色
        public void InitAllRole()
        {
            lstAllRole.Items.Clear();
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT ROLE_ID,ROLE_NAME FROM JS WHERE ROLE_LX='" + lbltid.Text + "' AND ROLE_ID NOT IN (SELECT B.ROLE_ID FROM HK_GROUPS_USER A,JS B WHERE A.OBJ_ID = B.ROLE_ID AND A.SSGID = " + hkdb.GetStr(Request.QueryString["id"]) + " AND A.OBJ_TYPE =3)");
            while (dr.Read())
            {
                lstAllRole.Items.Add(new ListItem(dr["role_name"].ToString(), dr["role_id"].ToString()));
            }
            dr.Close();
        }

        //已选职位
        public void InitCurPosition()
        {
            lstCurPosition.Items.Clear();
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT B.ZWID,B.ZWMC FROM HK_GROUPS_USER A ,ZW B WHERE A.OBJ_ID = B.ZWID AND A.SSGID = " + hkdb.GetStr(Request.QueryString["id"]) + " AND A.OBJ_TYPE =1");
            while (dr.Read())
            {
                ListItem item = new ListItem();
                lstCurPosition.Items.Add(new ListItem(dr["zwmc"].ToString(), dr["zwid"].ToString()));
            }
            dr.Close();
        }

        //全部职位
        public void InitAllPosition()
        {
            lstAllPosition.Items.Clear();
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT ZWID,ZWMC FROM ZW WHERE ZWID NOT IN (SELECT B.ZWID FROM HK_GROUPS_USER A,ZW B WHERE A.OBJ_ID = B.ZWID AND A.SSGID = " + hkdb.GetStr(Request.QueryString["id"]) + " AND A.OBJ_TYPE =1)");
            while (dr.Read())
            {
                lstAllPosition.Items.Add(new ListItem(dr["zwmc"].ToString(), dr["zwid"].ToString()));
            }
            dr.Close();
        }

        //已选人员
        public void InitCurStaff()
        {
            lstCurStaff.Items.Clear();
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT B.UI_ID,B.UI_DESC FROM HK_GROUPS_USER A,YH B WHERE A.OBJ_ID = B.UI_ID AND A.SSGID = " + hkdb.GetStr(Request.QueryString["id"]) + " AND A.OBJ_TYPE = 4");
            while (dr.Read())
            {
                ListItem item = new ListItem();
                lstCurStaff.Items.Add(new ListItem(dr["ui_desc"].ToString(), dr["ui_id"].ToString()));
            }
            dr.Close();
        }

        //全部人员
        public void InitAllStaff()
        {
            lstAllStaff.Items.Clear();
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT UI_ID,UI_DESC FROM YH WHERE UI_ID NOT IN (SELECT B.UI_ID FROM HK_GROUPS_USER A,YH B WHERE A.OBJ_ID = B.UI_ID AND A.SSGID = " + hkdb.GetStr(Request.QueryString["id"]) + " AND A.OBJ_TYPE = 4) AND UI_LX='" + lbltid.Text + "' AND UI_STATUS='正常'");
            while (dr.Read())
            {
                lstAllStaff.Items.Add(new ListItem(dr["ui_desc"].ToString(), dr["ui_id"].ToString()));
            }
            dr.Close();
        }

        //所有选定人员
        public void InitAllMember()
        {
            lstAllMember.Items.Clear();
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT B.* FROM V_GROUPS_USER A,YH B WHERE A.UI_ID = B.UI_ID AND A.SSGID = " + hkdb.GetStr(Request.QueryString["id"]) + "");
            while (dr.Read())
            {
                lstAllMember.Items.Add(new ListItem(dr["ui_desc"].ToString(), dr["ui_id"].ToString()));
            }
            dr.Close();
        }

        //添加已选角色 
        protected void cmdAdd_Click(object sender, System.EventArgs e)
        {
            if (lstAllRole.SelectedIndex >= 0)
            {
                //ListItem li = default(ListItem);
                foreach (ListItem li in lstAllRole.Items)
                {
                    if (li.Selected == true)
                    {
                        SqlHelper.ExecuteSql("INSERT INTO HK_GROUPS_USER (SSGID,OBJ_ID,OBJ_TYPE) VALUES(" + hkdb.GetStr(Request.QueryString["id"]) + ",'" + li.Value + "',3)");
                    }
                }
                ListBoxBind();
            }
        }

        //删除已选角色
        protected void cmdDelete_Click(object sender, System.EventArgs e)
        {
            if (lstCurRole.SelectedIndex >= 0)
            {
                //ListItem li = default(ListItem);
                foreach (ListItem li in lstCurRole.Items)
                {
                    if (li.Selected == true)
                    {
                        SqlHelper.ExecuteSql("DELETE FROM HK_GROUPS_USER WHERE SSGID = " + hkdb.GetStr(Request.QueryString["id"]) + " AND OBJ_ID = '" + li.Value + "' AND OBJ_TYPE =3");
                    }
                }
                ListBoxBind();
            }
        }

        //添加已选职位
        protected void cmdAddPositon_Click(object sender, System.EventArgs e)
        {
            if (lstAllPosition.SelectedIndex >= 0)
            {
                //ListItem li = default(ListItem);
                foreach (ListItem li in lstAllPosition.Items)
                {
                    if (li.Selected == true)
                    {
                        SqlHelper.ExecuteSql("INSERT INTO HK_GROUPS_USER (SSGID,OBJ_ID,OBJ_TYPE) VALUES(" + hkdb.GetStr(Request.QueryString["id"]) + ",'" + li.Value + "',1)");
                    }
                }
                ListBoxBind();
            }
        }

        //删除已选职位
        protected void cmdDeletePosition_Click(object sender, System.EventArgs e)
        {
            if (lstCurPosition.SelectedIndex >= 0)
            {
                //ListItem li = default(ListItem);
                foreach (ListItem li in lstCurPosition.Items)
                {
                    if (li.Selected == true)
                    {
                        SqlHelper.ExecuteSql("DELETE FROM HK_GROUPS_USER WHERE SSGID = " + hkdb.GetStr(Request.QueryString["id"]) + " AND OBJ_ID = '" + li.Value + "' AND OBJ_TYPE =1");
                    }
                }
                ListBoxBind();
            }
        }

        //添加已选人员
        protected void cmdAddStaff_Click(object sender, System.EventArgs e)
        {
            if (lstAllStaff.SelectedIndex >= 0)
            {
                //ListItem li = default(ListItem);
                foreach (ListItem li in lstAllStaff.Items)
                {
                    if (li.Selected == true)
                    {
                        SqlHelper.ExecuteSql("INSERT INTO HK_GROUPS_USER (SSGID,OBJ_ID,OBJ_TYPE) VALUES(" + hkdb.GetStr(Request.QueryString["id"]) + ",'" + li.Value + "',4)");
                    }
                }
                ListBoxBind();
            }
        }

        //删除已选人员
        protected void cmdDeleteStaff_Click(object sender, System.EventArgs e)
        {
            if (lstCurStaff.SelectedIndex >= 0)
            {
                //ListItem li = default(ListItem);
                foreach (ListItem li in lstCurStaff.Items)
                {
                    if (li.Selected == true)
                    {
                        SqlHelper.ExecuteSql("DELETE FROM HK_GROUPS_USER WHERE SSGID = " + hkdb.GetStr(Request.QueryString["id"]) + " AND OBJ_ID = '" + li.Value + "' AND OBJ_TYPE =4");
                    }
                }
                ListBoxBind();
            }
        }
    }
}
