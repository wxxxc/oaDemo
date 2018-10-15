using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.grbg
{
    public partial class Cyy : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10117", "10117");

                panel2.Visible = false;
                @add.Text = "增 加";
            }

            //绑定数据 
            GridViewBind();
        }

        public void GridViewBind()
        {
            SqlDataSource1.SelectCommand = "";
            SqlDataSource1.SelectCommand = "SELECT * FROM hk_Cyy WHERE CJR='" + this.Session["UserID"] + "' AND FL='" + xzlx.SelectedValue + "'";
            SqlDataSource1.DeleteCommand = "";
            SqlDataSource1.DeleteCommand = "DELETE FROM hk_Cyy WHERE CID=@cid AND CJR='" + this.Session["UserID"] + "'";
            SqlDataSource1.UpdateCommand = "";
            SqlDataSource1.UpdateCommand = "UPDATE hk_Cyy SET NR=@nr WHERE CID=@cid AND CJR='" + this.Session["UserID"] + "'";
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
                SqlHelper.ExecuteSql("INSERT INTO hk_Cyy(NR,ZT,FL,CJR,CJSJ) VALUES('" + hkdb.GetStr(name.Text) + "','正常','" + xzlx.SelectedValue + "','" + this.Session["UserID"] + "',GETDATE())");
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
                        Str1 = Str1 + "','" + Lab.Text.Trim();
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
                SqlHelper.ExecuteSql("UPDATE hk_Cyy SET ZT='禁用' WHERE CID IN('" + Str1 + "') AND FL='" + xzlx.SelectedValue + "'");
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
                        Str1 = Str1 + "','" + Lab.Text.Trim();
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
                SqlHelper.ExecuteSql("UPDATE hk_Cyy SET ZT='正常' WHERE CID IN ('" + Str1 + "') AND FL='" + xzlx.SelectedValue + "'");
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
    }
}
