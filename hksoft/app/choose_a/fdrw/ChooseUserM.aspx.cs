using haoke365;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hksoft.choose_a.fdrw
{
    public partial class ChooseUserM : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                DropDownListBind();

                AspNetPager1.PageSize = 10;

                ListViewBind();
            }
        }

        //dp绑定 
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
            string Str1 = " WHERE UI_STATUS='正常' AND UI_LX='企业'";


            //if (!string.IsNullOrEmpty(bm.SelectedValue))
            //{
            //    Str1 = Str1 + " AND UI_SSBM='" + bm.SelectedValue + "'";
            //}
            if (!string.IsNullOrEmpty(bm.SelectedValue))
            {
                if (bm.SelectedItem.Value == "1000000")
                {
                    Str1 = Str1 + " and yn_bmglz='是'";
                }
                else
                {
                    Str1 = Str1 + " and ui_ssbm= '" + bm.SelectedItem.Value + "' ";
                }
            }
            if (!string.IsNullOrEmpty(cxtj.Text))
            {
                Str1 = Str1 + " AND (UI_ID LIKE '%" + hkdb.GetStr(cxtj.Text) + "%' OR UI_DESC LIKE '%" + hkdb.GetStr(cxtj.Text) + "%')";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from yh" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.UI_ID,A.UI_DESC+'('+A.UI_ID+')' AS UI_DESC,'部门:'+B.BM_MC AS BM_MC,'职位:'+C.ZWMC AS ZWMC FROM YH A LEFT OUTER JOIN BM B ON(A.UI_SSBM=B.BM_ID) LEFT OUTER JOIN ZW C ON(A.UI_ZW=C.ZWID)" + Str1+ "order by A.number", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            ListView1.DataSource = ds;
            ListView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            ListViewBind();
        }
    }
}