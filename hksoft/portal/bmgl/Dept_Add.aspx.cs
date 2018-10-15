using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.bmgl
{
    public partial class Dept_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public string strL, strQx, strQxStr, strLine;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");            

            if (!IsPostBack)
            {
                hkdb.PassTo("60301", "0");

                OperQx();

                DropDownListBind();

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    bm_sjbm.SelectedValue = Request.QueryString["id"];
                }
            }
        }

        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(SaveAddBtn, "60301a", Session["roleqx"].ToString());
            hkdb.QxValid(SaveBtn, "60301a", Session["roleqx"].ToString());
        }

        //dp绑定 
        public void DropDownListBind()
        {
            string sql_bmlx = "SELECT ID,MC FROM hk_ZDYLX WHERE fl='p01' AND ZT='正常'";
            bd.Bind_DropDownList(bm_lx, sql_bmlx, "id", "mc", "", "");

            bd.Bind_DropDownList_bm(bm_sjbm, "0", "顶层部门", " AND JGLB<>'2'");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //编码判断（重复）
            string sql = "SELECT BM_ID FROM BM WHERE BM_BM = '" + hkdb.GetStr(bm_bm.Text) + "'";
            if (bd.CheckRepeat(sql) == "true")
            {
                mydb.Alert("保存失败，该部门编码已存在，不能重复！");
                return;
            }

            //名称判断（包含）
            //if (bd.CheckRepeat("SELECT BM_MC FROM BM WHERE CHARINDEX('" + hkdb.GetStr(bm_mc.Text) + "',bm_mc)>0") == "true")
            //{
            //    mydb.Alert("保存失败，该部门名称与系统中已有的部门名称存在包含关系！请重新输入");
            //    return;
            //}

            SqlDataReader datar = SqlHelper.ExecuteReader("SELECT TOP 1 * FROM BM WHERE BM_ID='" + bm_sjbm.SelectedValue + "'");
            if (datar.Read())
            {
                strQxStr = datar["dQxStr"].ToString();
                strLine = datar["dLine"].ToString();
            }
            datar.Close();

            if (bm_sjbm.SelectedValue == "0")
            {
                SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT TOP 1 * FROM BM WHERE BM_SJBM='0' ORDER BY DQXSTR DESC");
                if (datar2.Read())
                {
                    SqlDataReader datar3 = SqlHelper.ExecuteReader("SELECT TOP 1 * FROM hk_DeptKey WHERE dkID>(SELECT dkID FROM hk_DeptKey WHERE dkName='" + datar2["dQxStr"] + "') ORDER BY dkName ASC");
                    if (datar3.Read())
                    {
                        strQx = datar3["dkName"].ToString();
                        strL = "|-";
                    }
                    else
                    {
                        strQx = "aaaaa";
                        strL = "|-";
                    }
                    datar3.Close();
                }
                else
                {
                    strQx = "aaaaa";
                    strL = "|-";
                }
                datar2.Close();
            }
            else
            {
                SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT * FROM BM WHERE BM_ID='" + bm_sjbm.SelectedValue + "'");
                if (datar2.Read())
                {
                    if (datar2["dQxStr"].ToString().Length == 5)
                    {
                        SqlDataReader datar3 = SqlHelper.ExecuteReader("SELECT TOP 1 * FROM BM WHERE dQxStr LIKE '%" + datar2["dQxStr"].ToString() + "%' AND LEN(dQxStr)=9 ORDER BY dQxStr DESC");
                        if (datar3.Read())
                        {
                            string iqx = null;
                            iqx = datar3["dQxStr"].ToString().Substring(datar3["dQxStr"].ToString().Length - 4, 3);
                            int iqx_s = int.Parse(iqx) + 1;
                            strQx = "" + strQxStr + "" + iqx_s + "a";
                            strL = "|---";
                        }
                        else
                        {
                            strQx = "" + strQxStr + "100a";
                            strL = "|---";
                        }
                        datar3.Close();
                    }
                    else
                    {
                        SqlDataReader datar3 = SqlHelper.ExecuteReader("SELECT TOP 1 * FROM BM WHERE dQxStr LIKE '%" + datar2["dQxStr"].ToString() + "%' AND LEN(dQxStr)=" + datar2["dQxStr"].ToString().Length + "+4 ORDER BY dQxStr DESC");
                        if (datar3.Read())
                        {
                            string iqx = null;
                            iqx = datar3["dQxStr"].ToString().Substring(datar3["dQxStr"].ToString().Length - 4, 3);
                            int iqx_s = int.Parse(iqx) + 1;
                            strQx = "" + strQxStr + "" + iqx_s + "a";

                            strL = "|-";
                            for (int i = 0; i < strLine.ToString().Length + 2; i++)
                            {
                                strL = strL + "-";
                            }
                        }
                        else
                        {
                            SqlDataReader datar4 = SqlHelper.ExecuteReader("SELECT TOP 1 * FROM BM WHERE dQxStr LIKE '%" + datar2["dQxStr"].ToString().Substring(0, datar2["dQxStr"].ToString().Length - 4) + "%' AND LEN(dQxStr)=" + datar2["dQxStr"].ToString().Length + " ORDER BY dQxStr DESC");
                            if (datar4.Read())
                            {
                                strQx = "" + strQxStr + "100a";

                                strL = "|-";
                                for (int i = 0; i < strLine.ToString().Length + 2; i++)
                                {
                                    strL = strL + "-";
                                }
                            }
                            datar4.Close();
                        }
                        datar3.Close();
                    }
                }
                datar2.Close();
            }

            int iBmid = Convert.ToInt32(SqlHelper.ExecuteScalar("INSERT INTO BM(BM_BM,BM_MC,BM_LX,BM_FZR,BM_DH,BM_CZ,BM_BZ,BM_SJBM,DLINE,DQXSTR,CJR,CJSJ,JGLB,BMGLQX) VALUES('" + hkdb.GetStr(bm_bm.Text) + "','" + hkdb.GetStr(bm_mc.Text) + "','" + bm_lx.SelectedValue + "','" + hkdb.GetStr(bm_fzr.Text) + "','" + hkdb.GetStr(bm_dh.Text) + "','" + hkdb.GetStr(bm_cz.Text) + "','" + hkdb.GetStr(bm_bz.Text) + "','" + bm_sjbm.SelectedValue + "','" + strL + "','" + strQx + "','" + this.Session["userid"] + "',Getdate(),'0','" + bmglqx.SelectedValue + "')" + "SELECT CAST(scope_identity() AS int)"));

            string sql_report = "SELECT * FROM hk_Init WHERE ProduID='R'";
            if (bd.CheckRepeat(sql_report) == "true")
            {
                SqlHelper.ExecuteSql("INSERT INTO BM_Report(SSBMID,YNSLBM) VALUES('" + iBmid + "','否')");
            }

            string sql_scm = "SELECT * FROM hk_Init WHERE ProduID='G'";
            if (bd.CheckRepeat(sql_scm) == "true")
            {
                SqlHelper.ExecuteSql("INSERT INTO BM_SCM(SSBMID,BM_CYZS) VALUES('" + iBmid + "','否')");
            }

            string sql_kms = "SELECT * FROM hk_Init WHERE ProduID='K'";
            if (bd.CheckRepeat(sql_kms) == "true")
            {
                SqlHelper.ExecuteSql("INSERT INTO BM_KMS(SSBMID) VALUES('" + iBmid + "')");
            }

            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                bm_sjbm.Items.Clear();
                bm_lx.Items.Clear();

                DropDownListBind();

                Clear_Click();
                mydb.Alert("保存成功，请新增下一条记录！");
            }
            else
            {
                mydb.Alert_Parent("保存成功！", "Dept.aspx");
            }
        }

        //清空 
        protected void Clear_Click()
        {
            bm_bm.Text = "";
            bm_mc.Text = "";
            bm_fzr.Text = "";
            bm_dh.Text = "";
            bm_cz.Text = "";
            bm_bz.Text = "";
            bm_lx.SelectedValue = "";
            bm_sjbm.SelectedValue = "0";

            bmglqx.SelectedValue = "N";
        }

        //返回
        protected void Back_Click(object sender, EventArgs e)
        {
            mydb.Goto_Parent("Dept.aspx");
        }
    }
}
