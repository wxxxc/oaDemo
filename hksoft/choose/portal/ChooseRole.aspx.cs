using System;
using System.Collections;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.Choose.portal
{
    public partial class ChooseRole : System.Web.UI.Page
    {
        public string str, tqp, struser, strname, str1, strlist;
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("2");

            if (!IsPostBack)
            {
                DataBindToDownList();
                rqstr.Text = Server.UrlDecode(Request.QueryString["rqstr"].ToString());

                str1 = "" + rqstr.Text + "";
                ArrayList myarr = new ArrayList();
                string[] mystr = str1.Split(',');
                for (int s = 0; s < mystr.Length; s++)
                {
                    strlist += "'" + mystr[s] + "',";
                }
                strlist += "'0'";

                if (Request.QueryString["rqstr"] != null)
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT role_id,role_name FROM JS WHERE role_id IN (" + strlist + ")");
                    while (datar.Read())
                    {
                        ListItem theItem = new ListItem();
                        theItem.Text = datar["role_name"].ToString();
                        theItem.Value = datar["role_id"].ToString();
                        SelectedListBox.Items.Add(theItem);
                    }
                    datar.Close();
                }
            }
        }

        //角色
        public void DataBindToDownList()
        {
            SelectListBox.Items.Clear();

            SqlDataReader datar = SqlHelper.ExecuteReader("SELECT role_id,role_name FROM JS");
            while (datar.Read())
            {
                ListItem theItem = new ListItem();
                theItem.Text = datar["role_name"].ToString();
                theItem.Value = datar["role_id"].ToString();
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
                        mydb.Alert("此项已经存在！");
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
