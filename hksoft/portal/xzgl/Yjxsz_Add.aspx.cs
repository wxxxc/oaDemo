using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Yjxsz_Add : System.Web.UI.Page
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

                //dp绑定 
                DropDownListBind();
            }
        }

        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(SaveAddBtn, "11305a", Session["roleqx"].ToString());
            hkdb.QxValid(SaveBtn, "11305a", Session["roleqx"].ToString());
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
            Button btn = (Button)sender;
            string s = btn.ID;

            SqlHelper.ExecuteSql("INSERT INTO HK_YJX(MC,LX,ZT,GLY,UserIDs,UserNames,BZ,CJR,CJSJ) VALUES('" + hkdb.GetStr(mc.Text) + "','" + lx.SelectedValue + "','正常','" + gly.SelectedValue + "','" + hkdb.GetStr(UserID.Text) + "','" + hkdb.GetStr(UserName.Text) + "','" + hkdb.GetStr(bz.Text) + "','" + this.Session["userid"] + "',GETDATE())");
            //判断btn 
            if (s == "SaveAddBtn")
            {
                mc.Text = "";
                gly.SelectedValue = "";
                bz.Text = "";
                UserID.Text = "";
                UserName.Text = "";

                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Yjxsz.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！","Yjxsz.aspx");
            }
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            mc.Text = "";
            gly.SelectedValue = "";
            bz.Text = "";
            UserID.Text = "";
            UserName.Text = "";
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
