using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zygl
{
    public partial class Zydd : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        BindData bd = new BindData();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10503", "10503");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                dropdownlistBind();

                //页面绑定
                GridViewBind();
            }
        }

        //dp绑定 
        public void dropdownlistBind()
        {

            string sql_zyflxz = "select flid,flmc from OA_ZYFL where glry='" + this.Session["userid"] + "'";
            bd.Bind_DropDownList_NoBlank(zyflxz, sql_zyflxz, "flid", "flmc", "", "");

        }

        //查询 
        protected void ChangeType(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //复选框
        protected void CTCB(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            if (!string.IsNullOrEmpty(zyflxz.SelectedValue))
            {
                string Str1 = " where c.zyfl='" + zyflxz.SelectedValue + "' and a.zt='审批中'";

                if (CBygq.Checked == true)
                {
                    Str1 = Str1 + "and getdate()>sysj";
                }
                else
                {
                    Str1 = Str1 + "and getdate()<sysj";
                }

                //sql 
                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from OA_ZYSQ a left outer join OA_ZYDJ c on (a.sqzy=c.djid)" + Str1);
                DataSet ds = SqlHelper.ExecuteDs("select (case when(getdate()>sysj) then '已过期' else a.zt end)as ztmc,a.sqid,a.sysj,a.ghsj,a.zt,a.sqsj,b.ui_desc,c.zymc from OA_ZYSQ a left outer join yh b on (a.sqr=b.ui_id) left outer join OA_ZYDJ c on (a.sqzy=c.djid)" + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        //gv行处理 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}
