using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.seal
{
    public partial class OffSealManage : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11409", "11409");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //页面绑定 
                GridViewBind();
            }
        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " WHERE 1=1";
            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str1 = Str1 + " and " + query_tj.SelectedItem.Value + " like '%" + hkdb.GetStr(query_content.Text) + "%' ";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*)AS NUMS FROM hk_OffSeal" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM hk_OffSeal" + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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

                LinkButton lb1 = (LinkButton)e.Row.FindControl("LBtn_stop");
                lb1.Attributes.Add("onclick", "javascript:return confirm('您确认要停用公章[" + e.Row.Cells[2].Text.ToString() + "]吗？')");

                LinkButton lb2 = (LinkButton)e.Row.FindControl("LBtn_use");
                lb2.Attributes.Add("onclick", "javascript:return confirm('您确认要启用公章[" + e.Row.Cells[2].Text.ToString() + "]吗？')");

                LinkButton lb3 = (LinkButton)e.Row.FindControl("LBtn_reset");
                lb3.Attributes.Add("onclick", "javascript:return confirm('所有使用该公章人员的密码都将重置为123456，您确认要重置公章[" + e.Row.Cells[2].Text.ToString() + "]的密码吗？')");

                LinkButton lb4 = (LinkButton)e.Row.FindControl("LBtn_del");
                lb4.Attributes.Add("onclick", "javascript:return confirm('您确认要删除公章[" + e.Row.Cells[2].Text.ToString() + "]吗？')");
            }
        }

        protected void OnRow_Command(object sender, GridViewCommandEventArgs e)
        {
            //停用
            if (e.CommandName == "Stop")
            {
                int oID = Convert.ToInt32(e.CommandArgument);
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_OffSeal WHERE oID='" + oID + "'");
                if (dr.Read())
                {
                    SqlHelper.ExecuteSql("UPDATE hk_Seal SET sStatus='停用',ModUser='" + this.Session["userid"] + "',ModTime=GETDATE() WHERE sNo='" + dr["oNo"].ToString() + "'");
                }
                dr.Close();
                GridViewBind();
            }

            //启用
            if (e.CommandName == "Use")
            {
                int oID = Convert.ToInt32(e.CommandArgument);
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_OffSeal WHERE oID='" + oID + "'");
                if (dr.Read())
                {
                    SqlHelper.ExecuteSql("UPDATE hk_Seal SET sStatus='正常',ModUser='" + this.Session["userid"] + "',ModTime=GETDATE() WHERE sNo='" + dr["oNo"].ToString() + "'");
                }
                dr.Close();
                GridViewBind();
            }

            //重置密码
            if (e.CommandName == "PwdReset")
            {
                int oID = Convert.ToInt32(e.CommandArgument);
                string sPwd = FormsAuthentication.HashPasswordForStoringInConfigFile("123456", "MD5");

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_OffSeal WHERE oID='" + oID + "'");
                if (dr.Read())
                {
                    SqlHelper.ExecuteSql("UPDATE hk_OffSeal SET oPwd='" + sPwd + "' WHERE oID='" + oID + "'");
                    SqlHelper.ExecuteSql("UPDATE hk_Seal SET sPwd='" + sPwd + "',ModUser='" + this.Session["userid"] + "',ModTime=GETDATE() WHERE sNo='" + dr["oNo"].ToString() + "'");
                }
                dr.Close();
                GridViewBind();
            }

            //删除
            if (e.CommandName == "Del")
            {
                int oID = Convert.ToInt32(e.CommandArgument);

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_OffSeal WHERE oID='" + oID + "'");
                if (dr.Read())
                {
                    SqlHelper.ExecuteSql("DELETE FROM hk_OffSeal WHERE oID='" + oID + "'");
                    SqlHelper.ExecuteSql("DELETE FROM hk_Seal WHERE sNo='" + dr["oNo"].ToString() + "'");
                }
                dr.Close();

                GridViewBind();
            }
        }
    }
}
