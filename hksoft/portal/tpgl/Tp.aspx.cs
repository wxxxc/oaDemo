using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.tpgl
{
    public partial class Tp : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        int k,j;
        string strsubname,str1,str2;
        static int ProjID;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            k = 0;
            SqlDataReader datar = SqlHelper.ExecuteReader("SELECT HK_POLL_PROJECT.ID,PROJECTNAME,HK_POLL_SUBJECT.SUBID,SUBJECTNAME,HK_POLL_KEY.KEYID,KEYNAME,KEYTYPE FROM HK_POLL_SUBJECT,HK_POLL_PROJECT,HK_POLL_KEY WHERE SSID=HK_POLL_PROJECT.ID AND HK_POLL_SUBJECT.SUBID=HK_POLL_KEY.SUBID AND PROJECTTAG='1' AND PROJECTTYPE='企业' ORDER BY HK_POLL_SUBJECT.SUBID,KEYID");
            while (datar.Read())
            {
                xmname.Text = (datar["ProjectName"].ToString());
                if (k == 0)
                {
                    Repeater1.Controls.Add(new LiteralControl("<table class='table_1' cellspacing='1' id='table1' cellpadding='1' width='60%' align='center'>"));
                    Repeater1.Controls.Add(new LiteralControl("<tr class='tr2'><td align=center></td></tr>"));
                    Repeater1.Controls.Add(new LiteralControl("<tr class='tr1'><td ><b>1、" + datar["SubjectName"].ToString() + "</td></tr>"));
                    Repeater1.Controls.Add(new LiteralControl("<tr class='tr2'><td>"));
                    strsubname = datar["SubjectName"].ToString();
                    ProjID = (int)datar["id"];
                    j = 2;
                }

                if (strsubname != datar["SubjectName"].ToString())
                {
                    SaveBtn.Enabled = true;
                    if (k != 0)
                    {
                        Repeater1.Controls.Add(new LiteralControl("</td></tr>"));
                    }
                    Repeater1.Controls.Add(new LiteralControl("<tr class='tr1'><td><b>" + Convert.ToInt32(j) + "、" + datar["SubjectName"].ToString() + "</td></tr>"));
                    Repeater1.Controls.Add(new LiteralControl("<tr class='tr2'><td>"));
                    j = j + 1;
                    strsubname = datar["SubjectName"].ToString();
                }

                switch (datar["keytype"].ToString())
                {
                    case "文本":
                        str1 = "txt" + (datar["keyid"]);
                        Repeater1.Controls.Add(new LiteralControl("&nbsp;&nbsp;&nbsp;&nbsp;"));
                        TextBox T = new TextBox();
                        T.ID = str1;
                        Repeater1.Controls.Add(T);
                        Repeater1.Controls.Add(new LiteralControl("<br>"));
                        break;
                    case "单选":
                        str1 = "rad" + datar["keyid"];
                        str2 = "group" + j;
                        Repeater1.Controls.Add(new LiteralControl("&nbsp;&nbsp;&nbsp;&nbsp;"));
                        RadioButton R = new RadioButton();
                        R.Text = datar["keyname"].ToString();
                        R.ID = str1;
                        R.GroupName = str2;
                        Repeater1.Controls.Add(R);
                        Repeater1.Controls.Add(new LiteralControl("<br>"));
                        break;
                    case "多选":
                        str1 = "chk" + datar["keyid"];
                        Repeater1.Controls.Add(new LiteralControl("&nbsp;&nbsp;&nbsp;&nbsp;"));
                        CheckBox C = new CheckBox();
                        C.ID = str1;
                        C.Text = datar["keyname"].ToString();
                        Repeater1.Controls.Add(C);
                        Repeater1.Controls.Add(new LiteralControl("<br>"));
                        break;
                }
                k = k + 1;
            }
            datar.Close();

            if (k != 0)
            {
                Repeater1.Controls.Add(new LiteralControl("</td></tr></table>"));
            }
            else
            {
                Response.Write("<br>");
                Response.Write("<p align=center><font color=red>尚未设置任何调查项目！</font></p>");
                Response.End();
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int i = 0;
            //  Control ctr = default(Control);
            int thecode = 0;
            string ttype = null;
            int thekey = 0;

            i = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) AS NUMS FROM HK_POLL_DATA WHERE PROJECTID=" + ProjID + " AND YHID='" + this.Session["userid"] + "'");
            if (i != 0)
            {
                mydb.Alert("投票失败,您在此项目上已经投过一票，不能再重复投票！");
                SaveBtn.Enabled = false;
            }
            else
            {
                SqlHelper.ExecuteSql("INSERT INTO HK_POLL_DATA(PROJECTID,VOTETIME,YHID,YHNAME) VALUES(" + ProjID + ",GETDATE(),'" + this.Session["userid"] + "','" + this.Session["username"] + "')");
                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HK_POLL_DATA ORDER BY ID DESC");
                if (datar.Read())
                {
                    thecode = (int)datar["id"];
                }
                datar.Close();

                foreach (Control ctr in Repeater1.Controls)
                {
                    switch (ctr.GetType().ToString())
                    {
                        case "System.Web.UI.WebControls.RadioButton":
                            ttype = "1";
                            if (((RadioButton)ctr).Checked)
                            {
                                //Mid(ctr.ID, 4);
                                thekey = int.Parse(ctr.ID.Substring(3));
                                SqlHelper.ExecuteSql("INSERT INTO HK_POLL_DETAIL(VOTEID,KEYID,RESULT) VALUES(" + thecode + "," + thekey + ",'" + ttype + "')");
                            }

                            break;
                        case "System.Web.UI.WebControls.TextBox":
                            if (!string.IsNullOrEmpty(((TextBox)ctr).Text))
                            {
                                //thekey = (int)Strings.Mid(ctr.ID, 4);
                                thekey = int.Parse(ctr.ID.Substring(3));
                                SqlHelper.ExecuteSql("INSERT INTO HK_POLL_DETAIL(VOTEID,KEYID,RESULT) VALUES(" + thecode + "," + thekey + ",'" + ((TextBox)ctr).Text + "')");
                            }

                            break;
                        case "System.Web.UI.WebControls.CheckBox":
                            ttype = "2";
                            if (((CheckBox)ctr).Checked)
                            {
                                thekey = int.Parse(ctr.ID.Substring(3));
                                SqlHelper.ExecuteSql("INSERT INTO HK_POLL_DETAIL(VOTEID,KEYID,RESULT) VALUES(" + thecode + "," + thekey + ",'" + ttype + "')");
                            }

                            break;
                    }
                }

                SaveBtn.Enabled = false;
                mydb.Alert_Goto("投票成功！", "../../initmain.aspx");
            }
        }
    }
}
