using System;
using System.Data;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class zsjs : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public static string tjStr, nrStr;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("12105", "12105");

                tjStr = "无";
                nrStr = "无";

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);
            }
            else
            {
                GridViewBind();
            }
        }

        public void GridViewBind()
        {
            if (Rbl.SelectedValue == "1")
            {
                tjStr = "知识标题";
                nrStr = "" + hkdb.GetStr(nr.Text) + "";

                DataSet ds = SqlHelper.ExecuteDs("select * from OA_KnowLedge where Title like '%" + nrStr + "%'  and ((CHARINDEX('," + this.Session["userid"].ToString() + ",',','+QxYdUsername+',') > 0 )  or QxYdUsername='全部用户') and State='正常' order by id desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else if (Rbl.SelectedValue == "2")
            {
                tjStr = "知识描述";
                nrStr = "" + hkdb.GetStr(nr.Text) + "";

                DataSet ds = SqlHelper.ExecuteDs("select * from OA_KnowLedge where Content like '%" + nrStr + "%'  and ((CHARINDEX('," + this.Session["userid"].ToString() + ",',','+QxYdUsername+',') > 0 )  or QxYdUsername='全部用户') and State='正常' order by id desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }

            else if (Rbl.SelectedValue == "3")
            {
                tjStr = "作者";
                nrStr = "" + hkdb.GetStr(nr.Text) + "";

                DataSet ds = SqlHelper.ExecuteDs("select * from OA_KnowLedge where Realname like '%" + nrStr + "%'  and ((CHARINDEX('," + this.Session["userid"].ToString() + ",',','+QxYdUsername+',') > 0 )  or QxYdUsername='全部用户') and State='正常' order by id desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }

            else if (Rbl.SelectedValue == "4")
            {
                tjStr = "关键字";
                nrStr = "" + hkdb.GetStr(nr.Text) + "";

                DataSet ds = SqlHelper.ExecuteDs("select * from OA_KnowLedge where KeyWord like '%" + nrStr + "%'  and ((CHARINDEX('," + this.Session["userid"].ToString() + ",',','+QxYdUsername+',') > 0 )  or QxYdUsername='全部用户') and State='正常' order by id desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }

            else if (Rbl.SelectedValue == "5")
            {
                tjStr = "综合搜索";
                nrStr = "" + hkdb.GetStr(nr.Text) + "";

                DataSet ds = SqlHelper.ExecuteDs("select * from OA_KnowLedge where (KeyWord like '%" + nrStr + "%' or KeyWord like '%" + nrStr + "%'  or Realname like '%" + nrStr + "%'   or Content like '%" + nrStr + "%'  or  Title like '%" + nrStr + "%')  and ((CHARINDEX('," + this.Session["userid"].ToString() + ",',','+QxYdUsername+',') > 0 )  or QxYdUsername='全部用户') and State='正常' order by id desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                tjStr = "无";
                nrStr = "无";
            }
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        protected void BtnS_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }
    }
}
