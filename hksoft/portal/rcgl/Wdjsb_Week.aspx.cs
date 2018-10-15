using System;
using System.Data;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.portal.rcgl
{
    public partial class Wdjsb_Week : System.Web.UI.Page
    {
        private static DateTime datenew = new DateTime();
        protected void Page_Load(object sender, System.EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10113,1005", "0");

                if ((Request.QueryString["date"] != null))
                {
                    datenew = DateTime.Parse(Request.QueryString["date"]);
                    DisplayDate(datenew);
                }
                else
                {
                    datenew = DateTime.Now;
                    DisplayDate(DateTime.Now);
                }
            }
        }

        //显示日期
        public void DisplayDate(DateTime date)
        {
            string Day = "";
            switch (date.DayOfWeek.ToString())
            {
                case "Sunday":
                    Day = "星期日";
                    break;
                case "Monday":
                    Day = "星期一";
                    break;
                case "Tuesday":
                    Day = "星期二";
                    break;
                case "Wednesday":
                    Day = "星期三";
                    break;
                case "Thursday":
                    Day = "星期四";
                    break;
                case "Friday":
                    Day = "星期五";
                    break;
                case "Saturday":
                    Day = "星期六";
                    break;
            }
            lblHeader.Text = date.Year + "年" + date.Month + "月" + date.Day + "日" + Day;
            nian.SelectedValue = date.Year.ToString();
            dropMonth.SelectedIndex = date.Month - 1;
            dropDay.SelectedIndex = date.Day - 1;
        }

        //按月 
        protected void cmdMonth_Click(object sender, System.EventArgs e)
        {
            Server.Transfer(("wdjsb.aspx?i=2&date=" + datenew.ToShortDateString()));
        }

        //按天
        protected void cmdDay_Click(object sender, System.EventArgs e)
        {
            Server.Transfer(("wdjsb_day.aspx?date=" + datenew.ToShortDateString()));
        }

        //查询 
        protected void cmdQuery_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(nian.SelectedValue))
            {
                int year = 0;
                int month = 0;
                int day = 0;
                year = Int32.Parse(nian.SelectedValue);
                month = dropMonth.SelectedIndex + 1;
                day = Int32.Parse(dropDay.SelectedValue);
                datenew = new DateTime(year, month, day);
                DisplayDate(datenew);
            }
        }

        //上一周 
        protected void cmdLastday_Click(object sender, System.EventArgs e)
        {
            System.TimeSpan duration = new System.TimeSpan(7, 0, 0, 0);
            datenew = datenew.Subtract(duration);
            DisplayDate(datenew);
        }

        //下一周 
        protected void cmdNextday_Click(object sender, System.EventArgs e)
        {
            System.TimeSpan duration = new System.TimeSpan(7, 0, 0, 0);
            datenew = datenew.Add(duration);
            DisplayDate(datenew);
        }

        //日
        protected void dropDay_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            int numday = DateTime.DaysInMonth(Int32.Parse(nian.SelectedValue), dropMonth.SelectedIndex + 1);
            if (dropDay.SelectedIndex + 1 > numday)
            {
                dropDay.SelectedIndex = numday - 1;
            }
        }

        //月 
        protected void dropMonth_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            int numday = DateTime.DaysInMonth(Int32.Parse(nian.SelectedValue), dropMonth.SelectedIndex + 1);
            if (dropDay.SelectedIndex + 1 > numday)
            {
                dropDay.SelectedIndex = numday - 1;
            }
        }

        //每天 
        public string ssubject(int i)
        {
            string strDisInfo = "";
            DateTime Date = new DateTime();
            Date = DateTime.Parse(sDate(i));
            SqlCommand cmd = new SqlCommand();
            SqlDataReader datar = default(SqlDataReader);

            SqlConnection cnn = default(SqlConnection);
            cnn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["haokeDataLink"]);
            cmd = new SqlCommand("sp_Note_Remind", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Fdate", SqlDbType.DateTime);
            cmd.Parameters["@Fdate"].Value = datenew;
            cmd.Parameters.Add("@EmpID", SqlDbType.VarChar, 10);
            cmd.Parameters["@EmpID"].Value = this.Session["userid"].ToString();
            cnn.Open();
            datar = cmd.ExecuteReader();
            while (datar.Read())
            {
                int SchID = Int32.Parse(datar.GetInt32(1).ToString());
                DateTime FDate = new DateTime();
                FDate = DateTime.Parse(datar.GetSqlDateTime(2).ToString());
                string FDate_hour = FDate.Hour.ToString();
                string FDate_Minute = FDate.Minute.ToString();
                if (FDate_Minute == "0")
                {
                    FDate_Minute = "00";
                }
                string Subject = datar.GetValue(0).ToString();
                if (Subject.Length > 4)
                {
                    Subject = Subject.Substring(0, 4);
                    Subject += "..";
                }
                strDisInfo += "<br>" + "<a href=wdjsb_add.aspx?reurl=wdjsb_week.aspx&id=" + SchID + "&day=" + Date + " class=td style='font-size:9pt'>☉" + FDate_hour + ":" + FDate_Minute + " " + Subject + " </a>";
            }
            datar.Close();
            cnn.Close();
            return strDisInfo;
        }

        //显示日期 
        public string sDate(int i)
        {
            int j = num(datenew);
            //datenew = datenew;
            System.TimeSpan duration1 = new System.TimeSpan(j, 0, 0, 0);
            datenew = datenew.Subtract(duration1);
            System.TimeSpan duration2 = new System.TimeSpan(i, 0, 0, 0);
            datenew = datenew.Add(duration2);
            return datenew.ToShortDateString();
        }

        public int day(string date)
        {
            return Int32.Parse(DateTime.Parse(date).Day.ToString());
        }

        public int num(DateTime date)
        {
            int j = 0;
            switch (date.DayOfWeek.ToString())
            {
                case "Sunday":
                    j = 0;
                    break;
                case "Monday":
                    j = 1;
                    break;
                case "Tuesday":
                    j = 2;
                    break;
                case "Wednesday":
                    j = 3;
                    break;
                case "Thursday":
                    j = 4;
                    break;
                case "Friday":
                    j = 5;
                    break;
                case "Saturday":
                    j = 6;
                    break;
            }
            return j;
        }
    }
}
