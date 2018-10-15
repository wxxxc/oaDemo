using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.form
{
    public partial class FormDesign_Mod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10907", "0");

                DropDownListBind();

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_Form WHERE fID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (dr.Read())
                {
                    editor.Value = hkdb.GetStrTeOut(dr["fContent"].ToString());
                    FormType.SelectedValue = dr["FK_fcid"].ToString();
                    FormName.Text = dr["fName"].ToString();
                    UserID.Text = dr["fUserIDs"].ToString();
                    UserName.Text = dr["fUserNames"].ToString();
                    Number.Text = dr["fNo"].ToString();
                }
                dr.Close();

                BindAttr();
            }

            BindList();
        }

        //dp绑定 
        public void DropDownListBind()
        {
            string sql_FormType = "SELECT fcID,fcName FROM hk_FormClass";
            bd.Bind_DropDownList_NoBlank(FormType, sql_FormType, "fcID", "fcName", "", "");
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");

            LBtn_Add.Attributes["onclick"] = "javascript:return AddColumn();";
            LBtn_Mod.Attributes["onclick"] = "javascript:return ModColumn();";
            LBtn_Del.Attributes["onclick"] = "javascript:return DelColumn();";
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
                SqlHelper.ExecuteSql("UPDATE hk_Form SET FK_fcid='" + FormType.SelectedValue + "',fName='" + hkdb.GetStr(FormName.Text) + "',fContent='" + hkdb.GetStrTeIn(editor.Value) + "' ,fUserIDs='" + hkdb.GetStr(UserID.Text) + "' ,fUserNames='" + hkdb.GetStr(UserName.Text) + "' WHERE fID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                mydb.Alert_Refresh_Close("保存成功！","FormDesign.aspx");
            }
            else
            {
                mydb.Alert("请输入表单名称！");
            }
        }
    }
}
