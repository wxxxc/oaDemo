using System;
using System.Collections;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class AddWork_Add_Detail : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public int iNodeCount = 0;  //下一步骤的数量
        public int iUserCount = 0;  //下一步骤的用户数量

        public static string strwSerialNo, strfnName, Name;
        public static int lshid;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                BindDroList();
                BindAttr();
                
                //步骤节点
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.*,B.fnName FROM hk_Work A LEFT OUTER JOIN hk_WorkFlowNode B ON(A.FK_fnno=B.fnNo) WHERE wNo='" + hkdb.GetStr(Request.QueryString["Number"]) + "'");
                if (dr.Read())
                {
                    strfnName = dr["fnName"].ToString();
                    strwSerialNo = dr["wSerialNo"].ToString();
                    Name = dr["wTitle"].ToString();
                }
                dr.Close();

                //短信
                yndx.Visible = Convert.ToBoolean(hkdb.VeriSms());
            }

            BindLb(FormName.SelectedValue);

            //判断是否自动跳转
            if (iNodeCount == 1 && iUserCount == 1 && lblSelectMode.Text == "审批时由当前用户从指定人员中选择")
            {
                lblwUserIDs.Text = lblyhid.Text;
                wUserNames.Text = lblyhmc.Text;

                AudiRun();
            }
        }

        public void BindDroList()
        {
            iNodeCount = 0;

            //下一步
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT fnID,fnName FROM hk_WorkFlowNode WHERE fnNum IN (" + hkdb.GetStr(Request.QueryString["UpNodeNum"]) + "0) AND FK_wfno='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "' ORDER BY fnID DESC");
            while (dr.Read())
            {
                ListItem theItem = new ListItem();
                theItem.Text = dr["fnName"].ToString();
                theItem.Value = dr["fnID"].ToString();
                FormName.Items.Add(theItem);

                iNodeCount += 1;
                lblNodeCount.Text = iNodeCount.ToString();
            }
            dr.Close();
        }

        public void BindAttr()
        {
            OwUserNames.Attributes.Add("readonly", "readonly");
            wDeptNames.Attributes.Add("readonly", "readonly");
            wRoleNames.Attributes.Add("readonly", "readonly");
            wUserNames.Attributes.Add("readonly", "readonly");

            Button1.Attributes["onclick"] = "javascript:return chknull();";
        }

        public void BindLb(string str)
        {
            //审批人员
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowNode WHERE fnPosition='开始' AND FK_wfno='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "'");
            if (dr.Read())
            {
                if (dr["SelectMode"].ToString() == "审批时由当前用户从指定人员中选择")
                {
                    lblmsg.Text = "<a href=\"javascript:void(0)\" onclick=\"openUser()\" class=\"gvlink\">[选择审批人员]</a>";
                    lblmsg2.Text = "<a href=\"javascript:void(0)\" onclick=\"choosedept()\" class=\"gvlink\">[选择审批人员]</a>";
                    lblmsg3.Text = "<a href=\"javascript:void(0)\" onclick=\"chooserole()\" class=\"gvlink\">[选择审批人员]</a>";
                    lblmsg4.Text = "请从[经办人]、[经办部门]、[经办角色]中选择";
                }
                else
                {
                    lblmsg.Text = "由用户指定审批人员";
                    lblmsg2.Text = "由用户指定审批人员";
                    lblmsg3.Text = "由用户指定审批人员";
                    lblmsg4.Text = "<a href=\"javascript:void(0)\" onclick=\"chooseuser_m()\" class=\"gvlink\">[选择审批人员]</a>";
                }

                //当前步骤的审批模式、选择人员模式
                lblReviewMode.Text = dr["ReviewMode"].ToString();
                lblSelectMode.Text = dr["SelectMode"].ToString();
            }
            dr.Close();

            //经办人
            SqlDataReader dr2 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowNode WHERE fnID='" + str + "'");
            if (dr2.Read())
            {
                lblowUserIDs.Text = dr2["fnUserIDs"].ToString();
                OwUserNames.Text = dr2["fnUserNames"].ToString();

                lblwDeptIDs.Text = dr2["fnDeptIDs"].ToString();
                wDeptNames.Text = dr2["fnDeptNames"].ToString();

                lblwRoleIDs.Text = dr2["fnRoleIDs"].ToString();
                wRoleNames.Text = dr2["fnRoleNames"].ToString();
            }
            dr2.Close();







            //下一步骤的待办人员
            iUserCount = 0;

            //经办人员
            string str_ry = "";
            string strlist_ry = "";
            str_ry = "" + lblowUserIDs.Text + "";
            string[] mystr_ry = str_ry.Split(',');
            for (int s = 0; s < mystr_ry.Length; s++)
            {
                strlist_ry += "'" + mystr_ry[s] + "',";
            }
            strlist_ry += "'0'";

            //经办部门
            string str_bm = "";
            string strlist_bm = "";
            str_bm = "" + lblwDeptIDs.Text + "";
            string[] mystr_bm = str_bm.Split(',');
            for (int s1 = 0; s1 < mystr_bm.Length; s1++)
            {
                strlist_bm += "'" + mystr_bm[s1] + "',";
            }
            strlist_bm += "'0'";

            //经办角色
            string str_js = "";
            string strlist_js = "";
            str_js = "" + lblwRoleIDs.Text + "";
            string[] mystr_js = str_js.Split(',');
            for (int s2 = 0; s2 < mystr_js.Length; s2++)
            {
                strlist_js += "'" + mystr_js[s2] + "',";
            }
            strlist_js += "'0'";

            SqlDataReader datar = SqlHelper.ExecuteReader("SELECT ui_id,ui_desc FROM yh WHERE ui_lx='企业' AND (ui_id IN (" + strlist_ry + ") OR ui_ssbm IN (" + strlist_bm + ") OR ui_role IN (" + strlist_js + "))");
            while (datar.Read())
            {
                lblyhid.Text += datar["ui_id"].ToString() + ",";
                lblyhmc.Text += datar["ui_desc"].ToString() + ",";

                iUserCount += 1;
                lblyhCount.Text = iUserCount.ToString();
            }
            datar.Close();
        }

        //确定
        protected void Button1_Click(object sender, EventArgs e)
        {
            AudiRun();
        }

        private void AudiRun()
        {
            string jbryuser = lblwUserIDs.Text;
            string jbryname = wUserNames.Text;

            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.*,B.ui_desc,C.ui_desc AS enName FROM hk_WorkFlowEntrust A LEFT OUTER JOIN yh B ON(A.feUserID=B.ui_id) LEFT OUTER JOIN yh C ON(A.EnUserID=C.ui_id) WHERE feStatus='启用'");
            while (dr.Read())
            {
                jbryuser = jbryuser.Replace("" + dr["feUserID"] + "", "" + dr["EnUserID"] + "");
                jbryname = jbryname.Replace("" + dr["ui_desc"] + "", "" + dr["enName"] + "");
            }
            dr.Close();

            if (wUserNames.Text == "")
            {
                mydb.Alert("请选择审批人员！");
                return;
            }

            if (FormName.SelectedValue == "")
            {
                mydb.Alert("未选择下一步骤！");
                return;
            }
            else
            {
                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowNode WHERE fnID='" + FormName.SelectedValue + "'");
                if (datar1.Read())
                {
                    SqlHelper.ExecuteSql("UPDATE hk_Work SET SelectMode='" + datar1["SelectMode"] + "',wStatus='等待办理',wUserIDs='" + jbryuser + "',wUserNames='" + jbryname + "',ReviewMode='" + datar1["ReviewMode"] + "',TimeLimit='" + datar1["TimeLimit"] + "',NextNodeNo='" + datar1["fnNo"] + "',NextNodeID='" + datar1["fnID"] + "',NextNodeNum='" + datar1["fnNum"] + "',NextNodeName='" + datar1["fnName"] + "' WHERE wNo='" + hkdb.GetStr(Request.QueryString["Number"]) + "'");
                }
                else
                {
                    mydb.Alert("未找到下一步骤！");
                    return;
                }
                datar1.Close();

                string strlist = null;
                string str1 = null;
                str1 = "" + jbryuser + "";
                ArrayList myarr = new ArrayList();
                string[] mystr = str1.Split(',');
                for (int s = 0; s < mystr.Length; s++)
                {
                    strlist += "'" + mystr[s] + "',";
                }
                strlist += "'0'";

                //Msg 
                if (ynxx.Checked == true | yndx.Checked == true)
                {
                    SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT * FROM yh WHERE ui_id IN (" + strlist + ")");
                    while (datar2.Read())
                    {
                        string message = "有新工作：[" + Name + "]需要办理";
                        hkdb.SendMsg(ynxx.Checked, yndx.Checked, this.Session["userid"].ToString(), datar2["ui_id"].ToString(), message);
                    }
                    datar2.Close();
                }

                mydb.Alert_Close("提交成功！");
            }
        }
    }
}
