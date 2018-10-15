using System;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Web;
using System.Web.Security;
using FineUI;
using haoke365;
using Newtonsoft.Json.Linq;

namespace hksoft
{
    public partial class Main : PageBase
    {
        #region Page_Init

        protected void Page_Init(object sender, EventArgs e)
        {
            //菜单样式
            string menuType = "menu";
            HttpCookie menuCookie = Request.Cookies["MenuStyle_v4"];
            if (menuCookie != null)
            {
                menuType = menuCookie.Value;
            }

            // 注册客户端脚本，服务器端控件ID和客户端ID的映射关系
            JObject ids = GetClientIDS(btnExpandAll, btnCollapseAll, mainTabStrip, leftRegion, menuSettings, txtUser, btnRefresh, RegionPanel1, Region1);

            Tree treeMenu = InitTreeMenu();
            ids.Add("mainMenu", treeMenu.ClientID);
            ids.Add("menuType", "menu");

            //主题
            ids.Add("theme", PageManager.Instance.Theme.ToString());

            //个人选项1-个人设定
            MenuButton menuItem1 = new MenuButton();
            menuItem1.EnablePostBack = false;
            menuItem1.Text = "个人设定";
            menuItem1.Icon = IconHelper.String2Icon("Wrench", true);
            menuItem1.OnClientClick = String.Format("addExampleTab('{0}','{1}','{2}')", "MenuHyperLink1", "MySet.aspx", "个人设定");
            btnMenu.Menu.Items.Add(menuItem1);

            //个人选项2-消息设置
            MenuButton menuItem2 = new MenuButton();
            menuItem2.EnablePostBack = false;
            menuItem2.Text = "消息设置";
            menuItem2.Icon = IconHelper.String2Icon("WrenchOrange", true);
            menuItem2.OnClientClick = String.Format("addExampleTab('{0}','{1}','{2}')", "MenuHyperLink2", "XxSet.aspx", "消息设置");
            btnMenu.Menu.Items.Add(menuItem2);

            //个人选项3-修改密码
            MenuButton menuItem3 = new MenuButton();
            menuItem3.EnablePostBack = false;
            menuItem3.Text = "修改密码";
            menuItem3.Icon = IconHelper.String2Icon("TagRed", true);
            menuItem3.OnClientClick = String.Format("addExampleTab('{0}','{1}','{2}')", "MenuHyperLink3", "Mod_Pwd.aspx", "修改密码");
            btnMenu.Menu.Items.Add(menuItem3);

            //个人选项4-修改资料
            MenuButton menuItem4 = new MenuButton();
            menuItem4.EnablePostBack = false;
            menuItem4.Text = "修改资料";
            menuItem4.Icon = IconHelper.String2Icon("TagOrange", true);
            menuItem4.OnClientClick = String.Format("addExampleTab('{0}','{1}','{2}')", "MenuHyperLink4", "Mod_Zl.aspx", "修改资料");
            btnMenu.Menu.Items.Add(menuItem4);

            //个人选项5-万年历
            MenuButton menuItem5 = new MenuButton();
            menuItem5.EnablePostBack = false;
            menuItem5.Text = "万年历";
            menuItem5.Icon = IconHelper.String2Icon("Calendar", true);
            menuItem5.OnClientClick = String.Format("addExampleTab('{0}','{1}','{2}')", "MenuHyperLink5", "other/wnl/index.html", "万年历");
            btnMenu.Menu.Items.Add(menuItem5);

            //个人选项6-在线人员
            MenuButton menuItem6 = new MenuButton();
            menuItem6.EnablePostBack = false;
            menuItem6.Text = "在线人员";
            menuItem6.Icon = IconHelper.String2Icon("User", true);
            menuItem6.OnClientClick = String.Format("addExampleTab('{0}','{1}','{2}')", "MenuHyperLink6", "OnlineUser.aspx", "在线人员");
            btnMenu.Menu.Items.Add(menuItem6);

            //个人选项7-快捷方式
            MenuButton menuItem7 = new MenuButton();
            menuItem7.EnablePostBack = false;
            menuItem7.Text = "快捷方式";
            menuItem7.Icon = IconHelper.String2Icon("Laptop", true);
            menuItem7.OnClientClick = String.Format("addExampleTab('{0}','{1}','{2}')", "MenuHyperLink7", "portal/kjfs/quick.aspx", "快捷方式");
            btnMenu.Menu.Items.Add(menuItem7);

            //个人选项8-岗位职责
            MenuButton menuItem8 = new MenuButton();
            menuItem8.EnablePostBack = false;
            menuItem8.Text = "岗位职责";
            menuItem8.Icon = IconHelper.String2Icon("Shield", true);
            menuItem8.OnClientClick = String.Format("addExampleTab('{0}','{1}','{2}')", "MenuHyperLink8", "portal/bmgl/gwzz_view.aspx", "岗位职责");
            btnMenu.Menu.Items.Add(menuItem8);

            // 只在页面第一次加载时注册客户端用到的脚本
            if (!Page.IsPostBack)
            {
                string idsScriptStr = String.Format("window.IDS={0};", ids.ToString(Newtonsoft.Json.Formatting.None));
                PageContext.RegisterStartupScript(idsScriptStr);
            }
        }

        private Tree InitTreeMenu()
        {
            Tree treeMenu = new Tree();
            treeMenu.ID = "treeMenu";
            treeMenu.ShowBorder = false;
            treeMenu.ShowHeader = false;            
            treeMenu.EnableIcons = true;
            treeMenu.AutoScroll = true;
            treeMenu.EnableSingleClickExpand = true;
            treeMenu.EnableSingleExpand = true;
            leftRegion.Items.Add(treeMenu);

            string Sql1 = " where B.modu_zt<>'禁用' AND B.modu_upid NOT IN(SELECT modu_id FROM hk_modu WHERE modu_zt='禁用')";

            if (this.Session["systype"].ToString() == "A")     //主登录页
            {
                //判断产品ID
                string strMain = SqlHelper.ExecuteScalar("SELECT TOP 1 ProduID FROM hk_Init WHERE ynMain='Y'").ToString();
                if (!string.IsNullOrEmpty(Request.QueryString["from"]))
                {
                    if (strMain == Request.QueryString["from"].ToString())
                    {
                        //个人办公、插件
                        Sql1 = Sql1 + " and (B.modu_id='101' or B.modu_upid='101' or B.modu_lx='" + hkdb.GetStr(Request.QueryString["from"]) + "'";
                        SqlDataReader drCj = SqlHelper.ExecuteReader("SELECT ProduID FROM hk_Init WHERE InitType='2'");
                        while (drCj.Read())
                        {
                            Sql1 = Sql1 + " or B.modu_lx='" + drCj["ProduID"].ToString() + "'";
                        }
                        drCj.Close();
                        Sql1 = Sql1 + ")";
                    }
                    else
                    {
                        switch (Request.QueryString["from"])
                        {
                            case "P":
                                Sql1 = Sql1 + " and B.modu_lx='" + hkdb.GetStr(Request.QueryString["from"]) + "' AND B.modu_id<>'101' AND B.modu_upid<>'101'";
                                break;
                            default:
                                Sql1 = Sql1 + " and B.modu_lx='" + hkdb.GetStr(Request.QueryString["from"]) + "'";
                                break;
                        }
                    }
                }//主菜单调用
                else
                {
                    //个人办公、插件
                    Sql1 = Sql1 + " and (B.modu_id='101' or B.modu_upid='101' or B.modu_lx='" + strMain + "'";
                    SqlDataReader drCj = SqlHelper.ExecuteReader("SELECT ProduID FROM hk_Init WHERE InitType='2'");
                    while (drCj.Read())
                    {
                        Sql1 = Sql1 + " or B.modu_lx='" + drCj["ProduID"].ToString() + "'";
                    }
                    drCj.Close();
                    Sql1 = Sql1 + ")";
                }//默认主菜单
            }

            //SCM零售企业登录
            if (this.Session["systype"].ToString() == "M")
            {
                Sql1 = Sql1 + " and B.modu_lx<>'G'";
            }

            DataSet ds;
            if (this.Session["userid"].ToString() == "admin")
            {
                ds = SqlHelper.ExecuteDs("SELECT DISTINCT B.MODU_ID,B.MODU_MC,(CASE WHEN B.MODU_UPID=0 THEN NULL ELSE MODU_UPID END)AS MODU_UPID,B.MODU_WJLJ,B.MODU_ICON,B.ORDERID FROM hk_Modu B " + Sql1 + " ORDER BY B.ORDERID");
                ds.Relations.Add("TreeRelation", ds.Tables[0].Columns["modu_id"], ds.Tables[0].Columns["modu_upid"]);
            }
            else
            {
                ds = SqlHelper.ExecuteDs("SELECT DISTINCT B.MODU_ID,B.MODU_MC,(CASE WHEN B.MODU_UPID=0 THEN NULL ELSE MODU_UPID END)AS MODU_UPID,B.MODU_WJLJ,B.MODU_ICON,B.ORDERID FROM QX A LEFT OUTER JOIN hk_Modu B ON(A.MODU_ID=B.MODU_ID) " + Sql1 + " AND (A.ROLE_ID=(SELECT UI_ROLE FROM YH WHERE UI_ID='" + this.Session["UserID"] + "') OR A.ROLE_ID IN(SELECT DISTINCT ROLE_ID FROM YH_JS WHERE UI_ID='" + this.Session["UserID"] + "')) ORDER BY B.ORDERID");
                ds.Relations.Add("TreeRelation", ds.Tables[0].Columns["modu_id"], ds.Tables[0].Columns["modu_upid"]);
            } 

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                if (row.IsNull("modu_upid"))
                {
                    TreeNode node = new TreeNode();
                    node.Text = row["modu_mc"].ToString();
                    node.IconUrl = "images/menu" + row["modu_icon"].ToString();
                    //node.Expanded = true;
                    treeMenu.Nodes.Add(node);

                    ResolveSubTree(row, node);
                }
            }

            // 重新设置每个节点的图标
            //ResolveTreeNode(treeMenu.Nodes);

            return treeMenu;
        }

        private void ResolveSubTree(DataRow dataRow, TreeNode treeNode)
        {
            DataRow[] rows = dataRow.GetChildRows("TreeRelation");
            if (rows.Length > 0)
            {
                //treeNode.Expanded = true;
                foreach (DataRow row in rows)
                {
                    TreeNode node = new TreeNode();
                    node.Text = row["modu_mc"].ToString();
                    node.NavigateUrl = row["modu_wjlj"].ToString();
                    if (!String.IsNullOrEmpty(node.NavigateUrl))
                    {
                        //node.IconUrl = "images/menu" + row["modu_icon"].ToString();
                    }
                    treeNode.Nodes.Add(node);

                    ResolveSubTree(row, node);
                }
            }
        }

        private JObject GetClientIDS(params ControlBase[] ctrls)
        {
            JObject jo = new JObject();
            foreach (ControlBase ctrl in ctrls)
            {
                jo.Add(ctrl.ID, ctrl.ClientID);
            }

            return jo;
        }

        #endregion

        #region Page_Load

        mydb hkdb = new mydb();

        public static string strLogo, strDate,userImg,userName,userDep,userPos,score;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("1");

            if (!IsPostBack)
            {
                //标题栏、桌面、子系统&菜单
                string strMenu = "系统菜单";
                switch (Request.QueryString["from"].ToString())
                {
                    case "E":
                        strMenu = "资产管理菜单";
                        PageTitle.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT ProduName + ' - ' + Version FROM hk_Init WHERE ProduID='E'"));
                        break;
                    case "F":
                        strMenu = "物业管理菜单";
                        PageTitle.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT ProduName + ' - ' + Version FROM hk_Init WHERE ProduID='F'"));
                        break;
                    case "O":
                        strMenu = "办公管理菜单";
                        PageTitle.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT ProduName + ' - ' + Version FROM hk_Init WHERE ProduID='O'"));
                        break;
                    case "P":
                        strMenu = "系统管理菜单";
                        PageTitle.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT ProduName + ' - ' + Version FROM hk_Init WHERE ProduID='P'"));
                        break;
                    case "R":
                        strMenu = "报表管理菜单";
                        PageTitle.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT ProduName + ' - ' + Version FROM hk_Init WHERE ProduID='R'"));
                        break;
                    case "M":
                        strMenu = "供应链管理菜单";
                        PageTitle.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT ProduName + ' - ' + Version FROM hk_Init WHERE ProduID='G'"));
                        break;
                    case "V":
                        strMenu = "会员管理菜单";
                        PageTitle.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT ProduName + ' - ' + Version FROM hk_Init WHERE ProduID='V'"));
                        break;
                    case "K":
                        strMenu = "幼儿园管理菜单";
                        PageTitle.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT ProduName + ' - ' + Version FROM hk_Init WHERE ProduID='K'"));
                        break;
                    case "H":
                        strMenu = "人事管理菜单";
                        PageTitle.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT ProduName + ' - ' + Version FROM hk_Init WHERE ProduID='H'"));
                        break;
                    case "C":
                        strMenu = "客户管理菜单";
                        PageTitle.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT ProduName + ' - ' + Version FROM hk_Init WHERE ProduID='C'"));
                        break;
                    case "A":
                        strMenu = "系统菜单";
                        PageTitle.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT ProduName + ' - ' + Version FROM hk_Init WHERE ynMain='Y'"));
                        break;
                }



                //Logo
                if (this.Session["systype"].ToString() == "A")     //主登录页
                {
                    leftRegion.Title = strMenu;

                    strLogo = Convert.ToString(SqlHelper.ExecuteScalar("SELECT ProduName FROM hk_Init WHERE ynMain='Y'"));

                    //显示主菜单
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM hk_MenuMain WHERE mmstatus='正常' ORDER BY mmordid");
                    while (datar.Read())
                    {
                        lblMenu.Text += "&nbsp;&nbsp;<a href=\"" + datar["mmurl"].ToString() + "?from=" + datar["ProduID"].ToString() + "\" target=\"_self\" class=\"MenuMain\"><img src=\"" + datar["mmicon"] + "\" width=\"16px\" height=\"16px\" border=\"0\"><b>" + datar["mmname"] + "</b></a>";
                    }
                    datar.Close();
                }
                else  //子登录页
                {
                    leftRegion.Title = "系统菜单";

                    if (this.Session["systype"].ToString() == "M")
                    {
                        strLogo = Convert.ToString(SqlHelper.ExecuteScalar("SELECT ProduName FROM hk_Init WHERE ProduID='G'"));
                    }
                    else
                    {
                        strLogo = Convert.ToString(SqlHelper.ExecuteScalar("SELECT ProduName FROM hk_Init WHERE ProduID='" + this.Session["systype"] + "'"));
                    }
                }



                //默认选项卡
                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT MainPage FROM hk_MySet WHERE FK_uid='" + this.Session["userid"] + "'");
                if (datar1.Read())
                {
                    if (datar1["MainPage"].ToString() == "2")
                    {
                        mainTabStrip.ActiveTabIndex = 1;
                    }
                    else
                    {
                        mainTabStrip.ActiveTabIndex = 0;
                    }
                }
                datar1.Close();



                //页脚
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.UI_DESC,B.BM_MC,C.ZWMC,D.ROLE_NAME,E.QY_QC FROM YH A LEFT OUTER JOIN BM B ON(A.UI_SSBM=B.BM_ID) LEFT OUTER JOIN ZW C ON(A.UI_ZW=C.ZWID) LEFT OUTER JOIN JS D ON(A.UI_ROLE=ROLE_ID) LEFT OUTER JOIN QY E ON(A.UI_SSGS=E.QY_ID) WHERE UI_ID='" + this.Session["userid"] + "'");
                if (dr.Read())
                {
                    lblBottom.Text = "单位：" + dr["QY_QC"].ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;部门：" + dr["BM_MC"].ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;职位：" + dr["ZWMC"].ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;角色：" + dr["ROLE_NAME"].ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;登录时间：" + string.Format("{0:yyyy-MM-dd HH:mm:ss}", DateTime.Now);
                }
                dr.Close();

                //txtUser.Text = "hi," + Session["username"].ToString();
                txtUser.Text = "您的站内消息";
                string uid= Session["userid"].ToString();
                userImg = Convert.ToString(SqlHelper.ExecuteScalar("SELECT photo FROM YH WHERE ui_id='"+uid+"'"));
                if (userImg.Equals(""))
                {
                    userImg = "/photo/default_avatar.jpg";
                }
                userName= Session["username"].ToString();
                score= Convert.ToString(SqlHelper.ExecuteScalar("SELECT score FROM YH WHERE ui_id='" + uid + "'"));
                string bmid=Convert.ToString(SqlHelper.ExecuteScalar("SELECT ui_ssbm FROM YH WHERE ui_id='" + uid + "'"));
                string zwid= Convert.ToString(SqlHelper.ExecuteScalar("SELECT ui_zw FROM YH WHERE ui_id='" + uid + "'"));
                userDep= Convert.ToString(SqlHelper.ExecuteScalar("SELECT BM_MC FROM BM WHERE BM_ID='" + bmid + "'"));
                userPos= Convert.ToString(SqlHelper.ExecuteScalar("SELECT ZWMC FROM ZW WHERE ZWID='" + zwid + "'"));

                //日期
                strDate = System.DateTime.Now.Year.ToString() + "年" + System.DateTime.Now.Month.ToString() + "月" + System.DateTime.Now.Day.ToString() + "日";

                //在线客服
                if (Request.Cookies["haoke"].Values["sdate"].ToString() == "2001-01-01")
                {
                    Img1.Hidden = false;
                    lblTx.Hidden = false;
                }
            }
        }

        #endregion

        #region Event

        //安全退出
        protected void btnExit_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            //Session.Abandon();

            //FormsAuthentication.RedirectToLoginPage();
            //Response.Redirect("Default.aspx");

            switch (Request.QueryString["from"].ToString())
            {
                case "E":
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "')");
                    Session.Clear();
                    Response.Redirect("Index_Eam.aspx");
                    break;
                case "F":
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "')");
                    Session.Clear();
                    Response.Redirect("Index_Pms.aspx");
                    break;
                case "O":
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "')");
                    Session.Clear();
                    Response.Redirect("Default.aspx");
                    break;
                case "P":
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "')");
                    Session.Clear();
                    Response.Redirect("Index_Portal.aspx");
                    break;
                case "R":
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "')");
                    Session.Clear();
                    Response.Redirect("Index_Report.aspx");
                    break;
                case "M":
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "')");
                    Session.Clear();
                    Response.Redirect("Index_Scm.aspx");
                    break;
                case "V":
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "')");
                    Session.Clear();
                    Response.Redirect("Index_Vip.aspx");
                    break;
                case "K":
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "')");
                    Session.Clear();
                    Response.Redirect("Index_Kms.aspx");
                    break;
                case "H":
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "')");
                    Session.Clear();
                    Response.Redirect("Index_HR.aspx");
                    break;
                case "C":
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "')");
                    Session.Clear();
                    Response.Redirect("Index_Crm.aspx");
                    break;
                default:
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "')");
                    Session.Clear();
                    Response.Redirect("Default.aspx");
                    break;
            }
        }

        #endregion
    }
}