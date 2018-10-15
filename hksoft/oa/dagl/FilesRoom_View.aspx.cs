using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.dagl
{
    public partial class FilesRoom_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11801", "0");

                BindAttr();

                //dp绑定
                DropDownListBind();

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM OA_FilesRoom WHERE ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        Number.Text = datar["Number"].ToString();
                        Name.Text = datar["Name"].ToString();
                        UnitName.SelectedValue = datar["UnitId"].ToString();
                        wfDept.Text = datar["QxUnitName"].ToString();
                        wfDeptIDs.Text = datar["QxUnitId"].ToString();
                        Remark.Text = datar["Remark"].ToString();
                        datar.Close();

                        DelBtn.Visible = true;
                    }
                    else
                    {
                        datar.Close();
                        mydb.Alert_Close("此记录不存在,可能已被删除！");
                    }
                }
                else
                {
                    lbltitle.Text = "新增";
                    SaveAddBtn.Visible = true;
                }
            }
        }

        public void BindAttr()
        {
            wfDept.Attributes.Add("readonly", "readonly");
        }

        //dp绑定 
        public void DropDownListBind()
        {
            //部门
            bd.Bind_DropDownList_bm(UnitName, "", "", "");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (lbltitle.Text == "新增")
            {
                SqlHelper.ExecuteSql("insert into oa_FilesRoom(Number,Name,UnitId,UnitName,QxUnitId,QxUnitName,Remark,Username,Realname) values ('" + hkdb.GetStr(Number.Text) + "','" + hkdb.GetStr(Name.Text) + "','" + UnitName.SelectedValue + "','" + UnitName.SelectedItem.Text + "','" + hkdb.GetStr(wfDeptIDs.Text) + "','" + hkdb.GetStr(wfDept.Text) + "','" + hkdb.GetStr(Remark.Text) + "','" + this.Session["UserID"] + "','" + this.Session["Username"] + "')");
            }
            else
            {
                SqlHelper.ExecuteSql("Update oa_FilesRoom Set Number='" + hkdb.GetStr(Number.Text) + "',Name='" + hkdb.GetStr(Name.Text) + "',UnitId='" + UnitName.SelectedValue + "',UnitName='" + UnitName.SelectedItem.Text + "' ,QxUnitId='" + hkdb.GetStr(wfDeptIDs.Text) + "',QxUnitName='" + hkdb.GetStr(wfDept.Text) + "',Remark='" + hkdb.GetStr(Remark.Text) + "' where id='" + int.Parse(Request.QueryString["id"]) + "'");
            }

            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                Clear_Click();
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "FilesRoom.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！","FilesRoom.aspx");
            }
        }

        //清空 
        protected void Clear_Click()
        {
            Number.Text = "";
            Name.Text = "";
            UnitName.SelectedValue = "";
            wfDeptIDs.Text = "";
            wfDept.Text = "";
            Remark.Text = "";
        }

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            string sql = "SELECT ID FROM OA_FilesManage WHERE RoomId='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'";
            if (bd.CheckRepeat(sql) == "true")
            {
                mydb.Alert("删除失败,此卷库下已存在案卷！");
                return;
            }

            SqlHelper.ExecuteSql("DELETE FROM OA_FilesRoom WHERE ID = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

            mydb.Alert_Refresh_Close("删除成功！","FilesRoom.aspx");
        }
    }
}
