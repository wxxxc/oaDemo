using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Spdb_Mod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11304", "0");

                OperQx();

                //绑定下拉框 
                DropDownListBind();
                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));

                lblAttachSize.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT P_STRING FROM hk_CSDA WHERE PARAMT='P_fj_size'"));

                if (!string.IsNullOrEmpty(Request.QueryString["id"].ToString()))
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HK_SPDB WHERE SPID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        spmc.Text = datar["spmc"].ToString();
                        sply.Text = datar["sply"].ToString();
                        splx.SelectedValue = datar["splx"].ToString();
                        spjj.Text = datar["spjj"].ToString();
                        savefj.Text = datar["jmmc"].ToString();
                        savelj.Text = datar["jmlj"].ToString();
                        savefj.NavigateUrl = (datar["jmlj"] == System.DBNull.Value ? "" : "../.." + datar["jmlj"].ToString()) + datar["jmmc"].ToString();

                        datar.Close();
                    }
                    else
                    {
                        datar.Close();
                        mydb.Alert_Close("此记录不存在,可能已被删除！");
                    }
                }
            }
        }

        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(DelBtn, "11304d", Session["roleqx"].ToString());
            hkdb.QxValid(SaveBtn, "11304m", Session["roleqx"].ToString());
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string FileName = "";
            string FileVisualPathStr = "";
            string fjtype = null;

            if (!string.IsNullOrEmpty(jmmc.PostedFile.FileName.Trim()))
            {
                try
                {
                    //if (!string.IsNullOrEmpty(savefj.Text))
                    //{
                    //    System.IO.File.Delete(Server.MapPath(("../../" + savelj.Text + savefj.Text)));
                    //}

                    //上传附件 
                    if (jmmc.PostedFile.ContentLength < 1024 * int.Parse(lblAttachSize.Text))
                    {
                        FileName = System.IO.Path.GetFileName(jmmc.PostedFile.FileName);
                        fjtype = jmmc.PostedFile.FileName.Substring((jmmc.PostedFile.FileName.LastIndexOf(".") + 1));

                        if (fjtype == "wmv" | fjtype == "WMV" | fjtype == "swf" | fjtype == "SWF")
                        {
                            //if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\") + "Attach\\portal\\video\\" + this.Session["userid"].ToString())))
                            //{
                            //    System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\") + "Attach\\portal\\video\\" + this.Session["userid"].ToString()));
                            //}
                            Random TempNameInt = new Random();
                            string NewDocDirName = TempNameInt.Next(100000000).ToString();
                            if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\") + "Attach\\portal\\video\\" + this.Session["userid"].ToString() + "\\" + NewDocDirName)))
                            {
                                System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\") + "Attach\\portal\\video\\" + this.Session["userid"].ToString() + "\\" + NewDocDirName));
                            }
                            TempNameInt = null;
                            jmmc.PostedFile.SaveAs((Server.MapPath("..\\..\\") + "Attach\\portal\\video\\" + this.Session["userid"].ToString() + "\\" + NewDocDirName + "\\" + FileName));
                            FileVisualPathStr = "\\Attach\\portal\\video\\" + this.Session["userid"].ToString() + "\\" + NewDocDirName + "\\";
                        }
                        else
                        {
                            mydb.Alert("系统不支持这种附件格式，请选择.swf扩展名的视频文件！");
                            return;
                        }
                    }
                    else
                    {
                        mydb.Alert("保存失败,附件大小不能超过 " + lblAttachSize.Text + " KB！");
                        return;
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                SqlHelper.ExecuteSql("UPDATE HK_SPDB SET spmc='" + hkdb.GetStr(spmc.Text) + "',sply='" + hkdb.GetStr(sply.Text) + "',splx='" + splx.SelectedValue + "',spjj='" + hkdb.GetStr(spjj.Text) + "',jmmc='" + FileName + "',jmlj='" + FileVisualPathStr + "' WHERE SPID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

            }
            else
            {
                FileName = savefj.Text;
                FileVisualPathStr = savelj.Text;
                SqlHelper.ExecuteSql("UPDATE HK_SPDB SET spmc='" + hkdb.GetStr(spmc.Text) + "',sply='" + hkdb.GetStr(sply.Text) + "',splx='" + splx.SelectedValue + "',spjj='" + hkdb.GetStr(spjj.Text) + "',jmmc='" + FileName + "',jmlj='" + FileVisualPathStr + "' WHERE SPID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            }

            mydb.Alert_Refresh_Close("保存成功！","Spdb.aspx");
        }

        public void DropDownListBind()
        {
            string sql = "SELECT MC,ID FROM HK_ZDYLX WHERE fl='p08' AND ZT='正常' ORDER BY ID";
            bd.Bind_DropDownList(splx, sql, "ID", "MC", "", "");
        }

        protected void Del_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            if (!string.IsNullOrEmpty(Request.QueryString["id"].ToString()))
            {
                SqlHelper.ExecuteSql("DELETE FROM HK_SPDB WHERE SPID = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                mydb.Alert_Refresh_Close("删除成功！","Spdb.aspx");
            }
        }
    }
}