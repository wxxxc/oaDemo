using System;
using System.IO;
using System.Web.Security;
using haoke365;

namespace hkpro.workflow.seal
{
    public partial class MySignet_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //MD5
            string sPwdStr = FormsAuthentication.HashPasswordForStoringInConfigFile(sPwd.Text.ToString(), "MD5");

            //上传图片
            string strFolder = Server.MapPath("../../Attach/flow/Seal/");
            string strPath = string.Empty;
            string strName = string.Empty;

            if (sPicName.PostedFile.ContentLength != 0)
            {
                string fileName = Path.GetFileName(sPicName.PostedFile.FileName);
                string extName = Path.GetExtension(fileName);

                if (extName == ".jpg" | extName == ".JPG" | extName == ".bmp" | extName == ".BMP" | extName == ".gif" | extName == ".GIF" | extName == ".png" | extName == ".PNG")
                {
                    Random r = new Random();
                    string strad = r.Next(10000).ToString();
                    strName = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString() + strad;
                    sPicName.PostedFile.SaveAs(strFolder + strName + extName);
                    strPath = strName + extName;

                    SqlHelper.ExecuteSql("INSERT INTO hk_Seal(sName,sPicName,sPicNewName,sPwd,sType,sRemark,sStatus,sUser,AddUser,AddTime) values('" + hkdb.GetStr(sName.Text) + "','" + fileName + "','" + strPath + "','" + sPwdStr + "','私章','" + hkdb.GetStr(sRemark.Text) + "','待审','" + this.Session["userid"] + "','" + this.Session["userid"] + "',GETDATE())");
                    mydb.Alert_Goto("保存成功！", "MySignet.aspx");
                }
                else
                {
                    mydb.Alert("保存失败,请上传.jpg|.JPG|.gif|.GIF|.bmp|.BMP|.png|.PNG格式的印章图片！");
                }
            }
            else
            {
                mydb.Alert("请选择印章图片文件！");
            }
        }
    }
}
