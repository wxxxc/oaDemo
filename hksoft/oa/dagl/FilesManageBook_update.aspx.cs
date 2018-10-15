using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.dagl
{
    public partial class FilesManageBook_update : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static string attKey;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11802,11803", "0");

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

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM OA_FilesManageBook WHERE ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        Number.Text = datar["Number"].ToString();
                        Num.Text = datar["Num"].ToString();
                        Name.Text = datar["Name"].ToString();
                        wjTitle.Text = datar["Title"].ToString();
                        OtherTitle.Text = datar["OtherTitle"].ToString();
                        FwCompany.Text = datar["FwCompany"].ToString();
                        FwTime.Text = datar["FwTime"].ToString();
                        Miji.SelectedValue = datar["Miji"].ToString();
                        Dengji.SelectedValue = datar["Dengji"].ToString();
                        WjType.SelectedValue = datar["WjType"].ToString();
                        GwType.SelectedValue = datar["GwType"].ToString();
                        WjNum.Text = datar["WjNum"].ToString();
                        DyNum.Text = datar["DyNum"].ToString();
                        FilesName.SelectedValue = datar["FilesId"].ToString();
                        Remark.Text = datar["Remark"].ToString();
                        datar.Close();
                    }
                    else
                    {
                        datar.Close();
                        mydb.Alert_Close("此记录不存在,可能已被删除！");
                    }
                }
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
            SqlHelper.ExecuteSql("Update OA_FilesManageBook Set Num='" + hkdb.GetStr(Num.Text) + "',Name='" + hkdb.GetStr(Name.Text) + "',Title='" + hkdb.GetStr(wjTitle.Text) + "',OtherTitle='" + hkdb.GetStr(OtherTitle.Text) + "' ,FwCompany='" + hkdb.GetStr(FwCompany.Text) + "',FwTime='" + hkdb.GetStr(FwTime.Text) + "',Miji='" + hkdb.GetStr(Miji.Text) + "' ,Dengji='" + Dengji.SelectedValue + "',WjType='" + WjType.SelectedValue + "' ,GwType='" + GwType.SelectedValue + "',WjNum='" + hkdb.GetStr(WjNum.Text) + "',DyNum='" + hkdb.GetStr(DyNum.Text) + "' ,FilesName='" + FilesName.SelectedItem.Text + "',FilesId='" + FilesName.SelectedValue + "',Remark='" + hkdb.GetStr(Remark.Text) + "' where id='" + int.Parse(Request.QueryString["id"]) + "'");

            mydb.Alert_Refresh_Close("保存成功！", "FilesManageBook.aspx");
        }

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            string sql = "SELECT ID FROM OA_FilesManageBookLog WHERE BookId='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'";
            if (bd.CheckRepeat(sql) == "true")
            {
                mydb.Alert("删除失败,此文件下已存在借阅记录！");
                return;
            }

            SqlHelper.ExecuteSql("DELETE FROM OA_FilesManageBook WHERE ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

            mydb.Alert_Refresh_Close("删除成功！", "FilesManageBook.aspx");
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
