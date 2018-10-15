using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Kpxmwh_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static string attKey;
        protected void Page_Load(object Sender, EventArgs E)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("81105", "0");

                //附件
                attKey = this.Session["fjlx"].ToString();

                BindAttr();

                Random g = new Random();
                string rad = g.Next(10000).ToString();
                Number.Text = "" + System.DateTime.Now.Year.ToString() + "" + System.DateTime.Now.Month.ToString() + "" + System.DateTime.Now.Day.ToString() + "" + System.DateTime.Now.Hour.ToString() + "" + System.DateTime.Now.Minute.ToString() + "" + System.DateTime.Now.Second.ToString() + "" + System.DateTime.Now.Millisecond.ToString() + "" + rad + "";
                
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";

                    if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                    {
                        SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HR_Kpdf_Kpxm01 WHERE KPID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                        if (datar.Read())
                        {
                            kpid.Text = datar["kpid"].ToString();
                            kpqs.Text = datar["kpqs"].ToString();
                            ksrq.Text = hkdb.GetDate(datar["ksrq"].ToString());
                            jzrq.Text = hkdb.GetDate(datar["jzrq"].ToString());
                            kpzt.Text = datar["kpzt"].ToString();
                            UserID.Text = datar["CypwIDs"].ToString();
                            UserName.Text = datar["CypwNames"].ToString();
                            bz.Text = datar["kpbz"].ToString();

                            if (!string.IsNullOrEmpty(datar["xmfj"].ToString()))
                            {
                                Number.Text = datar["xmfj"].ToString();
                            }
                            datar.Close();

                            //Init
                            switch (kpzt.Text)
                            {
                                case "未生效":
                                    SaveBtn.Visible = true;
                                    DelBtn.Visible = true;
                                    StartBtn.Visible = true;
                                    AttDelBtn.Visible = true;
                                    uploadBtn.Visible = true;
                                    break;
                                case "已生效":
                                    StopBtn.Visible = true;
                                    break;
                                case "已暂停":
                                    StartBtn.Visible = true;
                                    ResetBtn.Visible = true;
                                    break;
                                case "已结束":
                                    break;
                            }

                            ksrq.Enabled = false;
                            jzrq.Enabled = false;
                        }
                        else
                        {
                            datar.Close();
                            mydb.Alert_Close("此记录不存在,可能已被删除！");
                        }
                    }
                }
                else
                {
                    lbltitle.Text = "新增";
                    kpzt.Text = "未生效";

                    SaveBtn.Visible = true;
                }
            }

            BindDpList();
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");

            uploadBtn.Attributes["onclick"] = "javascript:return PageCheck();";
            AttDelBtn.Attributes["onclick"] = "javascript:return AttDel();";
        }

        protected void Save_Click(object Sender, EventArgs E)
        {
            //判断必须有、且只能有1名 总经理评委
            int iPw_zr = Convert.ToInt32(SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM HR_Kpdf_Pw WHERE CHARINDEX(pid,'" + hkdb.GetStr(UserID.Text) + "')>0 AND PWLX='总经理评委'").ToString());
            if (iPw_zr != 1)
            {
                mydb.Alert("保存失败，参与评委中必须有、且只能有1名【总经理评委】！");
                return;
            }

            //判断必须有、且只能有1名 工作人员评委
            int iPw_gzry = Convert.ToInt32(SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM HR_Kpdf_Pw WHERE CHARINDEX(pid,'" + hkdb.GetStr(UserID.Text) + "')>0 AND PWLX='工作人员评委'").ToString());
            if (iPw_gzry != 1)
            {
                mydb.Alert("保存失败，参与评委中必须有、且只能有1名【工作人员评委】！");
                return;
            }

            //判断必须有7名以上 一般评委
            int iPw_ybpw = Convert.ToInt32(SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM HR_Kpdf_Pw WHERE CHARINDEX(pid,'" + hkdb.GetStr(UserID.Text) + "')>0 AND PWLX='一般评委'").ToString());
            if (iPw_ybpw < 7)
            {
                mydb.Alert("保存失败，参与评委中必须有7名以上【一般评委】！");
                return;
            }

            //判断不能有考评管理员
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM HR_Kpdf_Pw WHERE CHARINDEX(pid,'" + hkdb.GetStr(UserID.Text) + "')>0 AND PWLX='考评管理员'");
            if (dr.Read())
            {
                dr.Close();
                mydb.Alert("参与评委中不能有【考评管理员】！");
                return;
            }
            dr.Close();

            if (lbltitle.Text == "新增")
            {
                //考评日期判断
                int iDays = Convert.ToInt32(SqlHelper.ExecuteScalar("SELECT P_Value FROM HR_Kpdf_Paramt WHERE P_Code='WaitTime'").ToString());
                if (bd.CheckRepeat("SELECT kpid FROM HR_Kpdf_Kpxm01 WHERE ('" + hkdb.GetStr(ksrq.Text) + "' BETWEEN ksrq AND jzrq+" + iDays + " OR '" + hkdb.GetStr(jzrq.Text) + "' BETWEEN ksrq AND jzrq+" + iDays + ")") == "true")
                {
                    mydb.Alert("保存失败，该考评日期范围内不能重复创建考评项目！");
                    return;
                }

                kpid.Text = SqlHelper.ExecuteScalar("INSERT INTO HR_Kpdf_Kpxm01(kpqs,ksrq,jzrq,kpzt,CypwIDs,CypwNames,kpbz,cjr,cjsj,xmfj) VALUES"
                    + "('" + hkdb.GetStr(kpqs.Text) + "','" + hkdb.GetStr(ksrq.Text) + "','" + hkdb.GetStr(jzrq.Text) + "','" + hkdb.GetStr(kpzt.Text) + "','" + hkdb.GetStr(UserID.Text) + "','" + hkdb.GetStr(UserName.Text) + "','" + hkdb.GetStr(bz.Text) + "','" + this.Session["userid"] + "',GETDATE(),'" + hkdb.GetStr(Number.Text) + "')" + "SELECT CAST(scope_identity() AS int)").ToString();

                SaveBtn.Enabled = false;

                mydb.Alert_Refresh("保存成功！", "Kpxmwh.aspx");
            }
            else
            {
                SqlHelper.ExecuteSql("UPDATE HR_Kpdf_Kpxm01 SET kpqs='" + hkdb.GetStr(kpqs.Text) + "',ksrq='" + hkdb.GetStr(ksrq.Text) + "',jzrq='" + hkdb.GetStr(jzrq.Text) + "',CypwIDs='" + hkdb.GetStr(UserID.Text) + "',CypwNames='" + hkdb.GetStr(UserName.Text) + "',kpbz='" + hkdb.GetStr(bz.Text) + "',xgr='" + this.Session["userid"] + "',xgsj=GETDATE(),xmfj='" + hkdb.GetStr(Number.Text) + "' WHERE KPID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

                mydb.Alert_Refresh_Close("保存成功！", "Kpxmwh.aspx");
            }
        }

        //删除 
        protected void Del_Click(object Sender, EventArgs E)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            SqlHelper.ExecuteSql("DELETE FROM HR_Kpdf_Kpxm03 WHERE sskpid = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            SqlHelper.ExecuteSql("DELETE FROM HR_Kpdf_Kpxm02 WHERE sskpid = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            SqlHelper.ExecuteSql("DELETE FROM HR_Kpdf_Kpxm01 WHERE kpid = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

            mydb.Alert_Refresh_Close("删除成功！", "Kpxmwh.aspx");
        }

        //启动
        protected void Start_Click(object Sender, EventArgs E)
        {
            //是否已录入被考评人明细
            if (bd.CheckRepeat("SELECT mxid FROM HR_Kpdf_Kpxm02 WHERE SSKPID='" + hkdb.GetStr(kpid.Text) + "'") == "false")
            {
                mydb.Alert("启动失败，当前项目尚未维护被考评人明细信息！");
                return;
            }

            SqlHelper.ExecuteSql("UPDATE HR_Kpdf_Kpxm01 SET KPZT='已生效' WHERE kpid = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            mydb.Alert_Refresh_Close("启动成功！", "Kpxmwh.aspx");
        }

        //暂停
        protected void Stop_Click(object Sender, EventArgs E)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            SqlHelper.ExecuteSql("UPDATE HR_Kpdf_Kpxm01 SET KPZT='已暂停' WHERE kpid = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            mydb.Alert_Refresh_Close("暂停成功！", "Kpxmwh.aspx");
        }

        //重新修改
        protected void Reset_Click(object Sender, EventArgs E)
        {
            SqlHelper.ExecuteSql("UPDATE HR_Kpdf_Kpxm01 SET KPZT='未生效' WHERE kpid = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            mydb.Alert_Refresh_Close("已重置为未生效状态！", "Kpxmwh.aspx");
        }

        public void BindDpList()
        {
            fjlb.Items.Clear();

            //附件列表
            string sql_fjlb = "select * from hk_AttUpload where attkey='" + hkdb.GetStr(Number.Text) + "' and attClass='h22' order by attID desc";
            bd.Bind_DropDownList_NoBlank(fjlb, sql_fjlb, "attNewName", "attName", "", "");
        }

        //上传
        protected void uploadBtn_Click(object sender, EventArgs e)
        {
            string strBaseLocation = Server.MapPath("../../Attach/hr/jxgl/");
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

                SqlHelper.ExecuteSql("insert into hk_AttUpload(attName,attNewName,attKey,attClass) values ('" + fileName + "','" + TruePath + "','" + hkdb.GetStr(Number.Text) + "','h22')");
                BindDpList();
            }
        }
    }
}
