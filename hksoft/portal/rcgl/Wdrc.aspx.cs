using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using DayPilot.Web.Ui;
using haoke365;

namespace hkpro.portal.rcgl
{
    public partial class Wdrc : System.Web.UI.Page
    {
        SqlConnection Cnn;
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10106", "10106");

                //初始化 
                rl.Days = 5;
                rl.StartDate = firstDayOfWeek(DateTime.Now, DayOfWeek.Monday);
                DateBind();

                //选择年度 
                int j = 0;
                for (j = 1900; j <= 2101; j++)
                {
                    ListItem IItem = new ListItem();
                    IItem.Text = Convert.ToString(j);
                    if (j == DateTime.Now.Year)
                    {
                        IItem.Selected = true;
                    }
                    DropYear.Items.Add(IItem);
                }
                //选择月份 
                for (j = 1; j <= 12; j++)
                {
                    ListItem IItem = new ListItem();
                    IItem.Text = Convert.ToString(j);
                    if (j == DateTime.Now.Month)
                    {
                        IItem.Selected = true;
                    }
                    DropMonth.Items.Add(IItem);
                }
            }

            //初始化 
            Calendar1.VisibleDate = new DateTime(Convert.ToInt32(DropYear.SelectedItem.Text), Convert.ToInt32(DropMonth.SelectedItem.Text), 1);
            GridViewBind();
        }

        //gv绑定 
        public void DateBind()
        {
            Cnn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["haokeDataLink"]);
            SqlDataAdapter dapter = default(SqlDataAdapter);
            DataTable dt = new DataTable();
            dapter = new SqlDataAdapter("SELECT RCID,RCZT,KSSJ,JSSJ FROM HK_WDRC WHERE SYZ='" + this.Session["userid"] + "'", Cnn);
            dapter.Fill(dt);
            rl.DataSource = dt;
            rl.DataBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            switch (today.SelectedValue)
            {
                case "wks":
                    //未开始 
                    SqlDataSource1.SelectCommand = "";
                    SqlDataSource1.SelectCommand = "SELECT RCID,RCZT,YXJ FROM HK_WDRC WHERE SYZ='" + this.Session["userid"] + "' AND KSSJ<='" + string.Format("{0:yyyy-MM-dd}", DateTime.Now.AddDays(1)) + "' AND ZT='0'";
                    break;
                case "jxz":
                    //进行中 
                    SqlDataSource1.SelectCommand = "";
                    SqlDataSource1.SelectCommand = "SELECT RCID,RCZT,YXJ FROM HK_WDRC WHERE SYZ='" + this.Session["userid"] + "' AND KSSJ<='" + string.Format("{0:yyyy-MM-dd}", DateTime.Now.AddDays(1)) + "' AND ZT='1'";
                    break;
                case "ywc":
                    //已完成 
                    SqlDataSource1.SelectCommand = "";
                    SqlDataSource1.SelectCommand = "SELECT RCID,RCZT,YXJ FROM HK_WDRC WHERE SYZ='" + this.Session["userid"] + "' AND KSSJ<='" + string.Format("{0:yyyy-MM-dd}", DateTime.Now.AddDays(1)) + "' AND ZT='2'";
                    break;
                case "wait":
                    //正在等待其他人 
                    SqlDataSource1.SelectCommand = "";
                    SqlDataSource1.SelectCommand = "SELECT RCID,RCZT,YXJ FROM HK_WDRC WHERE SYZ='" + this.Session["userid"] + "' AND KSSJ<='" + string.Format("{0:yyyy-MM-dd}", DateTime.Now.AddDays(1)) + "' AND ZT='3'";
                    break;
                case "ytc":
                    //已推迟 
                    SqlDataSource1.SelectCommand = "";
                    SqlDataSource1.SelectCommand = "SELECT RCID,RCZT,YXJ FROM HK_WDRC WHERE SYZ='" + this.Session["userid"] + "' AND KSSJ<='" + string.Format("{0:yyyy-MM-dd}", DateTime.Now.AddDays(1)) + "' AND ZT='4'";
                    break;
                default:
                    //全部未完成 
                    SqlDataSource1.SelectCommand = "";
                    SqlDataSource1.SelectCommand = "SELECT RCID,RCZT,YXJ FROM HK_WDRC WHERE SYZ='" + this.Session["userid"] + "' AND KSSJ<='" + string.Format("{0:yyyy-MM-dd}", DateTime.Now.AddDays(1)) + "'and jssj>='" + string.Format("{0:yyyy-MM-dd}", DateTime.Now.AddDays(0)) + "' AND ZT<>'2'";
                    break;
            }
        }

        //显示方式
        protected void Xsfs_Selected(object sender, EventArgs e)
        {
            if (xsfs.SelectedValue == "7")
            {
                rl.Days = 7;
                rl.StartDate = firstDayOfWeek(DateTime.Now, DayOfWeek.Monday);
            }
            else if (xsfs.SelectedValue == "1")
            {
                rl.Days = 1;
                rl.StartDate = DateTime.Now;
                //精简格式 
                rl.HeaderDateFormat = "M/d";
            }
            else
            {
                rl.Days = 5;
                rl.StartDate = firstDayOfWeek(DateTime.Now, DayOfWeek.Monday);
            }
        }

        //周查询
        public static DateTime firstDayOfWeek(DateTime day, DayOfWeek weekStarts)
        {
            DateTime d = day;
            while (d.DayOfWeek != weekStarts)
            {
                d = d.AddDays(-1);
            }
            return d;
        }

        //空闲时间
        public void DayPilotCalendar1_FreeTimeClick(object sender, DayPilot.Web.Ui.FreeClickEventArgs e)
        {
            string Str2 = null;
            Str2 = "<script language='javascript'>window.open('wdrc_add.aspx?sd=" + e.Start + "&st=" + e.Start + "','newwidow','height=550,width=750,top=0,left=0,right=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')<";
            Str2 += "/";
            Str2 += "script>";
            Response.Write(Str2);
        }

        //日程内容 
        public void DayPilotCalendar1_EventClick(object sender, DayPilot.Web.Ui.EventClickEventArgs e)
        {
            string Str2 = null;
            Str2 = "<script language='javascript'>window.open('wdrc_mod.aspx?id=" + e.Value + "','newwidow','height=550,width=750,top=0,left=0,right=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')<";
            Str2 += "/";
            Str2 += "script>";
            Response.Write(Str2);
        }

        //工作外时间 
        protected void Xsgzsj_Check(object sender, EventArgs e)
        {
            if (xsgzsj.Checked == true)
            {
                rl.NonBusinessHours = NonBusinessHoursBehavior.Show;
            }
            else
            {
                rl.NonBusinessHours = NonBusinessHoursBehavior.Hide;
            }
        }


        //日历选择
        protected void selected_click(object sender, EventArgs e)
        {
            if (xsfs.SelectedValue == "1")
            {
                rl.StartDate = Convert.ToDateTime(Calendar1.SelectedDate);
                rl.Days = Convert.ToInt32(xsfs.SelectedValue);
            }
            else
            {
                rl.StartDate = firstDayOfWeek(Calendar1.SelectedDate, DayOfWeek.Monday);
                rl.Days = Convert.ToInt32(xsfs.SelectedValue);
            }
        }

        //回到今日
        protected void Today_Click(object sender, EventArgs e)
        {
            DropYear.Items.Clear();
            DropMonth.Items.Clear();
            //选择年度 
            int i = 0;
            for (i = 1900; i <= 2101; i++)
            {
                ListItem IItem = new ListItem();
                IItem.Text = Convert.ToString(i);
                if (i == DateTime.Now.Year)
                {
                    IItem.Selected = true;
                }
                DropYear.Items.Add(IItem);
            }
            //选择月份 
            for (i = 1; i <= 12; i++)
            {
                ListItem IItem = new ListItem();
                IItem.Text = Convert.ToString(i);
                if (i == DateTime.Now.Month)
                {
                    IItem.Selected = true;
                }
                DropMonth.Items.Add(IItem);
            }
            Calendar1.VisibleDate = new DateTime(Convert.ToInt32(DropYear.SelectedItem.Text), Convert.ToInt32(DropMonth.SelectedItem.Text), 1);
            if (xsfs.SelectedValue == "7")
            {
                rl.Days = 7;
                rl.StartDate = firstDayOfWeek(DateTime.Now, DayOfWeek.Monday);
            }
            else if (xsfs.SelectedValue == "1")
            {
                rl.Days = 1;
                rl.StartDate = DateTime.Now;
                //设置精简格式 
                rl.HeaderDateFormat = "M/d";
            }
            else
            {
                rl.Days = 5;
                rl.StartDate = firstDayOfWeek(DateTime.Now, DayOfWeek.Monday);
            }
        }

        //今日 X 状态的日程
        protected void Today_Select(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv行处理 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}
