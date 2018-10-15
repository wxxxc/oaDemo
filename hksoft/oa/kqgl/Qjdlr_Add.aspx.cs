using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Qjdlr_Add : System.Web.UI.Page
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
            SqlDataReader dr_sp = SqlHelper.ExecuteReader("SELECT qzcyid FROM hk_QZDA WHERE CJR='" + this.Session["UserID"] + "' AND QZLX='OA考勤请假审批专用群组'");
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
            //判断时间
            DateTime sdate = Convert.ToDateTime(qjkssj.Text);
            DateTime edate = Convert.ToDateTime(qjjssj.Text);
            if (sdate > edate)
            {
                mydb.Alert("请假截止日期不能小于开始日期！");
                return;
            }

            //判断请假天数
            double iQjts = Convert.ToDouble(SqlHelper.ExecuteScalar("SELECT DATEDIFF(day, '" + qjkssj.Text + "', '" + qjjssj.Text + "')+1").ToString());
            if (iQjts < Convert.ToDouble(qjts.Text))
            {
                mydb.Alert("请假天数超出了本次请假起止日期范围！");
                return;
            }

            //1.取到选定考勤类型、请假开始日期所属年份 下的可用假期天数
            double iKyjqts = 0;

            //2.本次请假天数
            //double iBcqjts = Convert.ToDouble(SqlHelper.ExecuteScalar("SELECT DATEDIFF(day, '" + qjkssj.Text + "', '" + qjjssj.Text + "')+1").ToString());
            double iBcqjts = Convert.ToDouble(qjts.Text);
            
            //年假
            if (qjlx.SelectedValue == "年假")
            { 
                //可用年假：1年以内0天；1(含)-10年5天；10(含)至20年:10天；20年(含)以上：15天
                SqlDataReader dr_nj = SqlHelper.ExecuteReader("SELECT (CASE WHEN nian>=1 AND nian<10 THEN 5 WHEN nian>=10 AND nian<20 THEN 10 WHEN nian>=20 THEN 15 ELSE 0 END)AS njts FROM (SELECT ISNULL(DATEDIFF(YEAR,CONVERT(VARCHAR(4),ui_rzrq,112)+'.1.1',DATEADD(DAY,-DATEDIFF(DAY,CONVERT(VARCHAR(4),ui_rzrq,112)+'.1.1',ui_rzrq),convert(char(10),getdate(),111))),0)AS nian FROM yh WHERE ui_id='" + this.Session["UserID"] + "')Z");
                if (dr_nj.Read())
                {
                    iKyjqts = Convert.ToDouble(dr_nj["njts"].ToString());
                }
                dr_nj.Close();

                //取到选定考勤类型、请假开始日期所属年份 下的已用假期天数
                double iYyqjts = Convert.ToDouble(SqlHelper.ExecuteScalar("SELECT ISNULL(SUM(QJTS),0)AS QJTS FROM OA_KQ_QJD01 WHERE SQRID='" + this.Session["UserID"] + "' AND QJZT='已确认' AND DATEADD(yy, DATEDIFF(yy,0,QJKSSJ), 0)=DATEADD(yy, DATEDIFF(yy,0,'" + qjkssj.Text + "'), 0) AND QJLX='" + qjlx.SelectedValue + "'").ToString());

                //验证天数
                if (iBcqjts > (iKyjqts - iYyqjts))
                {
                    mydb.Alert("提交失败,您当前选定的【请假类型】已超过了剩余可用天数【" + (iKyjqts - iYyqjts).ToString() + "】！");
                    return;
                }
            }

            //事假、病假
            if (qjlx.SelectedValue == "事假" | qjlx.SelectedValue == "病假")
            {
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT TOP 1 * FROM OA_KQ_JQFZ WHERE JQNF=DATEADD(yy, DATEDIFF(yy,0,'" + qjkssj.Text + "'), 0) AND CHARINDEX('" + this.Session["UserID"] + "',UserIDs)>0 ");
                if (dr.Read())
                {
                    switch (qjlx.SelectedValue)
                    {
                        case "事假":
                            iKyjqts = Convert.ToDouble(dr["shjts"].ToString());
                            break;
                        case "病假":
                            iKyjqts = Convert.ToDouble(dr["bjts"].ToString());
                            break;
                    }
                    dr.Close();
                }
                else
                {
                    dr.Close();
                    mydb.Alert("提交失败,在【本次请假年份】下尚未维护您的假期信息！");
                    return;
                }

                //取到选定考勤类型、请假开始日期所属年份 下的已用假期天数
                double iYyqjts = Convert.ToDouble(SqlHelper.ExecuteScalar("SELECT ISNULL(SUM(QJTS),0)AS QJTS FROM OA_KQ_QJD01 WHERE SQRID='" + this.Session["UserID"] + "' AND QJZT='已确认' AND DATEADD(yy, DATEDIFF(yy,0,QJKSSJ), 0)=DATEADD(yy, DATEDIFF(yy,0,'" + qjkssj.Text + "'), 0) AND QJLX='" + qjlx.SelectedValue + "'").ToString());

                //验证天数
                if (iBcqjts > (iKyjqts - iYyqjts))
                {
                    mydb.Alert_Refresh("请注意，您当前选定的【请假类型】已超过了剩余可用天数【" + (iKyjqts - iYyqjts).ToString() + "】天，超过规定请假天数后将会有扣款！","Qjdlr.aspx");
                    //return;
                }
            }

            //更新数据库
            IDlabel.Text = Convert.ToString(SqlHelper.ExecuteScalar("INSERT INTO OA_KQ_QJD01(QJLX,GJLB,QJKSSJ,QJKSSD,QJJSSJ,QJJSSD,QJTS,QJLY,GZTZQK,QJZT,SQRID,SQRMC,SQBMID,SQBMMC,SQSJ,jsrIDs,jsrNames,qjfj) VALUES('" + qjlx.SelectedValue + "','" + gjlb.SelectedValue + "','" + hkdb.GetStr(qjkssj.Text) + "','" + qjkssd.SelectedValue + "','" + hkdb.GetStr(qjjssj.Text) + "','" + qjjssd.SelectedValue + "','" + hkdb.GetStr(qjts.Text) + "','" + hkdb.GetStr(qjly.Text) + "','" + hkdb.GetStr(gztzqk.Text) + "','录入','" + this.Session["userid"] + "','" + this.Session["username"] + "','" + this.Session["deptid"] + "','" + this.Session["deptname"] + "',GETDATE(),'" + jsr.SelectedValue + "','" + jsr.SelectedItem.Text + "','" + hkdb.GetStr(Number.Text) + "')" + "select cast(scope_identity() as int)"));
                        
            mydb.Alert_Refresh("保存成功！","Qjdlr.aspx");
            
            SaveBtn.Visible = false;
            SendBtn.Visible = true;
        }

        //送审 
        protected void Send_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE OA_KQ_QJD01 SET QJZT='送审中',jsrIDs='" + jsr.SelectedValue + "',jsrNames='" + jsr.SelectedItem.Text + "',SSSJ=GETDATE() WHERE QJZT='录入' AND QID='" + IDlabel.Text + "'");

            SendMsg();

            mydb.Alert_Refresh_Close("送审成功！","Qjdlr.aspx");
        }

        //消息通知
        public void SendMsg()
        {
            //Msg 
            if (xxtz.Checked == true | dxtz.Checked == true)
            {
                string message = this.Session["username"].ToString() + "提交了一份请假单,请审批!";
                hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), jsr.SelectedValue, message);
            }
        }

        //请假类型切换
        protected void qjlx_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (qjlx.SelectedValue == "公假")
            {
                lblgjlb.Visible = true;
                gjlb.Visible = true;
            }
            else
            {
                gjlb.SelectedValue = "";
                lblgjlb.Visible = false;
                gjlb.Visible = false;
            }
        }

        //考勤审批说明
        protected void Kqspsm()
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT SMID FROM OA_KQ_SPSM WHERE SMLX='请假单' AND SYRY='申请人员'");
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
            string sql_fjlb = "select * from hk_AttUpload where attkey='" + hkdb.GetStr(Number.Text) + "' and attClass='o02' order by attID desc";
            bd.Bind_DropDownList_NoBlank(fjlb, sql_fjlb, "attNewName", "attName", "", "");
        }

        //上传
        protected void uploadBtn_Click(object sender, EventArgs e)
        {
            string strBaseLocation = Server.MapPath("../../Attach/oa/qjd/");
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

                SqlHelper.ExecuteSql("insert into hk_AttUpload(attName,attNewName,attKey,attClass) values ('" + fileName + "','" + TruePath + "','" + hkdb.GetStr(Number.Text) + "','o02')");
                BindDpList();
            }
        }
    }
}
