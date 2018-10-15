using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.docu
{
    public partial class AdminDoc : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10909", "10909");

                BindAttr();

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                GridViewBind();
            }
        }

        public void BindAttr()
        {
            ModBtn.Attributes["onclick"] = "javascript:return modcheck();";
            DelBtn.Attributes["onclick"] = "javascript:return delcheck();";
        }

        public void GridViewBind()
        {
            string Str1 = " WHERE 1=1";
            if (!string.IsNullOrEmpty(jsname.Text))
            {
                Str1 = Str1 + " AND adName like '%" + hkdb.GetStr(jsname.Text) + "%' ";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*)AS NUMS FROM hk_AdminDoc" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,B.ui_desc FROM hk_AdminDoc A LEFT OUTER JOIN yh B ON(A.AddUser=B.ui_id)" + Str1 + " ORDER BY adID DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
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

        //修改子程序
        protected void Mod_Click(object sender, EventArgs e)
        {
            mydb.Goto("AdminDoc_Mod.aspx?id=" + chkChoose() + "");
        }

        //删除
        protected void Del_Click(object sender, EventArgs e)
        {
            string chkStr = chkDelete();

            SqlHelper.ExecuteSql("DELETE FROM hk_AdminDoc WHERE adID IN(" + chkStr + ")");
            mydb.Alert("删除成功！");

            GridViewBind();
        }
    }
}
