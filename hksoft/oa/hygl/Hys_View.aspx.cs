using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.hygl
{
    public partial class Hys_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10509", "0");

                DropDownListBind_sjbm();

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";
                    SqlDataReader datar = SqlHelper.ExecuteReader("select * from oa_hys where hys_id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        mc.Text = datar["hys_mc"].ToString();
                        ssbm.SelectedValue = datar["hys_ssbm"].ToString();
                        gmrl.Text = datar["hys_gmrl"].ToString();
                        glry.SelectedValue = datar["hys_fzr"].ToString();
                        lxdh.Text = datar["hys_lxdh"].ToString();
                        jj.Text = datar["hys_jj"].ToString();

                        if (datar["hys_fwy"].ToString() == "有")
                        {
                            fwy.Checked = true;
                        }
                        else
                        {
                            fwy.Checked = false;
                        }
                        datar.Close();
                        //Init 
                        DelBtn.Visible = true;
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
                    SaveAddBtn.Visible = true;
                }
            }
        }

        //dp绑定 
        public void DropDownListBind_sjbm()
        {
            string sql_glry = "select ui_id,ui_desc from yh where ui_lx='企业' and ui_status='正常' order by ui_id";
            bd.Bind_DropDownList(glry, sql_glry, "ui_id", "ui_desc", "", "");

            bd.Bind_DropDownList_bm(ssbm, "", "", "");
        }


        //保存 
        protected void Save_Click(object sender, EventArgs e)
        {
            string fwyStr = "无";
            if (fwy.Checked == true)
            {
                fwyStr = "有";
            }
            if (lbltitle.Text == "新增")
            {
                SqlHelper.ExecuteSql("insert into oa_hys(hys_mc,hys_ssbm,hys_gmrl,hys_fzr,hys_lxdh,hys_fwy,hys_jj,cjr,cjsj) values('" + hkdb.GetStr(mc.Text) + "','" + hkdb.GetStr(ssbm.Text) + "','" + hkdb.GetStr(gmrl.Text) + "','" + glry.SelectedValue + "','" + hkdb.GetStr(lxdh.Text) + "','" + fwyStr + "','" + hkdb.GetStr(jj.Text) + "','" + this.Session["userid"] + "',GETDATE())");
            }
            else
            {
                SqlHelper.ExecuteSql("update oa_hys set hys_mc='" + hkdb.GetStr(mc.Text) + "',hys_ssbm='" + ssbm.SelectedValue + "',hys_gmrl='" + hkdb.GetStr(gmrl.Text) + "',hys_fzr='" + glry.SelectedValue + "',hys_lxdh='" + hkdb.GetStr(lxdh.Text) + "',hys_fwy='" + fwyStr + "',hys_jj='" + hkdb.GetStr(jj.Text) + "' where hys_id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            }

            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                Clear_Click();
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Hys.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！", "Hys.aspx");
            }
        }

        //清空 
        protected void Clear_Click()
        {
            mc.Text = "";
            ssbm.Text = "";
            gmrl.Text = "";
            glry.SelectedValue = "";
            lxdh.Text = "";
            fwy.Checked = false;
            jj.Text = "";
        }

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            int j = 0;
            j = (int)SqlHelper.ExecuteScalar("select count(*) from oa_hyqc where zkdd='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            if (j > 0)
            {
                mydb.Alert("删除失败,要删除的会议室已有申请记录！");
            }
            else
            {
                SqlHelper.ExecuteSql("delete from oa_hys where hys_id = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                mydb.Alert_Refresh_Close("删除成功！", "Hys.aspx");
            }
        }
    }
}
