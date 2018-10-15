using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.portal.bmgl
{
    public partial class Dept_Show : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static string showtitle;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("60301", "0");

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.*,(SELECT BM_MC FROM BM WHERE BM_ID=A.BM_SJBM)AS SJBMMC,(CASE WHEN BMGLQX='Y' THEN '允许管理子部门数据' ELSE '不允许管理子部门数据' END)AS BMGLQX_MC,B.mc FROM BM A LEFT OUTER JOIN hk_ZDYLX B ON(A.bm_lx=B.id) WHERE bm_id='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (dr.Read())
                {
                    showtitle = "部门详细信息";
                    bmbm.Text = dr["bm_bm"].ToString();
                    bmmc.Text = dr["bm_mc"].ToString();
                    sjbmmc.Text = dr["sjbmmc"].ToString();
                    bmfzr.Text = dr["bm_fzr"].ToString();
                    bmdh.Text = dr["bm_dh"].ToString();
                    bmcz.Text = dr["bm_cz"].ToString();
                    bmlx.Text = dr["mc"].ToString();
                    bz.Text = hkdb.TbToLb(dr["bm_bz"].ToString());
                    bmglqx.Text = dr["bmglqx_mc"].ToString();

                    //ModBtn.Visible = true;
                    //DelBtn.Visible = true;
                    //AddBtn.Visible = true;

                    OperQx();
                }
                else
                {
                    showtitle = "暂未选中任何部门";
                    ModBtn.Visible = false;
                    DelBtn.Visible = false;
                    AddBtn.Visible = false;
                }
                dr.Close();
            }
        }

        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(AddBtn, "60301a", Session["roleqx"].ToString());
            hkdb.QxValid(DelBtn, "60301d", Session["roleqx"].ToString());
            hkdb.QxValid(ModBtn, "60301m", Session["roleqx"].ToString());
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dept_Add.aspx?id=" + Request.QueryString["id"] + "");
        }

        protected void Mod_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dept_Mod.aspx?id=" + Request.QueryString["id"] + "");
        }

        protected void Del_Click(object sender, EventArgs e)
        {
            string sql1 = "SELECT * FROM BM WHERE bm_sjbm = '" + hkdb.GetStr(Request.QueryString["id"]) + "'";
            if (bd.CheckRepeat(sql1) == "true")
            {
                mydb.Alert("删除失败,当前部门存在下级部门！");
                return;
            }

            string sql2 = "SELECT * FROM yh WHERE ui_ssbm = '" + hkdb.GetStr(Request.QueryString["id"]) + "'";
            if (bd.CheckRepeat(sql2) == "true")
            {
                mydb.Alert("删除失败,当前部门下存在用户！");
                return;
            }

            string sql_report = "SELECT * FROM hk_Init WHERE ProduID='R'";
            if (bd.CheckRepeat(sql_report) == "true")
            {
                SqlHelper.ExecuteSql("DELETE FROM BM_Report WHERE ssbmid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            }

            string sql_scm = "SELECT * FROM hk_Init WHERE ProduID='G'";
            if (bd.CheckRepeat(sql_scm) == "true")
            {
                SqlHelper.ExecuteSql("DELETE FROM BM_SCM WHERE ssbmid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            }

            string sql_kms = "SELECT * FROM hk_Init WHERE ProduID='K'";
            if (bd.CheckRepeat(sql_kms) == "true")
            {
                SqlHelper.ExecuteSql("DELETE FROM BM_KMS WHERE ssbmid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            }

            SqlHelper.ExecuteSql("DELETE FROM BM WHERE bm_id='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            mydb.Alert_Parent("删除成功！", "Dept.aspx");
        }
    }
}
