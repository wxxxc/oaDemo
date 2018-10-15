using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jhgl
{
    public partial class Gzx_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10201,10110", "0");

                IDlabel.Text = Request.QueryString["id"];
                BindAttr();
            }
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;

            SqlHelper.ExecuteSql("insert into OA_GZJH02(jhid,gzzt,gznr,jhkssj,jhwcsj,cyz,yqjg) values('" + hkdb.GetStr(IDlabel.Text) + "','" + hkdb.GetStr(gzzt.Text) + "','" + hkdb.GetStr(gznr.Text) + "','" + hkdb.GetStr(jhkssj.Text) + "','" + hkdb.GetStr(jhwcsj.Text) + "','" + UserID.Text.TrimEnd(',') + "','" + hkdb.GetStr(yqjg.Text) + "')");
            if (s == "SaveAddBtn")
            {
                gzzt.Text = "";
                gznr.Text = "";
                jhkssj.Text = "";
                jhwcsj.Text = "";
                yqjg.Text = "";
                UserID.Text = "";
                UserName.Text = "";

                if (Request.QueryString["type"].ToString() == "m")//修改页面
                {
                    mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Wdjh_Mod.aspx?id=" + hkdb.GetStr(Request.QueryString["id"]) + "");
                }
                else if (Request.QueryString["type"].ToString() == "a")//新增页面
                {
                    mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Wdjh_Add.aspx?id=" + hkdb.GetStr(Request.QueryString["id"]) + "");
                }

            }
            else
            {
                if (Request.QueryString["type"].ToString() == "m")//修改页面
                {
                    mydb.Alert_Refresh_Close("保存成功！","Wdjh_Mod.aspx?id=" + hkdb.GetStr(Request.QueryString["id"]) + "");
                }
                else//新增页面
                {
                    mydb.Alert_Refresh_Close("保存成功！","Wdjh_Add.aspx?id=" + hkdb.GetStr(Request.QueryString["id"]) + "");
                }
            }
        }

        //清空 
        protected void Clear_Click(object sender, EventArgs e)
        {
            gzzt.Text = "";
            gznr.Text = "";
            jhkssj.Text = "";
            jhwcsj.Text = "";
            yqjg.Text = "";
            UserID.Text = "";
            UserName.Text = "";
        }
    }
}
