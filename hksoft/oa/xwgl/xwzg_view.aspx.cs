using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.xwgl
{
    public partial class xwzg_view1 : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11102", "0");

                DropDownListBind_fl();
                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));

                lblAttachSize.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT P_STRING FROM hk_CSDA WHERE PARAMT='P_fj_size'"));

                //短信
                dxtz.Visible = Convert.ToBoolean(hkdb.VeriSms());

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";
                    SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_XWNR where xwid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' and zt='草稿'");
                    if (datar.Read())
                    {
                        xwbt.Text = datar["xwbt"].ToString();
                        xwzy.Text = datar["xwzy"].ToString();
                        xwly.Text = datar["xwly"].ToString();
                        xwfl.SelectedValue = datar["fl"].ToString();
                        xwzz.Text = datar["xwzz"].ToString();
                        editor.Value = datar["xwnr"].ToString();
                        xwsj.Text = hkdb.GetDate(datar["xwsj"].ToString());
                        savefj.Text = datar["fjmc"].ToString();
                        savelj.Text = datar["fjlj"].ToString();
                        savefj.NavigateUrl = (datar["fjlj"] == System.DBNull.Value ? "" : "../.." + datar["fjlj"].ToString()) + datar["fjmc"].ToString();

                        datar.Close();
                    }
                    else
                    {
                        datar.Close();
                        mydb.Alert_Close("此记录不存在,可能已被删除！");
                    }
                }
                else
                {
                    lbltitle.Text = "新增";
                    SendBtn.Enabled = false;
                }
            }
        }

        public void DropDownListBind_fl()
        {
            string sql_xwfl = "select flmc,flid from oa_xwfl order by flid";
            bd.Bind_DropDownList(xwfl, sql_xwfl, "flid", "flmc", "", "");

        }

        //保存 
        protected void Save_Click(object sender, EventArgs e)
        {
            string FileName = "";
            string FileVisualPathStr = "";
            string UserName = this.Session["userid"].ToString();

            if (lbltitle.Text == "新增")
            {
                if (!string.IsNullOrEmpty(fj.PostedFile.FileName.Trim()))
                {
                    try
                    {
                        if (fj.PostedFile.ContentLength < 1024 * int.Parse(lblAttachSize.Text))
                        {
                            FileName = System.IO.Path.GetFileName(fj.PostedFile.FileName);
                            //if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\") + "Attach\\oa\\xw\\" + UserName)))
                            //{
                            //    System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\") + "Attach\\oa\\xw\\" + UserName));
                            //}
                            Random TempNameInt = new Random();
                            string NewDocDirName = TempNameInt.Next(100000000).ToString();
                            if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\") + "Attach\\oa\\xw\\" + UserName + "\\" + NewDocDirName)))
                            {
                                System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\") + "Attach\\oa\\xw\\" + UserName + "\\" + NewDocDirName));
                            }
                            TempNameInt = null;
                            fj.PostedFile.SaveAs((Server.MapPath("..\\..\\") + "Attach\\oa\\xw\\" + UserName + "\\" + NewDocDirName + "\\" + FileName));
                            FileVisualPathStr = "\\Attach\\oa\\xw\\" + UserName + "\\" + NewDocDirName + "\\";
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

                lblID.Text = Convert.ToString(SqlHelper.ExecuteScalar("insert into OA_XWNR(xwbt,xwzy,zt,xwly,xwzz,xwsj,fl,xwnr,fjmc,fjlj,cjr,cjsj) values('" + hkdb.GetStr(xwbt.Text) + "','" + hkdb.GetStr(xwzy.Text) + "','草稿','" + hkdb.GetStr(xwly.Text) + "','" + hkdb.GetStr(xwzz.Text) + "','" + hkdb.GetStr(xwsj.Text) + "','" + xwfl.SelectedValue + "','" + editor.Value + "','" + FileName + "','" + FileVisualPathStr + "','" + UserName + "',GETDATE())" + "select cast(scope_identity() as int)"));
            }
            else
            {
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
                            //if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\") + "Attach\\oa\\xw\\" + UserName)))
                            //{
                            //    System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\") + "Attach\\oa\\xw\\" + UserName));
                            //}
                            Random TempNameInt = new Random();
                            string NewDocDirName = TempNameInt.Next(100000000).ToString();
                            if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\") + "Attach\\oa\\xw\\" + UserName + "\\" + NewDocDirName)))
                            {
                                System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\") + "Attach\\oa\\xw\\" + UserName + "\\" + NewDocDirName));
                            }
                            TempNameInt = null;
                            fj.PostedFile.SaveAs((Server.MapPath("..\\..\\") + "Attach\\oa\\xw\\" + UserName + "\\" + NewDocDirName + "\\" + FileName));
                            FileVisualPathStr = "\\Attach\\oa\\xw\\" + UserName + "\\" + NewDocDirName + "\\";
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

                SqlHelper.ExecuteSql("update OA_XWNR set xwbt='" + hkdb.GetStr(xwbt.Text) + "',xwzy='" + hkdb.GetStr(xwzy.Text) + "',xwly='" + hkdb.GetStr(xwly.Text) + "',fl='" + xwfl.SelectedValue + "',xwzz='" + hkdb.GetStr(xwzz.Text) + "',xwsj='" + hkdb.GetStr(xwsj.Text) + "',xwnr='" + editor.Value + "',fjmc='" + FileName + "',fjlj='" + FileVisualPathStr + "' where xwid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            }

            savefj.Text = FileName;
            savelj.Text = FileVisualPathStr;
            savefj.NavigateUrl = "../.." + FileVisualPathStr + FileName;

            Button btn = (Button)sender;
            string s = btn.ID;

            SaveBtn.Enabled = false;
            SendBtn.Enabled = true;
            mydb.Alert_Refresh("保存成功,可以选择送审！", "Xwzg.aspx");
        }

        //送审 
        protected void Send_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                SqlHelper.ExecuteSql("update OA_XWNR set zt='送审中' where xwid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' and zt='草稿'");
            }
            else
            {
                SqlHelper.ExecuteSql("update OA_XWNR set zt='送审中' where xwid='" + lblID.Text + "' and zt='草稿'");
            }

            //Msg 
            if (xxtz.Checked == true | dxtz.Checked == true)
            {
                ycxx.Text = Convert.ToString(SqlHelper.ExecuteScalar("select glry from OA_XWFL where flid='" + xwfl.SelectedValue + "'"));
                string message = this.Session["username"].ToString() + "撰写了一篇新闻,请审批!";
                hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), ycxx.Text, message);
            }

            mydb.Alert_Refresh_Close("送审成功！", "Xwzg.aspx");
        }
    }
}
