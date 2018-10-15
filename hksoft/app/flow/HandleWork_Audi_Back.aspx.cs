using System;
using System.Collections;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.app.flow
{
    public partial class HandleWork_Audi_Back : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                //步骤节点
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.*,B.ui_desc FROM hk_Work A LEFT OUTER JOIN yh B ON(A.PromoterID=B.ui_id) WHERE wNo='" + hkdb.GetStr(Request.QueryString["Number"]) + "'");
                if (dr.Read())
                {
                    lblName.Text = dr["wTitle"].ToString();
                    lblFlowId.Text = dr["FK_wfid"].ToString();
                    lblstrPromoterID.Text = dr["PromoterID"].ToString();
                    lblstrPromoterName.Text = dr["ui_desc"].ToString();
                }
                dr.Close();

                BindDplist();

                BindAttr();
            }

            BindLb(FormName.SelectedValue);
        }

        public void BindDplist()
        {
            string sql_down_bh = "SELECT * FROM hk_WorkFlowNode WHERE fnNum<'" + int.Parse(Request.QueryString["UpNodeNum"]) + "' AND FK_wfno='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "' AND fnPosition='中间段' ORDER BY fnID DESC";
            if (!IsPostBack)
            {
                try
                {
                    bd.Bind_DropDownList(FormName, sql_down_bh, "fnID", "fnName", "0", "开始");
                }
                catch
                {
                    Response.Write(sql_down_bh);
                }
            }
        }

        public void BindAttr()
        {
            OwUserNames.Attributes.Add("readonly", "readonly");
            txt_wDeptNames.Attributes.Add("readonly", "readonly");
            txt_wRoleNames.Attributes.Add("readonly", "readonly");
            txt_wUserNames.Attributes.Add("readonly", "readonly");

            Button1.Attributes["onclick"] = "javascript:return chknull();";
        }

        public void BindLb(string str)
        {
            SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowNode WHERE fnNum<'" + int.Parse(Request.QueryString["UpNodeNum"]) + "' AND FK_wfno='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "' AND fnPosition='中间段' ORDER BY fnID DESC");
            if (datar1.Read())
            {
                Panel1.Visible = true;
            }
            else
            {
                Panel1.Visible = false;
            }
            datar1.Close();

            if (FormName.SelectedValue == "0")
            {
                lbljbry.Text = "驳回给发起人";
                lbljbbm.Text = "驳回给发起人";
                lbljbjs.Text = "驳回给发起人";
                lblyh.Text = "驳回给发起人";
            }
            else
            {
                lbljbry.Text = "1.按经办人员选择(请点击下框)：";
                lbljbbm.Text = "2.按经办部门选择(请点击下框)：";
                lbljbjs.Text = "3.按经办角色选择(请点击下框)：";
                lblyh.Text = "4.按全部人员选择(请点击下框)：";
                lblmsg41.Text = "<a href=\"#\" onclick=\"javascript:chooseuser_m()\" data-ajax=\"false\">";
                lblmsg42.Text = "</a>";
            }

            //经办人
            SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowNode WHERE fnID='" + str + "'");
            if (datar2.Read())
            {
                OwUserIDs.Text = datar2["fnUserIDs"].ToString();
                OwUserNames.Text = datar2["fnUserNames"].ToString();

                txt_wDeptIDs.Text = datar2["fnDeptIDs"].ToString();
                txt_wDeptNames.Text = datar2["fnDeptNames"].ToString();

                txt_wRoleIDs.Text = datar2["fnRoleIDs"].ToString();
                txt_wRoleNames.Text = datar2["fnRoleNames"].ToString();
            }
            else
            {
                OwUserIDs.Text = "";
                OwUserNames.Text = "";

                txt_wDeptIDs.Text = "";
                txt_wDeptNames.Text = "";

                txt_wRoleIDs.Text = "";
                txt_wRoleNames.Text = "";
            }
            datar2.Close();
        }

        //驳回
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FormName.SelectedValue == "0")
            {
                SqlHelper.ExecuteSql("UPDATE hk_Work SET wStatus='驳回审批',wUserIDs='驳回审批',wUserNames='驳回审批',LastTime=GETDATE() WHERE wNo='" + hkdb.GetStr(Request.QueryString["Number"]) + "'");

                SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + lblstrPromoterID.Text + "','请注意，您申请的工作[" + lblName.Text + "]已被审批驳回！'");
            }
            else
            {
                if (FormName.SelectedValue == "")
                {
                    mydb.Alert("未选择驳回步骤！");
                    return;
                }
                else
                {
                    SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowNode WHERE fnID='" + FormName.SelectedValue + "'");
                    if (datar1.Read())
                    {
                        SqlHelper.ExecuteSql("UPDATE hk_Work SET SelectMode='" + datar1["SelectMode"] + "',wUserIDs='" + hkdb.GetStr(txt_wUserIDs.Text) + "',wUserNames='" + hkdb.GetStr(txt_wUserNames.Text) + "',ReviewMode='" + datar1["ReviewMode"] + "',TimeLimit='" + datar1["TimeLimit"] + "',NextNodeNo='" + datar1["fnNo"] + "',NextNodeID='" + datar1["fnID"] + "',NextNodeNum='" + datar1["fnNum"] + "',NextNodeName='" + datar1["fnName"] + "',LastTime=GETDATE() WHERE wNo='" + hkdb.GetStr(Request.QueryString["Number"]) + "'");
                        SqlHelper.ExecuteSql("INSERT INTO hk_WorkAppLog(FK_wfID,al_fName,al_wfName,alContent,FK_uid,AddTime) values ('" + hkdb.GetStr(Request.QueryString["id"]) + "','" + FormName + "','" + lblName.Text + "','审批工作，驳回步骤[" + datar1["fnName"] + "]','" + this.Session["userid"] + "',GETDATE())");
                    }
                    else
                    {
                        mydb.Alert("未选择驳回步骤！");
                        return;
                    }
                    datar1.Close();


                    string strlist = null;
                    string str1 = null;
                    str1 = "" + txt_wUserIDs.Text + "";
                    ArrayList myarr = new ArrayList();
                    string[] mystr = str1.Split(',');
                    for (int s = 0; s < mystr.Length; s++)
                    {
                        strlist += "'" + mystr[s] + "',";
                    }
                    strlist += "'0'";

                    SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT * FROM yh WHERE ui_id IN (" + strlist + ")");
                    while (datar2.Read())
                    {
                        SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + datar2["ui_id"] + "','[" + lblName.Text + "]被驳回，请重新办理'");
                    }
                    datar2.Close();
                }
            }

            //正式更新审批意见的状态
            SqlHelper.ExecuteSql("Update hk_WorkAppComm SET ac_status='有效' WHERE acID='" + hkdb.GetStr(Request.QueryString["acid"]) + "'");

            //mydb.Alert_Goto("保存成功！", "HandleWork.aspx");
            lblMsg.Text = "驳回成功,请点击返回！";
            Button1.Enabled = false;
            FormName.Enabled = false;
        }
    }
}
