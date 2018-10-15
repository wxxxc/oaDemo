using System;
using System.Data.SqlClient;
using System.IO;
using System.Web.Security;
using haoke365;

namespace hkpro.workflow.seal
{
    public partial class OffSealManage_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                Random g = new Random();
                string rad = g.Next(10000).ToString();
                lblNo.Text = "" + System.DateTime.Now.Year.ToString() + "" + System.DateTime.Now.Month.ToString() + "" + System.DateTime.Now.Day.ToString() + "" + System.DateTime.Now.Hour.ToString() + "" + System.DateTime.Now.Minute.ToString() + "" + System.DateTime.Now.Second.ToString() + "" + System.DateTime.Now.Millisecond.ToString() + "" + rad + "";

                BindAttr();
            }
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //MD5
            string sPwdStr = FormsAuthentication.HashPasswordForStoringInConfigFile("123456", "MD5");

            //上传图片
            string strFolder = Server.MapPath("../../Attach/flow/Seal/");
            string strPath = string.Empty;
            string strName = string.Empty;

            if (oPicName.PostedFile.ContentLength != 0)
            {
                string fileName = Path.GetFileName(oPicName.PostedFile.FileName);
                string extName = Path.GetExtension(fileName);

                if (extName == ".jpg" | extName == ".JPG" | extName == ".bmp" | extName == ".BMP" | extName == ".gif" | extName == ".GIF" | extName == ".png" | extName == ".PNG")
                {
                    Random r = new Random();
                    string strad = r.Next(10000).ToString();
                    strName = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString() + strad;
                    oPicName.PostedFile.SaveAs(strFolder + strName + extName);
                    strPath = strName + extName;

                    //插入公章
                    SqlHelper.ExecuteSql("INSERT INTO hk_OffSeal(oNo,oName,oPicName,oPicNewName,oPwd,oRemark,AddUser,AddTime) values('" + lblNo.Text + "','" + hkdb.GetStr(oName.Text) + "','" + fileName + "','" + strPath + "','" + sPwdStr + "','" + hkdb.GetStr(oRemark.Text) + "','" + this.Session["userid"] + "',GETDATE())");

                    //按使用人员循环
                    string strlist = null;
                    string str1 = null;
                    str1 = "" + UserID.Text + "";
                    string[] mystr = str1.Split(',');
                    for (int s = 0; s < mystr.Length; s++)
                    {
                        strlist += "'" + mystr[s] + "',";
                    }
                    strlist += "'0'";

                    SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM yh WHERE ui_id IN (" + strlist + ")");
                    while (dr.Read())
                    {
                        SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + dr["ui_id"].ToString() + "','新公章[" + hkdb.GetStr(oName.Text) + "]发布，默认密码为123456，请您尽快修改密码！'");

                        SqlHelper.ExecuteSql("INSERT INTO hk_Seal(sNo,sName,sPicName,sPicNewName,sPwd,sType,sStatus,sRemark,sUser,AddUser,AddTime) values('" + lblNo.Text + "','" + hkdb.GetStr(oName.Text) + "','" + fileName + "','" + strPath + "','" + sPwdStr + "','公章','正常','" + hkdb.GetStr(oRemark.Text) + "','" + dr["ui_id"].ToString() + "','" + this.Session["userid"] + "',GETDATE())");
                    }
                    dr.Close();

                    mydb.Alert_Goto("保存成功！", "OffSealManage.aspx");
                }
                else
                {
                    mydb.Alert("保存失败,请上传.jpg|.JPG|.gif|.GIF|.bmp|.BMP|.png|.PNG格式的公章图片！");
                }
            }
            else
            {
                mydb.Alert("请选择公章图片文件！");
            }
        }
    }
}
