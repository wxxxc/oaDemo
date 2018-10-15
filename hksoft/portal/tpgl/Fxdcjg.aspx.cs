using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.portal.tpgl
{
    public partial class Fxdcjg : System.Web.UI.Page
    {
        int k,j;
        string strSubjectName;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["userid"] == null)
            {
                Response.Write("<br>&nbsp;<img src=images/clock.gif></img><font size=2pt color=red>对不起，系统已超时，请 <a href=Default.aspx target=_parent>重新登录</a> ！</font>");
                Response.End();
            }

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
            k = 0;

            SqlDataReader datar = SqlHelper.ExecuteReader("SELECT PROJECTNAME,HK_POLL_SUBJECT.SUBID,SUBJECTNAME,KEYID,KEYNAME,KEYTYPE,(SELECT COUNT(*) FROM HK_POLL_DETAIL WHERE HK_POLL_DETAIL.KEYID=HK_POLL_KEY.KEYID) AS NUM,(SELECT COUNT(*) FROM HK_POLL_DATA WHERE HK_POLL_DATA.PROJECTID= HK_POLL_PROJECT.ID) AS TPNUM FROM HK_POLL_SUBJECT,HK_POLL_PROJECT,HK_POLL_KEY WHERE SSID=HK_POLL_PROJECT.ID AND HK_POLL_SUBJECT.SUBID=HK_POLL_KEY.SUBID AND PROJECTTAG='1' AND PROJECTTYPE='" + qhlx.SelectedValue + "' ORDER BY HK_POLL_SUBJECT.SUBID,KEYID");
            while (datar.Read())
            {
                if (Convert.ToInt32(datar["tpnum"]) == 0)
                {
                    place1.Controls.Add(new LiteralControl("<p align=center><font color=red>没有该调查项目的投票记录！</font></p>"));
                    return;
                }

                if (k == 0)
                {
                    place1.Controls.Add(new LiteralControl("<table class='table_1' cellspacing='1' id='table1' cellpadding='1' width='60%' align='center'>"));
                    place1.Controls.Add(new LiteralControl("<tr class='tr2'><td align=center><b><font color=blue>" + datar["ProjectName"].ToString() + "</font></b></td></tr>"));
                    place1.Controls.Add(new LiteralControl("<tr class='tr2'><td align=center>总票数：<b><font color='red'>" + datar["tpnum"].ToString() + "</font></b></td></tr>"));
                    place1.Controls.Add(new LiteralControl("<tr class='tr1'><td><b>1、" + datar["SubjectName"].ToString() + "</td></tr>"));
                    place1.Controls.Add(new LiteralControl("<tr class='tr2'><td>"));
                    strSubjectName = datar["SubjectName"].ToString();
                    j = 2;
                }

                if (strSubjectName != datar["SubjectName"].ToString())
                {
                    if (k != 0)
                    {
                        place1.Controls.Add(new LiteralControl("</td></tr>"));
                    }
                    place1.Controls.Add(new LiteralControl("<tr class='tr1'><td><b>" + Convert.ToInt32(j) + "、" + datar["SubjectName"].ToString() + "</td></tr>"));
                    place1.Controls.Add(new LiteralControl("<tr class='tr2'><td>"));
                    j = j + 1;
                    strSubjectName = datar["SubjectName"].ToString();
                }

                switch (datar["keytype"].ToString())
                {
                    case "文本":
                        if (Convert.ToInt32(datar["num"]) > 0)
                        {
                            SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM HK_POLL_DETAIL WHERE KEYID=" + datar["keyid"].ToString());
                            while (datar1.Read())
                            {
                                place1.Controls.Add(new LiteralControl("&nbsp;&nbsp;&nbsp;&nbsp;填空：" + datar1["result"].ToString() + "<br>"));
                            }
                            datar1.Close();
                        }

                        break;
                    default:
                        place1.Controls.Add(new LiteralControl("&nbsp;&nbsp;&nbsp;&nbsp;" + datar["keyname"].ToString() + "：" + datar["num"].ToString() + "<br>"));
                        break;
                }
                k = k + 1;
            }
            datar.Close();
        }

        protected void qhlx_SelectedIndexChanged(object sender, EventArgs e)
        {
            place1.Controls.Clear();
            GridViewBind();
        }

    }
}
