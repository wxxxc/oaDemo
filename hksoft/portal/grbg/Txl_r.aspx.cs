using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.grbg
{
    public partial class Txl_r : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static string strsql, SqlStrMid, Namefile, XMStr, strtypeid;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (Request.QueryString["typeId"] != null)
            {
                strtypeid = "&typeId=" + Request.QueryString["typeId"] + "";
                strsql = " and FoldersID = '" + hkdb.GetStr(Server.UrlDecode(Request.QueryString["typeId"])) + "'";
            }
            else
            {
                strtypeid = "";
                strsql = "";
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["typeId"] != null)
                {
                    SqlDataReader dr = SqlHelper.ExecuteReader("select * from hk_Ygtxl_lb where id='" + int.Parse(Request.QueryString["typeid"]) + "' ");
                    if (dr.Read())
                    {
                        Namefile = dr["name"].ToString();
                    }
                    else
                    {
                        Namefile = "未选择类别";
                    }
                    dr.Close();
                }
                else
                {
                    Namefile = "未选择类别";
                }

                BindAttr();

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //页面绑定 
                GridViewBind();
            }

            XMStr = null;
            SqlDataReader dr_jy = SqlHelper.ExecuteReader("select distinct substring(dbo.fun_getPY(name),1,1) as FYNAME from hk_Ygtxl");
            while (dr_jy.Read())
            {
                string SQL_GetCount = "select count(id) from hk_Ygtxl where substring(dbo.fun_getPY(name),1,1)='" + dr_jy["FYNAME"] + "'";
                string XMCount = "" + hkdb.GetCount(SQL_GetCount) + "";
                XMStr += "<a href='txl_r.aspx?XS=" + dr_jy["FYNAME"] + "" + strtypeid + "' class=gvlink>" + dr_jy["FYNAME"] + "(" + XMCount + ")</a>&nbsp;&nbsp;";
            }
            dr_jy.Close();
        }

        public void BindAttr()
        {
            showbtn.Attributes["onclick"] = "javascript:return modcheck();";
        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " where 1=1 " + strsql + " ";

            if (Request.QueryString["Unit"] != null)
            {
                Str1 = Str1 + " and Unit like '%" + hkdb.GetStr(Server.UrlDecode(Request.QueryString["Unit"])) + "%'";
            }

            if (Request.QueryString["Respon"] != null)
            {
                Str1 = Str1 + " and Respon like '%" + hkdb.GetStr(Server.UrlDecode(Request.QueryString["Respon"])) + "%'";
            }

            if (!string.IsNullOrEmpty(jsSex.Text))
            {
                Str1 = Str1 + " AND Sex LIKE '%" + hkdb.GetStr(jsSex.Text) + "%'";
            }

            if (!string.IsNullOrEmpty(jsPost.Text))
            {
                Str1 = Str1 + " AND Post LIKE '%" + hkdb.GetStr(jsPost.Text) + "%'";
            }

            if (!string.IsNullOrEmpty(jsName.Text))
            {
                Str1 = Str1 + " AND Name LIKE '%" + hkdb.GetStr(jsName.Text) + "%'";
            }

            DataSet ds;
            if (Request.QueryString["XS"] != null)
            {
                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(id) from hk_Ygtxl " + Str1 + " and substring(dbo.fun_getPY(name),1,1)='" + Request.QueryString["XS"] + "'");
                ds = SqlHelper.ExecuteDs("select * from hk_Ygtxl " + Str1 + " and substring(dbo.fun_getPY(name),1,1)='" + Request.QueryString["XS"] + "'", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            }
            else
            {
                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(id) from hk_Ygtxl " + Str1);
                ds = SqlHelper.ExecuteDs("select * from hk_Ygtxl " + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            }

            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //分页
        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }

        private string CheckCbxUpdate()
        {
            string str = string.Empty;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                GridViewRow row = GridView1.Rows[i];
                CheckBox Chk = (CheckBox)row.FindControl("CheckSelect");
                Label LabVis = (Label)row.FindControl("LabVisible");
                if (Chk.Checked == true)
                {
                    if (str == "")
                    {
                        str = LabVis.Text.ToString();
                    }
                    else
                    {
                        str = str + "," + LabVis.Text.ToString();
                    }
                }
            }
            return str;
        }

        protected void ImageButton6_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["typeId"] != null)
            {
                Response.Redirect("txl_r_show.aspx?id=" + CheckCbxUpdate() + "&typeId=" + Request.QueryString["typeId"] + "");
            }
            else
            {
                Response.Redirect("txl_r_show.aspx?id=" + CheckCbxUpdate() + "");
            }
        }
    }
}