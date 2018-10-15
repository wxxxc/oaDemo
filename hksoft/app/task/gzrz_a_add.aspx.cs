using haoke365;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hksoft.app.task
{
    public partial class gzrz_a_add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                hkdb.PassTo("10106", "0");
                lblAttachSize.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT P_STRING FROM hk_CSDA WHERE PARAMT='P_fj_size'"));

            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string FileName = "";
            string FileVisualPathStr = "";
            string UserName = this.Session["userid"].ToString();
            string sdateStr = DateTime.Today.ToString("yyyy-MM-dd") + " 08:30:00:000 ";
            string edateStr = DateTime.Today.ToString("yyyy-MM-dd") + " 17:30:00:000 ";

            //判断附件 
            if (!string.IsNullOrEmpty(fj.PostedFile.FileName.Trim()))
            {
                try
                {
                    if (fj.PostedFile.ContentLength < 1024 * int.Parse(lblAttachSize.Text))
                    {
                        FileName = System.IO.Path.GetFileName(fj.PostedFile.FileName);
                        //if (!System.IO.Directory.Exists((Server.MapPath("..\\") + "mobileAttach\\portal\\rc\\" + UserName)))
                        //{
                        //    System.IO.Directory.CreateDirectory((Server.MapPath("..\\") + "mobileAttach\\portal\\rc\\" + UserName));
                        //}
                        Random TempNameInt = new Random();
                        string NewDocDirName = TempNameInt.Next(100000000).ToString();
                        if (!System.IO.Directory.Exists((Server.MapPath("..\\") + "mobileAttach\\portal\\rc\\" + UserName + "\\" + NewDocDirName)))
                        {
                            System.IO.Directory.CreateDirectory((Server.MapPath("..\\") + "mobileAttach\\portal\\rc\\" + UserName + "\\" + NewDocDirName));
                        }
                        TempNameInt = null;
                        fj.PostedFile.SaveAs((Server.MapPath("..\\") + "mobileAttach\\portal\\rc\\" + UserName + "\\" + NewDocDirName + "\\" + FileName));
                        FileVisualPathStr = "\\mobileAttach\\portal\\rc\\" + UserName + "\\" + NewDocDirName + "\\";
                    }
                    else
                    {
                        mydb.Alert("保存失败,附件大小不能超过 " + lblAttachSize.Text + " KB！");
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }

            }
            SqlHelper.ExecuteSql("INSERT INTO HK_WDRC(zt,RCZT,KSSJ,JSSJ,RCMS,FJMC,FJLJ,SYZ,CJSJ) VALUES(0,'" + hkdb.GetStr(rzzt.Text) + "','" + sdateStr + "','" + edateStr + "','" + rzms.Text + "','" + FileName + "','" + FileVisualPathStr + "','" + this.Session["userid"] + "',getdate())");
            //判断btn 
            
           
                mydb.Alert_Refresh_Close("保存成功！", "Wdrc.aspx");
            
        }
    }
}