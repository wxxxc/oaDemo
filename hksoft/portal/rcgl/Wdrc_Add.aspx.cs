using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.rcgl
{
    public partial class Wdrc_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10106", "0");

                lblAttachSize.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT P_STRING FROM hk_CSDA WHERE PARAMT='P_fj_size'"));

                if (!string.IsNullOrEmpty(Request.QueryString["sd"]))
                {
                    DateTime txtbegstr = Convert.ToDateTime(Request.QueryString["sd"].ToString());
                    DateTime txtendstr = Convert.ToDateTime(Request.QueryString["sd"].ToString());
                    txtSdate.Text = txtbegstr.ToString("yyyy-MM-dd");
                    txtEdate.Text = txtendstr.ToString("yyyy-MM-dd");
                    ssf.SelectedValue = Request.QueryString["st"].ToString();
                    esf.SelectedValue = Request.QueryString["st"].ToString();
                }
                else
                {
                    txtSdate.Text = DateTime.Now.AddDays(0).ToString("yyyy-MM-dd");
                    txtEdate.Text = DateTime.Now.AddDays(0).ToString("yyyy-MM-dd");
                }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            string sdateStr = null;
            string edateStr = null;
            string FileName = "";
            string FileVisualPathStr = "";
            string UserName = this.Session["userid"].ToString();
            sdateStr = txtSdate.Text + " " + ssf.SelectedValue;
            edateStr = txtEdate.Text + " " + esf.SelectedValue;

            if (Convert.ToDateTime(edateStr) < Convert.ToDateTime(sdateStr))
            {
                mydb.Alert("开始时间必须小于结束时间！");
                return;
            }

            //判断附件 
            if (!string.IsNullOrEmpty(fj.PostedFile.FileName.Trim()))
            {
                try
                {
                    if (fj.PostedFile.ContentLength < 1024 * int.Parse(lblAttachSize.Text))
                    {
                        FileName = System.IO.Path.GetFileName(fj.PostedFile.FileName);
                        //if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\") + "Attach\\portal\\rc\\" + UserName)))
                        //{
                        //    System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\") + "Attach\\portal\\rc\\" + UserName));
                        //}
                        Random TempNameInt = new Random();
                        string NewDocDirName = TempNameInt.Next(100000000).ToString();
                        if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\") + "Attach\\portal\\rc\\" + UserName + "\\" + NewDocDirName)))
                        {
                            System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\") + "Attach\\portal\\rc\\" + UserName + "\\" + NewDocDirName));
                        }
                        TempNameInt = null;
                        fj.PostedFile.SaveAs((Server.MapPath("..\\..\\") + "Attach\\portal\\rc\\" + UserName + "\\" + NewDocDirName + "\\" + FileName));
                        FileVisualPathStr = "\\Attach\\portal\\rc\\" + UserName + "\\" + NewDocDirName + "\\";
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

            //SqlHelper.ExecuteSql("INSERT INTO HK_WDRC(RCZT,RCDD,KSSJ,JSSJ,RCFL,ZT,YXJ,RCMS,FJMC,FJLJ,SYZ,CJSJ) VALUES('" + hkdb.GetStr(rczt.Text) + "','" + hkdb.GetStr(rcdd.Text) + "','" + sdateStr + "','" + edateStr + "','" + rcfl.SelectedValue + "','" + zt.SelectedValue + "','" + yxj.SelectedValue + "','" + hkdb.GetStr(rcms.Text) + "','" + FileName + "','" + FileVisualPathStr + "','" + this.Session["userid"] + "',getdate())");
            SqlHelper.ExecuteSql("INSERT INTO HK_WDRC(zt,RCZT,KSSJ,JSSJ,RCMS,FJMC,FJLJ,SYZ,CJSJ) VALUES(0,'" + hkdb.GetStr(rczt.Text) + "','" + sdateStr + "','" + edateStr + "','" + editor.Value + "','" + FileName + "','" + FileVisualPathStr + "','" + this.Session["userid"] + "',getdate())");
            //判断btn 
            if (s == "SaveAddBtn")
            {
                rczt.Text = "";
                //rcfl.SelectedValue = "";
                //rcdd.Text = "";
                //rcms.Text = "";
                //zt.SelectedValue = "0";
                //yxj.SelectedValue = "1";
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Wdrc.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！","Wdrc.aspx");
            }
        }

        //protected void Qtsj_Check(object sender, EventArgs e)
        //{
        //    if (qtsj.Checked == true)
        //    {
        //        ssf.SelectedValue = "00:00:00";
        //        esf.SelectedValue = "00:00:00";
        //        ssf.Visible = false;
        //        esf.Visible = false;
        //    }
        //    else
        //    {
        //        ssf.SelectedValue = "00:00:00";
        //        esf.SelectedValue = "00:00:00";
        //        ssf.Visible = true;
        //        esf.Visible = true;
        //    }
        //}

        protected void Clear_Click(object sender, EventArgs e)
        {
            rczt.Text = "";
            //rcfl.SelectedValue = "";
            //rcdd.Text = "";
            editor.Value = "";
            //zt.SelectedValue = "0";
            //yxj.SelectedValue = "1";
        }
    }
}
