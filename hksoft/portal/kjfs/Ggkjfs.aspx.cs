using System;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.kjfs
{
    public partial class Ggkjfs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");
            
            if (!IsPostBack)
            {
                hkdb.PassTo("60106", "60106");
            }

            GridViewBind();
        }

        public void GridViewBind()
        {
            SqlDataSource1.SelectCommand = "";
            SqlDataSource1.SelectCommand = "SELECT * FROM hk_Quick WHERE qlx='Y'";
            SqlDataSource1.DeleteCommand = "";
            SqlDataSource1.DeleteCommand = "DELETE FROM hk_Quick WHERE qid=@qid";
        }

        //删除 
        protected void Delete_Click(object sender, EventArgs e)
        {
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
                SqlHelper.ExecuteSql("DELETE FROM hk_Quick WHERE qid IN('" + cal + "')");
                GridViewBind();
            }
            else
            {
                mydb.Alert("删除失败,请先选中记录！");
            }
        }

        //选中行变色 
        protected void Item_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}
