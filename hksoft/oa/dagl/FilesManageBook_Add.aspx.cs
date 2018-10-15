using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.dagl
{
    public partial class FilesManageBook_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static string attKey;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11803", "0");

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
                DropDownListBind();
            }

            BindDpList();
        }

        public void BindAttr()
        {
            uploadBtn.Attributes["onclick"] = "javascript:return PageCheck();";
            AttDelBtn.Attributes["onclick"] = "javascript:return AttDel();";
        }

        //dp绑定 
        public void DropDownListBind()
        {
            //文件密级
            string sql_mini = "SELECT ID,MC FROM hk_zdylx where fl='o06' AND zt='正常'";
            bd.Bind_DropDownList(Miji, sql_mini, "ID", "MC", "", "");

            //紧急等级
            string sql_dengji = "SELECT ID,MC FROM hk_zdylx where fl='o07' AND zt='正常'";
            bd.Bind_DropDownList(Dengji, sql_dengji, "ID", "MC", "", "");

            //文件分类
            string sql_wjtype = "SELECT ID,MC FROM hk_zdylx where fl='o08' AND zt='正常'";
            bd.Bind_DropDownList(WjType, sql_wjtype, "ID", "MC", "", "");

            //公文类别
            string sql_gwtype = "SELECT ID,MC FROM hk_zdylx where fl='o09' AND zt='正常'";
            bd.Bind_DropDownList(GwType, sql_gwtype, "ID", "MC", "", "");

            //所属案卷
            string sql_filesname = "select * from oa_FilesManage where (CHARINDEX('," + this.Session["deptid"] + ",',','+QxUnitId+',')>0) order by id desc";
            bd.Bind_DropDownList(FilesName, sql_filesname, "ID", "name", "", "");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("insert into OA_FilesManageBook(Number,Num,Name,Title,OtherTitle,FwCompany,FwTime,Miji,Dengji,WjType,GwType,WjNum,DyNum,FilesName,FilesId,State,JrUsername,JrRealname,Remark,Username,Realname) values ('" + hkdb.GetStr(Number.Text) + "','" + hkdb.GetStr(Num.Text) + "','" + hkdb.GetStr(Name.Text) + "','" + hkdb.GetStr(wjTitle.Text) + "','" + hkdb.GetStr(OtherTitle.Text) + "','" + hkdb.GetStr(FwCompany.Text) + "','" + hkdb.GetStr(FwTime.Text) + "','" + Miji.SelectedValue + "','" + hkdb.GetStr(Dengji.SelectedValue) + "','" + hkdb.GetStr(WjType.SelectedValue) + "','" + hkdb.GetStr(GwType.SelectedValue) + "','" + hkdb.GetStr(WjNum.Text) + "','" + hkdb.GetStr(DyNum.Text) + "','" + FilesName.SelectedItem.Text + "','" + FilesName.SelectedValue + "','未借出','','','" + hkdb.GetStr(Remark.Text) + "','" + this.Session["UserID"] + "','" + this.Session["UserName"] + "')");

            mydb.Alert_Refresh_Close("保存成功！","FilesManageBook.aspx");
        }

        public void BindDpList()
        {
            fjlb.Items.Clear();

            string sql_fjlb = "select * from hk_AttUpload where attkey='" + hkdb.GetStr(Number.Text) + "' and attClass='o01' order by attID desc";
            bd.Bind_DropDownList_NoBlank(fjlb, sql_fjlb, "attNewName", "attName", "", "");

        }

        //上传
        protected void uploadBtn_Click(object sender, EventArgs e)
        {
            string strBaseLocation = Server.MapPath("../../Attach/oa/dagl/");
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

                SqlHelper.ExecuteSql("insert into hk_AttUpload(attName,attNewName,attKey,attClass) values ('" + fileName + "','" + TruePath + "','" + hkdb.GetStr(Number.Text) + "','o01')");
                BindDpList();
            }
        }
    }
}
