using System;
using System.Data;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.portal.rcgl
{
    public partial class Wdjsb_Tx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10113,1005", "0");
            }

            SqlConnection cnn = default(SqlConnection);
            SqlDataAdapter dapter = default(SqlDataAdapter);
            cnn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["haokeDataLink"]);
            DataTable tipTB = new DataTable();
            dapter = new SqlDataAdapter("SELECT SCHID,SUBJECT,FDATE FROM HK_JSB WHERE REMINDFLAG=1 AND FDATE BETWEEN GETDATE() AND DATEADD(DAY,REMINDDAY,GETDATE()) AND EMPID='" + this.Session["userid"] + "'", cnn);
            dapter.Fill(tipTB);

            if (tipTB.Rows.Count > 0)
            {
                lblTitle.Text = " 您有" + tipTB.Rows.Count.ToString() + "个事情安排即将开始！";
                int i = 0;
                for (i = 0; i <= tipTB.Rows.Count - 1; i++)
                {
                    DataRow row = tipTB.Rows[i];
                    string schid = row["SchID"].ToString();
                    string Subject = row["Subject"].ToString();
                    string FDate_date = DateTime.Parse(row["FDate"].ToString()).Date.ToShortDateString();
                    if (Subject.Length > 4)
                    {
                        Subject = Subject.Substring(0, 4);
                        Subject += "..";
                    }
                    lblTotal.Text += "<a href=wdjsb_add.aspx?reurl=wdjsb.aspx&id=" + schid + "&day=" + FDate_date + " title=显示详细信息 target='mainframe'>";
                    lblTotal.Text += "☉" + FDate_date + ":" + " " + Subject + "</a><br>";
                }
            }
        }
    }
}
