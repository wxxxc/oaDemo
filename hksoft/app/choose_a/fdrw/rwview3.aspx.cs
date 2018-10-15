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
    public partial class rwview3 : System.Web.UI.Page
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
            string Str1 = " where  ui_status='正常' and ui_lx='企业'";

            if (!string.IsNullOrEmpty(bm.SelectedItem.Value))
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
                Str1 = Str1 + " and " + hkdb.GetStr(cxtj.Text) + " like '%" + hkdb.GetStr(cxtj.Text) + "%' ";
            }
            DataSet ds = SqlHelper.ExecuteDs("select ui_id,ui_desc,ui_sex,ui_lx,(case when yn_bmglz='是' then 'ch' else 'noch' end)as yn_bmglz,b.bm_mc,c.zwmc from yh a left outer JOIN BM b on (a.ui_ssbm=b.bm_id)left outer JOIN ZW c on (a.ui_zw=c.zwid)" + Str1 + " order by a.ui_desc");
            ListView1.DataSource = ds;
            ListView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            ListViewBind();
        }
    }
}