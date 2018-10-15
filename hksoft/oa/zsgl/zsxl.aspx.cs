using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class zsxl : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("12102", "12102");

                DropDownListBind();

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //页面绑定 
                GridViewBind();
            }
        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        public void DropDownListBind()
        {

            string sql_bigid = "select ID,Name from OA_KlClass  order by ID";
            bd.Bind_DropDownList(bigid, sql_bigid, "id", "Name", "", "");

        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " where 1=1";
            if (!string.IsNullOrEmpty(Name.Text))
            {
                Str1 = Str1 + " and Name like '%" + hkdb.GetStr(Name.Text) + "%'";
                if (!string.IsNullOrEmpty(bigid.SelectedValue))
                {
                    Str1 = Str1 + " and Name like '%" + hkdb.GetStr(Name.Text) + "%' and BigId='" + bigid.SelectedValue + "'";
                }
            }
            else
            {
                if (!string.IsNullOrEmpty(bigid.SelectedValue))
                {
                    Str1 = Str1 + " and BigId='" + bigid.SelectedValue + "'";
                }
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) as nums from OA_KlClassSub" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select * from OA_KlClassSub " + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
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

        protected void bigid_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(bigid.SelectedValue))
            {
                string Str1 = " where 1=1";
                if (!string.IsNullOrEmpty(Name.Text))
                {
                    Str1 = Str1 + "and Name like '%" + hkdb.GetStr(Name.Text) + "%' and BigId='" + bigid.SelectedValue + "'";
                }
                Str1 = Str1 + "and BigId='" + bigid.SelectedValue + "'";

                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) as nums from OA_KlClassSub" + Str1);
                DataSet ds = SqlHelper.ExecuteDs("select * from OA_KlClassSub " + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                string Str1 = " where 1=1";
                if (!string.IsNullOrEmpty(Name.Text))
                {
                    Str1 = Str1 + "and Name like '%" + hkdb.GetStr(Name.Text) + "%'";
                }

                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) as nums from OA_KlClassSub" + Str1);
                DataSet ds = SqlHelper.ExecuteDs("select * from OA_KlClassSub " + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }
    }
}
