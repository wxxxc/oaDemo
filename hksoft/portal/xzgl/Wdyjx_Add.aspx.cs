using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Wdyjx_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static string attKey;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
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

                //dp绑定 
                string str1 = " where zt='正常'";
                if (this.Session["systype"].ToString() == "G")
                {
                    str1 = str1 + " and lx='供应商'";
                }
                else
                {
                    str1 = str1 + " and lx='企业' and CHARINDEX('" + this.Session["UserID"] + "',UserIDs)>0 ";
                }

                string sql = "SELECT ID,MC FROM HK_YJX" + str1;
                bd.Bind_DropDownList(yjx, sql, "ID", "MC", "", "");
            }

            BindDpList();
        }

        public void BindAttr()
        {
            uploadBtn.Attributes["onclick"] = "javascript:return PageCheck();";
            AttDelBtn.Attributes["onclick"] = "javascript:return AttDel();";
        }

        //保存 
        protected void Save_Click(object sender, EventArgs e)
        {
            string fbrstr = null;
            if (nm.Checked == true)
            {
                fbrstr = "匿名";
            }
            else
            {
                fbrstr = this.Session["username"].ToString();
            }

            SqlHelper.ExecuteSql("INSERT INTO HK_WDYJ(YJBT,YJNR,YJX,FJMC,ZT,FBRID,FBRMC,FBSJ) VALUES('" + hkdb.GetStr(yjbt.Text) + "','" + hkdb.GetStrTeIn(editor.Value) + "','" + yjx.SelectedValue + "','" + hkdb.GetStr(Number.Text) + "','待回复','" + this.Session["UserID"] + "','" + fbrstr + "',GETDATE())");

            //发送消息
            string jsr = Convert.ToString(SqlHelper.ExecuteScalar("SELECT GLY FROM HK_YJX WHERE ID='" + yjx.SelectedValue + "'"));
            string message = "有人向您的意见箱里提交了意见,请尽快回复!";
            SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'系统提示','" + jsr + "','" + message + "'");

            mydb.Alert_Close("发表成功！");
        }

        public void BindDpList()
        {
            fjlb.Items.Clear();

            string sql_fjlb = "select * from hk_AttUpload where attkey='" + hkdb.GetStr(Number.Text) + "' and attClass='p03' order by attID desc";
            bd.Bind_DropDownList_NoBlank(fjlb, sql_fjlb, "attNewName", "attName", "", "");
        }

        //上传
        protected void uploadBtn_Click(object sender, EventArgs e)
        {
            string strBaseLocation = Server.MapPath("../../Attach/portal/yjx/");
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

                SqlHelper.ExecuteSql("insert into hk_AttUpload(attName,attNewName,attKey,attClass) values ('" + fileName + "','" + TruePath + "','" + hkdb.GetStr(Number.Text) + "','p03')");
                BindDpList();
            }
        }
    }
}
