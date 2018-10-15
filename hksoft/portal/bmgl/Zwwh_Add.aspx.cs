using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.bmgl
{
    public partial class Zwwh_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("60303", "0");

                OperQx();
            }
        }

        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(SaveAddBtn, "60303a", Session["roleqx"].ToString());
            hkdb.QxValid(SaveBtn, "60303a", Session["roleqx"].ToString());
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("INSERT INTO ZW(ZWMC,ZWMS,GWZZ,JDR,JDSJ) VALUES('" + hkdb.GetStr(zwmc.Text) + "','" + hkdb.GetStr(zwms.Text) + "','" + editor.Value + "','" + this.Session["userid"] + "',GETDATE())");

            //日志
            mydb.InsertLog("新增职位【" + hkdb.GetStr(zwmc.Text) + "】", "60303");

            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                Clear_Click();
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "zwwh.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！","zwwh.aspx");
            }
        }

        //清空 
        protected void Clear_Click()
        {
            zwmc.Text = "";
            zwms.Text = "";
            editor.Value = "";
        }
    }
}
