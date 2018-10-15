using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Yjxsz_Mod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11305", "0");

                OperQx();

                BindAttr();

                //使用范围
                if (this.Session["systype"].ToString() == "A")     //主登录页
                {
                    SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT xh FROM hk_Init WHERE produID IN('M','V')");
                    if (datar1.Read())
                    {
                        lbllx.Visible = true;
                        lx.Visible = true;
                    }
                    datar1.Close();
                }
                else  //子登录页
                {
                    if (this.Session["systype"].ToString() == "M" | this.Session["systype"].ToString() == "V")
                    {
                        lbllx.Visible = true;
                        lx.Visible = true;
                    }
                }

                DropDownListBind();

                //dp绑定 
                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HK_YJX WHERE ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (datar.Read())
                {
                    mc.Text = datar["mc"].ToString();
                    gly.SelectedValue = datar["gly"].ToString();
                    bz.Text = datar["bz"].ToString();
                    lx.SelectedValue = datar["lx"].ToString();
                    UserID.Text = datar["UserIDs"].ToString();
                    UserName.Text = datar["UserNames"].ToString();
                    datar.Close();

                    if (lx.SelectedValue != "企业")
                    {
                        p_yhfw.Visible = false;
                    }
                }
                else
                {
                    datar.Close();
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }
            }
        }

        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(SaveBtn, "11305m", Session["roleqx"].ToString());
            hkdb.QxValid(DelBtn, "11305d", Session["roleqx"].ToString());
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");
        }

        //dp绑定 
        public void DropDownListBind()
        {
            string sql = "SELECT UI_ID,UI_DESC FROM YH WHERE UI_LX='企业' AND UI_STATUS='正常'";
            bd.Bind_DropDownList(gly, sql, "UI_ID", "UI_DESC", "", "");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE HK_YJX SET mc='" + hkdb.GetStr(mc.Text) + "',gly='" + gly.SelectedValue + "',UserIDs='" + hkdb.GetStr(UserID.Text) + "',UserNames='" + hkdb.GetStr(UserName.Text) + "',bz='" + hkdb.GetStr(bz.Text) + "',lx='" + lx.SelectedValue + "' WHERE ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

            mydb.Alert_Refresh_Close("保存成功！","Yjxsz.aspx");
        }

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            string sql = "SELECT * FROM hk_WDYJ WHERE YJX='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'";
            if (bd.CheckRepeat(sql) == "true")
            {
                mydb.Alert("删除失败,该意见箱下已有意见信息！");
                return;
            }

            SqlHelper.ExecuteSql("DELETE FROM hk_YJX WHERE id = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

            //日志
            mydb.InsertLog("删除意见箱【" + mc.Text + "】", "11305");

            mydb.Alert_Refresh_Close("删除成功！","Yjxsz.aspx");
        }

        protected void lx_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (lx.SelectedValue != "企业")
            {
                p_yhfw.Visible = false;
                UserID.Text = "";
                UserName.Text = "";
            }
            else
            {
                p_yhfw.Visible = true;
            }
        }
    }
}
