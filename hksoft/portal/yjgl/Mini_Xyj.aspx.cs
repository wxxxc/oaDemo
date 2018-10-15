using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.yjgl
{
    public partial class Mini_Xyj : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static string attKey;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10102,1002", "0");

                //短信
                dxtz.Visible = Convert.ToBoolean(hkdb.VeriSms());

                Random g = new Random();
                string rad = g.Next(10000).ToString();
                Number.Text = "" + System.DateTime.Now.Year.ToString() + "" + System.DateTime.Now.Month.ToString() + "" + System.DateTime.Now.Day.ToString() + "" + System.DateTime.Now.Hour.ToString() + "" + System.DateTime.Now.Minute.ToString() + "" + System.DateTime.Now.Second.ToString() + "" + System.DateTime.Now.Millisecond.ToString() + "" + rad + "";

                //附件
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT p_string FROM hk_CSDA WHERE paramt='P_AttType'");
                if (dr.Read())
                {
                    attKey = dr["p_string"].ToString();
                }
                dr.Close();

                BindAttr();

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    UserID.Text =Request.QueryString["id"];
                    UserName.Text = Request.QueryString["mc"];
                }
            }

            BindDpList();
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");

            uploadBtn.Attributes["onclick"] = "javascript:return PageCheck();";
            delBtn.Attributes["onclick"] = "javascript:return AttDel();";
        }

        //发送邮件
        protected void Send_Click(object sender, EventArgs e)
        {
            //发件箱
            int iYjid = Convert.ToInt32(SqlHelper.ExecuteScalar("INSERT INTO hk_Mail_FS(jsrIDs,jsrNames,fsbt,fsnr,zyjb,yncg,scbz,msbz,yjfj,fslx,fsrID,fsrName,fssj) VALUES('" + hkdb.GetStr(UserID.Text) + "','" + hkdb.GetStr(UserName.Text) + "','" + hkdb.GetStr(bt.Text) + "','" + editor.Value + "','" + zyx.SelectedValue + "','否','否','" + hkdb.GetValueChk_Str(msbz.Checked) + "','" + hkdb.GetStr(Number.Text) + "','内部邮件','" + this.Session["UserID"] + "','" + this.Session["UserName"] + "',GETDATE())" + "SELECT CAST(scope_identity() AS int)"));

            //循环收件箱
            string sto = UserID.Text;
            sto = sto.TrimEnd(',');

            int i = 0;
            for (i = 0; i < (sto.Split(',')).Length; i++)
            {
                SqlHelper.ExecuteSql("INSERT INTO hk_Mail_JS(ssyjid,jsr,jsrIDs,jsrNames,jsbt,jsnr,zyjb,jszt,scbz,msbz,yjfj,jslx,fsrID,fsrName,fssj) VALUES('" + iYjid + "','" + sto.Split(',')[i] + "','" + hkdb.GetStr(UserID.Text) + "','" + hkdb.GetStr(UserName.Text) + "','" + hkdb.GetStr(bt.Text) + "','" + editor.Value + "','" + zyx.SelectedValue + "','0','否','" + hkdb.GetValueChk_Str(msbz.Checked) + "','" + hkdb.GetStr(Number.Text) + "','内部邮件','" + this.Session["UserID"] + "','" + this.Session["UserName"] + "',GETDATE())");
            }

            //Msg 
            if (xxtz.Checked == true | dxtz.Checked == true)
            {
                string message = this.Session["username"].ToString() + "给您发了一封站内新邮件,请查收!";
                hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), sto, message);
            }

            mydb.Alert_Close("发送成功！");
        }

        //保存草稿 
        protected void Save_Click(object sender, EventArgs e)
        {
            string sto = UserID.Text;
            sto = sto.TrimEnd(',');

            SqlHelper.ExecuteSql("INSERT INTO hk_Mail_FS(jsrIDs,jsrNames,fsbt,fsnr,zyjb,yncg,scbz,msbz,yjfj,fslx,fsrID,fsrName,fssj) VALUES('" + hkdb.GetStr(UserID.Text) + "','" + hkdb.GetStr(UserName.Text) + "','" + hkdb.GetStr(bt.Text) + "','" + editor.Value + "','" + zyx.SelectedValue + "','是','否','" + hkdb.GetValueChk_Str(msbz.Checked) + "','" + hkdb.GetStr(Number.Text) + "','内部邮件','" + this.Session["UserID"] + "','" + this.Session["UserName"] + "',GETDATE())" + "SELECT CAST(scope_identity() AS int)");

            mydb.Alert_Close("草稿保存成功！");
        }

        public void BindDpList()
        {
            fjlb.Items.Clear();

            string sql_fjlb = "select * from hk_AttUpload where attkey='" + hkdb.GetStr(Number.Text) + "' and attClass='p01' order by attID desc";
            bd.Bind_DropDownList_NoBlank(fjlb, sql_fjlb, "attNewName", "attName", "", "");
        }

        //上传
        protected void uploadBtn_Click(object sender, EventArgs e)
        {
            string strBaseLocation = Server.MapPath("../../Attach/portal/yj/");
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

                SqlHelper.ExecuteSql("insert into hk_AttUpload(attName,attNewName,attKey,attClass) values ('" + fileName + "','" + TruePath + "','" + hkdb.GetStr(Number.Text) + "','p01')");
                BindDpList();
            }
        }
    }
}
