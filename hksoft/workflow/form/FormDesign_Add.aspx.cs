using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.form
{
    public partial class FormDesign_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10907", "0");

                BindAttr();

                DropDownListBind();

                Random g = new Random();
                string rad = g.Next(10000).ToString();
                Number.Text = "" + System.DateTime.Now.Year.ToString() + "" + System.DateTime.Now.Month.ToString() + "" + System.DateTime.Now.Day.ToString() + "" + System.DateTime.Now.Hour.ToString() + "" + System.DateTime.Now.Minute.ToString() + "" + System.DateTime.Now.Second.ToString() + "" + System.DateTime.Now.Millisecond.ToString() + "" + rad + "";
            }

            BindList();
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");

            LBtn_Add.Attributes["onclick"] = "javascript:return AddColumn();";
            LBtn_Mod.Attributes["onclick"] = "javascript:return ModColumn();";
            LBtn_Del.Attributes["onclick"] = "javascript:return DelColumn();";
        }

        //表单类别 
        public void DropDownListBind()
        {
            string sql_FormType = "SELECT fcID,fcName FROM hk_FormClass";
            bd.Bind_DropDownList_NoBlank(FormType, sql_FormType, "fcID", "fcName", "", "");
        }

        public void BindList()
        {
            FormColumn.Items.Clear();

            string sql_FormColumn = "SELECT clNo,clName+clType AS clName FROM hk_FormColumn WHERE FK_fno='" + hkdb.GetStr(Number.Text) + "' ORDER BY clID asc";
            bd.Bind_DropDownList_NoBlank(FormColumn, sql_FormColumn, "clNo", "clName", "", "");

            ListItem Item = new ListItem();
            Item.Text = "常规表单字段";
            Item.Value = "" + System.DateTime.Now.Year.ToString() + "" + System.DateTime.Now.Month.ToString() + "" + System.DateTime.Now.Day.ToString() + "" + System.DateTime.Now.Hour.ToString() + "" + System.DateTime.Now.Minute.ToString() + "" + System.DateTime.Now.Second.ToString() + "" + System.DateTime.Now.Millisecond.ToString() + "";
            FormColumn.Items.Insert(0, Item);
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(FormName.Text))
            {
                SqlHelper.ExecuteSql("INSERT INTO hk_Form(fNo,FK_fcid,fName,fUserIDs,fUserNames,fContent,FK_uid,FK_did,fQxStr,FK_rid,AddTime) values ('" + hkdb.GetStr(Number.Text) + "','" + FormType.SelectedValue + "','" + hkdb.GetStr(FormName.Text) + "','" + UserID.Text + "','" + UserName.Text + "','" + hkdb.GetStrTeIn(editor.Value) + "','" + this.Session["userid"] + "','" + this.Session["deptid"] + "','" + this.Session["deptqx"] + "','" + this.Session["roleid"] + "',GETDATE())");
                mydb.Alert_Refresh_Close("保存成功！","FormDesign.aspx");
            }
            else
            {
                mydb.Alert("请输入表单名称！");
            }
        }
    }
}
