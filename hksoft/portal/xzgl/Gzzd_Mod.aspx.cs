using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Gzzd_Mod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            //hkdb.VeriSess("4");

            if (this.Session["userid"] == null && this.Session["hyid"] == null)
            {
                Response.Write("<br>&nbsp;<img src=images/clock.gif></img><font size=2pt color=red>对不起，系统已超时，请重新登录！</font>");
                Response.End();
            }

            if (!IsPostBack)
            {
                OperQx();
                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));

                //使用范围
                if (this.Session["systype"].ToString() == "A")     //主登录页
                {
                    SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT xh FROM hk_Init WHERE produID IN('M','V','F')");
                    if (datar1.Read())
                    {
                        lx.Visible = true;
                    }
                    datar1.Close();
                }
                else  //子登录页
                {
                    if (this.Session["systype"].ToString() == "M" | this.Session["systype"].ToString() == "V" | this.Session["systype"].ToString() == "F")
                    {
                        lx.Visible = true;
                    }
                }

                DropDownListBind();

                lblAttachSize.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT P_STRING FROM hk_CSDA WHERE PARAMT='P_fj_size'"));

                //dp绑定 
                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HK_GZZD WHERE ZDID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (datar.Read())
                {
                    zdfl.SelectedValue = datar["zdfl"].ToString();
                    zdbt.Text = datar["zdbt"].ToString();
                    editor.Value = datar["zdnr"].ToString();
                    wh.Text = datar["zdwh"].ToString();
                    fwdw.Text = datar["fwdw"].ToString();
                    zddj.Text = datar["zddj"].ToString();
                    mj.Text = datar["mj"].ToString();
                    ztc.Text = datar["ztc"].ToString();
                    cjsj.Text = string.Format("{0:d}", datar["cjsj"]);
                    savefj.Text = datar["fjmc"].ToString();
                    savelj.Text = datar["fjlj"].ToString();
                    savefj.NavigateUrl = (datar["fjlj"] == System.DBNull.Value ? "" : "../.." + datar["fjlj"].ToString()) + datar["fjmc"].ToString();
                    lx.SelectedValue = datar["lx"].ToString();

                    datar.Close();
                }
                else
                {
                    datar.Close();
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }

                //首页链接 
                if (Request.QueryString["url"] == "index")
                {
                    SaveBtn.Visible = false;
                }
            }
        }

        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(SaveBtn, "11303m", Session["roleqx"].ToString());
        }

        //dp绑定 
        public void DropDownListBind()
        {
            string sql = "SELECT ID,MC FROM HK_ZDYLX WHERE fl='p05' AND ZT='正常'";
            bd.Bind_DropDownList(zdfl, sql, "id", "mc", "", "");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string FileName = "";
            string FileVisualPathStr = "";
            string UserName = this.Session["userid"].ToString();
            if (!string.IsNullOrEmpty(fj.PostedFile.FileName.Trim()))
            {
                try
                {
                    if (!string.IsNullOrEmpty(savefj.Text))
                    {
                        System.IO.File.Delete(Server.MapPath(("../../" + savelj.Text + savefj.Text)));
                    }

                    if (fj.PostedFile.ContentLength < 1024 * int.Parse(lblAttachSize.Text))
                    {
                        FileName = System.IO.Path.GetFileName(fj.PostedFile.FileName);
                        //if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\") + "Attach\\portal\\zd\\" + UserName)))
                        //{
                        //    System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\") + "Attach\\portal\\zd\\" + UserName));
                        //}
                        Random TempNameInt = new Random();
                        string NewDocDirName = TempNameInt.Next(100000000).ToString();
                        if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\") + "Attach\\portal\\zd\\" + UserName + "\\" + NewDocDirName)))
                        {
                            System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\") + "Attach\\portal\\zd\\" + UserName + "\\" + NewDocDirName));
                        }
                        TempNameInt = null;
                        fj.PostedFile.SaveAs((Server.MapPath("..\\..\\") + "Attach\\portal\\zd\\" + UserName + "\\" + NewDocDirName + "\\" + FileName));
                        FileVisualPathStr = "\\Attach\\portal\\zd\\" + UserName + "\\" + NewDocDirName + "\\";
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
                FileName = hkdb.GetStr(savefj.Text);
                FileVisualPathStr = hkdb.GetStr(savelj.Text);
            }

            SqlHelper.ExecuteSql("UPDATE HK_GZZD SET zdfl='" + zdfl.SelectedValue + "',ztc='" + hkdb.GetStr(ztc.Text) + "',zdbt='" + hkdb.GetStr(zdbt.Text) + "',zddj='" + hkdb.GetStr(zddj.Text) + "',mj='" + hkdb.GetStr(mj.Text) + "',fwdw='" + hkdb.GetStr(fwdw.Text) + "',zdwh='" + hkdb.GetStr(wh.Text) + "',zdnr='" + editor.Value + "',fjmc='" + FileName + "',fjlj='" + FileVisualPathStr + "',cjr='" + this.Session["userid"] + "',cjsj=GETDATE(),lx='" + lx.SelectedValue + "' WHERE ZDID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            
            mydb.Alert_Refresh_Close("保存成功！","Gzzd.aspx");
        }
    }
}
