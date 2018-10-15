using haoke365;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hksoft.app.choose_a.fdrw
{
    public partial class rwview_dw_zr : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("2");

            if (!IsPostBack)
            {
                DropDownListBind();
                ListViewBind();
            }
        }

        public void DropDownListBind()
        {
            bd.Bind_DropDownList_bm(bm, "", "全部部门", "");
        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            ListViewBind();
        }

        //gv绑定 
        public void ListViewBind()
        {
            string Str1 = "";
            if (!string.IsNullOrEmpty(cxtj.Text))
            {
                Str1 = "where  bm_mc  like '%" + hkdb.GetStr(cxtj.Text) + "%'";
            }
            DataSet ds = SqlHelper.ExecuteDs("select * from BM " + Str1 + " order by bm_bm asc");
            ListView1.DataSource = ds;
            ListView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            ListViewBind();
        }
    }
}