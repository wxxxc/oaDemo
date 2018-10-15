using System.Data.SqlClient;
using haoke365;

namespace hkpro.portal.xxgl
{
    public partial class MsgManage : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, System.EventArgs e)
        {
            hkdb.VeriSess("2");

            if (!IsPostBack)
            {
                //显示信息
                ReadMsg();

                //检查多条未读消息
                CheckNextMsg();

                //初始化回复按钮 
                this.btnReply.CommandArgument = "view";

                //初始化历史记录按钮 
                this.btnHistory.Attributes["onclick"] = "javascript: mytop=screen.availHeight-320-175;myleft=0;var newhiswin=window.open('../../portal/xxgl/msghistory.aspx','show','height=200,width=370,status=0,toolbar=no,menubar=no,location=no,scrollbars=yes,top='+mytop+',left='+myleft+',resizable=yes');newhiswin.focus();";
            }
        }

        public void CheckNextMsg()
        {
            int i = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*)AS NUMS FROM hk_Mess_JS WHERE jsr='" + this.Session["userid"] + "' AND zt='0'");
            if (i >= 2)
            {
                this.btnNext.Enabled = true;
            }
            else
            {
                this.btnNext.Enabled = false;
            }
        }

        public void ReadMsg()
        {
            this.txtSender.Enabled = false;
            this.txtContent.Enabled = false;
            this.btnReply.Enabled = true;
            this.btnHistory.Enabled = true;

            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.id,B.nr,B.fsr,B.fssj,C.ui_desc FROM hk_Mess_JS A LEFT OUTER JOIN hk_Mess_FS B ON(A.id=B.id) LEFT OUTER JOIN yh C ON(B.fsr=C.ui_id) WHERE A.jsr='" + this.Session["userid"] + "' AND A.zt='0' ORDER BY B.fssj DESC");
            if (dr.Read())
            {
                txtrealName.Text = dr["ui_desc"].ToString();
                txtSender.Text = dr["fsr"].ToString();
                txtContent.Text = dr["nr"].ToString();
                txtMsgID.Text = dr["id"].ToString();
                txtfssj.Text = dr["fssj"].ToString();
            }
            dr.Close();
        }

        //读取消息 
        protected void btnRead_Click(object sender, System.EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE hk_Mess_JS SET zt='1' WHERE jsr='" + this.Session["userid"] + "' AND id='" + hkdb.GetStr(txtMsgID.Text) + "'");
            this.Response.Write("<script language=javascript>window.opener.send_request('MsgRemindAjax.aspx?tmp='+Math.random()+'');window.close();</script>");
        }

        //下一条
        protected void btnNext_Click(object sender, System.EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE hk_Mess_JS SET zt='1' WHERE jsr='" + this.Session["userid"] + "' AND id='" + hkdb.GetStr(txtMsgID.Text) + "'");
            Response.Redirect("msgmanage.aspx");
        }

        //回复
        protected void btnReply_Click(object sender, System.EventArgs e)
        {
            this.lblInstruction.Text = "回复消息";
            SqlHelper.ExecuteSql("UPDATE hk_Mess_JS SET zt='1' WHERE jsr='" + this.Session["userid"] + "' AND id='" + hkdb.GetStr(txtMsgID.Text) + "'");
            if (this.btnReply.CommandArgument == "view")
            {
                btnReply.Text = "发 送";
                btnReply.CommandArgument = "reply";
                btnRead.Visible = false;
                btnNext.Visible = false;
                lblSender.Text = "接收人：";
                txtSender.Enabled = true;
                txtContent.Enabled = true;
                txtContent.Text = "";
                txtfssj.Visible = false;
                this.lblShortCut.Text = "按Alt+S发送消息 ";
            }
            else
            {
                SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + hkdb.GetStr(txtSender.Text) + "','" + hkdb.GetStr(txtContent.Text) + "'");
                this.Response.Write("<script language=javascript>window.opener.send_request('MsgRemindAjax.aspx?tmp='+Math.random()+'');window.close();</script>");
            }
        }
    }
}