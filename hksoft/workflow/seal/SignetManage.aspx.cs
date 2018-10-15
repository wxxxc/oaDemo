using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.seal
{
    public partial class SignetManage : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11408", "11408");

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
            string Str1 = " WHERE sType='私章'";
            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str1 = Str1 + " and " + query_tj.SelectedItem.Value + " like '%" + hkdb.GetStr(query_content.Text) + "%' ";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*)AS NUMS FROM hk_Seal A LEFT OUTER JOIN yh B ON (A.sUser=B.ui_id)" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,B.ui_desc FROM hk_Seal A LEFT OUTER JOIN yh B ON (A.sUser=B.ui_id)" + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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
                lb1.Attributes.Add("onclick", "javascript:return confirm('您确认要停用印章[" + e.Row.Cells[2].Text.ToString() + "]吗？')");

                LinkButton lb2 = (LinkButton)e.Row.FindControl("LBtn_use");
                lb2.Attributes.Add("onclick", "javascript:return confirm('您确认要启用印章[" + e.Row.Cells[2].Text.ToString() + "]吗？')");

                LinkButton lb3 = (LinkButton)e.Row.FindControl("LBtn_reset");
                lb3.Attributes.Add("onclick", "javascript:return confirm('重置后的密码为123456，您确认要重置印章[" + e.Row.Cells[2].Text.ToString() + "]吗？')");

                LinkButton lb4 = (LinkButton)e.Row.FindControl("LBtn_del");
                lb4.Attributes.Add("onclick", "javascript:return confirm('您确认要删除印章[" + e.Row.Cells[2].Text.ToString() + "]吗？')");
            }
        }

        protected void OnRow_Command(object sender, GridViewCommandEventArgs e)
        {
            //停用
            if (e.CommandName == "Stop")
            {
                int sID = Convert.ToInt32(e.CommandArgument);
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_Seal WHERE sID='" + sID + "'");
                if (dr.Read())
                {
                    SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + dr["sUser"].ToString() + "','请注意，您的[" + dr["sName"].ToString() + "]印章已经被停用。'");
                    SqlHelper.ExecuteSql("UPDATE hk_Seal SET sStatus='停用',ModUser='" + this.Session["userid"] + "',ModTime=GETDATE() WHERE sID='" + sID + "'");
                }
                dr.Close();
                GridViewBind();
            }

            //启用
            if (e.CommandName == "Use")
            {
                int sID = Convert.ToInt32(e.CommandArgument);
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_Seal WHERE sID='" + sID + "'");
                if (dr.Read())
                {
                    SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + dr["sUser"].ToString() + "','请注意，您的[" + dr["sName"].ToString() + "]印章已经被重新启用。'");
                    SqlHelper.ExecuteSql("UPDATE hk_Seal SET sStatus='正常',ModUser='" + this.Session["userid"] + "',ModTime=GETDATE() WHERE sID='" + sID + "'");
                }
                dr.Close();
                GridViewBind();
            }

            //重置密码
            if (e.CommandName == "PwdReset")
            {
                int sID = Convert.ToInt32(e.CommandArgument);
                string sPwd = FormsAuthentication.HashPasswordForStoringInConfigFile("123456", "MD5");

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_Seal WHERE sID='" + sID + "'");
                if (dr.Read())
                {
                    SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + dr["sUser"].ToString() + "','请注意，您的[" + dr["sName"].ToString() + "]印章密码已被重置为123456'");
                    SqlHelper.ExecuteSql("UPDATE hk_Seal SET sPwd='" + sPwd + "',ModUser='" + this.Session["userid"] + "',ModTime=GETDATE() WHERE sID='" + sID + "'");
                }
                dr.Close();
                GridViewBind();
            }

            //删除
            if (e.CommandName == "Del")
            {
                int sID = Convert.ToInt32(e.CommandArgument);

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_Seal WHERE sID='" + sID + "'");
                if (dr.Read())
                {
                    SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + dr["sUser"].ToString() + "','请注意，您的[" + dr["sName"].ToString() + "]印章已被删除。'");
                    SqlHelper.ExecuteSql("DELETE FROM hk_Seal WHERE sID='" + sID + "'");
                }
                dr.Close();

                GridViewBind();
            }
        }
    }
}
