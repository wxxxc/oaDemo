using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.tpgl
{
    public partial class Tmsz_r : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11307", "0");

                panel1.Height = 400;

                BindGridP1();
                BindGridP2();

                panel2.Visible = false;
                panel1.Visible = true;
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["ClassID"]))
            {
                if (!string.IsNullOrEmpty(name.Text))
                {
                    SqlHelper.ExecuteSql("INSERT INTO HK_POLL_SUBJECT(SSID,SUBJECTNAME,CJR,CJSJ) VALUES('" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "','" + hkdb.GetStr(name.Text) + "','" + this.Session["userid"] + "',GETDATE())");

                    BindGridP1();

                    name.Text = "";

                    mydb.Alert_Close("保存成功！");
                }
                else
                {
                    mydb.Alert_Close("请输入题目名称！");
                }
            }
            else
            {
                mydb.Alert_Close("请先选择调查项目，如无调查项目请在[设定项目]中新增项目！");
            }

        }

        protected void Save2_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(xxname.Text))
            {
                SqlHelper.ExecuteSql("INSERT INTO HK_POLL_KEY(SUBID,KEYNAME,KEYTYPE,CJR,CJSJ) VALUES('" + hkdb.GetStr(codelbl.Text) + "','" + hkdb.GetStr(xxname.Text) + "','" + ttype.SelectedItem.Value + "','" + this.Session["userid"] + "',GETDATE())");

                BindGridP2();

                xxname.Text = "";

                mydb.Alert_Close("保存成功！");
            }
            else
            {
                mydb.Alert_Close("请输入选项名称！");
            }
        }

        public void BindGridP1()
        {
            //为Panel1的数据 
            DataSet ds1 = SqlHelper.ExecuteDs("SELECT * FROM HK_POLL_SUBJECT WHERE SSID='" + Request.QueryString["id"] + "' ORDER BY SSID");
            DataGrid1.DataSource = ds1;
            DataGrid1.DataBind();
        }

        public void BindGridP2()
        {
            //为Panel2的数据 
            DataSet ds2 = SqlHelper.ExecuteDs("SELECT * FROM HK_POLL_KEY WHERE SUBID='" + codelbl.Text + "' ORDER BY KEYID");
            DataGrid2.DataSource = ds2;
            DataGrid2.DataBind();
        }

        protected void Grid1_Mod(object Sender, DataGridCommandEventArgs E)
        {
            string codestr = E.Item.Cells[1].Text;
            string namestr = E.Item.Cells[2].Text;
            codelbl.Text = codestr;
            NameStrLabel.Text = namestr;
            if ((E.CommandName == "editoption"))
            {
                panel1.Visible = false;
                panel2.Visible = true;
                BindGridP2();
            }
            else
            {
                if ((E.CommandName == "Delete"))
                {
                    SqlHelper.ExecuteSql("DELETE FROM HK_POLL_SUBJECT WHERE SUBID=" + codestr);
                    SqlHelper.ExecuteSql("DELETE FROM HK_POLL_KEY WHERE SUBID NOT IN (SELECT SUBID FROM HK_POLL_SUBJECT)");
                    SqlHelper.ExecuteSql("DELETE FROM HK_POLL_DETAIL WHERE KEYID NOT IN (SELECT KEYID FROM HK_POLL_KEY)");
                    BindGridP1();
                }
            }
        }

        protected void Grid1_Update(object Sender, DataGridCommandEventArgs E)
        {
            string NameStr = ((TextBox)E.Item.Cells[2].Controls[0]).Text;
            NameStrLabel.Text = NameStr;
            string CodeStr = E.Item.Cells[1].Text;
            codelbl.Text = CodeStr;
            SqlHelper.ExecuteSql("UPDATE HK_POLL_SUBJECT SET SUBJECTNAME='" + NameStr + "' WHERE SUBID=" + CodeStr);
            DataGrid1.EditItemIndex = -1;
            BindGridP1();
        }

        protected void Grid1_Cancel(object Sender, DataGridCommandEventArgs E)
        {
            DataGrid1.EditItemIndex = -1;
            BindGridP1();
        }

        protected void Grid1_Edit(object Sender, DataGridCommandEventArgs E)
        {
            DataGrid1.EditItemIndex = E.Item.ItemIndex;
            BindGridP1();
        }

        protected void Grid1_PageIndexChanged(object Sender, DataGridPageChangedEventArgs E)
        {
            DataGrid1.CurrentPageIndex = E.NewPageIndex;
            BindGridP1();
        }

        protected void Ret_Click(object sender, EventArgs e)
        {
            panel2.Visible = false;
            panel1.Visible = true;
            BindGridP1();
        }

        protected void Grid2_Mod(object Sender, DataGridCommandEventArgs E)
        {
            string codestr = E.Item.Cells[1].Text;
            string namestr = E.Item.Cells[2].Text;
            if ((E.CommandName == "Delete"))
            {
                SqlHelper.ExecuteSql("DELETE FROM HK_POLL_KEY WHERE KEYID=" + codestr);
                SqlHelper.ExecuteSql("DELETE FROM HK_POLL_DETAIL WHERE KEYID NOT IN (SELECT KEYID FROM HK_POLL_KEY)");
                BindGridP2();
            }
        }

        protected void Grid2_Update(object Sender, DataGridCommandEventArgs E)
        {
            string NameStr = ((TextBox)E.Item.Cells[2].Controls[0]).Text;
            string CodeStr = E.Item.Cells[1].Text;
            SqlHelper.ExecuteSql("UPDATE HK_POLL_KEY SET KEYNAME='" + NameStr + "' WHERE KEYID=" + CodeStr);
            DataGrid2.EditItemIndex = -1;
            BindGridP2();
        }

        protected void Grid2_Cancel(object Sender, DataGridCommandEventArgs E)
        {
            DataGrid2.EditItemIndex = -1;
            BindGridP2();
        }

        protected void Grid2_Edit(object Sender, DataGridCommandEventArgs E)
        {
            DataGrid2.EditItemIndex = E.Item.ItemIndex;
            BindGridP2();
        }

        protected void dg_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Footer & e.Item.ItemType != ListItemType.Header)
            {
                e.Item.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}