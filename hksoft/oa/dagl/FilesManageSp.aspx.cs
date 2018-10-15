using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.dagl
{
    public partial class FilesManageSp : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11805", "11805");

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
            string Str1 = " WHERE State='等待审批'";

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

                LinkButton l3 = (LinkButton)e.Row.FindControl("TongGuo");
                l3.Attributes.Add("onclick", "javascript:return confirm('确认通过此文件审批吗？')");

                LinkButton l4 = (LinkButton)e.Row.FindControl("JuJue");
                l4.Attributes.Add("onclick", "javascript:return confirm('确认拒绝此文件审批吗？')");
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "TongGuo")
            {
                int ID = Convert.ToInt32(e.CommandArgument);

                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_FilesManageBookLog where id='" + ID + "'");
                if (datar.Read())
                {
                    SqlHelper.ExecuteSql("Update OA_FilesManageBook Set JrUsername=JrUsername+'" + datar["JyUsername"].ToString() + ",',JrRealname=JrRealname+'" + datar["JyRealname"].ToString() + ",' where id='" + datar["BookId"] + "'");

                    SqlHelper.ExecuteSql("Update OA_FilesManageBookLog Set State='未归还',GhTime='未归还' where id='" + ID + "'");

                    mydb.Alert("通过审批！");
                }
                datar.Close();

                GridViewBind();
            }

            if (e.CommandName == "JuJue")
            {
                int ID = Convert.ToInt32(e.CommandArgument);

                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_FilesManageBookLog where id='" + ID + "'");
                if (datar.Read())
                {
                    SqlHelper.ExecuteSql("Update OA_FilesManageBookLog Set State='拒绝审批',GhTime='拒绝审批' where id='" + ID + "'");

                    mydb.Alert("拒绝成功！");
                }
                datar.Close();

                GridViewBind();
            }
        }
    }
}
