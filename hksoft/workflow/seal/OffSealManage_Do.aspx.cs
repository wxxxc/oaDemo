using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.seal
{
    public partial class OffSealManage_Do : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM hk_OffSeal WHERE oID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (datar.Read())
                {
                    lbloName.Text = datar["oName"].ToString();
                    lbloRemark.Text = hkdb.TbToLb(datar["oRemark"].ToString());
                    oPicNewName.ImageUrl = "../../Attach/flow/Seal/" + datar["oPicNewName"].ToString();
                }
                datar.Close();

                BindAttr();

                //页面绑定 
                GridViewBind();
            }
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");
        }

        //gv绑定 
        public void GridViewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,B.ui_desc FROM hk_Seal A LEFT OUTER JOIN yh B ON (A.sUser=B.ui_id) WHERE sType = '公章' AND sNo='" + hkdb.GetStr(Request.QueryString["no"]) + "'");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //gv行处理 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";

                LinkButton lb1 = (LinkButton)e.Row.FindControl("LBtn_stop");
                lb1.Attributes.Add("onclick", "javascript:return confirm('您确认要停用[" + e.Row.Cells[4].Text.ToString() + "]的公章吗？')");

                LinkButton lb2 = (LinkButton)e.Row.FindControl("LBtn_use");
                lb2.Attributes.Add("onclick", "javascript:return confirm('您确认要启用[" + e.Row.Cells[4].Text.ToString() + "]的公章吗？')");

                LinkButton lb3 = (LinkButton)e.Row.FindControl("LBtn_reset");
                lb3.Attributes.Add("onclick", "javascript:return confirm('重置后的密码为123456，您确认要重置[" + e.Row.Cells[4].Text.ToString() + "]的公章吗？')");

                LinkButton lb4 = (LinkButton)e.Row.FindControl("LBtn_del");
                lb4.Attributes.Add("onclick", "javascript:return confirm('您确认要删除[" + e.Row.Cells[4].Text.ToString() + "]的公章吗？')");
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

        protected void Save_Click(object sender, EventArgs e)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_OffSeal WHERE oID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            if (dr.Read())
            {
                SqlDataReader dr2 = SqlHelper.ExecuteReader("SELECT * FROM hk_Seal WHERE sNo='" + hkdb.GetStr(Request.QueryString["no"]) + "' AND sUser='" + hkdb.GetStr(UserID.Text) + "' AND sType='公章'");
                if (dr2.Read())
                {
                    dr2.Close();
                    mydb.Alert("此使用人员已经存在！");
                    return;
                }
                dr2.Close();

                SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + hkdb.GetStr(UserID.Text) + "','新公章[" + dr["oName"].ToString() + "]发布，默认密码为123456，请您尽快修改密码！'");

                SqlHelper.ExecuteSql("INSERT INTO hk_Seal(sNo,sName,sPicName,sPicNewName,sPwd,sType,sRemark,sStatus,sUser,AddUser,AddTime) values('" + dr["oNo"].ToString() + "','" + dr["oName"].ToString() + "','" + dr["oPicName"].ToString() + "','" + dr["oPicNewName"].ToString() + "','" + dr["oPwd"].ToString() + "','公章','" + dr["oRemark"].ToString() + "','正常','" + hkdb.GetStr(UserID.Text) + "','" + this.Session["userid"] + "',GETDATE())");
            }
            dr.Close();

            UserID.Text = "";
            UserName.Text = "";

            GridViewBind();
        }
    }
}
