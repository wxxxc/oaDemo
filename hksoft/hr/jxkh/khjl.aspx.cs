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
    public partial class khjl : System.Web.UI.Page
    {

        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("81111", "81111");
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
                   
                    DateTime d = DateTime.Now;
                    var dfirst= new DateTime(d.Year, d.Month, 1);
                    TextBox1.Text = dfirst.AddMonths(1).AddDays(-1).ToString("yyyy-MM-dd");
                    txtEdate.Text = dfirst.ToString("yyyy-MM-dd");
                }
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
            string Str2 = " where begindate>='" + string.Format("{0:yyyy-MM-dd HH:mm:ss}", (txtEdate.Text)) + "' and enddate<='"+ string.Format("{0:yyyy-MM-dd HH:mm:ss}", (TextBox1.Text)) + "'";
            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str2 = Str2 + " and b.ui_desc like '%" + hkdb.GetStr(query_content.Text) + "%' ";
            }
            if (!string.IsNullOrEmpty(TextBox2.Text))
            {
                Str2 = Str2 + " and c.xmmc like '%" + hkdb.GetStr(TextBox2.Text) + "%' ";
            }
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from hr_Jxkhjl a left join yh b on a.yhid=b.ui_id left join HR_Kpdf_Pfxm c on a.xmid=c.xmid" + Str2);
            DataSet ds = SqlHelper.ExecuteDs("select b.ui_desc as yhname,c.xmmc as xmname,c.Fz as score,* from hr_Jxkhjl a left join yh b on a.yhid=b.ui_id left join HR_Kpdf_Pfxm c on a.xmid=c.xmid  " + Str2 + "order by createtime desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void Del_Click(object sender, EventArgs e)
        {
            string cal = "";
            int i = 0;
            for (i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Rows[i].Cells[1].FindControl("del");


                if (cb.Checked == true)
                {
                    if (string.IsNullOrEmpty(cal))
                    {
                        cal = GridView1.DataKeys[i].Value.ToString();
                    }
                    else
                    {
                        cal = cal + "," + GridView1.DataKeys[i].Value.ToString();
                    }
                }
            }
            if (!string.IsNullOrEmpty(cal))
            {
                int k = 0;
                string call = "";
                var xms1 = cal.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                for (k = 0; k < xms1.Length; k++)
                {
                    string yhid = SqlHelper.ExecuteScalar("select yhid from HR_Jxkhjl WHERE id ='" + xms1[k] + "'").ToString();
                    string xmid = SqlHelper.ExecuteScalar("select xmid from HR_Jxkhjl WHERE id ='" + xms1[k] + "'").ToString();
                    double xmsc = Convert.ToDouble(SqlHelper.ExecuteScalar("select Fz from  HR_Kpdf_Pfxm WHERE Xmid ='" + xmid + "'"));
                    double sc = Convert.ToDouble(SqlHelper.ExecuteScalar("select khscore from yh WHERE ui_id ='" + yhid + "'"));
                    SqlHelper.ExecuteSql("Update yh set khscore='" + (sc - xmsc) + "' WHERE ui_id='" + yhid + "'");
                    call += "'" + xms1[k] + "'" + ",";
                }
               
                call = call.Substring(0, call.Length - 1);
                SqlHelper.ExecuteSql("delete from HR_Jxkhjl where id in (" + call + ")");
                
                 mydb.Alert("删除成功！");
                GridViewBind();
            }
            else
            {
                mydb.Alert("删除失败,请先选中记录！");
            }
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

        public string getfuji(string path) {
            var re = "";
            if (path!=null||path!="") {
                var a = path.Split(',');
                for (int i = 0; i < a.Length - 1; i++)
                {
                    var name = a[i].Substring(48,a[i].Length-48);
                    if (name.Length > 10)
                    {
                        name = name.Substring(0, 10) + "...";
                    }
                   re+= "<a target='_blank' href='"+qy_fjylurl.Text+a[i]+"'>在线预览 "+name+"</a><br/>";
                }
            }
           
            return re;
        }
    }
}