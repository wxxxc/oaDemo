using System;
using System.Data;
using haoke365;

namespace hkpro.app.portal
{
    public partial class Msg_Show : System.Web.UI.Page
    {
        BindData bd = new BindData();
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["id"].ToString()))
                {
                    SqlHelper.ExecuteSql("UPDATE HK_MESS_JS SET ZT='1' WHERE JSR='" + this.Session["userid"] + "' AND ID='" + Request.QueryString["id"].ToString() + "'");

                    //发送人
                    lblfsrid.Text = SqlHelper.ExecuteScalar("SELECT B.FSR FROM HK_MESS_JS A LEFT OUTER JOIN HK_MESS_FS B ON (A.ID=B.ID) WHERE A.ID='" + Request.QueryString["id"].ToString() + "'").ToString();

                    //绑定数据 
                    ListViewBind();
                }

                //ReplyBtn.Attributes["onclick"] = "javascript:fade();";
            }
        }

        public void ListViewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.ID,B.NR,B.FSR,B.FSSJ,C.UI_DESC FROM HK_MESS_JS A LEFT OUTER JOIN HK_MESS_FS B ON (A.ID=B.ID) LEFT OUTER JOIN YH C ON (B.FSR=C.UI_ID) WHERE A.ID='" + Request.QueryString["id"].ToString() + "'");
            ListView1.DataSource = ds;
            ListView1.DataBind();
        }

        protected void Reply_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + lblfsrid.Text + "','" + hfnr.Text + "'");
            
            hfnr.Text = "";

            ReplyBtn.Enabled = false;
            lblMsg.Text = "回复成功,请点击返回！";
            

            //ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>window.onload=function(){fade();}</script>");

            //ScriptManager.RegisterStartupScript(this.GetType(), "", "<script>goTo('Msg.aspx');<" + "/script>");
            //ScriptManager.RegisterStartupScript(typeof(string), "", "<script>window.location.href='AdminMain.aspx';</script>");
            //ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('保存成功4！');<" + "/script>");

            //ScriptManager.RegisterStartupScript(this.ReplyBtn, this.GetType(), "alertScript", "alert('保存成功1！');window.location.href='Msg.aspx';", true);
            //ScriptManager.RegisterStartupScript(this.UpdatePanel1, Page.GetType(), System.DateTime.Now.Ticks.ToString(), "alert('保存成功2！');window.location.href='Msg.aspx';", true);

            //string message = "alert('保存成功3！')";
            //ScriptManager.RegisterClientScriptBlock((Sender as Control), this.GetType(), "alert", message, true);

            //ScriptManager.RegisterStartupScript(this.ReplyBtn, this.GetType(), "alertScript", "AlertInfo();", true);
        }
    }
}
