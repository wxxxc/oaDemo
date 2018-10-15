using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Kqsmlr_Mod : System.Web.UI.Page
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

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.* FROM OA_KQ_SM01 A WHERE SID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (dr.Read())
                {
                    qdsj.Text = hkdb.GetDate(dr["qdsj"].ToString());
                    ynqd1.Checked = hkdb.GetValueChk_Checked(dr["ynqd1"].ToString());
                    ynqt1.Checked = hkdb.GetValueChk_Checked(dr["ynqt1"].ToString());
                    ynqd2.Checked = hkdb.GetValueChk_Checked(dr["ynqd2"].ToString());
                    ynqt2.Checked = hkdb.GetValueChk_Checked(dr["ynqt2"].ToString());
                    ynqd3.Checked = hkdb.GetValueChk_Checked(dr["ynqd3"].ToString());
                    ynqt3.Checked = hkdb.GetValueChk_Checked(dr["ynqt3"].ToString());
                    smzt.Text = dr["smzt"].ToString();
                    kqqksm.Text = dr["kqqksm"].ToString();
                    lblspr.Text = dr["jsrNames"].ToString();
                    lblsssj.Text = dr["sssj"].ToString();
                    jsr.SelectedValue = dr["jsrIDs"].ToString();

                    if (!string.IsNullOrEmpty(dr["smfj"].ToString()))
                    {
                        Number.Text = dr["smfj"].ToString();
                    }

                    lblsscs.Text = dr["sscs"].ToString();
                    dr.Close();
                }
                else
                {
                    dr.Close();
                    mydb.Alert_Close("该考勤说明可能已被删除！");
                }

                switch (smzt.Text)
                {
                    case "录入":
                        DelJhBtn.Visible = true;
                        SendBtn.Visible = true;
                        SaveBtn.Visible = true;
                        p_jsr.Visible = true;

                        AttDelBtn.Visible = true;
                        uploadBtn.Visible = true;
                        break;
                    case "已退回":
                        DelJhBtn.Visible = true;
                        SendBtn.Visible = true;
                        SaveBtn.Visible = true;
                        p_jsr.Visible = true;

                        AttDelBtn.Visible = true;
                        uploadBtn.Visible = true;
                        break;
                    default:
                        SendBtn.Visible = true;
                        SaveBtn.Visible = true;
                        p_jsr.Visible = true;

                        AttDelBtn.Visible = true;
                        uploadBtn.Visible = true;
                        break;
                }

                //考勤审批说明
                Kqspsm();

                GridViewBind();
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

        //gv绑定 
        public void GridViewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM OA_KQ_SM02 WHERE SSSID='" + hkdb.GetStr(Request.QueryString["id"]) + "' ORDER BY SPSJ DESC");
            GridView1.DataSource = ds;
            GridView1.DataBind();
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
            string sql = "SELECT sid FROM OA_KQ_SM01 WHERE Sqrid = '" + this.Session["UserID"] + "' AND qdsj='" + hkdb.GetStr(qdsj.Text) + "' AND SID<>'" + hkdb.GetStr(Request.QueryString["id"]) + "'";
            if (bd.CheckRepeat(sql) == "true")
            {
                mydb.Alert("您在该日期下已提交过考勤说明记录，不能重复！\\n请在原考勤说明记录上直接修改并保存后，重新送审即可！");
                return;
            }

            SqlHelper.ExecuteSql("UPDATE OA_KQ_SM01 SET QDSJ='" + hkdb.GetStr(qdsj.Text) + "',YNQD1='" + hkdb.GetValueChk_Str(ynqd1.Checked) + "',YNQT1='" + hkdb.GetValueChk_Str(ynqt1.Checked) + "',YNQD2='" + hkdb.GetValueChk_Str(ynqd2.Checked) + "',YNQT2='" + hkdb.GetValueChk_Str(ynqt2.Checked) + "',YNQD3='" + hkdb.GetValueChk_Str(ynqd3.Checked) + "',YNQT3='" + hkdb.GetValueChk_Str(ynqt3.Checked) + "',KQQKSM='" + hkdb.GetStr(kqqksm.Text) + "',jsrIDs='" + jsr.SelectedValue + "',jsrNames='" + jsr.SelectedItem.Text + "',smfj='" + hkdb.GetStr(Number.Text) + "' WHERE SID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");

            mydb.Alert_Refresh("保存成功！","Kqsmlr.aspx");
        }

        //送审 
        protected void Send_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE OA_KQ_SM01 set SMZT='送审中',jsrIDs='" + jsr.SelectedValue + "',jsrNames='" + jsr.SelectedItem.Text + "',SSSJ=GETDATE(),SSCS=SSCS+1 WHERE SID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");

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

        //删除考勤说明
        protected void DelJh_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("DELETE FROM OA_KQ_SM02 WHERE SSSID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            SqlHelper.ExecuteSql("DELETE FROM OA_KQ_SM01 WHERE SID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");

            mydb.Alert_Refresh("删除成功！","Kqsmlr.aspx");
        }

        //查询 
        protected void Ref_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv行处理
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";

                string spzt = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "spzt")).Trim();

                if (spzt == "审批退回")
                {
                    e.Row.ForeColor = Color.Red;
                }
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
