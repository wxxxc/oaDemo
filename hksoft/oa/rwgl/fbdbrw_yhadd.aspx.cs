using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.rwgl
{
    public partial class fbdbrw_yhadd : System.Web.UI.Page
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

                lblAttachSize.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT P_STRING FROM hk_CSDA WHERE PARAMT='P_fj_size'"));

                ynxs.Checked = false;
                Panelrq.Visible = false;
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
            string unitcode = null;
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
            }

            if (ynxs.Checked == true)
            {
                sdateStr = txtSdate.Text + " " + sxs.SelectedValue + sfz.SelectedValue + "00";
                edateStr = txtEdate.Text + " " + exs.SelectedValue + efz.SelectedValue + "00";
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

                    if (fj.PostedFile.ContentLength < 1024 * int.Parse(lblAttachSize.Text))//判断附件大小是否小于1024*附件最大值参数 
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

            //任务单号
            unitcode = DateTime.Now.Year.ToString("D2").Substring(0, 4) + DateTime.Now.Month.ToString("D2").Substring(0, 2) + DateTime.Now.Day.ToString("D2").Substring(0, 2);
            SqlDataReader datar = SqlHelper.ExecuteReader("select rwdh from OA_RWD01 where left(rwdh,8)='" + unitcode + "' order by rwdh desc");

            if (datar.Read())
            {
                unitcode = unitcode.Trim() + (Convert.ToInt32(datar["rwdh"].ToString().Substring(8, 3)) + 1).ToString("D3");
            }
            else
            {
                unitcode = unitcode + "001";
            }
            datar.Close();

            int newID = (Int32)SqlHelper.ExecuteScalar("insert into OA_RWD01(source,rwdh,rwbt,rwnr,jjcd,rwxz,ynxs,ksrq,jzrq,rwzt,fbr,fbsj,fjmc,fjlj,jsdx,fblx,qtld,zrld,zrr,qtbm,zrbm) values('"+ hkdb.GetStr(rwly.Text) + "','" + unitcode + "', '" + hkdb.GetStr(rwbt.Text) + "', '" + editor.Value + "', '" + jjcd.SelectedValue + "', '" + rwxz.SelectedValue + "', '" + ynxsstr + "', '" + sdateStr + "', '" + edateStr + "', '录入', '" + this.Session["userid"] + "', GETDATE(), '" + FileName + "', '" + FileVisualPathStr + "','" + hkdb.GetStr(jsdx.Text) + "','3','" + hkdb.GetStr(qtld.Text) + "','" + hkdb.GetStr(zrld.Text) + "','" + hkdb.GetStr(zrr.Text) + "','" + hkdb.GetStr(qtbm.Text) + "','" + hkdb.GetStr(zrbm.Text) + "')" + "SELECT CAST(scope_identity() AS int)");

            int i = 0;
            for (i = 0; i < (jsdx.Text.Split(',')).Length; i++)
            {
                SqlHelper.ExecuteSql("insert into OA_RWD02(ssrwid,jsr,jszt) values('" + newID + "','" + jsdx.Text.Split(',')[i] + "','未接收')");
            }

            //判断btn 
            if (s == "SaveAddBtn")
            {
                ynxs.Checked = false;
                txtSdate.Text = "";
                txtEdate.Text = "";
                sxs.SelectedValue = "";
                sfz.SelectedValue = "";
                exs.SelectedValue = "";
                efz.SelectedValue = "";
                rwxz.SelectedValue = "";
                fjname.Text = "";
                rwbt.Text = "";
                jjcd.SelectedValue = "中";
                editor.Value = "";
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "fbdbrw.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！","fbdbrw.aspx");
            }
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            ynxs.Checked = false;
            txtSdate.Text = "";
            txtEdate.Text = "";
            sxs.SelectedValue = "";
            sfz.SelectedValue = "";
            exs.SelectedValue = "";
            efz.SelectedValue = "";
            rwxz.SelectedValue = "";
            fjname.Text = "";
            rwbt.Text = "";
            jjcd.SelectedValue = "中";
            editor.Value = "";
        }
    }
}
