using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.csxx
{
    public partial class Dyzzsz : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("60105", "60105");

                panel2.Visible = false;
                @add.Text = "增 加";
            }

            GridViewBind();
        }

        public void GridViewBind()
        {
            SqlDataSource1.SelectCommand = "";
            SqlDataSource1.SelectCommand = "SELECT * FROM hk_DYSZ";
            SqlDataSource1.DeleteCommand = "";
            SqlDataSource1.DeleteCommand = "DELETE FROM hk_DYSZ WHERE dyid=@dyid";
            SqlDataSource1.UpdateCommand = "";
            SqlDataSource1.UpdateCommand = "UPDATE hk_DYSZ Set dymc=@dymc,dyz=@dyz WHERE dyid=@dyid";
        }

        protected void ChangeType(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //保存 
        protected void save_click(object sender, EventArgs e)
        {
            if (@add.Text == "保 存")
            {
                SqlHelper.ExecuteSql("INSERT INTO hk_DYSZ (dymc,dyzt,dyz) VALUES('" + hkdb.GetStr(name.Text) + "','正常','" + hkdb.GetStr(value.Text) + "')");
                
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
            //GridViewRow oDataGridItem = default(GridViewRow); 
            System.Web.UI.WebControls.CheckBox chk = default(System.Web.UI.WebControls.CheckBox);
            System.Web.UI.WebControls.Label Lab = default(System.Web.UI.WebControls.Label);
            i = 0;
            foreach (GridViewRow oDataGridItem in GridView1.Rows)
            {
                chk = (System.Web.UI.WebControls.CheckBox)oDataGridItem.FindControl("chk");
                if (chk.Checked)
                {
                    i = 1;
                    Lab = (System.Web.UI.WebControls.Label)oDataGridItem.FindControl("dp_id");
                    if (string.IsNullOrEmpty(Str1.Trim()))
                    {
                        Str1 = ((Label)oDataGridItem.FindControl("dp_id")).Text;
                    }
                    else
                    {
                        Str1 = Str1.Trim() + "','" + hkdb.GetStr(Lab.Text).Trim();
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
                SqlHelper.ExecuteSql("UPDATE HK_DYSZ SET DYZT='禁用' WHERE DYID IN ('" + Str1 + "')");
                GridViewBind();
            }
        }

        //启用
        protected void Pass_Click(object sender, EventArgs e)
        {
            int i = 0;
            string Str1 = "";
            //GridViewRow oDataGridItem = default(GridViewRow); 
            System.Web.UI.WebControls.CheckBox chk = default(System.Web.UI.WebControls.CheckBox);
            System.Web.UI.WebControls.Label Lab = default(System.Web.UI.WebControls.Label);
            i = 0;

            foreach (GridViewRow oDataGridItem in GridView1.Rows)
            {
                chk = (System.Web.UI.WebControls.CheckBox)oDataGridItem.FindControl("chk");
                if (chk.Checked)
                {
                    i = 1;
                    Lab = (System.Web.UI.WebControls.Label)oDataGridItem.FindControl("dp_id");
                    if (string.IsNullOrEmpty(Str1.Trim()))
                    {
                        Str1 = ((Label)oDataGridItem.FindControl("dp_id")).Text;
                    }
                    else
                    {
                        Str1 = Str1.Trim() + "','" + hkdb.GetStr(Lab.Text).Trim();
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
                SqlHelper.ExecuteSql("UPDATE HK_DYSZ SET DYZT='正常' WHERE DYID IN ('" + Str1 + "')");
                GridViewBind();
            }
        }

        //gv行处理 
        protected void Item_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }

        //排序 
        public void GridView1_DataBoundHandler(object sender, System.EventArgs e)
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

