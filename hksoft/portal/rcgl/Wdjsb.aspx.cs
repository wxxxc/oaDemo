using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.rcgl
{
    public partial class Wdjsb : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public static DateTime date = new DateTime();
        public string str_NoticeMsg;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                //用户类型 
                string a = null;
                if (Request.QueryString["i"] != "2")
                {
                    a = "10113";
                }
                else
                {
                    a = "0";
                }

                hkdb.PassTo("10113", a);

                //检测是否有需要提醒的事件 
                int j = Convert.ToInt32(SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM HK_JSB WHERE REMINDFLAG=1 AND FDATE BETWEEN GETDATE() AND DATEADD(DAY,REMINDDAY,GETDATE()) AND EMPID='" + this.Session["userid"] + "'"));
                if (j > 0 & Session["isScheduleNoticed"] == null)
                {
                    str_NoticeMsg = "onload=\"javascript:window.open('wdjsb_tx.aspx','','top=100,left=100')\"";
                    Session["isScheduleNoticed"] = "1";
                }

                if ((Request.QueryString["date"] != null))
                {
                    date = DateTime.Parse(Request.QueryString["date"]);
                    nian.SelectedValue = date.Year.ToString();
                    dropMonth.SelectedIndex = date.Month - 1;
                }
                else
                {
                    date = DateTime.Now;
                    nian.SelectedValue = date.Year.ToString();
                    dropMonth.SelectedIndex = date.Month - 1;
                }
            }
        }

        //绑定页面 
        protected void calSchedule_DayRender(object sender, DayRenderEventArgs e)
        {
            CalendarDay d = ((DayRenderEventArgs)e).Day;
            TableCell c = ((DayRenderEventArgs)e).Cell;

            if (d.IsOtherMonth)
            {
                c.Controls.Clear();
            }
            else
            {
                HyperLink aHyperLink = new HyperLink();
                aHyperLink.ImageUrl = "../../images/portal/add_small.gif";
                aHyperLink.ToolTip = "新增事件";
                aHyperLink.NavigateUrl = "wdjsb_add.aspx?reurl=wdjsb.aspx&day=" + d.Date.ToShortDateString();
                c.Controls.Add(new LiteralControl("&nbsp;"));
                c.Controls.Add(aHyperLink);
                DateTime FDate = new DateTime();
                string Subject = null;

                SqlConnection cnn = default(SqlConnection);
                SqlCommand cmd = new SqlCommand();
                SqlDataReader datar = default(SqlDataReader);
                DateTime Date = new DateTime();
                Date = d.Date;

                cnn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["haokeDataLink"]);
                cmd = new SqlCommand("sp_Note_Remind", cnn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Fdate", SqlDbType.DateTime);
                cmd.Parameters["@Fdate"].Value = Date;
                cmd.Parameters.Add("@EmpID", SqlDbType.VarChar, 10);
                cmd.Parameters["@EmpID"].Value = this.Session["userid"].ToString();
                cnn.Open();
                datar = cmd.ExecuteReader();
                while (datar.Read())
                {
                    int ID = Int32.Parse(datar.GetInt32(1).ToString());
                    FDate = DateTime.Parse(datar.GetSqlDateTime(2).ToString());
                    string FDate_hour = FDate.Hour.ToString();
                    string FDate_Minute = FDate.Minute.ToString();
                    if (FDate_Minute == "0")
                    {
                        FDate_Minute = "00";
                    }
                    Subject = datar.GetValue(0).ToString();

                    if (Subject.Length > 4)
                    {
                        Subject = Subject.Substring(0, 4);
                        Subject += "..";
                    }
                    HtmlAnchor a = new HtmlAnchor();
                    a.HRef = "wdjsb_add.aspx?reurl=wdjsb.aspx&id=" + ID + "&day=" + d.Date.ToShortDateString();
                    a.InnerText = "☉" + FDate_hour + ":" + FDate_Minute + " " + Subject + "";
                    c.Controls.Add(new LiteralControl("&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;"));
                    c.Controls.Add(new LiteralControl("<br>"));
                    c.Controls.Add(a);
                    c.Controls.Add(new LiteralControl("<br>"));
                }
                datar.Close();
                cnn.Close();
            }
            e.Cell.Attributes["onmouseover"] = "javascript:this.style.backgroundColor='#fff7ce';cursor='hand';";
            e.Cell.Attributes["onmouseout"] = "javascript:this.style.backgroundColor='#f4f4f4';";
        }

        //查询 
        protected void cmdQuery_Click(object sender, EventArgs e)
        {
            int year = 0;
            int month = 0;
            year = Int32.Parse(nian.SelectedValue);
            month = dropMonth.SelectedIndex + 1;
            DateTime querydate = new DateTime(year, month, 1);
            calSchedule.VisibleDate = querydate;
        }

        //按周查询 
        protected void cmdWeek_Click(object sender, EventArgs e)
        {
            date = DateTime.Now;
            Server.Transfer(("wdjsb_week.aspx?date=" + date.ToShortDateString()));
        }

        //按天查询
        protected void cmdDay_Click(object sender, EventArgs e)
        {
            date = DateTime.Now;
            Server.Transfer(("wdjsb_day.aspx?date=" + date.ToShortDateString()));
        }

        //返回日期
        public DateTime Getdate()
        {
            return date;
        }

        //点击日期
        protected void calSchedule_SelectionChanged(object sender, System.EventArgs e)
        {
            date = calSchedule.SelectedDate;
            Server.Transfer(("wdjsb_day.aspx?date=" + date.ToShortDateString()));
        }
    }
}
