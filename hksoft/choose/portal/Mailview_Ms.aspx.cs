using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.Choose.portal
{
    public partial class Mailview_Ms : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("2");

            if (!IsPostBack)
            {
                //按供应商设置
                if (this.Session["systype"].ToString() == "A")     //主登录页
                {
                    SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT xh FROM hk_Init WHERE produID='G'");
                    if (datar1.Read())
                    {
                        yhlx.Visible = true;
                    }
                    datar1.Close();
                }
                else  //子登录页
                {
                    if (this.Session["systype"].ToString() == "M")
                    {
                        yhlx.Visible = true;
                    }
                }

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                GridViewBind();
            }
        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " where ui_mail<> '' and ui_status='正常'";

            if (!string.IsNullOrEmpty(yhlx.SelectedValue))
            {
                Str1 = Str1 + " and ui_lx='" + yhlx.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str1 = Str1 + " and " + query_tj.SelectedItem.Value + " like '%" + hkdb.GetStr(query_content.Text) + "%' ";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from yh" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select ui_id,ui_desc,ui_mail,ui_lx from yh" + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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

        protected void set_null(object sender, EventArgs e)
        {
            Response.Write("<script language=javascript>");
            Response.Write("window.opener.document.getElementById(\"ms\").value='';");
            Response.Write("window.close();<");
            Response.Write("/script>");
        }
    }
}
