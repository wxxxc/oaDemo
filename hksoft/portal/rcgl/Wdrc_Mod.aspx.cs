using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.portal.rcgl
{
    public partial class Wdrc_Mod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10106", "0");
                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));

                lblAttachSize.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT P_STRING FROM hk_CSDA WHERE PARAMT='P_fj_size'"));

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM HK_WDRC WHERE RCID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (dr.Read())
                {
                    rczt.Text = dr["rczt"].ToString();
                    //rcdd.Text = dr["rcdd"].ToString();
                    //rcfl.SelectedValue = dr["rcfl"].ToString();
                    txtSdate.Text = string.Format("{0:d}", dr["kssj"]);
                    ssf.SelectedValue = string.Format("{0:HH:mm:ss}", dr["kssj"]);
                    txtEdate.Text = string.Format("{0:d}", dr["jssj"]);
                    esf.SelectedValue = string.Format("{0:HH:mm:ss}", dr["jssj"]);
                    editor.Value = dr["rcms"].ToString();
                    //zt.SelectedValue = dr["zt"].ToString();
                    //yxj.SelectedValue = dr["yxj"].ToString();
                    //cjsj.Text = dr["cjsj"].ToString();
                    savefj.Text = dr["fjmc"].ToString();
                    savelj.Text = dr["fjlj"].ToString();
                    savefj.NavigateUrl = (dr["fjlj"] == System.DBNull.Value ? "" : "../.." + dr["fjlj"].ToString()) + dr["fjmc"].ToString();

                    dr.Close();
                }
                else
                {
                    dr.Close();
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
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
                    if (!string.IsNullOrEmpty(savefj.Text))
                    {
                        System.IO.File.Delete(Server.MapPath(("../../" + savelj.Text + savefj.Text)));
                    }

                    //上传附件 
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
            else
            {
                FileName = savefj.Text;
                FileVisualPathStr = savelj.Text;
            }

            SqlHelper.ExecuteSql("UPDATE HK_WDRC SET RCZT='" + hkdb.GetStr(rczt.Text) + "',kssj='"+ sdateStr + "',jssj='" + sdateStr + "',rcms='" + editor.Value + "',fjmc='" + FileName + "',fjlj='" + FileVisualPathStr + "',CJSJ=GETDATE() WHERE RCID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            mydb.Alert_Refresh_Close("保存成功！","Wdrc.aspx");
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

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(savefj.Text))
            {
                System.IO.File.Delete(Server.MapPath(("../../" + savelj.Text + savefj.Text)));
            }

            SqlHelper.ExecuteSql("DELETE FROM HK_WDRC WHERE RCID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            mydb.Alert_Refresh_Close("删除成功！","Wdrc.aspx");
        }

        //标记完成
        protected void Bj_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE HK_WDRC SET ZT='2' WHERE RCID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            mydb.Alert_Refresh_Close("标记完成！","Wdrc.aspx");
        }
    }
}
