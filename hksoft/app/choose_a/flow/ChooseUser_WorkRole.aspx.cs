using System;
using System.Collections;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.Choose_A.flow
{
    public partial class ChooseUser_WorkRole : System.Web.UI.Page
    {
        public string str, tqp, struser, strname, str1, strlist, str2, strlist2;
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("0");

            if (!IsPostBack)
            {
                rqstr.Text = Server.UrlDecode(Request.QueryString["rqstr"].ToString());
                str1 = "" + rqstr.Text + "";
                ArrayList myarr = new ArrayList();
                string[] mystr = str1.Split(',');
                for (int s = 0; s < mystr.Length; s++)
                {
                    strlist += "'" + mystr[s] + "',";
                }
                strlist += "'0'";

                str2 = "" + Server.UrlDecode(Request.QueryString["usernamestr"].ToString()) + "";
                ArrayList myarr2 = new ArrayList();
                string[] mystr2 = str2.Split(',');
                for (int s = 0; s < mystr2.Length; s++)
                {
                    strlist2 += "'" + mystr2[s] + "',";
                }
                strlist2 += "'0'";

                if (Request.QueryString["rqstr"] != null)
                {
                    if (strlist != "")
                    {
                        SqlDataReader datar = SqlHelper.ExecuteReader("SELECT ui_id,ui_desc FROM yh WHERE ui_id IN (" + strlist2 + ")");
                        while (datar.Read())
                        {
                            ListItem theItem = new ListItem();
                            theItem.Text = datar["ui_desc"].ToString();
                            theItem.Value = datar["ui_id"].ToString();
                            SelectedListBox.Items.Add(theItem);
                        }
                        datar.Close();
                    }
                }
                DataBindToDownList();
            }
        }

        public void DataBindToDownList()
        {
            SelectListBox.Items.Clear();

            SqlDataReader datar = SqlHelper.ExecuteReader("SELECT ui_id,ui_desc FROM yh WHERE ui_lx='企业' AND  ui_id NOT IN (" + strlist2 + ") AND ui_role IN (" + strlist + ")");
            while (datar.Read())
            {
                ListItem theItem = new ListItem();
                theItem.Text = datar["ui_desc"].ToString();
                theItem.Value = datar["ui_id"].ToString();
                SelectListBox.Items.Add(theItem);
            }
            datar.Close();
        }

        //全选
        protected void faBtn_Click(object sender, EventArgs e)
        {

            if (SelectListBox.Items.Count > 0)
            {
                foreach (ListItem MyItem in SelectListBox.Items)
                    SelectedListBox.Items.Add(MyItem);
                SelectListBox.Items.Clear();
            }
        }

        //单选
        protected void fsBtn_Click(object sender, EventArgs e)
        {
            int i = 0;

            while (i <= SelectListBox.Items.Count - 1)
            {

                if (SelectListBox.Items[i].Selected)
                {
                    if (SelectedListBox.Items.IndexOf(SelectListBox.Items[i]) >= 0)
                    {
                        this.Response.Write("<script language=javascript>alert('此项已经存在！');</script>");
                        return;
                    }

                    SelectedListBox.Items.Add(new ListItem(SelectListBox.Items[i].Text, SelectListBox.Items[i].Value));
                    SelectListBox.Items.Remove(SelectListBox.Items[i]);
                }
                else
                    i += 1;
            }
        }

        //单消
        protected void bsBtn_Click(object sender, EventArgs e)
        {
            int i = 0;
            while (i <= SelectedListBox.Items.Count - 1)
            {
                if (SelectedListBox.Items[i].Selected)
                {
                    SelectListBox.Items.Add(new ListItem(SelectedListBox.Items[i].Text, SelectedListBox.Items[i].Value));
                    SelectedListBox.Items.Remove(SelectedListBox.Items[i]);
                }
                else
                    i += 1;
            }
        }

        //全消
        protected void baBtn_Click(object sender, EventArgs e)
        {
            if (SelectedListBox.Items.Count > 0)
            {
                foreach (ListItem MyItem in SelectedListBox.Items)
                    SelectListBox.Items.Add(MyItem);
                SelectedListBox.Items.Clear();
            }
        }
    }
}
