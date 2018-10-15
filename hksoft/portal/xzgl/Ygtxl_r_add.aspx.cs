using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Ygtxl_r_add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11310", "0");

                string sql_down_bh = "select id,Linew+name as aaa from hk_Ygtxl_lb order by QxString asc";
                bd.Bind_DropDownList_NoBlank(Folder, sql_down_bh, "id", "aaa", "", "");

                BindAttr();

                if (Request.QueryString["typeid"] != null)
                {
                    Folder.SelectedValue = Request.QueryString["typeid"].ToString();
                }
            }
        }

        public void BindAttr()
        {
            Button1.Attributes["onclick"] = "javascript:return chknull();";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Folder.SelectedValue != "")
            {
                Response.Redirect("Ygtxl_r.aspx?typeId=" + Folder.SelectedValue + "");
            }
            else
            {
                Response.Redirect("Ygtxl_r.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("insert into hk_Ygtxl(PxNum,FoldersName,FoldersID,Name,Worknum,Unit,Respon,Post,Sex,BothDay,Officetel,Fax,MoveTel,HomeTel,Email,QQNum,MsnNum,NbNum,Address,ZipCode,Remark,Username,Realname,NowTimes) values ('" + hkdb.GetStr(PxNum.Text) + "','" + Folder.SelectedItem.Text + "','" + Folder.SelectedValue + "','" + hkdb.GetStr(Name.Text) + "','" + hkdb.GetStr(Worknum.Text) + "','" + hkdb.GetStr(Unit.Text) + "','" + hkdb.GetStr(Respon.Text) + "','" + hkdb.GetStr(Post.Text) + "','" + hkdb.GetStr(Sex.SelectedValue) + "','" + hkdb.GetStr(BothDay.Text) + "','" + hkdb.GetStr(Officetel.Text) + "','" + hkdb.GetStr(Fax.Text) + "','" + hkdb.GetStr(MoveTel.Text) + "','" + hkdb.GetStr(HomeTel.Text) + "','" + hkdb.GetStr(Email.Text) + "','" + hkdb.GetStr(QQNum.Text) + "','" + hkdb.GetStr(MsnNum.Text) + "','" + hkdb.GetStr(NbNum.Text) + "','" + hkdb.GetStr(Address.Text) + "','" + hkdb.GetStr(ZipCode.Text) + "','" + hkdb.GetStr(Remark.Text) + "','" + this.Session["userid"] + "','" + this.Session["username"] + "','" + System.DateTime.Now.ToString() + "')");
            
            mydb.InsertLog("新增员工通讯录[" + Name.Text + "]", "11310");

            mydb.Alert_Goto("提交成功！", "Ygtxl_r.aspx?typeId=" + Folder.SelectedValue + "");
        }
    }
}