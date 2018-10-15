using System;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Spdb_w_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("60204", "0");

                DropDownListBind();

                lblAttachSize.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT P_STRING FROM hk_CSDA WHERE PARAMT='P_fj_size'"));
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            string FileName = "";
            string FileVisualPathStr = "";
            string fjtype = null;

            //判断附件 
            if (!string.IsNullOrEmpty(jmmc.PostedFile.FileName.Trim()))
            {
                try
                {
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

                SqlHelper.ExecuteSql("INSERT INTO HK_SPDB(SPMC,SPLY,SPLX,JMMC,JMLJ,SPJJ,CJR,CJSJ) VALUES('" + hkdb.GetStr(spmc.Text) + "','" + hkdb.GetStr(sply.Text) + "','" + splx.SelectedValue + "','" + FileName + "','" + FileVisualPathStr + "','" + hkdb.GetStr(spjj.Text) + "','" + this.Session["userid"] + "',GETDATE())");
            }
            else
            {
                SqlHelper.ExecuteSql("INSERT INTO HK_SPDB(SPMC,SPLY,SPLX,JMMC,JMLJ,SPJJ,CJR,CJSJ) VALUES('" + hkdb.GetStr(spmc.Text) + "','" + hkdb.GetStr(sply.Text) + "','" + splx.SelectedValue + "','" + FileName + "','" + FileVisualPathStr + "','" + hkdb.GetStr(spjj.Text) + "','" + this.Session["userid"] + "',GETDATE())");

            }

            //判断btn 
            if (s == "SaveAddBtn")
            {
                spmc.Text = "";
                sply.Text = "";
                splx.SelectedValue = "";
                spjj.Text = "";
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Spdb_w.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！","Spdb_w.aspx");
            }
        }

        public void DropDownListBind()
        {
            string sql = "SELECT MC,ID FROM HK_ZDYLX WHERE fl='p08' AND ZT='正常' ORDER BY ID";
            bd.Bind_DropDownList(splx, sql, "ID", "MC", "", "");
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            spmc.Text = "";
            sply.Text = "";
            splx.SelectedValue = "";
            spjj.Text = "";
        }
    }
}
