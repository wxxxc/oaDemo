using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Pfxm_r : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        BindData_HR bd_hr = new BindData_HR();

        public void Page_Load(object Sender, EventArgs E)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("81102", "0");

                //dp绑定 
                DropDownListBind();

                 if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HR_Kpdf_Pfxm WHERE XMID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        lblxmid.Text = datar["XMID"].ToString();
                        xmmc.Text = datar["XMMC"].ToString();
                        fz.Text = datar["FZ"].ToString();
                        kpxz.Text = datar["KPXZ"].ToString();
                        //pfdj.SelectedValue = datar["PFDJ"].ToString();
                        //pfdj_y.Text = datar["pfdj_y"].ToString();
                        //pfdj_l.Text = datar["pfdj_l"].ToString();
                        //pfdj_z.Text = datar["pfdj_z"].ToString();
                        //pfdj_c.Text = datar["pfdj_c"].ToString();
                        xmbz.Text = datar["xmbz"].ToString();
                        pxh.Text = datar["pxh"].ToString();
                        upid.SelectedValue = datar["UPID"].ToString();
                        //pw_zr.Checked = hkdb.GetValueChk_Checked(datar["pw_zr"].ToString());
                        //pw_fzr.Checked = hkdb.GetValueChk_Checked(datar["pw_fzr"].ToString());
                        //pw_ybpw.Checked = hkdb.GetValueChk_Checked(datar["pw_ybpw"].ToString());
                        //pw_gzry.Checked = hkdb.GetValueChk_Checked(datar["pw_gzry"].ToString());

                        datar.Close();

                        //if (pfdj.SelectedValue == "是")
                        //{
                        //    pfdj_y.Enabled = true;
                        //    pfdj_l.Enabled = true;
                        //    pfdj_z.Enabled = true;
                        //    pfdj_c.Enabled = true;
                        //}

                        //if (pw_gzry.Checked == true)
                        //{
                        //    pw_zr.Enabled = false;
                        //    pw_fzr.Enabled = false;
                        //    pw_ybpw.Enabled = false;
                        //}

                        if (xmmc.Text == "管理职责" | xmmc.Text == "本人工作")
                        {
                            xmmc.Enabled = false;
                        }
                    }
                    else
                    {
                        datar.Close();
                        mydb.Alert("此记录不存在,可能已被删除！");
                    }
                    labelstatus.Text = "修改";
                }

                if (Request.QueryString["k"] == "nex")
                {
                    labelstatus.Text = "新增";
                }
            }
        }

        protected void DropDownListBind()
        {
            upid.Items.Clear();

            //评分项目
            //bd_hr.Bind_DropDownList_pfxm(upid, "0", "", " AND PFDJ='否'");
            bd_hr.Bind_DropDownList_pfxm(upid, "0", "", " ");
        }

        protected void Save_Click(object Sender, EventArgs E)
        {
            //判断btn 
            Button btn = (Button)Sender;
            string s = btn.ID;
            if (s == "AddBtn")
            {
                xmmc.Text = "";
                fz.Text = "";
                kpxz.Text = "";
                upid.SelectedValue = "0";
                //pfdj.SelectedValue = "否";
                //pfdj_y.Text = "0";
                //pfdj_l.Text = "0";
                //pfdj_z.Text = "0";
                //pfdj_c.Text = "0";
                //pw_zr.Checked = false;
                //pw_fzr.Checked = false;
                //pw_ybpw.Checked = false;
                //pw_gzry.Checked = false;
                pxh.Text = "";
                xmbz.Text = "";

                //pfdj_y.Enabled = false;
                //pfdj_l.Enabled = false;
                //pfdj_z.Enabled = false;
                //pfdj_c.Enabled = false;

                labelstatus.Text = "新增";

                SaveBtn.Enabled = true;
                DelBtn.Enabled = false;
            }
            else
            {
                if (labelstatus.Text == "修改")
                {
                    //Demo
                    if (hkdb.IsDemo("Y") == "true")
                    {
                        return;
                    }

                    //判断该项目下是否存在未结束的考评项目
                    string sql1 = "SELECT MXID FROM HR_Kpdf_Kpxm02 A LEFT OUTER JOIN HR_Kpdf_Kpxm01 B ON(A.SSKPID=B.KPID) WHERE A.SSXMID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' AND B.KPZT<>'已结束'";
                    if (bd.CheckRepeat(sql1) == "true")
                    {
                        mydb.Alert("保存失败,该项目下存在尚未结束的考评项目！");
                        return;
                    }

                    //SqlHelper.ExecuteSql("UPDATE HR_Kpdf_Pfxm SET XMMC='" + hkdb.GetStr(xmmc.Text) + "',UPID='" + upid.SelectedValue + "',FZ='" + hkdb.GetStr(fz.Text) + "',KPXZ='" + hkdb.GetStr(kpxz.Text) + "',PFDJ='" + pfdj.SelectedValue + "',PFDJ_Y='" + hkdb.GetStr(pfdj_y.Text) + "',PFDJ_L='" + hkdb.GetStr(pfdj_l.Text) + "',PFDJ_Z='" + hkdb.GetStr(pfdj_z.Text) + "',PFDJ_C='" + hkdb.GetStr(pfdj_c.Text) + "',Pw_zr='" + hkdb.GetValueChk_Str(pw_zr.Checked) + "',Pw_fzr='" + hkdb.GetValueChk_Str(pw_fzr.Checked) + "',Pw_ybpw='" + hkdb.GetValueChk_Str(pw_ybpw.Checked) + "',Pw_Gzry='" + hkdb.GetValueChk_Str(pw_gzry.Checked) + "',Pxh='" + hkdb.GetStr(pxh.Text) + "',Xmbz='" + hkdb.GetStr(xmbz.Text) + "',Xgr='" + this.Session["UserID"] + "',Xgsj=GETDATE() WHERE XMID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    SqlHelper.ExecuteSql("UPDATE HR_Kpdf_Pfxm SET XMMC='" + hkdb.GetStr(xmmc.Text) + "',UPID='" + upid.SelectedValue + "',FZ='" + hkdb.GetStr(fz.Text) + "',KPXZ='" + hkdb.GetStr(kpxz.Text) + "',Pxh='" + hkdb.GetStr(pxh.Text) + "',Xmbz='" + hkdb.GetStr(xmbz.Text) + "',Xgr='" + this.Session["UserID"] + "',Xgsj=GETDATE() WHERE XMID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

                    mydb.Alert("保存成功！");
                    Response.Write("<script language=javascript>");
                    Response.Write("window.parent.lframe81102.location='Pfxm_l.aspx';<");
                    Response.Write("/script>");
                }
                else
                {
                    string sql = "SELECT * FROM HR_Kpdf_Pfxm WHERE XMMC='" + hkdb.GetStr(xmmc.Text) + "'";
                    if (bd.CheckRepeat(sql) == "true")
                    {
                        mydb.Alert("保存失败,此名称已经存在！");
                        return;
                    }

                    //SqlHelper.ExecuteSql("INSERT INTO HR_Kpdf_Pfxm(XMMC,UPID,FZ,Kpxz,Pfdj,Pfdj_y,Pfdj_l,Pfdj_z,Pfdj_c,Pw_zr,Pw_fzr,Pw_ybpw,Pw_Gzry,Pxh,Xmbz,Cjr,Cjsj) VALUES('" + hkdb.GetStr(xmmc.Text) + "','" + upid.SelectedValue + "','" + hkdb.GetStr(fz.Text) + "','" + hkdb.GetStr(kpxz.Text) + "','" + pfdj.SelectedValue + "','" + hkdb.GetStr(pfdj_y.Text) + "','" + hkdb.GetStr(pfdj_l.Text) + "','" + hkdb.GetStr(pfdj_z.Text) + "','" + hkdb.GetStr(pfdj_c.Text) + "','" + hkdb.GetValueChk_Str(pw_zr.Checked) + "','" + hkdb.GetValueChk_Str(pw_fzr.Checked) + "','" + hkdb.GetValueChk_Str(pw_ybpw.Checked) + "','" + hkdb.GetValueChk_Str(pw_gzry.Checked) + "','" + hkdb.GetStr(pxh.Text) + "','" + hkdb.GetStr(xmbz.Text) + "','" + this.Session["userid"] + "',GETDATE())");
                    SqlHelper.ExecuteSql("INSERT INTO HR_Kpdf_Pfxm(XMMC,UPID,FZ,Kpxz,Pxh,Xmbz,Cjr,Cjsj) VALUES('" + hkdb.GetStr(xmmc.Text) + "','" + upid.SelectedValue + "','" + hkdb.GetStr(fz.Text) + "','" + hkdb.GetStr(kpxz.Text) + "','" + hkdb.GetStr(pxh.Text) + "','" + hkdb.GetStr(xmbz.Text) + "','" + this.Session["userid"] + "',GETDATE())");

                    mydb.Alert("保存成功！");

                    xmmc.Text = "";
                    fz.Text = "";
                    kpxz.Text = "";
                    upid.SelectedValue = "0";
                    //pfdj.SelectedValue = "否";
                    //pfdj.SelectedValue = "否";
                    //pfdj_y.Text = "0";
                    //pfdj_l.Text = "0";
                    //pfdj_z.Text = "0";
                    //pfdj_c.Text = "0";
                    //pw_zr.Checked = false;
                    //pw_fzr.Checked = false;
                    //pw_ybpw.Checked = false;
                    //pw_gzry.Checked = false;
                    pxh.Text = "";
                    xmbz.Text = "";

                    //pfdj_y.Enabled = false;
                    //pfdj_l.Enabled = false;
                    //pfdj_z.Enabled = false;
                    //pfdj_c.Enabled = false;

                    Response.Write("<script language=javascript>");
                    Response.Write("window.parent.lframe81102.location='Pfxm_l.aspx';");
                    Response.Write("window.parent.rframe81102.location='Pfxm_r.aspx?k=nex';<");
                    Response.Write("/script>");
                }
            }
        }

        protected void Del_Click(object Sender, EventArgs E)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            string sql1 = "SELECT * FROM HR_Kpdf_Pfxm WHERE UPID='" +  lblxmid.Text + "'";
            if (bd.CheckRepeat(sql1) == "true")
            {
                mydb.Alert("删除失败,该项目存在子项目！");
                return;
            }

            string sql2 = "SELECT * FROM HR_Kpdf_Kpxm02 WHERE ssxmid='" + lblxmid.Text + "'";
            if (bd.CheckRepeat(sql2) == "true")
            {
                mydb.Alert("删除失败,该项目下已经在考评项目中存在！");
                return;
            }

            string sql4 = "SELECT * FROM HR_Kpdf_Kpxm04 WHERE ssxmid='" + lblxmid.Text + "'";
            if (bd.CheckRepeat(sql4) == "true")
            {
                mydb.Alert("删除失败,该项目下已经存在考评记录！");
                return;
            }

            string sql3 = "SELECT * FROM HR_Kpdf_Bkpr02 WHERE SSXMID='" + lblxmid.Text + "'";
            if (bd.CheckRepeat(sql3) == "true")
            {
                mydb.Alert("删除失败,该项目已经关联了被考评人！");
                return;
            }

            SqlHelper.ExecuteSql("DELETE FROM HR_Kpdf_Pfxm WHERE XMID = '" + lblxmid.Text + "'");
            mydb.Alert_Close("删除成功！");

            DelBtn.Enabled = false;
            SaveBtn.Enabled = false;

            //刷新菜单 
            Response.Write("<script language=javascript>");
            Response.Write("window.parent.lframe81102.location='Pfxm_l.aspx';<");
            Response.Write("/script>");
        }

        //protected void pfdj_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (pfdj.SelectedValue == "是")
        //    {
        //        pfdj_y.Text = "";
        //        pfdj_l.Text = "";
        //        pfdj_z.Text = "";
        //        pfdj_c.Text = "";

        //        pfdj_y.Enabled = true;
        //        pfdj_l.Enabled = true;
        //        pfdj_z.Enabled = true;
        //        pfdj_c.Enabled = true;
        //    }
        //    else
        //    {
        //        pfdj_y.Text = "0";
        //        pfdj_l.Text = "0";
        //        pfdj_z.Text = "0";
        //        pfdj_c.Text = "0";

        //        pfdj_y.Enabled = false;
        //        pfdj_l.Enabled = false;
        //        pfdj_z.Enabled = false;
        //        pfdj_c.Enabled = false;
        //    }
        //}

        //protected void pw_gzry_CheckedChanged(object sender, EventArgs e)
        //{
        //    if (pw_gzry.Checked == true)
        //    {
        //        pw_zr.Checked = false;
        //        pw_fzr.Checked = false;
        //        pw_ybpw.Checked = false;

        //        pw_zr.Enabled = false;
        //        pw_fzr.Enabled = false;
        //        pw_ybpw.Enabled = false;
        //    }
        //    else
        //    {
        //        pw_zr.Enabled = true;
        //        pw_fzr.Enabled = true;
        //        pw_ybpw.Enabled = true;
        //    }
        //}
    }
}
