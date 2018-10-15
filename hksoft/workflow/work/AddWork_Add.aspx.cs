using System;
using System.Collections;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;
using hkform;

namespace hkpro.workflow.work
{
    public partial class AddWork_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        myform showform = new myform();

        public static string attKey, fName, nowfnName, NextNodeNum, NextNodeNumKey, strfnid, fnWriteID;
        public static int serid, nNameid;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                //附件类型
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT p_string FROM hk_CSDA WHERE paramt='P_AttType'");
                if (dr.Read())
                {
                    attKey = dr["p_string"].ToString();
                }
                dr.Close();

                //职位
                lblZwmc.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT B.ZWMC FROM YH A LEFT OUTER JOIN ZW B ON(A.UI_ZW=B.ZWID) WHERE A.UI_ID='" + this.Session["userid"] + "'"));

                BindAttr();

                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowNode WHERE fnPosition='开始' AND FK_wfno='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "'");
                if (datar1.Read())
                {
                    nowfnName = datar1["fnName"].ToString();
                    NextNodeNum = datar1["NextNodeNum"].ToString();
                    NextNodeNumKey = datar1["NextNodeNum"].ToString();
                    lbloNextNodeNum.Text = datar1["NextNodeNum"].ToString();
                    strfnid = datar1["fnID"].ToString();
                    fnWriteID = "" + datar1["fnWriteID"].ToString() + "0";

                    //编辑附件
                    if (datar1["ynEditAtt"].ToString() == "是")
                    {
                        editimg.Visible = true;
                    }
                    else
                    {
                        editimg.Visible = false;
                    }

                    //删除附件
                    if (datar1["ynDelAtt"].ToString() == "是")
                    {
                        delBtn.Visible = true;
                    }
                    else
                    {
                        delBtn.Visible = false;
                    }

                    //编号计数
                    SqlDataReader dr_w = SqlHelper.ExecuteReader("SELECT TOP 1 wID,wFileNo FROM hk_Work WHERE FK_wfno='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "' ORDER BY wID DESC");
                    if (dr_w.Read())
                    {
                        nNameid = int.Parse(dr_w["wFileNo"].ToString()) + 1;
                        
                        SqlDataReader dr_wf = SqlHelper.ExecuteReader("SELECT FileNo,FileDigit,wfName,ynModFileNo FROM hk_WorkFlow WHERE wfNo='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "'");
                        if (dr_wf.Read())
                        {
                            if (dr_wf["ynModFileNo"].ToString() == "否")
                            {
                                fileid.Attributes.Add("readonly", "readonly");
                            }
                            fileid.Text = showform.FormatFileno(dr_wf["FileNo"].ToString(), nNameid.ToString().PadLeft(int.Parse(dr_wf["FileDigit"].ToString()), '0'), dr_wf["FileDigit"].ToString(), dr_wf["wfName"].ToString());
                        }
                        dr_wf.Close();
                    }
                    else
                    { 
                        SqlDataReader dr_wf = SqlHelper.ExecuteReader("SELECT FileNo,FileStartNo,FileDigit,wfName,ynModFileNo FROM hk_WorkFlow WHERE wfNo='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "'");
                        if (dr_wf.Read())
                        {
                            if (dr_wf["ynModFileNo"].ToString() == "否")
                            {
                                fileid.Attributes.Add("readonly", "readonly");
                            }

                            nNameid = int.Parse(dr_wf["FileStartNo"].ToString());
                            fileid.Text = showform.FormatFileno(dr_wf["FileNo"].ToString(), nNameid.ToString().PadLeft(int.Parse(dr_wf["FileDigit"].ToString()), '0'), dr_wf["FileDigit"].ToString(), dr_wf["wfName"].ToString());
                        }
                        dr_wf.Close();
                    }
                    dr_w.Close();
                }
                else
                { 
                    mydb.Alert_Close("该流程尚未创建【开始步骤】，请重新设计！");
                    return;
                }
                datar1.Close();



                if (!string.IsNullOrEmpty(Request.QueryString["wid"]))
                {
                    //如果重新发起
                    SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT A.wTitle,A.wContent,B.fName FROM hk_Work A LEFT OUTER JOIN hk_Form B ON(A.FK_fid=B.fID) WHERE A.wID='" + hkdb.GetStr(Request.QueryString["wId"]) + "'");
                    if (datar2.Read())
                    {
                        wTitle.Text = "重新发起:" + datar2["wTitle"].ToString();

                        string setfrom = null;
                        setfrom = hkdb.GetStrTeOut(datar2["wContent"].ToString().Replace("BACKGROUND-COLOR:", "").Replace("readOnly", "").Replace("BACKGROUND-COLOR: #EFEFEF", "").Replace("readonly", "").Replace("id=Text2", "readonly").Replace("id=\"Text2\"", "readonly"));

                        //可写字段
                        SqlDataReader dr_fc = SqlHelper.ExecuteReader("SELECT * FROM hk_FormColumn WHERE clID NOT IN(" + fnWriteID + ") AND clType!='[电子印章]'");
                        while (dr_fc.Read())
                        {
                            setfrom = setfrom.Replace("name=" + dr_fc["clNo"] + "", "name=" + dr_fc["clNo"] + "  style=\"BACKGROUND-COLOR: #EFEFEF\"  readonly").Replace("name=\"" + dr_fc["clNo"] + "\"", "name=" + dr_fc["clNo"] + "  style=\"BACKGROUND-COLOR: #EFEFEF\"  readonly");
                        }
                        dr_fc.Close();

                        ContractContent.Text = setfrom;
                        lblwricolu.Text = setfrom;
                        fName = datar2["fName"].ToString();
                    }
                    datar2.Close();
                }
                else
                {
                    //如果是新发起
                    //表单
                    SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT * FROM hk_Form WHERE fID='" + hkdb.GetStr(Request.QueryString["FormId"]) + "'");
                    if (datar2.Read())
                    {
                        string setfrom = null;
                        setfrom = hkdb.GetStrTeOut(datar2["fContent"].ToString().Replace("BACKGROUND-COLOR: #EFEFEF", "").Replace("readonly", "").Replace("value=\"宏控件-用户姓名\"", "readonly  value=\"" + this.Session["username"].ToString() + "\"").Replace("value=\"宏控件-用户部门\"", "readonly  value=\"" + this.Session["deptname"].ToString() + "\"").Replace("value=\"宏控件-用户角色\"", "readonly  value=\"" + Server.UrlDecode(Request.Cookies["haoke"].Values["rolename"].ToString()) + "\"").Replace("value=\"宏控件-用户职位\"", "readonly  value=" + lblZwmc.Text + "").Replace("value=\"宏控件-当前日期\"", "readonly  value=\"" + System.DateTime.Now.ToShortDateString() + "\""));

                        //自定义宏控件
                        SqlDataReader dr_wf = SqlHelper.ExecuteReader("SELECT wfName FROM hk_WorkFlow WHERE wfNo='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "'");
                        if (dr_wf.Read())
                        {
                            setfrom = showform.FormatMac(setfrom, fileid.Text, dr_wf["wfName"].ToString());
                        }
                        dr_wf.Close();

                        //可写字段
                        SqlDataReader dr_fc = SqlHelper.ExecuteReader("SELECT * FROM hk_FormColumn WHERE clID NOT IN(" + fnWriteID + ") AND clType!='[电子印章]'");
                        while (dr_fc.Read())
                        {
                            setfrom = setfrom.Replace("name=" + dr_fc["clNo"] + "", "name=" + dr_fc["clNo"] + "  style=\"BACKGROUND-COLOR: #EFEFEF\"  readonly").Replace("name=\"" + dr_fc["clNo"] + "\"", "name=" + dr_fc["clNo"] + "  style=\"BACKGROUND-COLOR: #EFEFEF\"  readonly");
                        }
                        dr_fc.Close();

                        ContractContent.Text = setfrom;
                        lblwricolu.Text = setfrom;
                        fName = datar2["fName"].ToString();
                    }
                    datar2.Close();
                }



                //流水号
                SqlDataReader datar3 = SqlHelper.ExecuteReader("SELECT TOP 1 wID FROM hk_Work ORDER BY wID DESC");
                if (datar3.Read())
                {
                    serid = int.Parse(datar3["wID"].ToString()) + 1;
                }
                else
                {
                    serid = 1;
                }
                datar3.Close();
            }

            if (!IsPostBack)
            {
                Random g = new Random();
                string rad = g.Next(10000).ToString();
                Number.Text = "" + System.DateTime.Now.Year.ToString() + "" + System.DateTime.Now.Month.ToString() + "" + System.DateTime.Now.Day.ToString() + "" + System.DateTime.Now.Hour.ToString() + "" + System.DateTime.Now.Minute.ToString() + "" + System.DateTime.Now.Second.ToString() + "" + System.DateTime.Now.Millisecond.ToString() + "" + rad + "";
            }

            BindDpList();
        }

        public void BindAttr()
        {
            uploadBtn.Attributes["onclick"] = "javascript:return PageCheck();";
            delBtn.Attributes["onclick"] = "javascript:return AttDel();";
        }

        //附件
        public void BindDpList()
        {
            attlist.Items.Clear();

            string sql_attlist = "SELECT attName,attNewName FROM hk_AttUpload WHERE attClass='w01' AND attKey='" + hkdb.GetStr(Number.Text) + "' ORDER BY attID DESC";
            bd.Bind_DropDownList_NoBlank(attlist, sql_attlist, "attNewName", "attName", "", "");
        }

        //下一步按钮
        protected void NetxBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string TjszStrSz, TjszStrCg;
                string TjszStr;
                string str1 = null;
                str1 = "" + NextNodeNum + "0";
                ArrayList myarr = new ArrayList();
                string[] mystr = str1.Split(',');
                for (int s = 0; s < mystr.Length; s++)
                {
                    TjszStrCg = null; TjszStrSz = null;
                    TjszStr = null;
                    TjszStr = "1 == 1";

                    //[常规型]条件
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

                    //[数字型]条件
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
                        NextNodeNumKey = NextNodeNumKey.Replace("" + mystr[s] + ",", "");
                        lbloNextNodeNum.Text = lbloNextNodeNum.Text.Replace("" + mystr[s] + ",", "");
                    }
                }

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowNode where fnPosition='开始' AND FK_wfno='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "'");
                if (dr.Read())
                {
                    string JkUsername = null, JkRealname = null;

                    SqlDataReader dr_wf = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlow WHERE wfID='" + dr["FK_wfid"] + "'");
                    if (dr_wf.Read())
                    {
                        JkUsername = dr_wf["wfUserIDs"].ToString();
                        JkRealname = dr_wf["wfUserNames"].ToString();
                    }
                    dr_wf.Close();

                    //流水号
                    SqlDataReader datar3 = SqlHelper.ExecuteReader("SELECT TOP 1 wID FROM hk_Work ORDER BY wID DESC");
                    if (datar3.Read())
                    {
                        serid = int.Parse(datar3["wID"].ToString()) + 1;
                    }
                    else
                    {
                        serid = 1;
                    }
                    datar3.Close();








                    if (!string.IsNullOrEmpty(Request.QueryString["wid"]))
                    {
                        //如果重新发起，则复制原工作记录的审批意见
                        int iWid = Convert.ToInt32(SqlHelper.ExecuteScalar("INSERT INTO hk_Work(wFileNo,MoniUserIDs,MoniUserNames,FK_fid,FK_fno,FK_wfid,FK_wfno,FK_fnno,FK_fnnum,wNo,wSerialNo,wName,wStatus,wContent,PromoterID,EndUserIDs,EndUserNames,MyUserIDs,MyUserNames,AttentUserIDs,AttentUserNames,FK_uid,FK_did,wQxStr,FK_rid,AddTime,LastTime,ClientUserIDs,ClientUserNames,wTitle) values ('" + nNameid + "','" + JkUsername + "','" + JkRealname + "','" + dr["FK_fid"] + "','" + dr["FK_fno"] + "','" + dr["FK_wfid"] + "','" + dr["FK_wfno"] + "','" + dr["fnNo"] + "','" + dr["fnNum"] + "','" + hkdb.GetStr(Number.Text) + "','" + serid + "','" + hkdb.GetStr(fileid.Text) + "','等待送审','" + hkdb.GetStrTeIn(ContractContent.Text) + "','" + this.Session["userid"] + "','','','','','','','" + this.Session["userid"] + "','" + this.Session["deptid"] + "','" + this.Session["deptqx"] + "','" + this.Session["roleid"] + "',GETDATE(),GETDATE(),'','','" + hkdb.GetStr(wTitle.Text) + "')" + "SELECT CAST(scope_identity() AS int)"));

                        SqlHelper.ExecuteSql("INSERT INTO hk_WorkAppComm(ac_wfID,ac_fName,ac_wfName,acContent,acAttName,acAttNewName,FK_uid,AddTime) SELECT " + iWid + ",ac_fName,ac_wfName,acContent,acAttName,acAttNewName,FK_uid,AddTime FROM hk_WorkAppComm WHERE ac_wfid='" + hkdb.GetStr(Request.QueryString["wid"].ToString()) + "'");
                    }
                    else
                    {
                        //如果是新发起
                        SqlHelper.ExecuteSql("INSERT INTO hk_Work(wFileNo,MoniUserIDs,MoniUserNames,FK_fid,FK_fno,FK_wfid,FK_wfno,FK_fnno,FK_fnnum,wNo,wSerialNo,wName,wStatus,wContent,PromoterID,EndUserIDs,EndUserNames,MyUserIDs,MyUserNames,AttentUserIDs,AttentUserNames,FK_uid,FK_did,wQxStr,FK_rid,AddTime,LastTime,ClientUserIDs,ClientUserNames,wTitle) values ('" + nNameid + "','" + JkUsername + "','" + JkRealname + "','" + dr["FK_fid"] + "','" + dr["FK_fno"] + "','" + dr["FK_wfid"] + "','" + dr["FK_wfno"] + "','" + dr["fnNo"] + "','" + dr["fnNum"] + "','" + hkdb.GetStr(Number.Text) + "','" + serid + "','" + hkdb.GetStr(fileid.Text) + "','等待送审','" + hkdb.GetStrTeIn(ContractContent.Text) + "','" + this.Session["userid"] + "','','','','','','','" + this.Session["userid"] + "','" + this.Session["deptid"] + "','" + this.Session["deptqx"] + "','" + this.Session["roleid"] + "',GETDATE(),GETDATE(),'','','" + hkdb.GetStr(wTitle.Text) + "')");
                    }






                }
                else
                { 
                    mydb.Alert("保存失败，请检查是否存在开始流程！");
                    return;
                }
                dr.Close();

                Response.Redirect("AddWork_Add_Detail.aspx?UpNodeNum=" + lbloNextNodeNum.Text + "&FlowNumber=" + Request.QueryString["FlowNumber"] + "&FormId=" + Request.QueryString["FormId"] + "&Number=" + Number.Text + "");
            }
            catch
            {
                mydb.Alert("保存失败，请检查是否有【必填项】未填写或【可写字段】设置错误！");
                return;
            }
        }

        //上传
        protected void uploadBtn_Click(object sender, EventArgs e)
        {
            string strBaseLocation = Server.MapPath("../../Attach/flow/work/");
            string TruePath = string.Empty;
            string Temp1 = string.Empty;

            if (uploadFile.PostedFile.ContentLength != 0)
            {
                string fileName = System.IO.Path.GetFileName(uploadFile.PostedFile.FileName);
                string extName = System.IO.Path.GetExtension(fileName);

                Random g = new Random();
                string rad = g.Next(10000).ToString();
                Temp1 = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString() + rad;
                uploadFile.PostedFile.SaveAs(strBaseLocation + Temp1 + extName);
                TruePath = Temp1 + extName;

                SqlHelper.ExecuteSql("INSERT INTO hk_AttUpload(attName,attNewName,attKey,attClass) VALUES('" + fileName + "','" + TruePath + "','" + hkdb.GetStr(Number.Text) + "','w01')");
                BindDpList();
            }
        }
    }
}
