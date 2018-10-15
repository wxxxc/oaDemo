using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.tpgl
{
    public partial class Tpdc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11306", "11306");

                //类型
                if (this.Session["systype"].ToString() == "A")     //主登录页
                {
                    SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT xh FROM hk_Init WHERE produID IN('M','V','F')");
                    if (datar1.Read())
                    {
                        lx.Visible = true;
                    }
                    datar1.Close();
                }
                else  //子登录页
                {
                    if (this.Session["systype"].ToString() == "M" | this.Session["systype"].ToString() == "V" | this.Session["systype"].ToString() == "F")
                    {
                        lx.Visible = true;
                    }
                }

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //页面绑定 
                LabelBind();
                GridViewBind();
            }
        }

        //查询
        protected void Query_Click(object sender, EventArgs e)
        {
            LabelBind();
            GridViewBind();
        }

        public void LabelBind()
        {
            SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM HK_POLL_PROJECT WHERE PROJECTTAG='1' AND PROJECTTYPE='" + lx.SelectedValue + "'");
            if (datar1.Read())
            {
                label1.Text = "当前生效的调查项目为：";
                label2.Text = "《" + datar1["ProjectName"].ToString() + "》";
            }
            else
            {
                label1.Text = "暂无任何生效的调查项目";
                label2.Text = "";
            }
            datar1.Close();
        }

        //gv绑定 
        public void GridViewBind()
        {
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM HK_POLL_PROJECT WHERE PROJECTTYPE='" + lx.SelectedValue + "'");
            DataSet ds = SqlHelper.ExecuteDs("SELECT ID,PROJECTNAME,PROJECTTYPE,PROJECTCOM,(CASE WHEN PROJECTTAG=0 THEN '无效' ELSE '有效' END)AS PROJECTTAG,CJSJ FROM HK_POLL_PROJECT WHERE PROJECTTYPE='" + lx.SelectedValue + "'", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
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
            }
        }

        protected void Del_Click(object sender, EventArgs e)
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
                SqlHelper.ExecuteSql("DELETE FROM HK_POLL_PROJECT WHERE ID IN('" + cal + "')");
                SqlHelper.ExecuteSql("DELETE FROM HK_POLL_SUBJECT WHERE SSID NOT IN (SELECT ID FROM HK_POLL_PROJECT)");
                SqlHelper.ExecuteSql("DELETE FROM HK_POLL_DATA WHERE PROJECTID NOT IN (SELECT ID FROM HK_POLL_PROJECT)");
                SqlHelper.ExecuteSql("DELETE FROM HK_POLL_KEY WHERE SUBID NOT IN (SELECT SUBID FROM HK_POLL_SUBJECT)");
                SqlHelper.ExecuteSql("DELETE FROM HK_POLL_DETAIL WHERE VOTEID NOT IN (SELECT ID FROM HK_POLL_DATA) OR KEYID NOT IN (SELECT KEYID FROM HK_POLL_KEY)");
                mydb.Alert("删除成功！");
                GridViewBind();
            }
            else
            {
                mydb.Alert("删除失败,请先选中记录！");
            }
        }
    }
}
