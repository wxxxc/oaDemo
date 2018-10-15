using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.dagl
{
    public partial class FilesManageBook_jyjl : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11803,11802", "11803");

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

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " WHERE ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'";

            if (!string.IsNullOrEmpty(jsTitle.Text))
            {
                Str1 = Str1 + " AND Title LIKE '%" + hkdb.GetStr(jsTitle.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsJyRealname.Text))
            {
                Str1 = Str1 + " AND JyRealname LIKE '%" + hkdb.GetStr(jsJyRealname.Text) + "%' ";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) AS NUMS FROM OA_FilesManageBookLog" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM OA_FilesManageBookLog" + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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

                Label ln = (Label)e.Row.FindControl("HyId");
                LinkButton l3 = (LinkButton)e.Row.FindControl("ShouHui");

                l3.Attributes.Add("onclick", "javascript:return confirm('确认收回此文件吗？')");
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ShouHui")
            {
                int ID = Convert.ToInt32(e.CommandArgument);

                SqlDataReader dr = SqlHelper.ExecuteReader("select * from OA_FilesManageBookLog   where id='" + ID + "'");
                if (dr.Read())
                {
                    string JyUsername1 = null, JyRealname1 = null;

                    SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_FilesManageBook where id='" + dr["BookId"] + "'");
                    if (datar.Read())
                    {
                        JyUsername1 = datar["JrUsername"].ToString().Replace("" + dr["JyUsername"].ToString() + ",", "");
                        JyRealname1 = datar["JrRealname"].ToString().Replace("" + dr["JyRealname"].ToString() + ",", "");
                    }
                    datar.Close();

                    SqlHelper.ExecuteSql("Update OA_FilesManageBook Set JrUsername='" + JyUsername1 + "',JrRealname='" + JyRealname1 + "'  where id='" + dr["BookId"] + "'");

                    SqlHelper.ExecuteSql("Update OA_FilesManageBookLog Set State='被收回',GhTime='" + System.DateTime.Now.ToString() + "' where id='" + ID + "' and State='未归还'");
                }
                dr.Close();

                mydb.Alert("收回成功！");

                GridViewBind();
            }
        }

        protected void Del_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            string cal = "";
            int i = 0;
            for (i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Rows[i].Cells[1].FindControl("del");
                if (cb.Checked == true)
                {
                    if (string.IsNullOrEmpty(cal))
                    {
                        cal = GridView1.DataKeys[i].Value.ToString();
                    }
                    else
                    {
                        cal = cal + "','" + GridView1.DataKeys[i].Value.ToString();
                    }
                }
            }
            if (!string.IsNullOrEmpty(cal))
            {
                SqlHelper.ExecuteSql("DELETE FROM OA_FilesManageBookLog WHERE ID IN ('" + cal + "')");
                mydb.Alert("删除成功！");
                GridViewBind();
            }
            else
            {
                mydb.Alert("删除失败,请先选中记录！");
            }
        }
    }
}
