using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.Choose.oa
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

                GridViewBind();
            }
        }

        public void DropDownListBind()
        {
            bd.Bind_DropDownList_bm(bm, "", "全部部门", "");
        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " where  ui_status='正常' and ui_lx='企业'";

            //if (yn_bmglz.Checked == true)
            //{
            //    Str1 = Str1 + " and yn_bmglz='是'";
            //}
             
            if (!string.IsNullOrEmpty(bm.SelectedItem.Value))
            {
                if (bm.SelectedItem.Value == "1000000")
                {
                    Str1 = Str1 + " and yn_bmglz='是'";
                }
                else {
                    Str1 = Str1 + " and ui_ssbm= '" + bm.SelectedItem.Value + "' ";
                }
            }
             
            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str1 = Str1 + " and " + query_tj.SelectedItem.Value + " like '%" + hkdb.GetStr(query_content.Text) + "%' ";
            }
            DataSet ds = SqlHelper.ExecuteDs("select ui_id,ui_desc,ui_sex,ui_lx,(case when yn_bmglz='是' then 'ch' else 'noch' end)as yn_bmglz,b.bm_mc,c.zwmc from yh a left outer JOIN BM b on (a.ui_ssbm=b.bm_id)left outer JOIN ZW c on (a.ui_zw=c.zwid)" + Str1 + " order by a.number");
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

        protected void set_null(object sender, EventArgs e)
        {
            Response.Write("<script language=javascript>");
            Response.Write("window.opener.document.getElementById(\"zrr\").value='';");
            Response.Write("window.close();<");
            Response.Write("/script>");
        }
    }
}
