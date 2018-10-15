using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.hygl
{
    public partial class Hyqc_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10107", "0");

                BindAttr();

                lblAttachSize.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT P_STRING FROM hk_CSDA WHERE PARAMT='P_fj_size'"));

                //短信
                dxtz.Visible = Convert.ToBoolean(hkdb.VeriSms());

                DropDownListBind();

                txtSdate.Text = DateTime.Now.AddDays(0).ToString("yyyy-MM-dd");
                txtEdate.Text = DateTime.Now.AddDays(0).ToString("yyyy-MM-dd");
                sxs.SelectedValue = DateTime.Now.AddDays(0).ToString("HH") + ":";
                exs.SelectedValue = DateTime.Now.AddDays(0).ToString("HH") + ":";
            }
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string sdateStr = txtSdate.Text + " " + sxs.SelectedValue + sfz.SelectedValue + "00";
            string edateStr = txtEdate.Text + " " + exs.SelectedValue + efz.SelectedValue + "00";
            string FileName = "";
            string FileVisualPathStr = "";
            string UserName = this.Session["userid"].ToString();

            //判断附件 
            if (!string.IsNullOrEmpty(fj.PostedFile.FileName.Trim()))
            {
                try
                {
                    if (fj.PostedFile.ContentLength < 1024 * int.Parse(lblAttachSize.Text))
                    {
                        FileName = System.IO.Path.GetFileName(fj.PostedFile.FileName);
                        //if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\") + "Attach\\oa\\hy\\" + UserName)))
                        //{
                        //    System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\") + "Attach\\oa\\hy\\" + UserName));
                        //}
                        Random TempNameInt = new Random();
                        string NewDocDirName = TempNameInt.Next(100000000).ToString();
                        if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\") + "Attach\\oa\\hy\\" + UserName + "\\" + NewDocDirName)))
                        {
                            System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\") + "Attach\\oa\\hy\\" + UserName + "\\" + NewDocDirName));
                        }
                        TempNameInt = null;
                        fj.PostedFile.SaveAs((Server.MapPath("..\\..\\") + "Attach\\oa\\hy\\" + UserName + "\\" + NewDocDirName + "\\" + FileName));
                        FileVisualPathStr = "\\Attach\\oa\\hy\\" + UserName + "\\" + NewDocDirName + "\\";
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
            }

            //会议编码 
            lblid.Text = DateTime.Now.Year.ToString("D2").Substring(2, 2) + DateTime.Now.Month.ToString("D2").Substring(0, 2) + DateTime.Now.Day.ToString("D2").Substring(0, 2);

            SqlDataReader datar = SqlHelper.ExecuteReader("select id from oa_hyqc where left(id,6)='" + lblid.Text + "' order by id desc");
            if (datar.Read())
            {
                lblid.Text = lblid.Text + (Convert.ToInt32(datar["id"].ToString().Substring(6, 3)) + 1).ToString("D3");
            }
            else
            {
                lblid.Text = lblid.Text + "001";
            }
            datar.Close();

            SqlHelper.ExecuteSql("insert into oa_hyqc(id,hyzt,hylx,kssj,jssj,zkbm,zkdd,cxfw,zcr,jysm,hyzl,zt,cjry,fqr,fqsj,path) values('" + lblid.Text + "','" + hkdb.GetStr(hyzt.Text) + "','" + hylx.SelectedValue + "','" + sdateStr + "','" + edateStr + "','" + dept.SelectedValue + "','" + zkdd.SelectedValue + "','" + hkdb.GetStr(cxfw.Text) + "','" + hkdb.GetStr(fzr.Text) + "','" + hkdb.GetStr(jysm.Text) + "','" + FileName + "','起草中','" + hkdb.GetStr(UserID.Text) + "','" + this.Session["userid"] + "',GETDATE(),'" + FileVisualPathStr + "')");

            SaveBtn.Enabled = false;
            Button2.Enabled = false;
            SendBtn.Visible = true;
            mydb.Alert_Refresh("保存成功,可以点击【送审】或【关闭】！", "Hyqc.aspx");
        }

        //送审
        protected void Send_Click(object sender, EventArgs e)
        {
            string glryStr = Convert.ToString(SqlHelper.ExecuteScalar("SELECT HYS_FZR FROM OA_HYS WHERE HYS_ID='" + zkdd.SelectedValue + "'"));

            SqlHelper.ExecuteSql("update oa_hyqc set zt='送审中',fqr='" + this.Session["userid"] + "',fqsj=GETDATE(),spr='" + glryStr + "' where fqr='" + this.Session["userid"] + "' and zt='起草中' and id='" + lblid.Text + "'");

            //Msg
            string sdateStr = txtSdate.Text + " " + sxs.SelectedValue + sfz.SelectedValue + "00";
            string edateStr = txtEdate.Text + " " + exs.SelectedValue + efz.SelectedValue + "00";
            if (xxtz.Checked == true | dxtz.Checked == true)
            {
                SqlDataReader datar1 = SqlHelper.ExecuteReader("select hys_fzr from oa_hys where hys_id='" + zkdd.SelectedValue + "'");
                if (datar1.Read())
                {
                    ycxx.Text = datar1["hys_fzr"].ToString();
                    datar1.Close();

                    string message = "申请在" + sdateStr + "至" + edateStr + "使用" + zkdd.SelectedItem.Text + "!" + this.Session["username"].ToString();
                    hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), ycxx.Text, message);
                }
                else
                {
                    datar1.Close();
                }
            }

            mydb.Alert_Refresh_Close("会议已成功送审！", "Hyqc.aspx");
        }

        //dp绑定 
        public void DropDownListBind()
        {
            string sql_hylx = "select mc,id FROM hk_ZDYLX where fl='o01' and zt='正常' order by id";
            bd.Bind_DropDownList(hylx, sql_hylx, "id", "mc", "", "");


            string sql_zkdd = "select hys_id,hys_mc from oa_hys order by hys_id";
            bd.Bind_DropDownList(zkdd, sql_zkdd, "hys_id", "hys_mc", "", "");


            bd.Bind_DropDownList_bm(dept, "", "", "");
        }


        protected void Clear_Click(object sender, EventArgs e)
        {
            hyzt.Text = "";
            hylx.SelectedValue = "";
            dept.SelectedValue = "";
            zkdd.SelectedValue = "";
            cxfw.Text = "";
            fzr.Text = "";
            jysm.Text = "";
            sxs.SelectedValue = "";
            sfz.SelectedValue = "";
            exs.SelectedValue = "";
            efz.SelectedValue = "";
            UserID.Text = "";
            UserName.Text = "";
        }

        protected void txtSdate_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSdate.Text))
            {
                txtEdate.Text = txtSdate.Text;
            }
        }
    }
}
