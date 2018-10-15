using System;
using System.Data;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.portal.rcgl
{
    public partial class Wdjsb_Day : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        private static DateTime date = new DateTime();
        protected void Page_Load(object sender, System.EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10113,1005", "0");

                if ((Request.QueryString["date"] != null))
                {
                    date = DateTime.Parse(Request.QueryString["date"]);
                    DisplayDate(date);
                }
                else
                {
                    date = DateTime.Now;
                    DisplayDate(DateTime.Now);
                }
            }
        }

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
        protected void cmdMonth_Click(object sender, EventArgs e)
        {
            Server.Transfer(("wdjsb.aspx?i=2&date=" + date));
        }

        //按周
        protected void cmdWeek_Click(object sender, EventArgs e)
        {
            Server.Transfer(("wdjsb_week.aspx?date=" + date));
        }

        //上一日
        protected void cmdLastday_Click(object sender, EventArgs e)
        {
            System.TimeSpan duration = new System.TimeSpan(1, 0, 0, 0);
            date = date.Subtract(duration);
            DisplayDate(date);
        }

        //下一日
        protected void cmdNextday_Click(object sender, EventArgs e)
        {
            System.TimeSpan duration = new System.TimeSpan(1, 0, 0, 0);
            date = date.Add(duration);
            DisplayDate(date);
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
                date = new DateTime(year, month, day);
                DisplayDate(date);
            }
        }

        //日期 
        protected void dropDay_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            int numday = DateTime.DaysInMonth(Int32.Parse(nian.SelectedValue), dropMonth.SelectedIndex + 1);
            if (dropDay.SelectedIndex + 1 > numday)
            {
                dropDay.SelectedIndex = numday - 1;
            }
        }

        //月份
        protected void dropMonth_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            int numday = DateTime.DaysInMonth(Int32.Parse(nian.SelectedValue), dropMonth.SelectedIndex + 1);
            if (dropDay.SelectedIndex + 1 > numday)
            {
                dropDay.SelectedIndex = numday - 1;
            }
        }

        //每天
        public string ssubject()
        {
            string strDisInfo = "";
            DateTime FDate = new DateTime();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader datar = default(SqlDataReader);
            SqlConnection cnn = default(SqlConnection);
            cnn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["haokeDataLink"]);
            cmd = new SqlCommand("sp_Note_Remind", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Fdate", SqlDbType.DateTime);
            cmd.Parameters["@Fdate"].Value = date;
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
                string Subject = datar.GetValue(0).ToString();
                strDisInfo += "<br>" + "<A href=wdjsb_add.aspx?reurl=wdjsb_day.aspx&id=" + ID + "&day=" + date + " style='FONT-WEIGHT: 400'>☉" + FDate_hour + ":" + FDate_Minute + " " + Subject + "</A>";
            }
            datar.Close();
            cnn.Close();
            return strDisInfo;
        }

        protected void cmdAddNew_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Server.Transfer(("wdjsb_add.aspx?reurl=wdjsb_day.aspx&day=" + date.ToShortDateString()));
        }
    }
}
