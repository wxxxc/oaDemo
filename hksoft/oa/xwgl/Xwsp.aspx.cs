﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.xwgl
{
    public partial class Xwsp : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        protected void Page_Load(object sender, EventArgs e)
        {

            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11103", "11103");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                dropdownlistBind();

                //页面绑定 
                GridViewBind();
            }
        }

        //dp绑定 
        public void dropdownlistBind()
        {
            string sql_xwfl = "select flmc,flid from oa_xwfl where glry='" + this.Session["userid"] + "' order by flid";
            bd.Bind_DropDownList_NoBlank(xwfl, sql_xwfl, "flid", "flmc", "", "");

        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            if (!string.IsNullOrEmpty(xwfl.SelectedValue))
            {
                string Str1 = " where fl='" + xwfl.SelectedValue + "' and zt='" + zt.SelectedValue + "'";
                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from OA_XWNR" + Str1);
                DataSet ds = SqlHelper.ExecuteDs("select a.xwid,a.xwbt,a.cjsj,a.cjr,a.zt,b.ui_desc from OA_XWNR a left outer join yh b on(a.cjr=b.ui_id)" + Str1 + " order by a.cjsj desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        //删除 
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
                        cal = cal + "','" + GridView1.DataKeys[i].Value.ToString();
                    }
                }
            }
            if (!string.IsNullOrEmpty(cal))
            {
                SqlHelper.ExecuteSql("delete from OA_XWNR where xwid in ('" + cal + "')");
                mydb.Alert("删除成功！");
                GridViewBind();
            }
            else
            {
                mydb.Alert("删除失败,请先选中记录！");
            }
        }

        //gv行处理 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}
