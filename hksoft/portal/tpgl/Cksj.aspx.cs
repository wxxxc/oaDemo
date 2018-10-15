using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.tpgl
{
    public partial class Cksj : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public int k,j,projid;
        public string strsubname,str1,str2,theid;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11308", "11308");
            }

            theid = Request.QueryString["id"];

            //类型
            if (this.Session["systype"].ToString() == "A")     //主登录页
            {
                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT xh FROM hk_Init WHERE produID IN('M','V','F')");
                if (datar1.Read())
                {
                    qhlx.Visible = true;
                    lxnr.Visible = true;
                }
                datar1.Close();
            }
            else  //子登录页
            {
                if (this.Session["systype"].ToString() == "M" | this.Session["systype"].ToString() == "V" | this.Session["systype"].ToString() == "F")
                {
                    qhlx.Visible = true;
                    lxnr.Visible = true;
                }
            }

            //页面绑定 
            GridViewBind();

        }

        public void GridViewBind()
        {
            SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HK_POLL_PROJECT WHERE PROJECTTAG='1' AND PROJECTTYPE='" + qhlx.SelectedValue + "'");
            if (datar.Read())
            {
                projid = Convert.ToInt32(datar["id"]);
                place1.Controls.Add(new LiteralControl("<table class='table_1' cellspacing='1' id='table1' cellpadding='1' width='60%' align='center'>"));
                place1.Controls.Add(new LiteralControl("<tr class='tr2'><td align=center><b><font color=blue>《" + datar["ProjectName"].ToString() + "》</font></b></td></tr>"));
            }
            else
            {
                Response.Write("<br>");
                Response.Write("<p align=center><font color='red'>尚未设置任何调查项目！</font></p>");
                datar.Close();
                Response.End();
            }
            datar.Close();

            SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT ID,VOTETIME,YHID FROM HK_POLL_DATA WHERE PROJECTID='" + projid + "' ORDER BY ID");
            k = 1;
            while (datar1.Read())
            {
                if (k == 1)
                {
                    place1.Controls.Add(new LiteralControl("<tr class='tr2'><td align=center>"));
                }
                place1.Controls.Add(new LiteralControl("[<a href='dcjg.aspx?lx=" + qhlx.SelectedValue + "&id=" + datar1["id"].ToString() + "' title='" + datar1["votetime"].ToString() + "'>" + k + "</a>]&nbsp;"));
                k = k + 1;
            }
            datar1.Close();

            if (k == 1)
            {
                place1.Controls.Add(new LiteralControl("<tr class='tr2'><td align=center>暂时没有调查数据</td></tr>"));
            }
            else
            {
                place1.Controls.Add(new LiteralControl("</td></tr>"));
            }

            if (string.IsNullOrEmpty(theid))
            {
                place1.Controls.Add(new LiteralControl("</table>"));
            }
            else
            {
                k = 0;

                SqlHelper.ExecuteSql("SELECT * INTO TEMPLS FROM HK_POLL_DETAIL WHERE VOTEID=" + hkdb.GetStr(theid));
                SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT PROJECTNAME,HK_POLL_SUBJECT.SUBID,SUBJECTNAME,HK_POLL_KEY.KEYID,KEYNAME,KEYTYPE,VOTETIME,YHID,RESULT,UI_DESC FROM ((((HK_POLL_SUBJECT INNER JOIN HK_POLL_PROJECT ON HK_POLL_SUBJECT.SSID=HK_POLL_PROJECT.ID) INNER JOIN HK_POLL_KEY ON HK_POLL_SUBJECT.SUBID=HK_POLL_KEY.SUBID) INNER JOIN HK_POLL_DATA ON HK_POLL_DATA.PROJECTID=HK_POLL_PROJECT.ID) LEFT JOIN YH ON HK_POLL_DATA.YHID=YH.UI_ID LEFT JOIN TEMPLS ON TEMPLS.KEYID=HK_POLL_KEY.KEYID) WHERE HK_POLL_DATA.ID=" + hkdb.GetStr(theid) + " ORDER BY HK_POLL_SUBJECT.SUBID,HK_POLL_KEY.KEYID");
                while (datar2.Read())
                {
                    if (k == 0)
                    {
                        place1.Controls.Add(new LiteralControl("<tr class='tr2'><td>投票时间：<b><font color=blue>" + string.Format("{0:yyyy-MM-dd}", datar2["votetime"].ToString()) + "</font></b>"));
                        place1.Controls.Add(new LiteralControl("&nbsp;&nbsp;&nbsp;&nbsp;投票人：<b><font color=blue>" + datar2["ui_desc"].ToString() + "</font></b></td></tr>"));
                        place1.Controls.Add(new LiteralControl("<tr class='tr1'><td><b>1、" + datar2["SubjectName"].ToString() + "</td></tr>"));
                        place1.Controls.Add(new LiteralControl("<tr class='tr2'><td>"));
                        strsubname = datar2["SubjectName"].ToString();
                        j = 2;
                    }

                    if (strsubname != datar2["SubjectName"].ToString())
                    {
                        if (k != 0)
                        {
                            place1.Controls.Add(new LiteralControl("</td></tr>"));
                        }
                        place1.Controls.Add(new LiteralControl("<tr class='tr1'><td><b>" + Convert.ToString(j) + "、" + datar2["SubjectName"].ToString() + "</td></tr>"));
                        place1.Controls.Add(new LiteralControl("<tr class='tr2'><td>"));
                        j = j + 1;
                        strsubname = datar2["SubjectName"].ToString();
                    }

                    switch (datar2["keytype"].ToString())
                    {
                        case "文本":
                            str1 = "txt" + datar2["keyid"].ToString();
                            place1.Controls.Add(new LiteralControl("&nbsp;&nbsp;&nbsp;&nbsp;"));
                            TextBox T = new TextBox();
                            T.ID = str1;
                            if (datar2["result"] == System.DBNull.Value == false)
                            {
                                T.Text = datar2["result"].ToString();
                            }

                            T.Enabled = false;
                            place1.Controls.Add(T);
                            place1.Controls.Add(new LiteralControl("<br>"));
                            break;
                        case "单选":
                            str1 = "rad" + datar2["keyid"].ToString();
                            str2 = "group" + Convert.ToString(j);
                            place1.Controls.Add(new LiteralControl("&nbsp;&nbsp;&nbsp;&nbsp;"));
                            RadioButton R = new RadioButton();
                            R.Text = datar2["keyname"].ToString();
                            R.ID = str1;
                            if (datar2["result"] == System.DBNull.Value == false)
                            {
                                R.Checked = true;
                            }

                            R.Enabled = false;
                            R.GroupName = str2;
                            place1.Controls.Add(R);
                            place1.Controls.Add(new LiteralControl("<br>"));
                            break;
                        case "多选":
                            str1 = "chk" + datar2["keyid"].ToString();
                            place1.Controls.Add(new LiteralControl("&nbsp;&nbsp;&nbsp;&nbsp;"));
                            CheckBox C = new CheckBox();
                            C.ID = str1;
                            if (datar2["result"] == System.DBNull.Value == false)
                            {
                                C.Checked = true;
                            }

                            C.Text = datar2["keyname"].ToString();
                            place1.Controls.Add(C);
                            place1.Controls.Add(new LiteralControl("<br>"));
                            break;
                    }
                    k = k + 1;
                }
                datar2.Close();

                SqlHelper.ExecuteSql("DROP TABLE TEMPLS");
                if (k != 0)
                {
                    place1.Controls.Add(new LiteralControl("</td></tr></table>"));
                }
                else
                {
                    place1.Controls.Add(new LiteralControl("</table>"));
                }
            }
        }

        protected void qhlx_SelectedIndexChanged(object sender, EventArgs e)
        {
            place1.Controls.Clear();
            GridViewBind();
        }
    }
}
