using System;
using System.Web.UI;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class zshdAdd : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("12106", "0");
            }
        }

        protected void BtnS_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("insert into OA_KlAction(Title,Content,ParentNodesID,PointNum,Username,Realname,Settime) values ('" + hkdb.GetStr(title.Text) + "','" + editor.Value + "','0','0','" + this.Session["userid"] + "','" + this.Session["username"] + "','" + System.DateTime.Now.ToString() + "')");

            mydb.Alert_Refresh_Close("发布讨论成功！","zshd.aspx");
        }
    }
}
