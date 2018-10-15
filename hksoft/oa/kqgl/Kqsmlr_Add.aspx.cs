using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Kqsmlr_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static string attKey;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11714", "0");

                //短信
                dxtz.Visible = Convert.ToBoolean(hkdb.VeriSms());

                //附件
                SqlDataReader dr_fj = SqlHelper.ExecuteReader("SELECT p_string FROM hk_CSDA WHERE paramt='P_AttType'");
                if (dr_fj.Read())
                {
                    attKey = dr_fj["p_string"].ToString();
                }
                dr_fj.Close();

                BindAttr();

                Random g = new Random();
                string rad = g.Next(10000).ToString();
                Number.Text = "" + System.DateTime.Now.Year.ToString() + "" + System.DateTime.Now.Month.ToString() + "" + System.DateTime.Now.Day.ToString() + "" + System.DateTime.Now.Hour.ToString() + "" + System.DateTime.Now.Minute.ToString() + "" + System.DateTime.Now.Second.ToString() + "" + System.DateTime.Now.Millisecond.ToString() + "" + rad + "";
                
                DropDownListBind();

                //设置本部门的用户为默认下一步审批人
                SqlDataReader dr_jsr = SqlHelper.ExecuteReader("SELECT TOP 1 YHID FROM OA_KQ_QX Z LEFT OUTER JOIN YH A ON(Z.YHID=A.UI_ID) WHERE (Z.KQSPRY1='是' OR Z.KQSPRY2='是') AND A.UI_SSBM='" + this.Session["DeptID"] + "'");
                if (dr_jsr.Read())
                {
                    jsr.SelectedValue = dr_jsr["YHID"].ToString();
                }
                dr_jsr.Close();

                //考勤审批说明
                Kqspsm();
            }

            BindDpList();
        }

        public void BindAttr()
        {
            uploadBtn.Attributes["onclick"] = "javascript:return PageCheck();";
            AttDelBtn.Attributes["onclick"] = "javascript:return AttDel();";
        }

        public void DropDownListBind()
        {
            string Str = " WHERE (Z.KQSPRY1='是' OR Z.KQSPRY2='是')";
            SqlDataReader dr_sp = SqlHelper.ExecuteReader("SELECT qzcyid FROM hk_QZDA WHERE CJR='" + this.Session["UserID"] + "' AND QZLX='OA考勤说明审批专用群组'");
            if (dr_sp.Read())
            {
                Str += " AND CHARINDEX(UI_ID,'" + dr_sp["qzcyid"].ToString() + "')>0";
            }
            dr_sp.Close();

            string sql = "SELECT UI_ID,UI_DESC+'('+B.BM_MC+'-'+C.ZWMC+')' AS UI_DESC FROM OA_KQ_QX Z LEFT OUTER JOIN YH A ON(Z.YHID=A.UI_ID) LEFT OUTER JOIN BM B ON (A.UI_SSBM=B.BM_ID) LEFT OUTER JOIN ZW C ON(A.UI_ZW=C.ZWID) " + Str + " ORDER BY UI_DESC";
            bd.Bind_DropDownList(jsr, sql, "UI_ID", "UI_DESC", "", "选择下一步审批人员");
        }

        //保存 
        protected void Save_Click(object sender, EventArgs e)
        {
            if (ynqd1.Checked == false && ynqt1.Checked == false && ynqd2.Checked == false && ynqt2.Checked == false && ynqd3.Checked == false && ynqt3.Checked == false)
            {
                mydb.Alert("签到类型必须至少选择一项！");
                return;
            }

            //同一日期只能存在一条记录，不能重复
            string sql = "SELECT sid FROM OA_KQ_SM01 WHERE Sqrid = '" + this.Session["UserID"] + "' AND qdsj='" + hkdb.GetStr(qdsj.Text) + "'";
            if (bd.CheckRepeat(sql) == "true")
            {
                mydb.Alert("您在该日期下已提交过考勤说明记录，不能重复！\\n请在原考勤说明记录上直接修改并保存后，重新送审即可！");
                return;
            }
            
            //更新数据库
            IDlabel.Text = Convert.ToString(SqlHelper.ExecuteScalar("INSERT INTO OA_KQ_SM01(QDSJ,YNQD1,YNQT1,YNQD2,YNQT2,YNQD3,YNQT3,KQQKSM,SMZT,SQRID,SQRMC,SQBMID,SQBMMC,SQSJ,jsrIDs,jsrNames,SMFJ) VALUES('" + hkdb.GetStr(qdsj.Text) + "','" + hkdb.GetValueChk_Str(ynqd1.Checked) + "','" + hkdb.GetValueChk_Str(ynqt1.Checked) + "','" + hkdb.GetValueChk_Str(ynqd2.Checked) + "','" + hkdb.GetValueChk_Str(ynqt2.Checked) + "','" + hkdb.GetValueChk_Str(ynqd3.Checked) + "','" + hkdb.GetValueChk_Str(ynqt3.Checked) + "','" + hkdb.GetStr(kqqksm.Text) + "','录入','" + this.Session["userid"] + "','" + this.Session["username"] + "','" + this.Session["deptid"] + "','" + this.Session["deptname"] + "',GETDATE(),'" + jsr.SelectedValue + "','" + jsr.SelectedItem.Text + "','" + hkdb.GetStr(Number.Text) + "')" + "select cast(scope_identity() as int)"));

            mydb.Alert_Refresh("保存成功！","Kqsmlr.aspx");

            SaveBtn.Visible = false;
            SendBtn.Visible = true;
        }

        //送审 
        protected void Send_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE OA_KQ_SM01 SET SMZT='送审中',jsrIDs='" + jsr.SelectedValue + "',jsrNames='" + jsr.SelectedItem.Text + "',SSSJ=GETDATE(),SSCS=1 WHERE SMZT='录入' AND SID='" + IDlabel.Text + "'");

            SendMsg();

            mydb.Alert_Refresh_Close("考勤说明已成功送审！","Kqsmlr.aspx");
        }

        //消息通知
        public void SendMsg()
        {
            //Msg 
            if (xxtz.Checked == true | dxtz.Checked == true)
            {
                string message = this.Session["username"].ToString() + "提交了一份考勤说明,请审批!";
                hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), jsr.SelectedValue, message);
            }
        }

        //考勤审批说明
        protected void Kqspsm()
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT SMID FROM OA_KQ_SPSM WHERE SMLX='考勤说明单' AND SYRY='申请人员'");
            if (dr.Read())
            {
                lcsm.Visible = true;
                lcsm.Attributes.Add("onclick", "Javascript:popPrn('Kqspsm_Show.aspx?id=" + dr["SMID"].ToString() + "');");
            }
            dr.Close();
        }

        public void BindDpList()
        {
            fjlb.Items.Clear();

            //附件列表
            string sql_fjlb = "select * from hk_AttUpload where attkey='" + hkdb.GetStr(Number.Text) + "' and attClass='o03' order by attID desc";
            bd.Bind_DropDownList_NoBlank(fjlb, sql_fjlb, "attNewName", "attName", "", "");
        }

        //上传
        protected void uploadBtn_Click(object sender, EventArgs e)
        {
            string strBaseLocation = Server.MapPath("../../Attach/oa/kqsm/");
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

                SqlHelper.ExecuteSql("insert into hk_AttUpload(attName,attNewName,attKey,attClass) values ('" + fileName + "','" + TruePath + "','" + hkdb.GetStr(Number.Text) + "','o03')");
                BindDpList();
            }
        }
    }
}
