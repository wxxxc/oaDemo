using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.flow
{
    public partial class WorkFlow : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static string formName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT B.fName FROM hk_WorkFlow A LEFT OUTER JOIN hk_Form B ON (A.FK_fid=B.fID) WHERE FK_fid='" + hkdb.GetStr(Request.QueryString["FormId"]) + "'");
                if (dr.Read())
                {
                    formName = dr["fName"].ToString();
                }
                else
                {
                    formName = "暂无流程";
                }
                dr.Close();

                BindAttr();

                //页面绑定 
                GridViewBind();
            }

            if (!IsPostBack)
            {
                string sql_dpform = "SELECT fID,fName FROM hk_Form ORDER BY fID DESC";
                bd.Bind_DropDownList_NoBlank(dpform, sql_dpform, "fID", "fName", "", "");
            }
        }

        public void BindAttr()
        {
            DelBtn.Attributes["onclick"] = "javascript:return delcheck();";
        }

        //gv绑定 
        public void GridViewBind()
        {
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*)AS NUMS FROM hk_WorkFlow WHERE FK_fid='" + hkdb.GetStr(Request.QueryString["FormId"]) + "'");
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM hk_WorkFlow WHERE FK_fid='" + hkdb.GetStr(Request.QueryString["FormId"]) + "'", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
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

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lid = (Label)e.Row.FindControl("lblwfID");
                Label lno = (Label)e.Row.FindControl("lblwfNo");

                Label lbl1 = (Label)e.Row.FindControl("lblshow");
                Label lbl2 = (Label)e.Row.FindControl("lblmod");
                Label lbl3 = (Label)e.Row.FindControl("lbldesign");

                lbl1.Text = " <a href=\"javascript:void(0)\" onclick=\"showflow(" + lid.Text + ");\" class=\"gvlink\">查看</a>";
                lbl2.Text = " <a href=\"javascript:void(0)\" onclick=\"modflow(" + lid.Text + ");\" class=\"gvlink\">修改</a>";
                lbl3.Text = " <a href=\"javascript:void(0)\" onclick='window.open (\"WorkFlow_Node.aspx?FlowNumber=" + lno.Text + "\", \"_blank\", \"height=650, width=900,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no,top=0,left=0\")' class=\"gvlink\">流程设计</a>";
            }
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
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

            int i = 0;
            i = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM hk_Work WHERE FK_wfid IN (" + chkStr + ")");
            if (i > 0)
            {
                mydb.Alert("删除失败,选中的部分流程下已经存在工作记录！");
                return;
            }
            else
            {
                SqlHelper.ExecuteSql("DELETE FROM hk_WorkFlow WHERE wfID in(" + chkStr + ")");

                GridViewBind();

                mydb.Alert("删除成功！");
            }
        }
    }
}
