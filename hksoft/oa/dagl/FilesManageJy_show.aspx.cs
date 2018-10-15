using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.dagl
{
    public partial class FilesManageJy_show : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11804", "11804");

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
                Label ll4 = (Label)e.Row.FindControl("Label4");
                LinkButton l4 = (LinkButton)e.Row.FindControl("JieYue");

                l4.Attributes.Add("onclick", "javascript:return confirm('确认借阅此文件吗？')");

                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_FilesManageBook where id='" + hkdb.GetStr(ln.Text) + "' and (CHARINDEX('," + this.Session["DeptID"] + ",',','+JrUsername+',')>0)");
                if (datar.Read())
                {
                    ll4.Text = " 已借阅";
                }
                else
                {
                    ll4.Text = " 未借阅";
                }
                datar.Close();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "JieYue")
            {
                int ID = Convert.ToInt32(e.CommandArgument);

                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_FilesManageBook where id='" + ID + "'");
                if (datar.Read())
                {
                    SqlDataReader datar1 = SqlHelper.ExecuteReader("select * from OA_FilesManageBookLog where BookId='" + ID + "' and JyUsername='" + Session["userid"] + "' and State='等待审批'");
                    if (datar1.Read())
                    {
                        mydb.Alert("您已经申请过此文件，请等待审批！");
                        return;
                    }
                    else
                    {
                        SqlHelper.ExecuteSql("insert into OA_FilesManageBookLog(BookId,AJId,Num,Title,JyUsername,JyRealname,JyTime,State,GhTime) values ('" + datar["id"].ToString() + "','" + datar["FilesId"].ToString() + "','" + datar["Num"].ToString() + "','" + datar["Title"].ToString() + "','" + Session["userid"] + "','" + Session["username"] + "','" + System.DateTime.Now.ToString() + "','等待审批','等待审批')");
                    }
                    datar1.Close();

                    mydb.Alert("申请成功！请等待审批！");
                }
                datar.Close();

                GridViewBind();
            }
        }
    }
}
