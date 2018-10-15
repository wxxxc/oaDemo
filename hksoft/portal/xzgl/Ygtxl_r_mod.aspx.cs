using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Ygtxl_r_mod : System.Web.UI.Page
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

                SqlDataReader dr = SqlHelper.ExecuteReader("select * from hk_Ygtxl where id='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (dr.Read())
                {
                    Folder.SelectedValue = dr["FoldersID"].ToString();
                    PxNum.Text = dr["PxNum"].ToString();
                    Name.Text = dr["Name"].ToString();
                    Worknum.Text = dr["Worknum"].ToString();
                    Unit.Text = dr["Unit"].ToString();
                    Respon.Text = dr["Respon"].ToString();
                    Post.Text = dr["Post"].ToString();
                    Sex.SelectedValue = dr["Sex"].ToString();
                    Officetel.Text = dr["Officetel"].ToString();
                    Fax.Text = dr["Fax"].ToString();
                    MoveTel.Text = dr["MoveTel"].ToString();
                    HomeTel.Text = dr["HomeTel"].ToString();
                    Email.Text = dr["Email"].ToString();
                    QQNum.Text = dr["QQNum"].ToString();
                    MsnNum.Text = dr["MsnNum"].ToString();
                    NbNum.Text = dr["NbNum"].ToString();
                    Address.Text = dr["Address"].ToString();
                    ZipCode.Text = dr["ZipCode"].ToString();
                    Remark.Text = dr["Remark"].ToString();
                    BothDay.Text = dr["BothDay"].ToString();
                }
                dr.Close();

                BindAttr();
            }
        }

        public void BindAttr()
        {
            Button1.Attributes["onclick"] = "javascript:return chknull();";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Ygtxl_r.aspx?typeId=" + Folder.SelectedValue + "");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("Update hk_Ygtxl Set PxNum='" + PxNum.Text + "',FoldersName='" + Folder.SelectedItem.Text + "',FoldersID='" + Folder.SelectedValue + "',Name='" + Name.Text + "',Worknum='" + Worknum.Text + "',Unit='" + Unit.Text + "',Respon='" + Respon.Text + "',Post='" + Post.Text + "',Sex='" + Sex.SelectedValue + "',BothDay='" + BothDay.Text + "',Officetel='" + Officetel.Text + "',Fax='" + Fax.Text + "',MoveTel='" + MoveTel.Text + "',HomeTel='" + HomeTel.Text + "',Email='" + Email.Text + "',QQNum='" + QQNum.Text + "',MsnNum='" + MsnNum.Text + "',NbNum='" + NbNum.Text + "',Address='" + Address.Text + "',ZipCode='" + ZipCode.Text + "',Remark='" + Remark.Text + "' where id='" + int.Parse(Request.QueryString["id"]) + "'");
            
            mydb.InsertLog("修改员工通讯录[" + Name.Text + "]", "11310");

            mydb.Alert_Goto("提交成功！", "Ygtxl_r.aspx?typeId=" + Folder.SelectedValue + "");
        }
    }
}