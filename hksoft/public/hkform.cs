using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace hkform
{
    public class myform
    {
        public string FormatFileno(string AStr, string LcNameId, string BianhaoWs, string FlowName)
        {
            if ("" == AStr)
                return "";
            else
            {
                AStr = AStr.Replace("{Y}", System.DateTime.Now.Year.ToString());
                AStr = AStr.Replace("{M}", System.DateTime.Now.Month.ToString());
                AStr = AStr.Replace("{D}", System.DateTime.Now.Day.ToString());
                AStr = AStr.Replace("{H}", System.DateTime.Now.Hour.ToString());
                AStr = AStr.Replace("{I}", System.DateTime.Now.Minute.ToString());
                AStr = AStr.Replace("{S}", System.DateTime.Now.Second.ToString());
                AStr = AStr.Replace("{F}", FlowName);
                AStr = AStr.Replace("{U}", HttpContext.Current.Session["username"].ToString());
                AStr = AStr.Replace("{SD}", HttpContext.Current.Session["deptname"].ToString());
                AStr = AStr.Replace("{R}", HttpContext.Current.Server.UrlDecode(HttpContext.Current.Request.Cookies["haoke"].Values["rolename"].ToString()));
                AStr = AStr.Replace("{N}", "" + LcNameId + "");
                AStr = AStr.Replace("{W}", GetWeekDay());
                return AStr;
            }
        }

        public string FormatMac(string AStr, string LcName, string FlowName)
        {
            if ("" == AStr)
                return "";
            else
            {
                AStr = AStr.Replace("{Y}", System.DateTime.Now.Year.ToString());
                AStr = AStr.Replace("{M}", System.DateTime.Now.Month.ToString());
                AStr = AStr.Replace("{D}", System.DateTime.Now.Day.ToString());
                AStr = AStr.Replace("{H}", System.DateTime.Now.Hour.ToString());
                AStr = AStr.Replace("{I}", System.DateTime.Now.Minute.ToString());
                AStr = AStr.Replace("{S}", System.DateTime.Now.Second.ToString());
                AStr = AStr.Replace("{F}", FlowName);
                AStr = AStr.Replace("{U}", HttpContext.Current.Session["username"].ToString());
                AStr = AStr.Replace("{SD}", HttpContext.Current.Session["deptname"].ToString());
                AStr = AStr.Replace("{R}", HttpContext.Current.Server.UrlDecode(HttpContext.Current.Request.Cookies["haoke"].Values["rolename"].ToString()));
                AStr = AStr.Replace("{W}", GetWeekDay());
                AStr = AStr.Replace("{BD}", LcName);
                return AStr;
            }
        }

        private string GetWeekDay()
        {
            string Temp = "";
            switch (DateTime.Now.DayOfWeek)
            {
                case DayOfWeek.Sunday:
                    Temp = "星期日";
                    break;
                case DayOfWeek.Monday:
                    Temp = "星期一";
                    break;
                case DayOfWeek.Tuesday:
                    Temp = "星期二";
                    break;
                case DayOfWeek.Wednesday:
                    Temp = "星期三";
                    break;
                case DayOfWeek.Thursday:
                    Temp = "星期四";
                    break;
                case DayOfWeek.Friday:
                    Temp = "星期五";
                    break;
                case DayOfWeek.Saturday:
                    Temp = "星期六";
                    break;
            }
            return Temp;
        }
    }
}
