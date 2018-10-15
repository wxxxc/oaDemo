using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zygl
{
    public partial class Zysq_Mod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {

            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10108", "0");

                DropDownListBind_sqzy();
                DropDownListBind_sjbm();

                SqlDataReader datar = SqlHelper.ExecuteReader("select a.*,b.szbm,b.zyfl,b.zymc,c.bm_mc from OA_ZYSQ a left outer join OA_ZYDJ b on (a.sqzy=b.djid) left outer JOIN BM c on (a.sybm=c.bm_id) where sqid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (datar.Read())
                {
                    sybm.Text = datar["sybm"].ToString();
                    jysm.Text = datar["jysm"].ToString();
                    txtSdate.Text = string.Format("{0:d}", datar["sysj"]);
                    sxs.SelectedValue = string.Format("{0:HH}", datar["sysj"]);
                    sfz.SelectedValue = string.Format("{0:mm}", datar["sysj"]);
                    txtEdate.Text = string.Format("{0:d}", datar["ghsj"]);
                    exs.SelectedValue = string.Format("{0:HH}", datar["ghsj"]);
                    efz.SelectedValue = string.Format("{0:mm}", datar["ghsj"]);
                    sqzy.SelectedValue = datar["sqzy"].ToString();
                    zyfl.Text = datar["zyfl"].ToString();
                }
                else
                {
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }
                datar.Close();
            }
        }

        //dp绑定 
        public void DropDownListBind_sqzy()
        {
            string sql_sqzy = "select djid,CAST(djid AS VARCHAR(10))+'-'+zymc as zymc from OA_ZYDJ order by djid";
            bd.Bind_DropDownList(sqzy, sql_sqzy, "djid", "zymc", "", "");

            string sql_zyfl = "select flid,CAST(flid AS VARCHAR(10))+'-'+flmc AS flmc from OA_ZYFL order by flid";
            bd.Bind_DropDownList(zyfl, sql_zyfl, "flid", "flmc", "", "");

        }

        //dp绑定 
        public void DropDownListBind_sjbm()
        {
            //绑定部门
            bd.Bind_DropDownList_bm(sybm, "", "", "");
        }

        //申请资源 
        public ICollection DropDownListBind()
        {
            SqlConnection cnn = default(SqlConnection);
            SqlDataAdapter dtcmd = default(SqlDataAdapter);
            DataSet dset = default(DataSet);

            cnn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["haokeDataLink"]);
            dtcmd = new SqlDataAdapter("select * from OA_ZYDJ where zyfl='" + zyfl.SelectedValue + "' and zt='可用' order by djid", cnn);
            dset = new DataSet();
            dtcmd.Fill(dset);
            DataView dv = new DataView(dset.Tables[0]);
            return dv;
        }
    }
}
