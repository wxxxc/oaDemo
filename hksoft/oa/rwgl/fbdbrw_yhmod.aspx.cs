using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.rwgl
{
    public partial class fbdbrw_yhmod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10301", "0");

                DropDownListBind();
                //dp绑定 

                lblAttachSize.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT P_STRING FROM hk_CSDA WHERE PARAMT='P_fj_size'"));

                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));

                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_RWD01 where rwid='" + hkdb.GetStr(Request.QueryString["rwid"].ToString()) + "'");
                if (datar.Read())
                {
                    rwly.Text = datar["source"].ToString();
                    rwidstr.Text = datar["rwid"].ToString();
                    jjcd.SelectedValue = datar["jjcd"].ToString();
                    rwxz.SelectedValue = datar["rwxz"].ToString();
                    jsdx.Text = datar["jsdx"].ToString();
                    qtld.Text = datar["qtld"].ToString();
                    zrld.Text = datar["zrld"].ToString();
                    zrr.Text =  datar["zrr"].ToString();
                    qtbm.Text = datar["qtbm"].ToString();
                    zrbm.Text = datar["zrbm"].ToString();
                    editor.Value = datar["rwnr"].ToString();
                    rwdh.Text = datar["rwdh"].ToString();
                    savefj.Text = datar["fjmc"].ToString();

                    if (datar["ynxs"].ToString() == "是")
                    {
                        ynxs.Checked = true;
                        Panelrq.Visible = true;
                        txtSdate.Text = string.Format("{0:d}", datar["ksrq"]);
                        sxs.SelectedValue = string.Format("{0:HH}", datar["ksrq"]);
                        sfz.SelectedValue = string.Format("{0:mm}", datar["ksrq"]);
                        txtEdate.Text = string.Format("{0:d}", datar["jzrq"]);
                        exs.SelectedValue = string.Format("{0:HH}", datar["jzrq"]);
                        efz.SelectedValue = string.Format("{0:mm}", datar["jzrq"]);
                    }
                    else
                    {
                        ynxs.Checked = false;
                        Panelrq.Visible = false;
                        txtSdate.Text = "";
                        txtEdate.Text = "";
                        sxs.SelectedValue = "";
                        sfz.SelectedValue = "";
                        exs.SelectedValue = "";
                        efz.SelectedValue = "";
                    }

                    rwbt.Text = datar["rwbt"].ToString();
                    //fjname.Text =datar["fjmc"].ToString();
                    savefj.Text = datar["fjmc"].ToString();
                    savelj.Text = datar["fjlj"].ToString();
                    savefj.NavigateUrl = (datar["fjlj"] == System.DBNull.Value ? "" : "../.." + datar["fjlj"]) + datar["fjmc"].ToString();

                    datar.Close();
                }
                else
                {
                    datar.Close();
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }
            }
        }

        //任务性质 
        public void DropDownListBind()
        {
            string sql_rwxz = "select id,mc FROM hk_ZDYLX where fl='o10' and zt='正常'";
            bd.Bind_DropDownList(rwxz, sql_rwxz, "id", "mc", "", "");
        }

        protected void ynxs_click(object sender, EventArgs e)
        {
            if (ynxs.Checked == true)
            {
                Panelrq.Visible = true;
            }
            else
            {
                Panelrq.Visible = false;
                txtSdate.Text = "";
                txtEdate.Text = "";
                sxs.SelectedValue = "";
                sfz.SelectedValue = "";
                exs.SelectedValue = "";
                efz.SelectedValue = "";
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
            string PathStr = null;
            string type = null;
            string ynxsstr = null;

            if (ynxs.Checked == true)
            {
                ynxsstr = "是";
                if (string.IsNullOrEmpty(txtSdate.Text) | string.IsNullOrEmpty(txtEdate.Text) | string.IsNullOrEmpty(sxs.Text) | string.IsNullOrEmpty(sfz.Text) | string.IsNullOrEmpty(exs.Text) | string.IsNullOrEmpty(efz.Text))
                {
                    mydb.Alert("请选择开始日期或截止日期！");
                    return;
                }
            }
            else
            {
                ynxsstr = "否";
                txtSdate.Text = "";
                txtEdate.Text = "";
                sxs.SelectedValue = "";
                sfz.SelectedValue = "";
                exs.SelectedValue = "";
                efz.SelectedValue = "";
            }

            if (ynxs.Checked == true)
            {
                sdateStr = txtSdate.Text + " " + sxs.SelectedValue + ":" + sfz.SelectedValue + ":" + "00";
                edateStr = txtEdate.Text + " " + exs.SelectedValue + ":" + efz.SelectedValue + ":" + "00";
            }
            else
            {
                sdateStr = "";
                edateStr = "";
            }

            //判断附件 
            if (!string.IsNullOrEmpty(fj.PostedFile.FileName.Trim()))
            {
                try
                {
                    PathStr = fj.PostedFile.FileName;

                    if (!string.IsNullOrEmpty(savefj.Text))
                    {
                        System.IO.File.Delete(Server.MapPath(("../../" + savelj.Text + savefj.Text)));
                    }

                    if (fj.PostedFile.ContentLength < 1024 * int.Parse(lblAttachSize.Text))
                    {
                        type = PathStr.Substring((PathStr.LastIndexOf(".") + 1));
                        if (!string.IsNullOrEmpty(fjname.Text.Trim()))
                        {
                            FileName = fjname.Text + "." + type;
                        }
                        else
                        {
                            FileName = System.IO.Path.GetFileName(fj.PostedFile.FileName);
                        }

                        //if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\") + "Attach\\oa\\rw\\" + UserName)))
                        //{
                        //    System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\") + "Attach\\oa\\rw\\" + UserName));
                        //}
                        Random TempNameInt = new Random();
                        string NewDocDirName = TempNameInt.Next(100000000).ToString();
                        if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\") + "Attach\\oa\\rw\\" + UserName + "\\" + NewDocDirName)))
                        {
                            System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\") + "Attach\\oa\\rw\\" + UserName + "\\" + NewDocDirName));
                        }
                        TempNameInt = null;
                        fj.PostedFile.SaveAs((Server.MapPath("..\\..\\") + "Attach\\oa\\rw\\" + UserName + "\\" + NewDocDirName + "\\" + FileName));
                        FileVisualPathStr = "\\Attach\\oa\\rw\\" + UserName + "\\" + NewDocDirName + "\\";
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

            SqlHelper.ExecuteSql("delete from OA_RWD02 where ssrwid ='" + hkdb.GetStr(rwidstr.Text) + "'");
            SqlHelper.ExecuteSql("update OA_RWD01 set source='" + hkdb.GetStr(rwly.Text) + "', qtld='" + hkdb.GetStr(qtld.Text) + "',zrld='" + hkdb.GetStr(zrld.Text) + "',zrr='" + hkdb.GetStr(zrr.Text) + "',qtbm='" + hkdb.GetStr(qtbm.Text) + "',zrbm='" + hkdb.GetStr(zrbm.Text) + "', jsdx='" + hkdb.GetStr(jsdx.Text) + "',rwdh= '" + hkdb.GetStr(rwdh.Text) + "',rwbt= '" + hkdb.GetStr(rwbt.Text) + "',rwnr= '" + editor.Value + "',jjcd= '" + jjcd.SelectedValue + "',rwxz= '" + rwxz.SelectedValue + "',ynxs= '" + ynxsstr + "',ksrq= '" + sdateStr + "',jzrq= '" + edateStr + "',rwzt='录入',fbr= '" + this.Session["userid"] + "',fbsj= GETDATE(), fjmc='" + FileName + "',fjlj='" + FileVisualPathStr + "' where rwid='" + hkdb.GetStr(Request.QueryString["rwid"].ToString()) + "'");

            int i = 0;
            for (i = 0; i < (jsdx.Text.Split(',')).Length; i++)
            {
                SqlHelper.ExecuteSql("insert into OA_RWD02(ssrwid,jsr,jszt) values('" + hkdb.GetStr(rwidstr.Text) + "','" + jsdx.Text.Split(',')[i] + "','未接收')");
            }

            //判断btn 
            if (s == "SaveBtn")
            {
                mydb.Alert_Refresh("保存成功！", "fbdbrw.aspx");
                savefj.Text = FileName;
                savelj.Text = FileVisualPathStr;

                savefj.NavigateUrl = FileVisualPathStr + FileName;
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！", "fbdbrw.aspx");
            }
        }
    }
}
