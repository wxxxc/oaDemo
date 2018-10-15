using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.form
{
    public partial class FormClass : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10906", "10906");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                BindAttr();
                //页面绑定 
                GridViewBind();
            }
        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        public void BindAttr()
        {
            ModBtn.Attributes["onclick"] = "javascript:return modcheck();";
            DelBtn.Attributes["onclick"] = "javascript:return delcheck();";
        }

        //获取更新行
        private string chkChoose()
        {
            string str = string.Empty;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                GridViewRow row = GridView1.Rows[i];
                CheckBox chk = (CheckBox)row.FindControl("chkSelect");
                Label lblVis = (Label)row.FindControl("lblVisible");
                if (chk.Checked == true)
                {
                    if (str == "")
                    {
                        str = lblVis.Text.ToString();
                    }
                    else
                    {
                        str = str + "," + lblVis.Text.ToString();
                    }
                }
            }
            return str;
        }

        //获取删除行
        private string chkDelete()
        {
            string str = "0";
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                GridViewRow row = GridView1.Rows[i];
                CheckBox chk = (CheckBox)row.FindControl("chkSelect");
                Label lblVis = (Label)row.FindControl("lblVisible");
                if (chk.Checked == true)
                {
                    if (str == "")
                    {
                        str = lblVis.Text.ToString();
                    }
                    else
                    {
                        str = str + "," + lblVis.Text.ToString();
                    }
                }
            }
            return str;
        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " WHERE 1=1";
            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str1 = Str1 + " and " + query_tj.SelectedItem.Value + " like '%" + hkdb.GetStr(query_content.Text) + "%' ";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*)AS NUMS FROM hk_FormClass" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM hk_FormClass" + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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
                CheckBox cb = (CheckBox)e.Row.FindControl("chkSelect");
                if (cb != null)
                    e.Row.Attributes.Add("ondblclick", cb.ClientID + ".checked=(!" + cb.ClientID + ".checked);");
            }
        }

        //修改
        protected void Mod_Click(object sender, EventArgs e)
        {
            mydb.Goto("FormClass_Mod.aspx?id=" + chkChoose() + "");
        }

        //删除
        protected void Del_Click(object sender, EventArgs e)
        {
            string chkStr = chkDelete();

            int i = 0;
            i = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM hk_Form WHERE FK_fcid IN (" + chkStr + ")");
            if (i > 0)
            {
                mydb.Alert("删除失败,选中的部分分类下已存在表单！");
                return;
            }
            else
            {
                SqlHelper.ExecuteSql("DELETE FROM hk_FormClass WHERE fcID IN(" + chkStr + ")");
                mydb.Alert("删除成功！");
            }
            GridViewBind();
        }
    }
}
