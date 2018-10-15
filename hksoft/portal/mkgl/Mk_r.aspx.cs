using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.mkgl
{
    public partial class Mk_r : System.Web.UI.Page
    {
        BindData bd = new BindData();
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("60101", "0");

                //dp绑定 
                DropDownListBind_lx();

                if (!string.IsNullOrEmpty(Request.QueryString["classid"]))
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HK_MODU WHERE MODU_ID='" + hkdb.GetStr(Request.QueryString["classid"].ToString()) + "'");
                    if (datar.Read())
                    {
                        moduid.Text = datar["modu_id"].ToString();
                        modumc.Text = datar["modu_mc"].ToString();
                        moduwjlj.Text = datar["modu_wjlj"].ToString();
                        modubz.Text = datar["modu_bz"].ToString();
                        rbzt.SelectedValue = datar["modu_zt"].ToString();
                        modu_lx.SelectedValue = datar["modu_lx"].ToString();
                        modu_xz.SelectedValue = datar["modu_xz"].ToString();
                        modu_icon.Text = datar["modu_icon"].ToString();

                        DropDownListBind_sjmk();

                        moduupid.SelectedValue = datar["modu_upid"].ToString();

                        if (datar["d_indi"].ToString() != "0")
                        {
                            cbindi.Checked = true;
                        }

                        if (datar["d_dept"].ToString() != "0")
                        {
                            cbdept.Checked = true;
                        }

                        if (datar["d_corp"].ToString() != "0")
                        {
                            cbcorp.Checked = true;
                        }

                        yn_oper.SelectedValue = datar["yn_oper"].ToString();

                        if (yn_oper.SelectedValue == "是")
                        {
                            p_oper.Visible = true;

                            if (datar["o_full"].ToString() != "0")
                            {
                                cbfull.Checked = true;
                            }

                            if (datar["o_add"].ToString() != "0")
                            {
                                cbadd.Checked = true;
                            }

                            if (datar["o_mod"].ToString() != "0")
                            {
                                cbmod.Checked = true;
                            }

                            if (datar["o_del"].ToString() != "0")
                            {
                                cbdel.Checked = true;
                            }

                            if (datar["o_exp"].ToString() != "0")
                            {
                                cbexp.Checked = true;
                            }

                            if (datar["o_aud"].ToString() != "0")
                            {
                                cbaud.Checked = true;
                            }

                            if (datar["o_exe"].ToString() != "0")
                            {
                                cbexe.Checked = true;
                            }

                            if (datar["o_que"].ToString() != "0")
                            {
                                cbque.Checked = true;
                            }
                        }
                        datar.Close();

                        cbindi.Enabled = false;
                        cbdept.Enabled = false;
                        cbcorp.Enabled = false;
                        yn_oper.Enabled = false;
                        cbfull.Enabled = false;
                        cbadd.Enabled = false;
                        cbmod.Enabled = false;
                        cbdel.Enabled = false;
                        cbexp.Enabled = false;
                        cbaud.Enabled = false;
                        cbexe.Enabled = false;
                        cbque.Enabled = false;

                        SaveBtn.Enabled = true;
                        DelBtn.Enabled = true;
                    }
                    else
                    {
                        datar.Close();
                        mydb.Alert_Close("此记录不存在,可能已被删除！");
                    }
                }

                if (Request.QueryString["k"] == "nex")
                {
                    moduid.Enabled = true;
                    moduid.CssClass = "mytext";
                    labelstatus.Text = "新增";
                    SaveBtn.Enabled = true;
                }
            }
        }

        public void DropDownListBind_sjmk()
        {
            moduupid.Items.Clear();

            string sql_modu = "SELECT MODU_ID,MODU_MC FROM HK_MODU WHERE MODU_UPID=0 AND MODU_LX<>'G' AND MODU_LX='" + modu_lx.SelectedValue + "' ORDER BY ORDERID";
            bd.Bind_DropDownList(moduupid, sql_modu, "MODU_ID", "MODU_MC", "0", "");
        }

        public void DropDownListBind_lx()
        {
            string Sql1 = " where 1=1";
            if (this.Session["systype"].ToString() == "A")     //主登录页
            {
                string str = null;
                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT ProduID FROM hk_Init");
                while (datar1.Read())
                {
                    str = str + "','" + datar1["ProduID"].ToString();
                }
                datar1.Close();

                Sql1 = Sql1 + " and ProduID in ('" + str + "')";
            }
            else  //子登录页
            {
                if (this.Session["systype"].ToString() == "M")
                {
                    Sql1 = Sql1 + " and (ProduID='G' or ProduID='P')";
                }
                else
                {
                    Sql1 = Sql1 + " and (ProduID='" + this.Session["systype"] + "' or ProduID='P')";
                }
            }

            string sql = "SELECT (CASE WHEN ProduID='G' THEN 'M' ELSE ProduID END)AS ProduID,ProduName FROM hk_Init " + Sql1 + " ORDER BY InitType";
            bd.Bind_DropDownList(modu_lx, sql, "ProduID", "ProduName", "", "");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string strindi = "0";
            string strdept = "0";
            string strcorp = "0";

            string strfull = "0";
            string stradd = "0";
            string strmod = "0";
            string strdel = "0";
            string strexp = "0";
            string straud = "0";
            string strexe = "0";
            string strque = "0";

            if (cbindi.Checked == true)
            {
                strindi = moduid.Text + "1";
            }

            if (cbdept.Checked == true)
            {
                strdept = moduid.Text + "2";
            }

            if (cbcorp.Checked == true)
            {
                strcorp = moduid.Text + "9";
            }

            if (cbfull.Checked == true)
            {
                strfull = moduid.Text + "f";
            }

            if (cbadd.Checked == true)
            {
                stradd = moduid.Text + "a";
            }

            if (cbmod.Checked == true)
            {
                strmod = moduid.Text + "m";
            }

            if (cbdel.Checked == true)
            {
                strdel = moduid.Text + "d";
            }

            if (cbexp.Checked == true)
            {
                strexp = moduid.Text + "e";
            }

            if (cbaud.Checked == true)
            {
                straud = moduid.Text + "u";
            }

            if (cbexe.Checked == true)
            {
                strexe = moduid.Text + "x";
            }

            if (cbque.Checked == true)
            {
                strque = moduid.Text + "q";
            }

            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "AddBtn")
            {
                moduid.Enabled = true;
                moduid.CssClass = "mytext";
                moduid.Text = "";
                modumc.Text = "";
                moduwjlj.Text = "";
                modu_icon.Text = "";
                modubz.Text = "";
                moduupid.SelectedValue = "0";
                rbzt.SelectedValue = "启用";
                modu_lx.SelectedValue = "";
                modu_xz.SelectedValue = "标准模块";
                yn_oper.SelectedValue = "否";
                cbindi.Checked = false;
                cbdept.Checked = false;
                cbcorp.Checked = false;
                cbfull.Checked = false;
                cbadd.Checked = false;
                cbmod.Checked = false;
                cbdel.Checked = false;
                cbexp.Checked = false;
                cbaud.Checked = false;
                cbexe.Checked = false;
                cbque.Checked = false;

                yn_oper.Enabled = true;
                cbindi.Enabled = true;
                cbdept.Enabled = true;
                cbcorp.Enabled = true;

                p_oper.Visible = false;
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

                    SqlHelper.ExecuteSql("UPDATE HK_MODU SET MODU_ZT='" + rbzt.SelectedValue + "',modu_mc='" + hkdb.GetStr(modumc.Text) + "',modu_wjlj='" + hkdb.GetStr(moduwjlj.Text) + "',modu_icon='" + hkdb.GetStr(modu_icon.Text) + "',modu_bz='" + hkdb.GetStr(modubz.Text) + "',modu_upid='" + moduupid.SelectedValue + "',modu_lx='" + modu_lx.SelectedValue + "',modu_xz='" + modu_xz.SelectedValue + "',yn_oper='" + yn_oper.SelectedValue + "',o_full='" + strfull + "',o_add='" + stradd + "',o_mod='" + strmod + "',o_del='" + strdel + "',o_exp='" + strexp + "',o_aud='" + straud + "',o_exe='" + strexe + "',o_que='" + strque + "',d_indi='" + strindi + "',d_dept='" + strdept + "',d_corp='" + strcorp + "' WHERE MODU_ID='" + hkdb.GetStr(Request.QueryString["classid"].ToString()) + "'");

                    mydb.Alert("保存成功！");

                    Response.Write("<script language=javascript>");
                    Response.Write("window.parent.lframe60101.location='Mk_l.aspx';<");
                    Response.Write("/script>");
                }
                else
                {
                    string sql = "SELECT * FROM HK_MODU WHERE MODU_ID='" + hkdb.GetStr(moduid.Text) + "'";
                    if (bd.CheckRepeat(sql) == "true")
                    {
                        mydb.Alert("保存失败,此编码已经存在！");
                        return;
                    }

                    SqlHelper.ExecuteSql("INSERT INTO HK_MODU(MODU_ID,MODU_MC,MODU_UPID,MODU_WJLJ,MODU_ZT,MODU_BZ,MODU_LX,CJR,CJSJ,MODU_ICON,ORDERID,MODU_XZ,YN_OPER,O_FULL,O_ADD,O_MOD,O_DEL,O_EXP,O_AUD,O_EXE,O_QUE,D_INDI,D_DEPT,D_CORP) VALUES('" + hkdb.GetStr(moduid.Text) + "','" + hkdb.GetStr(modumc.Text) + "','" + moduupid.SelectedValue + "','" + hkdb.GetStr(moduwjlj.Text) + "','" + rbzt.SelectedValue + "','" + hkdb.GetStr(modubz.Text) + "','" + modu_lx.SelectedValue + "','" + this.Session["userid"] + "',GETDATE(),'" + hkdb.GetStr(modu_icon.Text) + "','" + hkdb.GetStr(moduid.Text) + "','" + modu_xz.SelectedValue + "','" + yn_oper.SelectedValue + "','" + strfull + "','" + stradd + "','" + strmod + "','" + strdel + "','" + strexp + "','" + straud + "','" + strexe + "','" + strque + "','" + strindi + "','" + strdept + "','" + strcorp + "')");

                    mydb.Alert("保存成功！");

                    moduid.Text = "";
                    modumc.Text = "";
                    moduwjlj.Text = "";
                    modu_icon.Text = "";
                    modubz.Text = "";
                    rbzt.SelectedValue = "启用";
                    modu_lx.SelectedValue = "";
                    modu_xz.SelectedValue = "标准模块";
                    yn_oper.SelectedValue = "否";
                    cbindi.Checked = false;
                    cbdept.Checked = false;
                    cbcorp.Checked = false;
                    cbfull.Checked = false;
                    cbadd.Checked = false;
                    cbmod.Checked = false;
                    cbdel.Checked = false;
                    cbexp.Checked = false;
                    cbaud.Checked = false;
                    cbexe.Checked = false;
                    cbque.Checked = false;
                    p_oper.Visible = false;

                    Response.Write("<script language=javascript>");
                    Response.Write("window.parent.lframe60101.location='Mk_l.aspx';");
                    Response.Write("window.parent.rframe60101.location='mk_r.aspx?k=nex';<");
                    Response.Write("/script>");
                }
            }
        }

        protected void Del_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            string sql1 = "SELECT * FROM HK_MODU WHERE MODU_UPID='" + hkdb.GetStr(moduid.Text) + "'";
            if (bd.CheckRepeat(sql1) == "true")
            {
                mydb.Alert("删除失败,此模块存在下级模块！");
                return;
            }

            string sql2 = "SELECT * FROM QX WHERE MODU_ID='" + hkdb.GetStr(moduid.Text) + "'";
            if (bd.CheckRepeat(sql2) == "true")
            {
                mydb.Alert("删除失败,该模块已绑定角色！");
                return;
            }

            SqlHelper.ExecuteSql("DELETE FROM HK_MODU WHERE MODU_ID = '" + hkdb.GetStr(moduid.Text) + "'");
            mydb.Alert_Close("删除成功！");

            moduid.Text = "";
            modumc.Text = "";
            moduwjlj.Text = "";
            modu_icon.Text = "";
            modubz.Text = "";
            moduupid.SelectedValue = "0";

            DelBtn.Enabled = false;
            SaveBtn.Enabled = false;

            //刷新 
            Response.Write("<script language=javascript>");
            Response.Write("window.parent.lframe60101.location='Mk_l.aspx';<");
            Response.Write("/script>");
        }

        protected void modu_lx_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(modu_lx.SelectedValue))
            {
                DropDownListBind_sjmk();
            }
        }

        protected void yn_oper_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (yn_oper.SelectedValue == "是")
            {
                p_oper.Visible = true;

                cbfull.Enabled = true;
                cbadd.Enabled = true;
                cbmod.Enabled = true;
                cbdel.Enabled = true;
                cbexp.Enabled = true;
                cbaud.Enabled = true;
                cbexe.Enabled = true;
                cbque.Enabled = true;
            }
            else
            {
                p_oper.Visible = false;

                cbfull.Checked = false;
                cbadd.Checked = false;
                cbmod.Checked = false;
                cbdel.Checked = false;
                cbexp.Checked = false;
                cbaud.Checked = false;
                cbexe.Checked = false;
                cbque.Checked = false;
            }
        }

        protected void cbfull_CheckedChanged(object sender, EventArgs e)
        {
            if (cbfull.Checked == true)
            {
                cbadd.Checked = false;
                cbmod.Checked = false;
                cbdel.Checked = false;
                cbexp.Checked = false;
                cbaud.Checked = false;
                cbexe.Checked = false;
                cbque.Checked = false;

                cbadd.Enabled = false;
                cbmod.Enabled = false;
                cbdel.Enabled = false;
                cbexp.Enabled = false;
                cbaud.Enabled = false;
                cbexe.Enabled = false;
                cbque.Enabled = false;
            }
            else
            {
                cbadd.Enabled = true;
                cbmod.Enabled = true;
                cbdel.Enabled = true;
                cbexp.Enabled = true;
                cbaud.Enabled = true;
                cbexe.Enabled = true;
                cbque.Enabled = true;
            }
        }
    }
}