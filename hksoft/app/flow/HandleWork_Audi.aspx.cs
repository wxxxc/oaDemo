using System;
using System.Collections;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.app.flow
{
    public partial class HandleWork_Audi : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static string strNextNodeNum, strbkNextNodeNum, strnnNumkey, strfnid, strfnWriteID, strwUserIDs;
        public static int a;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowNode WHERE fnID='" + int.Parse(Request.QueryString["UpNodeId"]) + "'");
                if (datar1.Read())
                {
                    lblstrfnName.Text = datar1["fnName"].ToString();
                    strNextNodeNum = datar1["NextNodeNum"].ToString();
                    strnnNumkey = datar1["NextNodeNum"].ToString();
                    lblnnnk.Text = datar1["NextNodeNum"].ToString();
                    strfnid = datar1["fnID"].ToString();
                    strfnWriteID = "" + datar1["fnWriteID"].ToString() + "0";
                }
                datar1.Close();

                SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT A.*,B.fName FROM hk_Work A LEFT OUTER JOIN hk_Form B ON(A.FK_fid=B.fID) WHERE wID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (datar2.Read())
                {
                    strbkNextNodeNum = datar2["NextNodeNum"].ToString();
                    Number.Text = datar2["wNo"].ToString();
                    lblName.Text = datar2["wName"].ToString();
                    lblstrAudiMode.Text = datar2["ReviewMode"].ToString();
                    strwUserIDs = datar2["wUserIDs"].ToString();
                    lblstrhyUserIDs.Text = datar2["wUserIDs"].ToString().Replace("" + this.Session["userid"].ToString() + ",", "");
                    lblstrhyUserNames.Text = datar2["wUserNames"].ToString().Replace("" + this.Session["username"].ToString() + ",", "");

                    string setfrom = null;
                    setfrom = hkdb.GetStrTeOut(datar2["wContent"].ToString().Replace("BACKGROUND-COLOR:", "").Replace("readOnly", "").Replace("BACKGROUND-COLOR: #EFEFEF", "").Replace("readonly", "").Replace("id=Text2", "readonly").Replace("id=\"Text2\"", "readonly"));

                    //可写字段
                    SqlDataReader dr_fc = SqlHelper.ExecuteReader("SELECT * FROM hk_FormColumn WHERE clID NOT IN(" + strfnWriteID + ") AND clType!='[电子印章]'");
                    while (dr_fc.Read())
                    {
                        setfrom = setfrom.Replace("name=" + dr_fc["clNo"] + "", "name=" + dr_fc["clNo"] + "  style=\"BACKGROUND-COLOR: #EFEFEF\"  readonly").Replace("name=\"" + dr_fc["clNo"] + "\"", "name=" + dr_fc["clNo"] + " style=\"BACKGROUND-COLOR: #EFEFEF\"  readonly");
                    }
                    dr_fc.Close();

                    lblhtm.Text = setfrom;
                    lblFormName.Text = datar2["fName"].ToString();

                    lblwTitle.Text = datar2["wTitle"].ToString();
                }
                datar2.Close();

                //判断是否转到下一个节点
                int m = strwUserIDs.Length;
                int s = strwUserIDs.Replace(",", "").Length;
                a = m - s;
                if (a <= 1)
                {
                    Button4.Visible = true;
                    Button1.Visible = false;
                }
                else
                {
                    if (lblstrAudiMode.Text == "仅一人通过审批即可向下流转")
                    {
                        Button4.Visible = true;
                    }
                    else
                    {
                        Button4.Visible = false;
                    }
                    Button1.Visible = true;
                }





                //审批意见
                string strAtt2 = "";
                SqlDataReader datar3 = SqlHelper.ExecuteReader("SELECT A.*,B.ui_desc FROM hk_WorkAppComm A LEFT OUTER JOIN yh B ON(A.FK_uid=B.ui_id) WHERE ac_wfID='" + hkdb.GetStr(Request.QueryString["id"]) + "' AND ac_Status='有效' ORDER BY acID");
                while (datar3.Read())
                {
                    strAtt2 += "<br>·<font color=red>" + datar3["acContent"].ToString() + "</font>&nbsp;&nbsp;" + datar3["ui_desc"].ToString() + "&nbsp;&nbsp;" + string.Format("{0:yyyy-MM-dd HH:mm}", datar3["AddTime"]) + "&nbsp;&nbsp;<a href=../../workflow/Work/WorkAttDown.aspx?number=" + datar3["acAttNewName"].ToString() + " target=_blank>" + datar3["acAttName"].ToString() + "</a>";
                }
                datar3.Close();
                lblspyj.Text = strAtt2;

                //附件
                bd.GetAtt(Number.Text, "wk", "flow/work", fujian);
            }
        }

        //保存
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txt_appcomm.Text))
            {
                lblMsg.Text = "请输入审批意见！";
                return;
            }

            try
            {
                string TjszStrSz, TjszStrCg;
                string TjszStr;
                string str1 = null;
                str1 = "" + strNextNodeNum + "0";
                ArrayList myarr = new ArrayList();
                string[] mystr = str1.Split(',');
                for (int s = 0; s < mystr.Length; s++)
                {
                    TjszStrCg = null; TjszStrSz = null;
                    TjszStr = null;
                    TjszStr = "1 == 1";

                    //常规型条件
                    SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowBranch WHERE fbTofnid=(SELECT fnID FROM hk_WorkFlowNode WHERE fnNum='" + mystr[s] + "' AND FK_wfno='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "') AND FK_fnid='" + strfnid + "' AND fbType='[常规型]'");
                    while (datar1.Read())
                    {
                        if (datar1["fbCondi"].ToString() == "包含")
                        {
                            TjszStrCg += "&&" + Request.Form["" + datar1["fbNo"] + ""].IndexOf(datar1["fbValue"].ToString()) + ">= 0 ";
                        }
                        else if (datar1["fbCondi"].ToString() == "不包含")
                        {
                            TjszStrCg += "&&" + Request.Form["" + datar1["fbNo"] + ""].IndexOf(datar1["fbValue"].ToString()) + "< 0 ";
                        }
                    }
                    datar1.Close();

                    //数字型条件
                    SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowBranch WHERE fbTofnid=(SELECT fnID FROM hk_WorkFlowNode WHERE fnNum='" + mystr[s] + "' AND FK_wfno='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "') AND FK_fnid='" + strfnid + "' AND fbType='[数字型]'");
                    while (datar2.Read())
                    {
                        TjszStrSz += "&&" + int.Parse(Request.Form["" + datar2["fbNo"] + ""]) + " " + datar2["fbCondi"] + " " + datar2["fbValue"] + "  ";
                    }
                    datar2.Close();

                    TjszStr += TjszStrCg + TjszStrSz;
                    MSScriptControl.ScriptControl sc = new MSScriptControl.ScriptControlClass();
                    sc.Language = "javascript";
                    if ((bool)sc.Eval(TjszStr) == false)
                    {
                        strnnNumkey = strnnNumkey.Replace("" + mystr[s] + ",", "");
                        lblnnnk.Text = lblnnnk.Text.Replace("" + mystr[s] + ",", "");
                    }
                }

                SqlHelper.ExecuteSql("INSERT INTO hk_WorkAppLog(FK_wfID,al_fName,al_wfName,alContent,FK_uid,AddTime) values ('" + hkdb.GetStr(Request.QueryString["id"]) + "','" + lblFormName.Text + "','" + lblName.Text + "','审批工作','" + this.Session["userid"] + "',GETDATE())");

                if (lblstrAudiMode.Text == "仅一人通过审批即可向下流转")
                {
                    SqlHelper.ExecuteSql("UPDATE hk_Work SET wStatus='正在办理', wContent='" + hkdb.GetStrTeIn(lblhtm.Text) + "',EndUserIDs=EndUserIDs+'" + this.Session["userid"].ToString() + ",',EndUserNames=EndUserNames+'" + this.Session["username"].ToString() + ",',LastTime=GETDATE() WHERE wID='" + int.Parse(Request.QueryString["id"]) + "'");
                }
                else
                {
                    SqlHelper.ExecuteSql("UPDATE hk_Work SET wStatus='正在办理', wContent='" + hkdb.GetStrTeIn(lblhtm.Text) + "',EndUserIDs=EndUserIDs+'" + this.Session["userid"].ToString() + ",',EndUserNames=EndUserNames+'" + this.Session["username"].ToString() + ",',wUserIDs='" + lblstrhyUserIDs.Text + "',wUserNames='" + lblstrhyUserNames.Text + "',LastTime=GETDATE() WHERE wID='" + int.Parse(Request.QueryString["id"]) + "'");
                }
            }
            catch
            {
                mydb.Alert("保存失败，请检查是否有必填项未填写！");
                return;
            }

            if (txt_appcomm.Text == "")
            {

            }
            else
            {
                SqlHelper.ExecuteSql("INSERT INTO hk_WorkAppComm(ac_wfID,ac_fName,ac_wfName,acContent,acAttName,acAttNewName,FK_uid,AddTime) values ('" + hkdb.GetStr(Request.QueryString["id"]) + "','" + lblstrfnName.Text + "','" + lblName.Text + "','" + hkdb.GetStr(txt_appcomm.Text) + "','','','" + this.Session["userid"] + "',GETDATE())");
            }

            //保存
            SqlDataReader datar3 = SqlHelper.ExecuteReader("SELECT * FROM hk_Work WHERE wID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            if (datar3.Read())
            {
                SqlDataReader dr_wh = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkHandled WHERE whNo='" + datar3["wNo"] + "'");
                if (dr_wh.Read())
                {
                    dr_wh.Close();
                    SqlHelper.ExecuteSql("UPDATE hk_WorkHandled SET whContent='" + hkdb.GetStrTeIn(lblhtm.Text) + "' WHERE whNo='" + datar3["wNo"] + "'");
                }
                else
                {
                    dr_wh.Close();
                    SqlHelper.ExecuteSql("INSERT INTO hk_WorkHandled(FK_fid,FK_fno,FK_wfid,FK_wfno,FK_fnno,FK_fnnum,whNo,whSerialNo,whName,whContent,whPromoterID,whEndUserIDs,whEndUserNames,FK_uid,AddTime) values ('" + datar3["FK_fid"] + "','" + datar3["FK_fno"] + "','" + datar3["FK_wfid"] + "','" + datar3["FK_wfno"] + "','" + datar3["NextNodeNo"] + "','" + datar3["NextNodeNum"] + "','" + datar3["wNo"] + "','" + datar3["wSerialNo"] + "','" + datar3["wName"] + "','" + hkdb.GetStrTeIn(lblhtm.Text) + "','" + datar3["PromoterID"] + "','" + datar3["EndUserIDs"] + "','" + datar3["EndUserNames"] + "','" + this.Session["userid"] + "',GETDATE())");
                }
            }
            datar3.Close();

            Response.Redirect("HandleWork.aspx");
        }

        //保存并通过
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txt_appcomm.Text))
            {
                lblMsg.Text = "请输入审批意见！";
                return;
            }

            try
            {
                string TjszStrSz, TjszStrCg;
                string TjszStr;
                string str1 = null;
                str1 = "" + strNextNodeNum + "0";
                ArrayList myarr = new ArrayList();
                string[] mystr = str1.Split(',');
                for (int s = 0; s < mystr.Length; s++)
                {
                    TjszStrCg = null; TjszStrSz = null;
                    TjszStr = null;
                    TjszStr = "1 == 1";

                    //常规型条件
                    SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowBranch WHERE fbTofnid=(SELECT fnID FROM hk_WorkFlowNode WHERE fnNum='" + mystr[s] + "' AND FK_wfno='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "') AND FK_fnid='" + strfnid + "' AND fbType='[常规型]'");
                    while (datar1.Read())
                    {
                        if (datar1["fbCondi"].ToString() == "包含")
                        {
                            TjszStrCg += "&&" + Request.Form["" + datar1["fbNo"] + ""].IndexOf(datar1["fbValue"].ToString()) + ">= 0 ";
                        }
                        else if (datar1["fbCondi"].ToString() == "不包含")
                        {
                            TjszStrCg += "&&" + Request.Form["" + datar1["fbNo"] + ""].IndexOf(datar1["fbValue"].ToString()) + "< 0 ";
                        }
                    }
                    datar1.Close();

                    //数字型条件
                    SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowBranch WHERE fbTofnid=(SELECT fnID FROM hk_WorkFlowNode WHERE fnNum='" + mystr[s] + "' AND FK_wfno='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "') AND FK_fnid='" + strfnid + "' AND fbType='[数字型]'");
                    while (datar2.Read())
                    {
                        TjszStrSz += "&&" + int.Parse(Request.Form["" + datar2["fbNo"] + ""]) + " " + datar2["fbCondi"] + " " + datar2["fbValue"] + "  ";
                    }
                    datar2.Close();

                    TjszStr += TjszStrCg + TjszStrSz;
                    MSScriptControl.ScriptControl sc = new MSScriptControl.ScriptControlClass();
                    sc.Language = "javascript";
                    if ((bool)sc.Eval(TjszStr) == false)
                    {
                        strnnNumkey = strnnNumkey.Replace("" + mystr[s] + ",", "");
                        lblnnnk.Text = lblnnnk.Text.Replace("" + mystr[s] + ",", "");
                    }
                }

                SqlHelper.ExecuteSql("INSERT INTO hk_WorkAppLog(FK_wfID,al_fName,al_wfName,alContent,FK_uid,AddTime) values ('" + hkdb.GetStr(Request.QueryString["id"]) + "','" + lblFormName.Text + "','" + lblName.Text + "','审批工作','" + this.Session["userid"] + "',GETDATE())");

                SqlHelper.ExecuteSql("UPDATE hk_Work SET wStatus='正在办理', wContent='" + hkdb.GetStrTeIn(lblhtm.Text) + "',EndUserIDs=EndUserIDs+'" + this.Session["userid"].ToString() + ",',EndUserNames=EndUserNames+'" + this.Session["username"].ToString() + ",',LastTime=GETDATE() WHERE wID='" + int.Parse(Request.QueryString["id"]) + "'");

                //？
                SqlHelper.ExecuteSql("INSERT INTO hk_WorkAppLog(FK_wfID,al_fName,al_wfName,alContent,FK_uid,AddTime) values ('" + hkdb.GetStr(Request.QueryString["id"]) + "','" + lblFormName.Text + "','" + lblName.Text + "','审批工作','" + this.Session["userid"] + "',GETDATE())");
            }
            catch
            {
                mydb.Alert("保存失败，请检查是否有必填项未填写！");
                return;
            }

            //审批意见ID
            int iAcid = 0;

            if (txt_appcomm.Text == "")
            {

            }
            else
            {
                iAcid = Convert.ToInt32(SqlHelper.ExecuteScalar("INSERT INTO hk_WorkAppComm(ac_wfID,ac_fName,ac_wfName,acContent,acAttName,acAttNewName,FK_uid,AddTime,ac_status) values ('" + hkdb.GetStr(Request.QueryString["id"]) + "','" + lblstrfnName.Text + "','" + lblName.Text + "','" + hkdb.GetStr(txt_appcomm.Text) + "','','','" + this.Session["userid"] + "',GETDATE(),'临时')" + "SELECT CAST(scope_identity() AS int)"));
            }

            //保存
            SqlDataReader datar3 = SqlHelper.ExecuteReader("SELECT * FROM hk_Work WHERE wID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            if (datar3.Read())
            {
                SqlDataReader dr_wh = SqlHelper.ExecuteReader("SELECT whID FROM hk_WorkHandled WHERE whNo='" + datar3["wNo"] + "'");
                if (dr_wh.Read())
                {
                    dr_wh.Close();
                    SqlHelper.ExecuteSql("UPDATE hk_WorkHandled SET whContent='" + hkdb.GetStrTeIn(lblhtm.Text) + "' WHERE whNo='" + datar3["wNo"] + "'");
                }
                else
                {
                    dr_wh.Close();
                    SqlHelper.ExecuteSql("INSERT INTO hk_WorkHandled(FK_fid,FK_fno,FK_wfid,FK_wfno,FK_fnno,FK_fnnum,whNo,whSerialNo,whName,whContent,whPromoterID,whEndUserIDs,whEndUserNames,FK_uid,AddTime) values ('" + datar3["FK_fid"] + "','" + datar3["FK_fno"] + "','" + datar3["FK_wfid"] + "','" + datar3["FK_wfno"] + "','" + datar3["NextNodeNo"] + "','" + datar3["NextNodeNum"] + "','" + datar3["wNo"] + "','" + datar3["wSerialNo"] + "','" + datar3["wName"] + "','" + hkdb.GetStrTeIn(lblhtm.Text) + "','" + datar3["PromoterID"] + "','" + datar3["EndUserIDs"] + "','" + datar3["EndUserNames"] + "','" + this.Session["userid"] + "',GETDATE())");
                }
            }
            datar3.Close();

            
            Response.Redirect("HandleWork_Audi_Pass.aspx?UpNodeNum=" + lblnnnk.Text + "&FlowNumber=" + Request.QueryString["FlowNumber"] + "&FormId=" + Request.QueryString["FormId"] + "&UpNodeId=" + Request.QueryString["UpNodeId"] + "&Number=" + Number.Text + "&acid=" + iAcid + "");
            //Server.Transfer("HandleWork_Audi_Pass.aspx?UpNodeNum=" + lblnnnk.Text + "&FlowNumber=" + Request.QueryString["FlowNumber"] + "&FormId=" + Request.QueryString["FormId"] + "&UpNodeId=" + Request.QueryString["UpNodeId"] + "&Number=" + Number.Text + "&acid=" + iAcid + "");
        }

        //保存并驳回
        protected void Button9_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txt_appcomm.Text))
            {
                lblMsg.Text = "请输入审批意见！";
                return;
            }

            SqlHelper.ExecuteSql("INSERT INTO hk_WorkAppLog(FK_wfID,al_fName,al_wfName,alContent,FK_uid,AddTime) values ('" + hkdb.GetStr(Request.QueryString["id"]) + "','" + lblFormName.Text + "','" + lblName.Text + "','审批工作','" + this.Session["userid"] + "',GETDATE())");

            SqlHelper.ExecuteSql("UPDATE hk_Work SET wStatus='正在办理', wContent='" + hkdb.GetStrTeIn(lblhtm.Text) + "',EndUserIDs=EndUserIDs+'" + this.Session["userid"].ToString() + ",',EndUserNames=EndUserNames+'" + this.Session["username"].ToString() + ",',LastTime=GETDATE() WHERE wID='" + int.Parse(Request.QueryString["id"]) + "'");

            //？
            SqlHelper.ExecuteSql("INSERT INTO hk_WorkAppLog(FK_wfID,al_fName,al_wfName,alContent,FK_uid,AddTime) values ('" + hkdb.GetStr(Request.QueryString["id"]) + "','" + lblFormName.Text + "','" + lblName.Text + "','审批工作','" + this.Session["userid"] + "',GETDATE())");

            //审批意见ID
            int iAcid = 0;

            if (txt_appcomm.Text == "")
            {

            }
            else
            {
                iAcid = Convert.ToInt32(SqlHelper.ExecuteScalar("INSERT INTO hk_WorkAppComm(ac_wfID,ac_fName,ac_wfName,acContent,acAttName,acAttNewName,FK_uid,AddTime,ac_status) values ('" + hkdb.GetStr(Request.QueryString["id"]) + "','" + lblstrfnName.Text + "','" + lblName.Text + "','" + hkdb.GetStr(txt_appcomm.Text) + "','','','" + this.Session["userid"] + "',GETDATE(),'临时')" + "SELECT CAST(scope_identity() AS int)"));
            }

            //保存已办理
            SqlDataReader datar3 = SqlHelper.ExecuteReader("SELECT * FROM hk_Work WHERE wID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            if (datar3.Read())
            {
                SqlDataReader dr_wh = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkHandled WHERE whNo='" + datar3["wNo"] + "'");
                if (dr_wh.Read())
                {
                    dr_wh.Close();
                    SqlHelper.ExecuteSql("UPDATE hk_WorkHandled SET whContent='" + hkdb.GetStrTeIn(lblhtm.Text) + "' WHERE whNo='" + datar3["wNo"] + "'");
                }
                else
                {
                    dr_wh.Close();
                    SqlHelper.ExecuteSql("INSERT INTO hk_WorkHandled(FK_fid,FK_fno,FK_wfid,FK_wfno,FK_fnno,FK_fnnum,whNo,whSerialNo,whName,whContent,whPromoterID,whEndUserIDs,whEndUserNames,FK_uid,AddTime) values ('" + datar3["FK_fid"] + "','" + datar3["FK_fno"] + "','" + datar3["FK_wfid"] + "','" + datar3["FK_wfno"] + "','" + datar3["NextNodeNo"] + "','" + datar3["NextNodeNum"] + "','" + datar3["wNo"] + "','" + datar3["wSerialNo"] + "','" + datar3["wName"] + "','" + hkdb.GetStrTeIn(lblhtm.Text) + "','" + datar3["PromoterID"] + "','" + datar3["EndUserIDs"] + "','" + datar3["EndUserNames"] + "','" + this.Session["userid"] + "',GETDATE())");
                }
            }
            datar3.Close();

            Response.Redirect("HandleWork_Audi_Back.aspx?UpNodeNum=" + strbkNextNodeNum + "&FlowNumber=" + Request.QueryString["FlowNumber"] + "&FormId=" + Request.QueryString["FormId"] + "&UpNodeId=" + Request.QueryString["UpNodeId"] + "&Number=" + Number.Text + "&acid=" + iAcid + "");
        }
    }
}
