using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.xwgl
{
    public partial class Xwfl_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11101", "0");

                DropDownListBind();

                //判断新增还是查看 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";
                    DelBtn.Visible = true;
                    SqlDataReader datar = SqlHelper.ExecuteReader("select flmc,flbz,glry from OA_XWFL where flid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        flmc.Text = datar["flmc"].ToString();
                        bz.Text = datar["flbz"].ToString();
                        glry.SelectedValue = datar["glry"].ToString();
                    }
                    else
                    {
                        mydb.Alert_Close("此记录不存在,可能已被删除！");
                    }
                    datar.Close();
                }
                else
                {
                    lbltitle.Text = "新增";
                    SaveAddBtn.Visible = true;
                }
            }
        }

        //dp绑定 
        public void DropDownListBind()
        {

            string sql_glry = "select ui_id,ui_desc from yh where ui_lx='企业' and ui_status='正常' order by ui_id";
            bd.Bind_DropDownList(glry, sql_glry, "ui_id", "ui_desc", "", "");

        }

        //保存 
        protected void Save_Click(object sender, EventArgs e)
        {
            if (lbltitle.Text == "新增")
            {
                SqlHelper.ExecuteSql("insert into OA_XWFL(flmc,glry,flbz,cjr,cjsj) values('" + hkdb.GetStr(flmc.Text) + "','" + glry.SelectedValue + "','" + hkdb.GetStr(bz.Text) + "','" + this.Session["userid"] + "',getdate())");
            }
            else
            {
                SqlHelper.ExecuteSql("update OA_XWFL set flmc='" + hkdb.GetStr(flmc.Text) + "',glry='" + glry.SelectedValue + "',flbz='" + hkdb.GetStr(bz.Text) + "' where flid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            }
            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                Clear_Click();
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Xwfl.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！", "Xwfl.aspx");
            }
        }

        //清空 
        protected void Clear_Click()
        {
            flmc.Text = "";
            bz.Text = "";
            glry.SelectedValue = "";
        }

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            int i = 0;
            i = (int)SqlHelper.ExecuteScalar("select count(*) from OA_XWNR where fl=" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "");
            if (i > 0)
            {
                mydb.Alert("删除失败,此分类已在新闻内容撰稿中使用！");
            }
            else
            {
                SqlHelper.ExecuteSql("delete from OA_XWFL where flid = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                mydb.Alert_Refresh_Close("删除成功！", "Xwfl.aspx");
            }
        }
    }
}
