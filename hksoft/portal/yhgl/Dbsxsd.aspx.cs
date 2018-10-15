using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Drawing;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.yhgl
{
    public partial class Dbsxsd : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("60307", "60307");

                DropDownListBind();
            }

            GridViewBind();
        }

        //dp绑定 
        public void DropDownListBind()
        {
            string Sql1 = " where produid NOT IN('Y','X')";

            if (this.Session["systype"].ToString() == "A")     //主登录页
            {
                string str = null;
                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT ProduID FROM hk_Init");
                while (datar1.Read())
                {
                    str = str + "','" + datar1["ProduID"].ToString();
                }
                datar1.Close();

                Sql1 = Sql1 + " and ProduID in ('" + str + "')";
            }
            else  //子登录页
            {
                if (this.Session["systype"].ToString() == "M")
                {
                    Sql1 = Sql1 + " and (ProduID='G' or ProduID='P')";
                }
                else
                {
                    Sql1 = Sql1 + " and (ProduID='" + this.Session["systype"] + "' or ProduID='P')";
                }
            }

            string sql = "SELECT produid,produname FROM hk_init " + Sql1 + " ORDER BY InitType";
            bd.Bind_DropDownList(xt, sql, "produid", "produname", "", "");
        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string strXt = "";
            if (xt.SelectedValue == "G")
            {
                strXt = "M";
            }
            else
            {
                strXt = xt.SelectedValue;
            }

            SqlDataSource1.SelectCommand = "";
            SqlDataSource1.SelectCommand = "SELECT * FROM hk_ToDo WHERE ProduID='" + strXt + "' ORDER BY ID";
            SqlDataSource1.UpdateCommand = "";
            SqlDataSource1.UpdateCommand = "UPDATE hk_ToDo SET topn=@topn,days=@days WHERE id=@id";
        }

        //gv行处理 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";

                string strStatus = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "Status")).Trim();
                if (strStatus == "停用")
                {
                    e.Row.ForeColor = Color.Red;
                }
            }
        }

        //停用 
        protected void Stop_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

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
                SqlHelper.ExecuteSql("UPDATE hk_ToDo SET Status='停用' WHERE ID IN('" + cal + "')");

                mydb.Alert("停用成功！");

                GridViewBind();
            }
            else
            {
                mydb.Alert("停用失败,请先选中记录！");
            }
        }

        //恢复
        protected void Pass_Click(object sender, EventArgs e)
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
                SqlHelper.ExecuteSql("UPDATE hk_ToDo SET Status='正常' WHERE ID IN('" + cal + "')");

                mydb.Alert("恢复成功！");

                GridViewBind();
            }
            else
            {
                mydb.Alert("恢复失败,请先选中记录！");
            }
        }
    }
}