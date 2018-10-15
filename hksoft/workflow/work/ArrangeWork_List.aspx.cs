using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class ArrangeWork_List : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static string strfoldername;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowFolder WHERE ffID='" + int.Parse(Request.QueryString["id"]) + "'");
                if (datar1.Read())
                {
                    strfoldername = datar1["ffName"].ToString();
                }
                else
                {
                    strfoldername = "暂没选中任何文件夹";
                }
                datar1.Close();

                BindAttr();

                GridViewBind();

                //文件夹
                string sql_folder = "SELECT ffID,ffLine+ffName AS ffName FROM hk_WorkFlowFolder ORDER BY ffQxStr ASC";
                bd.Bind_DropDownList_NoBlank(dp_folder, sql_folder, "ffID", "ffName", "", "");
            }
        }

        public void BindAttr()
        {
            DelBtn.Attributes["onclick"] = "javascript:return delcheck();";
            MoveBtn.Attributes["onclick"] = "javascript:return folderMove();";

            DelFolderBtn.Attributes["onclick"] = "javascript:return delfolder();";
        }

        public void GridViewBind()
        {
            string Str1 = "";
            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str1 = Str1 + " AND (fdName LIKE '%" + hkdb.GetStr(query_content.Text) + "%' OR fdTitle LIKE '%" + hkdb.GetStr(query_content.Text) + "%')";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*)AS NUMS FROM hk_WorkFolder WHERE FK_ffid='" + hkdb.GetStr(Request.QueryString["id"]) + "'" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,B.ffName FROM hk_WorkFolder A LEFT OUTER JOIN hk_WorkFlowFolder B ON(A.FK_ffid=B.ffID) WHERE FK_ffid='" + hkdb.GetStr(Request.QueryString["id"]) + "'" + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
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

        //删除
        protected void Del_Click(object sender, EventArgs e)
        {
            string CheckStr = chkDelete();
            SqlHelper.ExecuteSql("DELETE FROM hk_WorkFolder WHERE fdID IN (" + CheckStr + ")");
            GridViewBind();
        }

        //转移
        protected void MoveBtn_Click(object sender, EventArgs e)
        {
            string CheckStr = chkDelete();
            SqlHelper.ExecuteSql("UPDATE hk_WorkFolder SET FK_ffid='" + dp_folder.SelectedValue + "' WHERE fdID IN (" + CheckStr + ")");
            GridViewBind();
        }

        //删除文件夹
        protected void DelFolderBtn_Click(object sender, EventArgs e)
        {
            DelNode(Request.QueryString["id"], Request.QueryString["id"]);

            mydb.Alert_Parent("删除成功！", "ArrangeWork.aspx");
        }

        //新建子文件夹
        protected void AddFolderBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("ArrangeWork_Add.aspx?id=" + Request.QueryString["id"] + "");
        }

        //重命名文件夹
        protected void RenameBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("ArrangeWork_Mod.aspx?id=" + Request.QueryString["id"] + "");
        }

        private void DelNode(string IDStr, string PID)
        {
            SqlHelper.ExecuteSql("DELETE FROM hk_WorkFlowFolder WHERE ffID='" + IDStr + "'");

            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowFolder WHERE (ffParid=" + IDStr.ToString() + ") ORDER BY ffID ASC");
            while (dr.Read())
            {
                SqlHelper.ExecuteSql("DELETE FROM hk_WorkFlowFolder WHERE ffID='" + dr["ffID"].ToString() + "'");

                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowFolder WHERE ffParid=" + dr["ffID"] + "");
                if (datar1.Read())
                {
                    string IDStr1 = dr["ffID"].ToString();
                    string PID1 = dr["ffParid"].ToString();
                    DelNode(IDStr1, PID1);
                }
                datar1.Close();
            }
            dr.Close();
        }
    }
}
