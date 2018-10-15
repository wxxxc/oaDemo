using System;
using System.Collections;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.app.flow
{
    public partial class HandleWork_Audi_Pass : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public int iNodeCount = 0;  //下一步骤的数量
        public int iUserCount = 0;  //下一步骤的用户数量
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                //步骤节点ID
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.* FROM hk_Work A WHERE wNo='" + hkdb.GetStr(Request.QueryString["Number"]) + "'");
                if (dr.Read())
                {
                    lblName.Text = dr["wTitle"].ToString();
                    lblFlowId.Text = dr["FK_wfid"].ToString();
                }
                dr.Close();

                BindDplist();
                BindAttr();

                //短信
                dxtx.Visible = Convert.ToBoolean(hkdb.VeriSms());
            }

            BindLb(rblFormName.SelectedValue);

            //判断是否自动跳转
            if (iNodeCount == 1 && iUserCount == 1 && lblSelectMode.Text == "审批时由当前用户从指定人员中选择")
            {
                txt_wUserIDs.Text = lblyhid.Text;
                txt_wUserNames.Text = lblyhmc.Text;

                AudiRun();
            }
        }

        public void BindDplist()
        {
            iNodeCount = 0;

            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT fnID,fnName FROM hk_WorkFlowNode WHERE fnNum IN (" + hkdb.GetStr(Request.QueryString["UpNodeNum"]) + "0) AND FK_wfno='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "' ORDER BY fnID DESC");
            while (dr.Read())
            {
                ListItem theItem = new ListItem();
                theItem.Text = dr["fnName"].ToString();
                theItem.Value = dr["fnID"].ToString();
                rblFormName.Items.Add(theItem);

                iNodeCount += 1;
                lblNodeCount.Text = iNodeCount.ToString();
            }
            dr.Close();

            //如果有分支，则必须手工选择；如果没有分支，则默认选中第一个后自动跳转
            if (iNodeCount <= 1)
            {
                this.rblFormName.SelectedIndex = 0;
            }
        }

        public void BindAttr()
        {
            OwUserNames.Attributes.Add("readonly", "readonly");
            txt_wDeptNames.Attributes.Add("readonly", "readonly");
            txt_wRoleNames.Attributes.Add("readonly", "readonly");
            txt_wUserNames.Attributes.Add("readonly", "readonly");

            SaveBtn.Attributes["onclick"] = "javascript:return chknull();";
        }

        public void BindLb(string str)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowNode WHERE fnID='" + hkdb.GetStr(Request.QueryString["UpNodeId"]) + "'");
            if (dr.Read())
            {
                if (dr["fnPosition"].ToString() == "结束")
                {
                    Panel1.Visible = false;
                    rblFormName.Visible = false;
                    lblmsg5.Visible = true;
                    lblmsg5.Text = "结束";
                }
                else
                {
                    Panel1.Visible = true;
                    if (dr["SelectMode"].ToString() == "审批时由当前用户从指定人员中选择")
                    {
                        lblyh.Text = "已选中的审批接收人员：";
                    }
                    else
                    {
                        lbljbry.Visible = false;
                        OwUserNames.Visible = false;
                        lbljbbm.Visible = false;
                        txt_wDeptNames.Visible = false;
                        lbljbjs.Visible = false;
                        txt_wRoleNames.Visible = false;

                        lblyh.Text = "按全部人员选择(请点击下框)：";
                        lblmsg41.Text = "<a href=\"#\" onclick=\"javascript:chooseuser_m()\" data-ajax=\"false\">";
                        lblmsg42.Text = "</a>";
                    }

                    rblFormName.Visible = true;
                    lblmsg5.Visible = false;
                    lblmsg5.Text = "中间段";
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
                OwUserIDs.Text = dr2["fnUserIDs"].ToString();
                OwUserNames.Text = dr2["fnUserNames"].ToString();

                txt_wDeptIDs.Text = dr2["fnDeptIDs"].ToString();
                txt_wDeptNames.Text = dr2["fnDeptNames"].ToString();

                txt_wRoleIDs.Text = dr2["fnRoleIDs"].ToString();
                txt_wRoleNames.Text = dr2["fnRoleNames"].ToString();
            }
            dr2.Close();





            //下一步骤的待办人员
            iUserCount = 0;

            //经办人员
            string str_ry = "";
            string strlist_ry = "";
            str_ry = "" + OwUserIDs.Text + "";
            string[] mystr_ry = str_ry.Split(',');
            for (int s = 0; s < mystr_ry.Length; s++)
            {
                strlist_ry += "'" + mystr_ry[s] + "',";
            }
            strlist_ry += "'0'";

            //经办部门
            string str_bm = "";
            string strlist_bm = "";
            str_bm = "" + txt_wDeptIDs.Text + "";
            string[] mystr_bm = str_bm.Split(',');
            for (int s1 = 0; s1 < mystr_bm.Length; s1++)
            {
                strlist_bm += "'" + mystr_bm[s1] + "',";
            }
            strlist_bm += "'0'";

            //经办角色
            string str_js = "";
            string strlist_js = "";
            str_js = "" + txt_wRoleIDs.Text + "";
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

        //保存
        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            AudiRun();
        }

        private void AudiRun()
        {
            string jbryuser = txt_wUserIDs.Text;
            string jbryname = txt_wUserNames.Text;

            //审批人员to委托人员
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.*,B.ui_desc,C.ui_desc AS enName FROM hk_WorkFlowEntrust A LEFT OUTER JOIN yh B ON(A.feUserID=B.ui_id) LEFT OUTER JOIN yh C ON(A.EnUserID=C.ui_id) WHERE feStatus='启用'");
            while (dr.Read())
            {
                jbryuser = jbryuser.Replace("" + dr["feUserID"] + "", "" + dr["EnUserID"] + "");
                jbryname = jbryname.Replace("" + dr["ui_desc"] + "", "" + dr["enName"] + "");
            }
            dr.Close();

            if (lblmsg5.Text == "结束")
            {
                string GdTypeId = null;

                //归档
                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT A.*,B.ffName FROM hk_WorkFlow A LEFT OUTER JOIN hk_WorkFlowFolder B ON(A.FK_ffid=B.ffID) WHERE wfID='" + lblFlowId.Text + "'");
                if (datar1.Read())
                {
                    GdTypeId = datar1["FK_ffid"].ToString();
                }
                datar1.Close();

                SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT * FROM hk_Work WHERE wNo='" + hkdb.GetStr(Request.QueryString["Number"]) + "'");
                if (datar2.Read())
                {
                    SqlHelper.ExecuteSql("INSERT INTO hk_WorkFolder(FK_fid,FK_fno,FK_wfid,FK_wfno,FK_fnno,FK_fnnum,fdNo,fdSerialNo,fdName,fdContent,fdPromoterID,fdEndUserIDs,fdEndUserNames,FK_ffid,FK_uid,AddTime,fdTitle) values ('" + datar2["FK_fid"] + "','" + datar2["FK_fno"] + "','" + datar2["FK_wfid"] + "','" + datar2["FK_wfno"] + "','" + datar2["FK_fnno"] + "','" + datar2["FK_fnnum"] + "','" + datar2["wNo"] + "','" + datar2["wSerialNo"] + "','" + datar2["wName"] + "','" + datar2["wContent"] + "','" + datar2["PromoterID"] + "','" + datar2["EndUserIDs"] + "','" + datar2["EndUserNames"] + "','" + GdTypeId + "','" + this.Session["userid"] + "',GETDATE(),'" + datar2["wTitle"] + "')");

                    SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + datar2["PromoterID"] + "','您发起的工作：" + datar2["wName"] + "审批完成'");
                }
                datar2.Close();

                SqlHelper.ExecuteSql("UPDATE hk_Work SET wStatus='正常结束',wUserIDs='正常结束',wUserNames='正常结束',LastTime=GETDATE() WHERE wNo='" + hkdb.GetStr(Request.QueryString["Number"]) + "'");
            }
            else
            {
                if (txt_wUserNames.Text == "")
                {
                    lblMsg.Text = "请选择审批人员！";
                    return;
                }

                if (rblFormName.SelectedValue == "")
                {
                    lblMsg.Text = "未选择下一步骤！";
                    return;
                }
                else
                {
                    SqlDataReader datar3 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowNode WHERE fnID='" + rblFormName.SelectedValue + "'");
                    if (datar3.Read())
                    {
                        SqlHelper.ExecuteSql("UPDATE hk_Work SET SelectMode='" + datar3["SelectMode"] + "',wUserIDs='" + jbryuser + "',wUserNames='" + jbryname + "',ReviewMode='" + datar3["ReviewMode"] + "',TimeLimit='" + datar3["TimeLimit"] + "',NextNodeNo='" + datar3["fnNo"] + "',NextNodeID='" + datar3["fnID"] + "',NextNodeNum='" + datar3["fnNum"] + "',NextNodeName='" + datar3["fnName"] + "',LastTime=GETDATE() WHERE wNo='" + hkdb.GetStr(Request.QueryString["Number"]) + "'");

                        SqlHelper.ExecuteSql("INSERT INTO hk_WorkAppLog(FK_wfID,al_fName,al_wfName,alContent,FK_uid,AddTime) values ('" + hkdb.GetStr(Request.QueryString["id"]) + "','" + rblFormName + "','" + lblName.Text + "','审批工作，转入下一步骤[" + datar3["fnName"] + "]','" + this.Session["userid"] + "',GETDATE())");
                    }
                    else
                    {
                        lblMsg.Text = "未找到下一步骤！";
                        return;
                    }
                    datar3.Close();

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
                    if (xxtx.Checked == true | dxtx.Checked == true)
                    {
                        SqlDataReader datar4 = SqlHelper.ExecuteReader("SELECT * FROM yh WHERE ui_id IN (" + strlist + ")");
                        while (datar4.Read())
                        {
                            string message = "有新工作：[" + lblName.Text + "]需要办理";
                            hkdb.SendMsg(xxtx.Checked, dxtx.Checked, this.Session["userid"].ToString(), datar4["ui_id"].ToString(), message);
                        }
                        datar4.Close();
                    }
                }
            }

            //正式更新审批意见的状态
            SqlHelper.ExecuteSql("Update hk_WorkAppComm SET ac_status='有效' WHERE acID='" + hkdb.GetStr(Request.QueryString["acid"]) + "'");

            //mydb.Alert_Goto("保存成功！", "HandleWork.aspx");
            lblMsg.Text = "提交成功,请点击返回！";
            SaveBtn.Enabled = false;
        }
    }
}
