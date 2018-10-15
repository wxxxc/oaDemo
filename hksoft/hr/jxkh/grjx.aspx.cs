using haoke365;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hksoft.hr.jxkh
{
    public partial class grjx : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public static string userName,khscore;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("81114", "81114");
                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));

                if (!string.IsNullOrEmpty(Request.QueryString["sd"]))
                {
                    DateTime txtbegstr = Convert.ToDateTime(Request.QueryString["sd"].ToString());
                    DateTime txtendstr = Convert.ToDateTime(Request.QueryString["sd"].ToString());
                    txtEdate.Text = txtendstr.ToString("yyyy-MM-dd");
                    TextBox1.Text = txtbegstr.ToString("yyyy-MM-dd");
                }
                else
                {
                   // TextBox1.Text = DateTime.Now.AddDays(0).ToString("yyyy-MM-dd");
                    DateTime d = DateTime.Now;
                    var dfirst = new DateTime(d.Year, d.Month, 1);
                    TextBox1.Text = dfirst.AddMonths(1).AddDays(-1).ToString("yyyy-MM-dd");
                    txtEdate.Text = dfirst.ToString("yyyy-MM-dd");
                }

                khscore = Convert.ToString(SqlHelper.ExecuteScalar("SELECT khscore FROM YH WHERE ui_id='" + this.Session["userid"] + "'"));
                userName = Session["username"].ToString();

                //页面绑定 
                GridViewBind();
            }
        }
        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str2 = " where begindate>='" + string.Format("{0:yyyy-MM-dd HH:mm:ss}", (txtEdate.Text)) + "' and enddate<='" + string.Format("{0:yyyy-MM-dd HH:mm:ss}", (TextBox1.Text)) + "'" + " and yhid= '" + this.Session["userid"] + "'";
            if (!string.IsNullOrEmpty(TextBox2.Text))
            {
                Str2 = Str2 + " and c.xmmc like '%" + hkdb.GetStr(TextBox2.Text) + "%' ";
            }
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select COUNT(*) from(select a.begindate,a.enddate,cast(a.fjlj as varchar(4000)) as fjlj,cast(a.fjmc as varchar(4000)) as fjmc,c.Xmmc,COUNT(*) as num from hr_Jxkhjl a left join HR_Kpdf_Pfxm c on a.xmid = c.Xmid" + Str2 + " group by Xmmc,begindate,enddate,cast(a.fjlj as varchar(4000)),cast(a.fjmc as varchar(4000)) ) as y");
            DataSet ds = SqlHelper.ExecuteDs("select a.begindate,a.enddate,cast(a.fjlj as varchar(4000)) as fjlj,cast(a.fjmc as varchar(4000)) as fjmc,c.Xmmc,COUNT(*) as num from hr_Jxkhjl a left join HR_Kpdf_Pfxm c on a.xmid = c.Xmid" + Str2 + " group by Xmmc,begindate,enddate,cast(a.fjlj as varchar(4000)),cast(a.fjmc as varchar(4000))", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }


        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
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


        //附件显示
        public string isshowfj(string path)
        {
            string display = "";
            if (path == "../.." || path == "")
            {
                display = "display:none";
            }
            else
            {
                display = "display:block";
            }
            return display;
        }

        public string getfuji(string path)
        {
            var re = "";
            if (path != null || path != "")
            {
                var a = path.Split(',');
                for (int i = 0; i < a.Length - 1; i++)
                {
                    var name = a[i].Substring(48, a[i].Length - 48);
                    if (name.Length > 10)
                    {
                        name = name.Substring(0, 10) + "...";
                    }
                    re += "<a target='_blank' href='" + qy_fjylurl.Text + a[i] + "'>在线预览 " + name + "</a><br/>";
                }
            }

            return re;
        }
    }
}