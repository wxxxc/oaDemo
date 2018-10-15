using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.jsgl
{
    public partial class Role_Per_Oper : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public static string str_ofull, str_oadd, str_omod, str_odel, str_oexp, str_oaud, str_oexe, str_oque, str_indi, str_dept, str_corp, RoleQxStr;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("60302", "0");

                LabelRole.Text = Request.QueryString["rolename"];

                GridviewBind();

                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM JS WHERE ROLE_ID='" + hkdb.GetStr(Request.QueryString["roleid"]) + "'");
                if (datar.Read())
                {
                    RoleQxStr = datar["role_qx"].ToString();
                    datar.Close();

                    for (int i = 0; i < GridView1.Rows.Count; i++)
                    {
                        GridViewRow row = GridView1.Rows[i];

                        CheckBox Co_que = (CheckBox)row.FindControl("o_que");
                        Label Lo_que = (Label)row.FindControl("o_queid");

                        CheckBox Co_full = (CheckBox)row.FindControl("o_full");
                        Label Lo_full = (Label)row.FindControl("o_fullid");

                        CheckBox Co_add = (CheckBox)row.FindControl("o_add");
                        Label Lo_add = (Label)row.FindControl("o_addid");

                        CheckBox Co_mod = (CheckBox)row.FindControl("o_mod");
                        Label Lo_mod = (Label)row.FindControl("o_modid");

                        CheckBox Co_del = (CheckBox)row.FindControl("o_del");
                        Label Lo_del = (Label)row.FindControl("o_delid");

                        CheckBox Co_exp = (CheckBox)row.FindControl("o_exp");
                        Label Lo_exp = (Label)row.FindControl("o_expid");

                        CheckBox Co_aud = (CheckBox)row.FindControl("o_aud");
                        Label Lo_aud = (Label)row.FindControl("o_audid");

                        CheckBox Co_exe = (CheckBox)row.FindControl("o_exe");
                        Label Lo_exe = (Label)row.FindControl("o_exeid");

                        RadioButton Cindi = (RadioButton)row.FindControl("indi");
                        Label Lindi = (Label)row.FindControl("indiid");

                        RadioButton Cdept = (RadioButton)row.FindControl("dept");
                        Label Ldept = (Label)row.FindControl("deptid");

                        RadioButton Ccorp = (RadioButton)row.FindControl("corp");
                        Label Lcorp = (Label)row.FindControl("corpid");

                        if (hkdb.StrIx(Lindi.Text, RoleQxStr) && Lindi.Text != "0")
                        {
                            Cindi.Checked = true;
                        }

                        if (hkdb.StrIx(Ldept.Text, RoleQxStr) && Ldept.Text != "0")
                        {
                            Cdept.Checked = true;
                        }

                        if (hkdb.StrIx(Lcorp.Text, RoleQxStr) && Lcorp.Text != "0")
                        {
                            Ccorp.Checked = true;
                        }

                        if (hkdb.StrIx(Lo_full.Text, RoleQxStr) && Lo_full.Text != "0")
                        {
                            Co_full.Checked = true;
                        }

                        if (hkdb.StrIx(Lo_add.Text, RoleQxStr) && Lo_add.Text != "0")
                        {
                            Co_add.Checked = true;
                        }

                        if (hkdb.StrIx(Lo_mod.Text, RoleQxStr) && Lo_mod.Text != "0")
                        {
                            Co_mod.Checked = true;
                        }

                        if (hkdb.StrIx(Lo_del.Text, RoleQxStr) && Lo_del.Text != "0")
                        {
                            Co_del.Checked = true;
                        }

                        if (hkdb.StrIx(Lo_exp.Text, RoleQxStr) && Lo_exp.Text != "0")
                        {
                            Co_exp.Checked = true;
                        }

                        if (hkdb.StrIx(Lo_aud.Text, RoleQxStr) && Lo_aud.Text != "0")
                        {
                            Co_aud.Checked = true;
                        }

                        if (hkdb.StrIx(Lo_exe.Text, RoleQxStr) && Lo_exe.Text != "0")
                        {
                            Co_exe.Checked = true;
                        }

                        if (hkdb.StrIx(Lo_que.Text, RoleQxStr) && Lo_que.Text != "0")
                        {
                            Co_que.Checked = true;
                        }
                    }
                }
                else
                {
                    datar.Close();
                    mydb.Alert_Goto("此记录不存在，可能已被删除！", "role.aspx");
                }

                //快速定位
                string Sql = "";
                if (this.Session["systype"].ToString() != "A")     //主登录页
                {
                    Sql = " AND MODU_LX IN('P','" + this.Session["systype"] + "')";
                }

                int k = 0;
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT MODU_ID,MODU_MC FROM hk_Modu WHERE YN_OPER='是' AND LEN(MODU_ID)=3 " + Sql + " ORDER BY ORDERID");
                while (dr.Read())
                {
                    lbldw.Text += "[<a href=#" + dr["modu_id"] + " class=yellow>" + dr["modu_mc"] + "</a>]&nbsp;";

                    k = k + 1;

                    if (k == 8)
                    {
                        lbldw.Text += "<br>";
                        k = 0;
                    }
                }
                dr.Close();
            }
        }

        public void GridviewBind()
        {
            string Sql = "";
            if (this.Session["systype"].ToString() != "A")     //主登录页
            {
                Sql = " AND A.MODU_LX IN('P','" + this.Session["systype"] + "')";
            }
            
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,B.MODU_MC AS MODU_MC1,B.MODU_ID AS MODU_ID1 FROM HK_MODU A LEFT OUTER JOIN HK_MODU B ON(A.MODU_UPID=B.MODU_ID) WHERE A.YN_OPER='是' AND LEN(A.MODU_ID)=5 AND (A.O_FULL='0' OR (A.D_INDI<>'0' AND A.D_DEPT<>'0') OR (A.D_INDI<>'0' AND A.D_CORP<>'0') OR (A.D_CORP<>'0' AND A.D_DEPT<>'0')) " + Sql + " ORDER BY B.ORDERID,A.ORDERID");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";      //单击变色
            }

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                GridViewRow row = GridView1.Rows[i];

                CheckBox Co_que = (CheckBox)row.FindControl("o_que");
                Label Lo_que = (Label)row.FindControl("o_queid");

                CheckBox Co_full = (CheckBox)row.FindControl("o_full");
                Label Lo_full = (Label)row.FindControl("o_fullid");

                CheckBox Co_add = (CheckBox)row.FindControl("o_add");
                Label Lo_add = (Label)row.FindControl("o_addid");

                CheckBox Co_mod = (CheckBox)row.FindControl("o_mod");
                Label Lo_mod = (Label)row.FindControl("o_modid");

                CheckBox Co_del = (CheckBox)row.FindControl("o_del");
                Label Lo_del = (Label)row.FindControl("o_delid");

                CheckBox Co_exp = (CheckBox)row.FindControl("o_exp");
                Label Lo_exp = (Label)row.FindControl("o_expid");

                CheckBox Co_aud = (CheckBox)row.FindControl("o_aud");
                Label Lo_aud = (Label)row.FindControl("o_audid");

                CheckBox Co_exe = (CheckBox)row.FindControl("o_exe");
                Label Lo_exe = (Label)row.FindControl("o_exeid");

                RadioButton Cindi = (RadioButton)row.FindControl("indi");
                Label Lindi = (Label)row.FindControl("indiid");

                RadioButton Cdept = (RadioButton)row.FindControl("dept");
                Label Ldept = (Label)row.FindControl("deptid");

                RadioButton Ccorp = (RadioButton)row.FindControl("corp");
                Label Lcorp = (Label)row.FindControl("corpid");

                if (Lindi.Text == "0")
                { Cindi.Visible = false; }
                else
                { Cindi.Visible = true; }

                if (Ldept.Text == "0")
                { Cdept.Visible = false; }
                else
                { Cdept.Visible = true; }

                if (Lcorp.Text == "0")
                { Ccorp.Visible = false; }
                else
                { Ccorp.Visible = true; }

                if (Lo_que.Text == "0")
                { Co_que.Visible = false; }
                else
                { Co_que.Visible = true; }

                if (Lo_full.Text == "0")
                { Co_full.Visible = false; }
                else
                { Co_full.Visible = true; }

                if (Lo_add.Text == "0")
                { Co_add.Visible = false; }
                else
                { Co_add.Visible = true; }

                if (Lo_mod.Text == "0")
                { Co_mod.Visible = false; }
                else
                { Co_mod.Visible = true; }

                if (Lo_del.Text == "0")
                { Co_del.Visible = false; }
                else
                { Co_del.Visible = true; }

                if (Lo_exp.Text == "0")
                { Co_exp.Visible = false; }
                else
                { Co_exp.Visible = true; }

                if (Lo_aud.Text == "0")
                { Co_aud.Visible = false; }
                else
                { Co_aud.Visible = true; }

                if (Lo_exe.Text == "0")
                { Co_exe.Visible = false; }
                else
                { Co_exe.Visible = true; }
            }
        }

        protected void Ok_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            str_ofull = string.Empty;
            str_oadd = string.Empty;
            str_omod = string.Empty;
            str_odel = string.Empty;
            str_oexp = string.Empty;
            str_oaud = string.Empty;
            str_oexe = string.Empty;
            str_indi = string.Empty;
            str_dept = string.Empty;
            str_corp = string.Empty;
            str_oque = string.Empty;

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                GridViewRow row = GridView1.Rows[i];

                CheckBox Co_que = (CheckBox)row.FindControl("o_que");
                Label Lo_que = (Label)row.FindControl("o_queid");

                CheckBox Co_full = (CheckBox)row.FindControl("o_full");
                Label Lo_full = (Label)row.FindControl("o_fullid");

                CheckBox Co_add = (CheckBox)row.FindControl("o_add");
                Label Lo_add = (Label)row.FindControl("o_addid");

                CheckBox Co_mod = (CheckBox)row.FindControl("o_mod");
                Label Lo_mod = (Label)row.FindControl("o_modid");

                CheckBox Co_del = (CheckBox)row.FindControl("o_del");
                Label Lo_del = (Label)row.FindControl("o_delid");

                CheckBox Co_exp = (CheckBox)row.FindControl("o_exp");
                Label Lo_exp = (Label)row.FindControl("o_expid");

                CheckBox Co_aud = (CheckBox)row.FindControl("o_aud");
                Label Lo_aud = (Label)row.FindControl("o_audid");

                CheckBox Co_exe = (CheckBox)row.FindControl("o_exe");
                Label Lo_exe = (Label)row.FindControl("o_exeid");

                RadioButton Cindi = (RadioButton)row.FindControl("indi");
                Label Lindi = (Label)row.FindControl("indiid");

                RadioButton Cdept = (RadioButton)row.FindControl("dept");
                Label Ldept = (Label)row.FindControl("deptid");

                RadioButton Ccorp = (RadioButton)row.FindControl("corp");
                Label Lcorp = (Label)row.FindControl("corpid");

                RadioButton Csale = (RadioButton)row.FindControl("sale");
                Label Lsale = (Label)row.FindControl("saleid");

                if (Co_que.Checked == true)
                {
                    str_oque += "|" + Lo_que.Text + "";
                }

                if (Cindi.Checked == true)
                {
                    str_indi += "|" + Lindi.Text + "";
                }

                if (Cdept.Checked == true)
                {
                    str_dept += "|" + Ldept.Text + "";
                }

                if (Ccorp.Checked == true)
                {
                    str_corp += "|" + Lcorp.Text + "";
                }

                if (Co_full.Checked == true)
                {
                    str_ofull += "|" + Lo_full.Text + "";
                }

                if (Co_add.Checked == true)
                {
                    str_oadd += "|" + Lo_add.Text + "";
                }

                if (Co_mod.Checked == true)
                {
                    str_omod += "|" + Lo_mod.Text + "";
                }

                if (Co_del.Checked == true)
                {
                    str_odel += "|" + Lo_del.Text + "";
                }

                if (Co_exp.Checked == true)
                {
                    str_oexp += "|" + Lo_exp.Text + "";
                }

                if (Co_aud.Checked == true)
                {
                    str_oaud += "|" + Lo_aud.Text + "";
                }

                if (Co_exe.Checked == true)
                {
                    str_oexe += "|" + Lo_exe.Text + "";
                }
            }

            string strall = str_ofull + str_oadd + str_omod + str_odel + str_oexp + str_oaud + str_oexe + str_oque + str_indi + str_dept + str_corp;
            SqlHelper.ExecuteSql("UPDATE JS SET ROLE_QX='" + strall + "' WHERE ROLE_ID='" + hkdb.GetStr(Request.QueryString["roleid"]) + "'");

            mydb.Alert_Goto("操作授权成功，需要注销重新登录系统后才会生效！", "role.aspx");
        }
    }
}
