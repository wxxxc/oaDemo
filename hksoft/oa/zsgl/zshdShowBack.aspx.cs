using System;
using System.Web.UI;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class zshdShowBack : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("12106", "0");
            }
        }

        protected void BtnS_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("insert into OA_KlAction  (Title,Content,ParentNodesID,PointNum,Username,Realname,Settime) values ('回帖','" + editor.Value + "','" + Request.QueryString["Backid"] + "','0','" + this.Session["userid"] + "','" + this.Session["username"] + "','" + System.DateTime.Now.ToString() + "')");
            
            mydb.Alert_Goto("提交成功！", "zshdShow.aspx?id=" + Request.QueryString["Backid"] + "");
        }

        protected void BtnF_Click(object sender, EventArgs e)
        {
            Response.Redirect("zshdShow.aspx?id=" + Request.QueryString["Backid"] + "");
        }
    }
}
