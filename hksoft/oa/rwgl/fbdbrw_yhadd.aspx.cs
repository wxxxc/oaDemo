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

        //�������� 
        public void DropDownListBind()
        {
            string sql_rwxz = "select id,mc FROM hk_ZDYLX where fl='o10' and zt='����'";
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
            //�ж�btn 
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
                ynxsstr = "��";
                if (string.IsNullOrEmpty(txtSdate.Text) | string.IsNullOrEmpty(txtEdate.Text) | string.IsNullOrEmpty(sxs.Text) | string.IsNullOrEmpty(sfz.Text) | string.IsNullOrEmpty(exs.Text) | string.IsNullOrEmpty(efz.Text))
                {
                    mydb.Alert("��ѡ��ʼ���ڻ��ֹ���ڣ�");
                    return;
                }
            }
            else
            {
                ynxsstr = "��";
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

            //�жϸ��� 
            if (!string.IsNullOrEmpty(fj.PostedFile.FileName.Trim()))
            {
                try
                {
                    PathStr = fj.PostedFile.FileName;

                    if (fj.PostedFile.ContentLength < 1024 * int.Parse(lblAttachSize.Text))//�жϸ�����С�Ƿ�С��1024*�������ֵ���� 
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
                        mydb.Alert("����ʧ��,������С���ܳ��� " + lblAttachSize.Text + " KB��");
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

            //���񵥺�
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

            int newID = (Int32)SqlHelper.ExecuteScalar("insert into OA_RWD01(source,rwdh,rwbt,rwnr,jjcd,rwxz,ynxs,ksrq,jzrq,rwzt,fbr,fbsj,fjmc,fjlj,jsdx,fblx,qtld,zrld,zrr,qtbm,zrbm) values('"+ hkdb.GetStr(rwly.Text) + "','" + unitcode + "', '" + hkdb.GetStr(rwbt.Text) + "', '" + editor.Value + "', '" + jjcd.SelectedValue + "', '" + rwxz.SelectedValue + "', '" + ynxsstr + "', '" + sdateStr + "', '" + edateStr + "', '¼��', '" + this.Session["userid"] + "', GETDATE(), '" + FileName + "', '" + FileVisualPathStr + "','" + hkdb.GetStr(jsdx.Text) + "','3','" + hkdb.GetStr(qtld.Text) + "','" + hkdb.GetStr(zrld.Text) + "','" + hkdb.GetStr(zrr.Text) + "','" + hkdb.GetStr(qtbm.Text) + "','" + hkdb.GetStr(zrbm.Text) + "')" + "SELECT CAST(scope_identity() AS int)");

            int i = 0;
            for (i = 0; i < (jsdx.Text.Split(',')).Length; i++)
            {
                SqlHelper.ExecuteSql("insert into OA_RWD02(ssrwid,jsr,jszt) values('" + newID + "','" + jsdx.Text.Split(',')[i] + "','δ����')");
            }

            //�ж�btn 
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
                jjcd.SelectedValue = "��";
                editor.Value = "";
                mydb.Alert_Refresh("����ɹ�,��������һ����¼��", "fbdbrw.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("����ɹ���","fbdbrw.aspx");
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
            jjcd.SelectedValue = "��";
            editor.Value = "";
        }
    }
}
