using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro
{
    public partial class OnlineUser : System.Web.UI.Page
    {
        int iRs = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("1");

            BindTree(ListTreeView.Nodes, 0);
        }

        private void BindTree(TreeNodeCollection Nds, int strid)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("select bm_id,bm_mc,bm_sjbm FROM BM where bm_sjbm=" + strid.ToString() + " order by bm_id asc");
            while (dr.Read())
            {
                if (strid == 0)
                {
                    TreeNode OrganizationNode = new TreeNode();
                    OrganizationNode.Value = dr["bm_id"].ToString();
                    int strId = int.Parse(dr["bm_id"].ToString());
                    OrganizationNode.ImageUrl = "images/portal/folder_c.gif";
                    OrganizationNode.Text = "" + dr["bm_mc"].ToString() + "";
                    OrganizationNode.SelectAction = TreeNodeSelectAction.Expand;
                    OrganizationNode.Expanded = true;
                    Nds.Add(OrganizationNode);
                    BindTree(Nds[Nds.Count - 1].ChildNodes, strId);

                    SqlDataReader dr2 = SqlHelper.ExecuteReader("select ui_id,ui_desc,lasttime,ui_sex,ui_yddh,remindtime from yh a left outer join hk_MySet b on (a.ui_id=b.fk_uid) where ui_ssbm='" + dr["bm_id"].ToString() + "' and datediff(ss,lasttime,getdate())<=(remindtime/1000+10) order by ui_desc asc");
                    while (dr2.Read())
                    {
                        TreeNode OrganizationNode1 = new TreeNode();
                        OrganizationNode1.Value = dr2["ui_id"].ToString();
                        string strId1 = dr2["ui_id"].ToString();

                        DateTime dt1 = Convert.ToDateTime(System.DateTime.Now.ToString());

                        DateTime dt2 = Convert.ToDateTime(dr2["lasttime"].ToString());
                        TimeSpan ts = dt1 - dt2;
                        Int32 remindtime = Convert.ToInt32(dr2["remindtime"].ToString()) / 1000 + 10;

                        //Response.Write("" + dr2["ui_desc"].ToString() + "：" + ts.TotalSeconds + "<br>");
                        if (ts.TotalSeconds < remindtime)
                        {
                            if (dr2["ui_sex"].ToString() == "女")
                            {
                                OrganizationNode1.ImageUrl = "images/girl_y.gif";
                            }
                            else
                            {
                                OrganizationNode1.ImageUrl = "images/boy_y.gif";
                            }

                            iRs += 1;
                        }
                        else
                        {
                            if (dr2["ui_sex"].ToString() == "女")
                            {
                                OrganizationNode1.ImageUrl = "images/girl_n.gif";
                            }
                            else
                            {
                                OrganizationNode1.ImageUrl = "images/boy_n.gif";
                            }

                        }

                        string stryhcx = "javascript:popAdd('portal/yhgl/yhcx_view.aspx?id=" + dr2["ui_id"].ToString() + "')";
                        string strxx = "javascript:popMini('portal/xxgl/minixx.aspx?id=" + dr2["ui_id"].ToString() + "&mc=" + dr2["ui_desc"].ToString() + "')";
                        string stryj = "javascript:popAdd('portal/yjgl/mini_xyj.aspx?id=" + dr2["ui_id"].ToString() + "&mc=" + dr2["ui_desc"].ToString() + "')";
                        string strdx = "javascript:popMini('portal/dxgl/mini_xdx.aspx?id=" + dr2["ui_yddh"].ToString() + "')";

                        if (this.Session["smsqx"].ToString() == "Y")
                        {
                            //OrganizationNode1.Text = "<a href=# onclick=" + stryhcx + " class=gvlink>" + dr2["ui_desc"].ToString() + "</a>[<a href=# onclick=" + strxx + " class=gvlink>消息</a>][<a href=# onclick=" + stryj + " class=gvlink>邮件</a>][<a href=# onclick=" + strdx + " class=gvlink>短信</a>]";
                            OrganizationNode1.Text = "<a href=# onclick=" + stryhcx + " class=gvlink>" + dr2["ui_desc"].ToString() + "</a>[<a href=# onclick=" + strxx + " class=gvlink>消息</a>][<a href=# onclick=" + stryj + " class=gvlink>邮件</a>]";
                        }
                        else
                        {
                            OrganizationNode1.Text = "<a href=# onclick=" + stryhcx + " class=gvlink>" + dr2["ui_desc"].ToString() + "</a>[<a href=# onclick=" + strxx + " class=gvlink>消息</a>][<a href=# onclick=" + stryj + " class=gvlink>邮件</a>]";
                        }

                        OrganizationNode1.SelectAction = TreeNodeSelectAction.Expand;
                        OrganizationNode1.Expanded = true;
                        OrganizationNode.ChildNodes.Add(OrganizationNode1);
                    }
                    dr2.Close();
                }
                else
                {

                    TreeNode OrganizationNode = new TreeNode();
                    OrganizationNode.Value = dr["bm_id"].ToString();
                    int strId = int.Parse(dr["bm_id"].ToString());
                    OrganizationNode.ImageUrl = "images/portal/folder_o.gif";
                    OrganizationNode.Text = " " + dr["bm_mc"].ToString() + "";
                    OrganizationNode.SelectAction = TreeNodeSelectAction.Expand;
                    OrganizationNode.Expanded = true;
                    Nds.Add(OrganizationNode);
                    BindTree(Nds[Nds.Count - 1].ChildNodes, strId);

                    SqlDataReader dr2 = SqlHelper.ExecuteReader("select ui_id,ui_desc,lasttime,ui_sex,ui_yddh,remindtime from yh a left outer join hk_MySet b on (a.ui_id=b.fk_uid) where ui_ssbm='" + dr["bm_id"].ToString() + "' and datediff(ss,lasttime,getdate())<=(remindtime/1000+10) order by ui_desc asc");

                    while (dr2.Read())
                    {
                        TreeNode OrganizationNode1 = new TreeNode();
                        OrganizationNode1.Value = dr2["ui_id"].ToString();
                        string strId1 = dr2["ui_id"].ToString();

                        DateTime dt1 = Convert.ToDateTime(System.DateTime.Now.ToString());

                        DateTime dt2 = Convert.ToDateTime(dr2["lasttime"].ToString());
                        TimeSpan ts = dt1 - dt2;
                        Int32 remindtime = Convert.ToInt32(dr2["remindtime"].ToString()) / 1000 + 10;

                        //Response.Write("" + dr2["ui_desc"].ToString() + "：" + ts.TotalSeconds + "<br>");
                        if (ts.TotalSeconds < remindtime)
                        {
                            if (dr2["ui_sex"].ToString() == "女")
                            {
                                OrganizationNode1.ImageUrl = "images/girl_y.gif";
                            }
                            else
                            {
                                OrganizationNode1.ImageUrl = "images/boy_y.gif";
                            }

                            iRs += 1;
                        }
                        else
                        {
                            if (dr2["ui_sex"].ToString() == "女")
                            {
                                OrganizationNode1.ImageUrl = "images/girl_n.gif";
                            }
                            else
                            {
                                OrganizationNode1.ImageUrl = "images/boy_n.gif";
                            }
                        }

                        string stryhcx = "javascript:popAdd('portal/yhgl/yhcx_view.aspx?id=" + dr2["ui_id"].ToString() + "')";
                        string strxx = "javascript:popMini('portal/xxgl/minixx.aspx?id=" + dr2["ui_id"].ToString() + "&mc=" + dr2["ui_desc"].ToString() + "')";
                        string stryj = "javascript:popAdd('portal/yjgl/mini_xyj.aspx?id=" + dr2["ui_id"].ToString() + "&mc=" + dr2["ui_desc"].ToString() + "')";
                        string strdx = "javascript:popMini('portal/dxgl/mini_xdx.aspx?id=" + dr2["ui_yddh"].ToString() + "')";

                        if (this.Session["smsqx"].ToString() == "Y")
                        {
                            //OrganizationNode1.Text = "<a href=# onclick=" + stryhcx + " class=gvlink>" + dr2["ui_desc"].ToString() + "</a>[<a href=# onclick=" + strxx + " class=gvlink>消息</a>][<a href=# onclick=" + stryj + " class=gvlink>邮件</a>][<a href=# onclick=" + strdx + " class=gvlink>短信</a>]";
                            OrganizationNode1.Text = "<a href=# onclick=" + stryhcx + " class=gvlink>" + dr2["ui_desc"].ToString() + "</a>[<a href=# onclick=" + strxx + " class=gvlink>消息</a>][<a href=# onclick=" + stryj + " class=gvlink>邮件</a>]";
                        }
                        else
                        {
                            OrganizationNode1.Text = "<a href=# onclick=" + stryhcx + " class=gvlink>" + dr2["ui_desc"].ToString() + "</a>[<a href=# onclick=" + strxx + " class=gvlink>消息</a>][<a href=# onclick=" + stryj + " class=gvlink>邮件</a>]";
                        }

                        OrganizationNode1.SelectAction = TreeNodeSelectAction.Expand;
                        OrganizationNode1.Expanded = true;
                        OrganizationNode.ChildNodes.Add(OrganizationNode1);
                    }
                    dr2.Close();
                }
            }
            dr.Close();

            lblrs.Text = iRs.ToString();
        }
    }
}
