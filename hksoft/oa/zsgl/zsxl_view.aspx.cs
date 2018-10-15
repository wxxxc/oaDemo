using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class zsxl_view : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("12102", "0");

                DropDownListBind();
                //dp绑定 

                BindAttr();

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";
                    SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KlClassSub where ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        Name.Text = datar["Name"].ToString();
                        BigName.SelectedValue = datar["BigId"].ToString();
                        UserName.Text = datar["SyRealname"].ToString();
                        UserID.Text = datar["SyUsername"].ToString();
                        datar.Close();
                        DelBtn.Visible = true;
                    }
                }
                else
                {
                    lbltitle.Text = "新增";
                    SaveAddBtn.Visible = true;
                }
            }
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");
        }

        //dp绑定 
        public void DropDownListBind()
        {

            string sql_BigName = "select ID,Name from OA_KlClass  order by ID";
            bd.Bind_DropDownList(BigName, sql_BigName, "ID", "Name", "", "");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (lbltitle.Text == "新增")
            {
                SqlHelper.ExecuteScalar("insert into OA_KlClassSub(BigId,BigName,Name,SyRealname,SyUsername,Username,Realname,Settime) values('" + BigName.SelectedValue + "','" + BigName.SelectedItem + "','" + hkdb.GetStr(Name.Text) + "','" + hkdb.GetStr(UserName.Text) + "','" + hkdb.GetStr(UserID.Text) + "','" + this.Session["userid"] + "','" + this.Session["username"] + "',GETDATE())");
            }
            else
            {
                SqlHelper.ExecuteSql("update OA_KlClassSub set BigId='" + BigName.SelectedValue + "',BigName='" + BigName.SelectedItem + "',Name='" + hkdb.GetStr(Name.Text) + "',SyUsername='" + hkdb.GetStr(UserID.Text) + "',SyRealname='" + hkdb.GetStr(UserName.Text) + "' where ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                SqlHelper.ExecuteSql("update OA_KnowLedge set LittleName='" + hkdb.GetStr(Name.Text) + "' where LittleId='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            }

            //判断btn
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                Clear_Click();
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "zsxl.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！", "zsxl.aspx");
            }
        }

        //清空 
        protected void Clear_Click()
        {
            Name.Text = "";
            UserName.Text = "";
            UserID.Text = "";
        }

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            int i = 0;
            i = (int)SqlHelper.ExecuteScalar("select count(*) from OA_KnowLedge where LittleId='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            if (i > 0)
            {
                mydb.Alert("删除失败,此知识小类下已存在关联知识！");
            }
            else
            {
                SqlHelper.ExecuteSql("delete from OA_KlClassSub where ID = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                mydb.Alert_Refresh_Close("删除成功！", "zsxl.aspx");
            }
        }

        protected void allyh_Click(object sender, EventArgs e)
        {
            UserID.Text = "全部用户";
            UserName.Text = "全部用户";
        }
    }
}
