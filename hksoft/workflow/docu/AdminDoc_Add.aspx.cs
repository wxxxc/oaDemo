using System;
using System.Web.UI;
using haoke365;

namespace hkpro.workflow.docu
{
    public partial class AdminDoc_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10909", "0");

                BindAttr();
            }
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");
            SaveBtn.Attributes["onclick"] = "javascript:return checkForm();";
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            //上传文档
            string strBaseLocation = Server.MapPath("../../Attach/flow/AdminDoc/");
            string TruePath = string.Empty;
            string tmpNo = string.Empty;

            if (UploadDoc.PostedFile.ContentLength != 0)
            {
                string fileName = System.IO.Path.GetFileName(UploadDoc.PostedFile.FileName);
                string extName = System.IO.Path.GetExtension(fileName);

                Random g = new Random();
                string rad = g.Next(10000).ToString();
                tmpNo = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString() + rad;
                UploadDoc.PostedFile.SaveAs(strBaseLocation + tmpNo + extName);
                TruePath = tmpNo + extName;

                SqlHelper.ExecuteSql("INSERT INTO hk_AdminDoc(adName,adOldName,adNewName,adType,adUserIDs,adUserNames,AddUser,AddTime) VALUES ('" + hkdb.GetStr(Name.Text) + "','" + fileName + "','" + TruePath + "','" + extName + "','" + hkdb.GetStr(UserID.Text) + "','" + hkdb.GetStr(UserName.Text) + "','" + this.Session["userid"] + "',GETDATE())");
                
                mydb.Alert_Goto("保存成功！", "AdminDoc.aspx");
            }
            else
            {
                mydb.Alert("请选择要上传的附件！");
            }
        }
    }
}
