using System;
using haoke365;

namespace hkpro.workflow.form
{
    public partial class FormDesign_Add_cladd : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10907", "0");

                Random g = new Random();
                string rad = g.Next(10000).ToString();
                Number.Text = "" + System.DateTime.Now.Year.ToString() + "" + System.DateTime.Now.Month.ToString() + "" + System.DateTime.Now.Day.ToString() + "" + rad + "";
            }
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("INSERT INTO hk_FormColumn(FK_fno,clNo,clName,clType) values ('" + hkdb.GetStr(Request.QueryString["Number"]) + "','" + Number.Text + "','" + hkdb.GetStr(Name.Text) + "','" + Type.SelectedValue + "')");
            mydb.Alert_Close("保存成功！");
        }
    }
}
