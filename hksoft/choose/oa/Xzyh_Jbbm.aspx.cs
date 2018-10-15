using System;
using System.Collections;
using System.Web.UI.WebControls;
using haoke365;

namespace hksoft.choose.oa
{
    public partial class Xzyh_Jbbm : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public string str, tqp, struser, strname, str1, strlist, str2, strlist2;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                requeststr.Text = Server.UrlDecode(Request.QueryString["requeststr"].ToString());

                str1 = "" + requeststr.Text + "";
                ArrayList myarr = new ArrayList();
                string[] mystr = str1.Split(',');
                for (int s = 0; s < mystr.Length; s++)
                {
                    strlist += "'" + mystr[s] + "',";
                }
                strlist += "'0'";

                str2 = "" + Server.UrlDecode(Request.QueryString["usernamestr"].ToString()) + "";
                //Response.Write(str2);
                ArrayList myarr2 = new ArrayList();
                string[] mystr2 = str2.Split(',');
                for (int s = 0; s < mystr2.Length; s++)
                {
                    strlist2 += "'" + mystr2[s] + "',";
                }
                strlist2 += "'0'";

                if (Request.QueryString["requeststr"] != null)
                {
                    if (strlist != "")
                    {
                        string sql_down1 = "select * from yh where ui_id in (" + strlist2 + ")";
                        //Response.Write(sql_down1);

                        bd.Bind_ListBox(TargetListBox, sql_down1, "ui_id", "ui_desc");
                    }
                }

                DataBindToDownList();
            }
        }

        public void DataBindToDownList()
        {
            string sql_down1 = "select * from yh where ui_id not in (" + strlist2 + ") and ui_ssbm in (" + strlist + ")";
            bd.Bind_ListBox(SourceListBox, sql_down1, "ui_id", "ui_desc");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            if (SourceListBox.Items.Count > 0)
            {
                foreach (ListItem MyItem in SourceListBox.Items)
                    TargetListBox.Items.Add(MyItem);
                SourceListBox.Items.Clear();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int i = 0;
            while (i <= SourceListBox.Items.Count - 1)
            {
                if (SourceListBox.Items[i].Selected)
                {
                    if (TargetListBox.Items.IndexOf(SourceListBox.Items[i]) >= 0)
                    {
                        mydb.Alert("此项已经存在！");
                        return;
                    }
                    TargetListBox.Items.Add(new ListItem(SourceListBox.Items[i].Text, SourceListBox.Items[i].Value));
                    SourceListBox.Items.Remove(SourceListBox.Items[i]);
                }
                else
                    i += 1;
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            int i = 0;

            while (i <= TargetListBox.Items.Count - 1)
            {
                if (TargetListBox.Items[i].Selected)
                {
                    SourceListBox.Items.Add(new ListItem(TargetListBox.Items[i].Text, TargetListBox.Items[i].Value));
                    TargetListBox.Items.Remove(TargetListBox.Items[i]);
                }
                else
                    i += 1;
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            if (TargetListBox.Items.Count > 0)
            {
                foreach (ListItem MyItem in TargetListBox.Items)
                    SourceListBox.Items.Add(MyItem);

                TargetListBox.Items.Clear();
            }
        }
    }
}