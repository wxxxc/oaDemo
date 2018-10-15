using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class zsdl_view : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("12101", "0");

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";
                    SqlDataReader datar = SqlHelper.ExecuteReader("select Name from OA_KlClass where ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        Name.Text = datar["Name"].ToString();
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

        protected void Save_Click(object sender, EventArgs e)
        {
            if (lbltitle.Text == "新增")
            {
                SqlHelper.ExecuteScalar("insert into OA_KlClass(Name,UserName,RealName,SetTime) values('" + hkdb.GetStr(Name.Text) + "','" + this.Session["userid"] + "','" + this.Session["username"] + "',GETDATE())" + "SELECT CAST(scope_identity() AS int)");
            }
            else
            {
                SqlHelper.ExecuteSql("update OA_KlClass set Name='" + hkdb.GetStr(Name.Text) + "' where ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                SqlHelper.ExecuteSql("update OA_KlClassSub set BigName='" + hkdb.GetStr(Name.Text) + "' where BigId='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                SqlHelper.ExecuteSql("update OA_KnowLedge set BigName='" + hkdb.GetStr(Name.Text) + "' where BigId='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            }

            //判断btn
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                Clear_Click();
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "zsdl.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！", "zsdl.aspx");
            }
        }

        //清空 
        protected void Clear_Click()
        {
            Name.Text = "";
        }

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            int i = 0;
            i = (int)SqlHelper.ExecuteScalar("select count(*) from OA_KlClassSub where BigId='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            if (i > 0)
            {
                mydb.Alert("删除失败,此知识大类下已存在知识小类！");
            }
            else
            {
                SqlHelper.ExecuteSql("delete from OA_KlClass where ID = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                mydb.Alert_Refresh_Close("删除成功！", "zsdl.aspx");
            }
        }
    }
}
