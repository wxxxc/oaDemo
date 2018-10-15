using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.dagl
{
    public partial class FilesManageJyTj : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11807", "11807");

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
            string Str1 = " WHERE State!='已销毁'";

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
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,B.MC AS MIJI_MC FROM OA_FilesManageBook A LEFT OUTER JOIN hk_ZDYLX B ON(A.MIJI=B.ID)" + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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
                Label ll3 = (Label)e.Row.FindControl("Label3");

                ll4.Text = SqlHelper.ExecuteScalar("select count(id) from OA_FilesManageBookLog  where BookId='" + ln.Text + "'").ToString();

                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_FilesManageBook where id='" + hkdb.GetStr(ln.Text) + "' and State!='已销毁'");
                if (datar.Read())
                {
                    if (datar["JrUsername"].ToString() != "")
                    {
                        ll3.Text = " 已借出";
                    }
                    else
                    {
                        ll3.Text = " 未借出";
                    }
                }
                datar.Close();
            }
        }
    }
}
