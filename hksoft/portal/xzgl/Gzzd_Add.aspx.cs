using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Gzzd_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11303", "0");

                OperQx();

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
            }
        }

        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(SaveAddBtn, "11303a", Session["roleqx"].ToString());
            hkdb.QxValid(SaveBtn, "11303a", Session["roleqx"].ToString());
        }

        //dp绑定 
        public void DropDownListBind()
        {
            string sql = "SELECT ID,MC FROM HK_ZDYLX WHERE fl='p05' AND ZT='正常'";
            bd.Bind_DropDownList(zdfl, sql, "id", "mc", "", "");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;

            string FileName = "";
            string FileVisualPathStr = "";
            string UserName = this.Session["userid"].ToString();
            if (!string.IsNullOrEmpty(fj.PostedFile.FileName.Trim()))
            {
                try
                {
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

            SqlHelper.ExecuteSql("INSERT INTO HK_GZZD(ZDBT,ZDNR,LX,ZDFL,ZDWH,ZDDJ,MJ,ZTC,FWDW,FJMC,FJLJ,ZT,CJR,CJSJ) VALUES('" + hkdb.GetStr(zdbt.Text) + "','" + editor.Value + "','" + lx.SelectedValue + "','" + zdfl.SelectedValue + "','" + hkdb.GetStr(wh.Text) + "','" + hkdb.GetStr(zddj.Text) + "','" + hkdb.GetStr(mj.Text) + "','" + hkdb.GetStr(ztc.Text) + "','" + hkdb.GetStr(fwdw.Text) + "','" + FileName + "','" + FileVisualPathStr + "','录入','" + this.Session["userid"] + "',GETDATE())");
            
            //判断btn 
            if (s == "SaveAddBtn")
            {
                zdbt.Text = "";
                editor.Value = "";
                zdfl.SelectedValue = "";
                wh.Text = "";
                zddj.Text = "";
                mj.Text = "";
                ztc.Text = "";
                fwdw.Text = "";
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Gzzd.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！","Gzzd.aspx");
            }
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            zdbt.Text = "";
            editor.Value = "";
            zdfl.SelectedValue = "";
            wh.Text = "";
            zddj.Text = "";
            mj.Text = "";
            ztc.Text = "";
            fwdw.Text = "";
        }
    }
}
