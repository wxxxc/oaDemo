using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.dagl
{
    public partial class FilesManageBookXh : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11806", "11806");

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
            string Str1 = " WHERE State='已销毁'";

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
                LinkButton l1 = (LinkButton)e.Row.FindControl("HuanYuan");
                l1.Attributes.Add("onclick", "javascript:return confirm('确认还原此文件吗？')");
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "HuanYuan")
            {
                int ID = Convert.ToInt32(e.CommandArgument);

                SqlHelper.ExecuteSql("Update OA_FilesManageBook Set State='未借出' ,JrUsername='',JrRealname='' where id='" + ID + "'");

                mydb.Alert("还原成功！");

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
                SqlHelper.ExecuteSql("DELETE FROM OA_FilesManageBook WHERE ID IN ('" + cal + "')");
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
