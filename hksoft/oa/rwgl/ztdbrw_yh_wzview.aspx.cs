using haoke365;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hksoft.oa.rwgl
{
    public partial class ztdbrw_yh_wzview1 : System.Web.UI.Page
    {
            mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");
            if (!IsPostBack)
            {
                hkdb.PassTo("10303", "10303");
                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //页面绑定
                GridViewBind();
            }
        }
        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        private void GridViewBind()
        {
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select COUNT(*) from  dbo.OA_RwPunish where rwid='"+ hkdb.GetStr(Request.QueryString["rwid"].ToString()) + "'");
            DataSet ds = SqlHelper.ExecuteDs ("select reason,createuser,createtime,person from dbo.OA_RwPunish where rwid='" + hkdb.GetStr(Request.QueryString["rwid"].ToString()) + "' order by createtime desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }
        protected  void AspNetPager1_PageChanged(object sender,EventArgs e)
        {
            GridViewBind();
        }
    }
}