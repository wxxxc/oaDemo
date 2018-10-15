using System;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web;
using haoke365;

namespace hkpro.portal.wpgl
{
    public partial class Uploadfile : System.Web.UI.Page
    {
        int nDirID = -1;
        public static string attKey;

        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10109", "0");

                //附件
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT P_STRING FROM HK_CSDA WHERE paramt='P_AttType'");
                if (dr.Read())
                {
                    attKey = dr["p_string"].ToString();
                }
                dr.Close();
            }

            ///获取参数 
            if ((Request.Params["DirID"] != null))
            {
                if (Int32.TryParse(Request.Params["DirID"].ToString(), out nDirID) == false)
                {
                    return;
                }
            }

            ///设置按钮
            if (nDirID <= -1)
            {
                SureBtn.Enabled = false;
            }
            else
            {
                SureBtn.Enabled = true;
            }
        }

        //上传
        protected void SureBtn_Click(object sender, EventArgs e)
        {
            UploadFiles(nDirID);
        }

        //处理过程
        public void UploadFiles(int DirID)
        {
            //上传文件列表 
            HttpFileCollection fileList = HttpContext.Current.Request.Files;

            ///定义消息 
            StringBuilder uploadMsg = new StringBuilder("<b>上传结果：</b>" + "<br><br>");

            try
            {
                //上传路径
                string strBaseLocation = Server.MapPath("../../Attach/portal/wd/");

                //循环文件列表 
                int i = 0;
                for (i = 0; i <= fileList.Count - 1; i++)
                {
                    //获取上传文件名
                    HttpPostedFile hPostedFile = fileList[i];
                    string fileName = null;
                    fileName = Path.GetFileName(hPostedFile.FileName);

                    //新文件名
                    string strNewName = string.Empty;

                    if (!string.IsNullOrEmpty(fileName))
                    {
                        //获取扩展名
                        string extName = System.IO.Path.GetExtension(fileName);

                        //判断扩展名是否非法
                        if (attKey.IndexOf(extName) != -1)
                        {
                            //生成随机名 
                            string Temp1 = "";
                            string rad = "";
                            Random g = null;
                            g = new Random();
                            rad = g.Next(10000).ToString();
                            Temp1 = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString() + rad;

                            //上传文件
                            strNewName = Temp1 + i.ToString() + extName;
                            hPostedFile.SaveAs(strBaseLocation + strNewName);

                            SqlHelper.ExecuteSql("INSERT INTO HK_NETDISK_URL(DIRID,FILENAME,NEWNAME,TYPE,CONTAIN,CREATEDATE) VALUES('" + DirID + "','" + fileName + "','" + strNewName + "','" + hPostedFile.ContentType + "','" + hPostedFile.ContentLength + "',GETDATE())");

                            uploadMsg.Append(("上传成功：<font color=blue>" + fileName + "</font><br>"));
                        }
                        else
                        {
                            uploadMsg.Append(("<font color=red>上传失败：【" + fileName + "】文件的扩展名不在本系统许可范围内</font><br>"));
                        }
                    }
                }

                //上传成功
                StatusMsg.Text = uploadMsg.ToString();
            }
            catch (Exception ex)
            {
                //上传失败
                StatusMsg.Text = ex.Message;
            }
        }

        //返回 
        protected void ReturnBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShowDisk.aspx");
        }
    }
}
