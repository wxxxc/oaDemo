using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.Choose.portal
{
    public partial class Yhview : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("2");

            if (!IsPostBack)
            {
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
            string Str1 = " where ui_status='正常' and ui_lx='企业'";
            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str1 = Str1 + " and " + query_tj.SelectedItem.Value + " like '%" + hkdb.GetStr(query_content.Text) + "%' ";
            }
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from yh" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select a.*,b.zwmc,c.role_name FROM ZW b right outer join yh a on (a.ui_zw=b.zwid) left outer join JS c on (a.ui_role=c.role_id) " + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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
                string theid = Request.QueryString["id"];
                switch (theid)
                {
                    case "rysq":
                        e.Row.Attributes.Add("onclick", "javascript:chuan(this)");
                        break;
                    case "rysq2":
                        e.Row.Attributes.Add("onclick", "javascript:chuan1(this)");
                        break;
                    case "jdr":
                        e.Row.Attributes.Add("onclick", "javascript:chuan2(this)");
                        break;
                    case "xgr":
                        e.Row.Attributes.Add("onclick", "javascript:chuan3(this)");
                        break;
                    case "fzr":
                        e.Row.Attributes.Add("onclick", "javascript:chuan4(this)");
                        break;
                }
            }
        }

        protected void set_null(object sender, EventArgs e)
        {
            string theid = Request.QueryString["id"];
            switch (theid)
            {
                case "rysq":
                    Response.Write("<script language=javascript>");
                    Response.Write("window.opener.document.getElementById(\"rysq_view\").value='';");
                    Response.Write("window.opener.document.getElementById(\"rysq\").value='';");
                    Response.Write("window.close();<");
                    Response.Write("/script>");
                    break;
                case "rysq2":
                    Response.Write("<script language=javascript>");
                    Response.Write("window.opener.document.getElementById(\"rysq\").value='';");
                    Response.Write("window.close();<");
                    Response.Write("/script>");
                    break;
                case "jdr":
                    Response.Write("<script language=javascript>");
                    Response.Write("window.opener.document.getElementById(\"jdr\").value='';");
                    Response.Write("window.close();<");
                    Response.Write("/script>");
                    break;
                case "xgr":
                    Response.Write("<script language=javascript>");
                    Response.Write("window.opener.document.getElementById(\"xgr\").value='';");
                    Response.Write("window.close();<");
                    Response.Write("/script>");
                    break;
                case "fzr":
                    Response.Write("<script language=javascript>");
                    Response.Write("window.opener.document.getElementById(\"fzr\").value='';");
                    Response.Write("window.close();<");
                    Response.Write("/script>");
                    break;
            }
        }
    }
}