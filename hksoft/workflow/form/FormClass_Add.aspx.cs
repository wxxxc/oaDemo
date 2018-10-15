using System;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.form
{
    public partial class FormClass_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10906", "0");
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("INSERT INTO hk_FormClass(fcName,fcRemark) values('" + hkdb.GetStr(fcName.Text) + "','" + hkdb.GetStr(fcRemark.Text) + "')");

            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                Clear();
                mydb.Alert("保存成功,请新增下一条记录！");
            }
            else
            {
                mydb.Alert_Goto("保存成功！", "FormClass.aspx");
            }
        }

        //清空 
        public void Clear()
        {
            fcName.Text = "";
            fcRemark.Text = "";
        }
    }
}
