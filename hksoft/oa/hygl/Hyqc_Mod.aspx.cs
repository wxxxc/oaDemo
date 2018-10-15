using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.hygl
{
    public partial class Hyqc_Mod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10107", "0");

                DropDownListBind();
                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));

                lblAttachSize.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT P_STRING FROM hk_CSDA WHERE PARAMT='P_fj_size'"));

                GridViewBind();
            }
        }

        //绑定数据 
        public void GridViewBind()
        {
            SqlDataReader datar = SqlHelper.ExecuteReader("select a.*,b.mc,c.bm_mc,d.hys_mc from oa_hyqc a left outer JOIN hk_ZDYLX b on (a.hylx=b.id) left outer JOIN BM c on (a.zkbm=c.bm_id) left outer join oa_hys d on (a.zkdd=d.hys_id) where a.id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            if (datar.Read())
            {
                hyzt.Text = datar["hyzt"].ToString();
                hylx.Text = datar["hylx"].ToString();
                txtSdate.Text = string.Format("{0:d}", datar["kssj"]);
                sxs.SelectedValue = string.Format("{0:HH}", datar["kssj"]);
                sfz.SelectedValue = string.Format("{0:mm}", datar["kssj"]);
                txtEdate.Text = string.Format("{0:d}", datar["jssj"]);
                exs.SelectedValue = string.Format("{0:HH}", datar["jssj"]);
                efz.SelectedValue = string.Format("{0:mm}", datar["jssj"]);
                dept.SelectedValue = datar["zkbm"].ToString();
                zkdd.SelectedValue = datar["zkdd"].ToString();
                cxfw.Text = datar["cxfw"].ToString();
                fzr.Text = datar["zcr"].ToString();
                jysm.Text = datar["jysm"].ToString();
                savefj.Text = datar["hyzl"].ToString();
                savelj.Text = datar["path"].ToString();
                savefj.NavigateUrl = (datar["path"] == System.DBNull.Value ? "" : "../.." + datar["path"]) + datar["hyzl"].ToString();

                fqsj.Text = datar["fqsj"].ToString();
                vsdate.Text = datar["kssj"].ToString();
                vedate.Text = datar["jssj"].ToString();
                UserID.Text = datar["cjry"].ToString();
                UserName.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["cjry"].ToString() + "','1'"));

                if (datar["zt"].ToString() != "起草中")
                {
                    SaveBtn.Visible = false;
                    DelBtn.Visible = false;
                    SendBtn2.Visible = false;
                    dxtz2.Visible = false;
                    xxtz2.Visible = false;
                }

                if (datar["zt"].ToString() != "已审批")
                {
                    SendBtn.Visible = false;
                    xxtz.Visible = false;
                    dxtz.Visible = false;
                }
            }

            datar.Close();
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string FileName = "";
            string FileVisualPathStr = "";
            string UserName = this.Session["userid"].ToString();

            string sdateStr = txtSdate.Text + " " + sxs.SelectedValue + ":" + sfz.SelectedValue + ":" + "00";
            string edateStr = txtEdate.Text + " " + exs.SelectedValue + ":" + efz.SelectedValue + ":" + "00";

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
            else
            {
                FileName = savefj.Text;
                FileVisualPathStr = savelj.Text;
            }

            SqlHelper.ExecuteSql("update oa_hyqc set hyzt='" + hkdb.GetStr(hyzt.Text) + "',hylx='" + hylx.SelectedValue + "',kssj='" + sdateStr + "',jssj='" + edateStr + "',zkbm='" + dept.SelectedValue + "',zkdd='" + zkdd.SelectedValue + "',cxfw='" + hkdb.GetStr(cxfw.Text) + "',zcr='" + hkdb.GetStr(fzr.Text) + "',jysm='" + hkdb.GetStr(jysm.Text) + "',hyzl='" + FileName + "',cjry='" + hkdb.GetStr(UserID.Text) + "',fqsj=GETDATE(),path='" + FileVisualPathStr + "' where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            mydb.Alert_Refresh("保存成功,可以点击【送审】或【关闭】！", "Hyqc.aspx");
        }

        //送审
        protected void Send_Click2(object sender, EventArgs e)
        {
            string glryStr = Convert.ToString(SqlHelper.ExecuteScalar("SELECT HYS_FZR FROM OA_HYS WHERE HYS_ID='" + zkdd.SelectedValue + "'"));

            SqlHelper.ExecuteSql("update oa_hyqc set zt='送审中',fqr='" + this.Session["userid"] + "',fqsj=GETDATE(),spr='" + glryStr + "' where fqr='" + this.Session["userid"] + "' and zt='起草中' and id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

            //Msg
            string sdateStr = txtSdate.Text + " " + sxs.SelectedValue + sfz.SelectedValue + "00";
            string edateStr = txtEdate.Text + " " + exs.SelectedValue + efz.SelectedValue + "00";
            if (xxtz2.Checked == true | dxtz2.Checked == true)
            {
                SqlDataReader datar1 = SqlHelper.ExecuteReader("select hys_fzr from oa_hys where hys_id='" + zkdd.SelectedValue + "'");
                if (datar1.Read())
                {
                    ycxx.Text = datar1["hys_fzr"].ToString();
                    datar1.Close();

                    string message = "申请在" + sdateStr + "至" + edateStr + "使用" + zkdd.SelectedItem.Text + "!" + this.Session["username"].ToString();
                    hkdb.SendMsg(xxtz2.Checked, dxtz2.Checked, this.Session["userid"].ToString(), ycxx.Text, message);
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
            string sql_hylx = "select mc,id FROM hk_ZDYLX where fl='o01' and zt<>'删除' order by id";
            bd.Bind_DropDownList(hylx, sql_hylx, "id", "mc", "", "");

            string sql_zkdd = "select hys_id,hys_mc from oa_hys order by hys_id";
            bd.Bind_DropDownList(zkdd, sql_zkdd, "hys_id", "hys_mc", "", "");


            bd.Bind_DropDownList_bm(dept, "", "", "");
        }


        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(savefj.Text))
            {
                System.IO.File.Delete(Server.MapPath(("../../" + savelj.Text + savefj.Text)));
            }

            SqlHelper.ExecuteSql("delete from oa_hyqc where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            mydb.Alert_Refresh_Close("删除成功！", "Hyqc.aspx");
        }

        //通知 
        protected void Send_Click(object sender, EventArgs e)
        {
            //Msg 
            if (xxtz.Checked == true | dxtz.Checked == true)
            {
                string message = "请在" + hkdb.GetStr(vsdate.Text) + "到" + zkdd.SelectedItem.Text + "参加<" + hkdb.GetStr(hyzt.Text) + ">会议!" + this.Session["username"].ToString();
                hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), UserID.Text, message);

                mydb.Alert_Close("己成功通知本次会议参加人员！");
            }
            else
            {
                mydb.Alert("请先选择站内消息或手机短信任意一种，再发送通知！");
            }
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
