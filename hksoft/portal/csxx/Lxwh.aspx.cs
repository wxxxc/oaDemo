using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.csxx
{
    public partial class Lxwh : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("60103", "60103");

                DropDownListBind();

                panel2.Visible = false;
                @add.Text = "增 加";
            }

            //绑定数据 
            GridViewBind();
        }

        //dp绑定 
        public void DropDownListBind()
        {
            string Sql = " WHERE Tstatus='正常'";
            if (this.Session["systype"].ToString() == "A")     //主登录页
            {
                string str = null;
                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT ProduID FROM hk_Init");
                while (datar1.Read())
                {
                    str = str + "','" + datar1["ProduID"].ToString();
                }
                datar1.Close();

                Sql = Sql + " AND ProduID in ('" + str + "')";
            }
            else  //子登录页
            {
                Sql = Sql + " AND (ProduID='" + this.Session["systype"] + "' or ProduID='P')";
            }

            string sql_xzlx = "SELECT TID,PRODUID+'-'+TNAME AS TNAME FROM HK_TYPE " + Sql + " ORDER BY PRODUID,TID";
            bd.Bind_DropDownList_NoBlank(xzlx, sql_xzlx, "TID", "TNAME", "", "");
        }

        public void GridViewBind()
        {
            SqlDataSource1.SelectCommand = "";
            SqlDataSource1.SelectCommand = "SELECT * FROM HK_ZDYLX WHERE ZT<>'删除' AND FL='" + xzlx.SelectedValue + "' ORDER BY ID";
            SqlDataSource1.DeleteCommand = "";
            SqlDataSource1.DeleteCommand = "UPDATE HK_ZDYLX SET ZT='删除' WHERE id=@id";
            SqlDataSource1.UpdateCommand = "";
            SqlDataSource1.UpdateCommand = "UPDATE HK_ZDYLX SET mc=@mc WHERE id=@id";
        }

        protected void ChangeType(object sender, EventArgs e)
        {
            GridViewBind();

            if (!string.IsNullOrEmpty(xzlx.SelectedValue))
            {
                add.Enabled = true;
                StopBtn.Enabled = true;
                PassBtn.Enabled = true;
            }
            else
            {
                add.Enabled = false;
                StopBtn.Enabled = false;
                PassBtn.Enabled = false;
            }
        }

        //保存 
        protected void Save_Click(object sender, EventArgs e)
        {
            if (@add.Text == "保 存")
            {
                SqlHelper.ExecuteSql("INSERT INTO HK_ZDYLX (MC,ZT,FL) VALUES('" + hkdb.GetStr(name.Text) + "','正常','" + xzlx.SelectedValue + "')");
                name.Text = "";

                GridViewBind();
            }
            else
            {
                panel2.Visible = true;
                @add.Text = "保 存";
            }
        }

        //禁用
        protected void Stop_Click(object sender, EventArgs e)
        {
            int i = 0;
            string Str1 = "";
            // GridViewRow oDataGridItem = default(GridViewRow);
            System.Web.UI.WebControls.CheckBox chk = default(System.Web.UI.WebControls.CheckBox);
            System.Web.UI.WebControls.Label Lab = default(System.Web.UI.WebControls.Label);
            i = 0;
            foreach (GridViewRow oDataGridItem in GridView1.Rows)
            {
                chk = (CheckBox)oDataGridItem.FindControl("chk");
                if (chk.Checked)
                {
                    i = 1;
                    Lab = (Label)oDataGridItem.FindControl("dp_id");
                    if (string.IsNullOrEmpty(Str1))
                    {
                        Str1 = ((Label)oDataGridItem.FindControl("dp_id")).Text;
                    }
                    else
                    {
                        Str1 = Str1 + "','" + hkdb.GetStr(Lab.Text).Trim();
                    }
                }
            }
            if (i == 0)
            {
                mydb.Alert("操作失败,请先选中记录！");
                return;
            }
            else
            {
                SqlHelper.ExecuteSql("UPDATE HK_ZDYLX SET ZT='禁用' WHERE ID IN('" + Str1 + "') AND FL='" + xzlx.SelectedValue + "'");
                GridViewBind();
            }
        }

        //启用
        protected void Pass_Click(object sender, EventArgs e)
        {
            int i = 0;
            string Str1 = "";
            // GridViewRow oDataGridItem = default(GridViewRow);
            System.Web.UI.WebControls.CheckBox chk = default(System.Web.UI.WebControls.CheckBox);
            System.Web.UI.WebControls.Label Lab = default(System.Web.UI.WebControls.Label);
            i = 0;

            foreach (GridViewRow oDataGridItem in GridView1.Rows)
            {
                chk = (CheckBox)oDataGridItem.FindControl("chk");
                if (chk.Checked)
                {
                    i = 1;
                    Lab = (Label)oDataGridItem.FindControl("dp_id");
                    if (string.IsNullOrEmpty(Str1))
                    {
                        Str1 = ((Label)oDataGridItem.FindControl("dp_id")).Text;
                    }
                    else
                    {
                        Str1 = Str1 + "','" + hkdb.GetStr(Lab.Text.Trim());
                    }
                }
            }
            if (i == 0)
            {
                mydb.Alert("操作失败,请先选中记录！");
                return;
            }
            else
            {
                SqlHelper.ExecuteSql("UPDATE HK_ZDYLX SET ZT='正常' WHERE ID IN ('" + Str1 + "') AND FL='" + xzlx.SelectedValue + "'");
                GridViewBind();
            }
        }

        //gv行处理 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }

        //排序 
        protected void GridView1_DataBound(object sender, System.EventArgs e)
        {
            GridViewRow headerRow = GridView1.HeaderRow;
            string strSortExpression = GridView1.SortExpression;
            int i = 0;
            for (i = 0; i <= GridView1.Columns.Count - 1; i += i + 1)
            {
                string strColumnExpression = GridView1.Columns[i].SortExpression;
                if ((strSortExpression == strColumnExpression) & (!string.IsNullOrEmpty(strSortExpression)))
                {
                    Image img = new Image();
                    if (GridView1.SortDirection.ToString() == "Ascending")
                    {
                        img.ImageUrl = "../../images/Up.gif";
                        img.ToolTip = "Ascending";
                    }
                    else
                    {
                        img.ImageUrl = "../../images/Down.gif";
                        img.ToolTip = "Descending";
                    }
                    try
                    {
                        headerRow.Cells[i].Controls.Add(new LiteralControl(" "));
                        headerRow.Cells[i].Controls.Add(img);
                    }
                    catch (Exception ex)
                    {
                        this.Response.Write("Error Message:" + ex.Message.ToString());
                        this.Response.End();
                    }
                }
            }
        }
    }
}
