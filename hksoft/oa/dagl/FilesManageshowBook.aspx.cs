using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.dagl
{
    public partial class FilesManageshowBook : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11803", "11803");

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
            string Str1 = " WHERE State!='已销毁' and FilesId='" + hkdb.GetStr(Request.QueryString["id"]) + "'";

            if (!string.IsNullOrEmpty(jsNum.Text))
            {
                Str1 = Str1 + " AND Num LIKE '%" + hkdb.GetStr(jsNum.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsName.Text))
            {
                Str1 = Str1 + " AND Name LIKE '%" + hkdb.GetStr(jsName.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsTitle.Text))
            {
                Str1 = Str1 + " AND Title LIKE '%" + hkdb.GetStr(jsTitle.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsOtherTitle.Text))
            {
                Str1 = Str1 + " AND OtherTitle LIKE '%" + hkdb.GetStr(jsOtherTitle.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsFwCompany.Text))
            {
                Str1 = Str1 + " AND FwCompany LIKE '%" + hkdb.GetStr(jsFwCompany.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsFwTime.Text))
            {
                Str1 = Str1 + " AND FwTime LIKE '%" + hkdb.GetStr(jsFwTime.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsMiji.Text))
            {
                Str1 = Str1 + " AND Miji LIKE '%" + hkdb.GetStr(jsMiji.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsDengji.Text))
            {
                Str1 = Str1 + " AND Dengji LIKE '%" + hkdb.GetStr(jsDengji.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsWjType.Text))
            {
                Str1 = Str1 + " AND WjType LIKE '%" + hkdb.GetStr(jsWjType.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsGwType.Text))
            {
                Str1 = Str1 + " AND GwType LIKE '%" + hkdb.GetStr(jsGwType.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsFilesName.Text))
            {
                Str1 = Str1 + " AND FilesName LIKE '%" + hkdb.GetStr(jsFilesName.Text) + "%' ";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) AS NUMS FROM OA_FilesManageBook A" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,B.MC AS MiJi_mc FROM OA_FilesManageBook A LEFT OUTER JOIN hk_ZDYLX B ON(A.MiJi=B.ID)" + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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

                LinkButton l1 = (LinkButton)e.Row.FindControl("Shanchu");
                LinkButton l3 = (LinkButton)e.Row.FindControl("ShouHui");
                Label ll4 = (Label)e.Row.FindControl("Label4");
                LinkButton l4 = (LinkButton)e.Row.FindControl("XiaoHui");

                l1.Attributes.Add("onclick", "javascript:return confirm('确认删除吗？')");
                l3.Attributes.Add("onclick", "javascript:return confirm('确认收回此文件吗？')");
                l4.Attributes.Add("onclick", "javascript:return confirm('确认销毁此文件吗？')");

                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_FilesManageBook where  id='" + hkdb.GetStr(ln.Text) + "' and State!='已销毁'");
                if (datar.Read())
                {
                    if (datar["JrUsername"].ToString() != "")
                    {
                        ll4.Text = " <a href=\"javascript:void(0)\" onclick=\"Statefrom(" + ln.Text + ");\" class=\"gvlink\">已借出</a>";
                    }
                    else
                    {
                        ll4.Text = " 未借出";
                    }
                }
                datar.Close();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Shanchu")
            {
                int ID = Convert.ToInt32(e.CommandArgument);

                SqlHelper.ExecuteSql("delete from OA_FilesManageBook where id='" + ID + "'");

                mydb.Alert("删除成功！");

                GridViewBind();
            }

            if (e.CommandName == "ShouHui")
            {
                int ID = Convert.ToInt32(e.CommandArgument);

                SqlHelper.ExecuteSql("Update OA_FilesManageBook Set State='未借出' ,JrUsername='',JrRealname='' where id='" + ID + "'");
                SqlHelper.ExecuteSql("Update OA_FilesManageBookLog Set State='被收回' ,GhTime='" + System.DateTime.Now.ToString() + "' where BookId='" + ID + "' and State='未归还'");

                mydb.Alert("收回成功！");
                GridViewBind();
            }


            if (e.CommandName == "XiaoHui")
            {
                int ID = Convert.ToInt32(e.CommandArgument);

                SqlHelper.ExecuteSql("Update OA_FilesManageBook Set State='已销毁',JrUsername='',JrRealname='' where id='" + ID + "'");

                SqlHelper.ExecuteSql("Update OA_FilesManageBookLog  Set State='被销毁' ,GhTime='" + System.DateTime.Now.ToString() + "' where BookId='" + ID + "'");

                mydb.Alert("销毁成功！");
                GridViewBind();
            }
        }
    }
}
