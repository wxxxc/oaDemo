using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.dxgl
{
    public partial class Cydx : System.Web.UI.Page
    {
        BindData bd = new BindData();
        mydb hkdb = new mydb();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11001", "11001");

                DropDownListBind();

                panel2.Visible = false;
                add.Text = "增 加";
            }

            //页面绑定
            GridViewBind();
        }

        //dp绑定 
        public void DropDownListBind()
        {
            string sql_dxlx = "SELECT ID,MC FROM HK_ZDYLX WHERE fl='p04' AND ZT='正常' ORDER BY ID";
            bd.Bind_DropDownList_NoBlank(dxlx, sql_dxlx, "id", "mc", "", "");
        }

        public void GridViewBind()
        {
            if (!string.IsNullOrEmpty(dxlx.SelectedValue))
            {
                Msg.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT COUNT(*) AS NUMS FROM HK_CYDX A LEFT OUTER JOIN HK_ZDYLX B ON(A.LX=B.ID) WHERE LX=" + dxlx.SelectedValue + ""));
                SqlDataSource1.SelectCommand = "";
                SqlDataSource1.SelectCommand = "SELECT A.*,B.MC FROM HK_CYDX A LEFT OUTER JOIN HK_ZDYLX B ON(A.LX=B.ID) WHERE LX= " + dxlx.SelectedValue + " ORDER BY A.ID";
                SqlDataSource1.DeleteCommand = "";
                SqlDataSource1.DeleteCommand = "DELETE FROM HK_CYDX WHERE id=@id";
                SqlDataSource1.UpdateCommand = "";
                SqlDataSource1.UpdateCommand = "UPDATE HK_CYDX SET nr=@nr WHERE id=@id";
            }
        }

        protected void ChangeType(object sender, EventArgs e)
        {
            GridViewBind();
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (add.Text == "保 存")
            {
                SqlHelper.ExecuteSql("INSERT INTO HK_CYDX (NR,LX) VALUES('" + hkdb.GetStr(nr.Text) + "','" + dxlx.SelectedValue + "')");

                nr.Text = "";
                GridViewBind();
            }
            else
            {
                panel2.Visible = true;
                add.Text = "保 存";
            }
        }


        //gv行处理 
        protected void Item_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
                ImageButton l = (ImageButton)e.Row.FindControl("ImageButton4");
                l.Attributes.Add("onclick", "javascript:return " + "confirm('确认要执行删除吗？')");
            }
        }
    }
}
