using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.seal
{
    public partial class SealUseLog : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11410", "11410");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                BindAttr();
                GridViewBind();
            }
        }

        public void BindAttr()
        {
            DelBtn.Attributes["onclick"] = "javascript:return delcheck();";
        }

        public void GridViewBind()
        {
            string Str1 = " WHERE 1=1";
            if (!string.IsNullOrEmpty(jsName.Text))
            {
                Str1 = Str1 + " AND slName LIKE '%" + hkdb.GetStr(jsName.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsRealname.Text))
            {
                Str1 = Str1 + " AND B.ui_Desc LIKE '%" + hkdb.GetStr(jsRealname.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsUsetime.Text))
            {
                Str1 = Str1 + " AND convert(char(10),cast(UseTime as datetime),120)=convert(char(10),cast('" + jsUsetime.Text + "' as datetime),120)";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM hk_SealLog A LEFT OUTER JOIN yh B ON(A.FK_uid=B.ui_id)" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,B.ui_desc FROM hk_SealLog A LEFT OUTER JOIN yh B ON(A.FK_uid=B.ui_id)" + Str1 + " ORDER BY slID DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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

        protected void Del_Click(object sender, EventArgs e)
        {
            string chkStr = chkDelete();

            SqlHelper.ExecuteSql("DELETE FROM hk_SealLog WHERE slID IN (" + chkStr + ")");
            GridViewBind();
        }
    }
}
