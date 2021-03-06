﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;
using System.Data;
using System.Data.SqlClient;

namespace hksoft.portal.rcgl
{
    public partial class ylwdrc : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10120", "10120");
                DropDownListBind();
                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);
                if (!string.IsNullOrEmpty(Request.QueryString["sd"]))
                {
                    DateTime txtbegstr = Convert.ToDateTime(Request.QueryString["sd"].ToString());
                    DateTime txtendstr = Convert.ToDateTime(Request.QueryString["sd"].ToString());
                    txtEdate.Text = txtendstr.ToString("yyyy-MM-dd");
                    TextBox1.Text = txtbegstr.ToString("yyyy-MM-dd");
                }
                else
                {
                    TextBox1.Text = DateTime.Now.AddDays(0).ToString("yyyy-MM-dd");
                    txtEdate.Text = DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd");
                }
                //页面绑定 
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
            DateTime d = Convert.ToDateTime(TextBox1.Text).AddDays(1);
            string Str1 = Str1 = " where a.cjsj<='" + d + "' and a.cjsj>='" + string.Format("{0:yyyy-MM-dd HH:mm:ss}", (txtEdate.Text)) + "'";
            string Str2 = "";
            if (!string.IsNullOrEmpty(query_content.Text))
            {
                //Str2 = " where ";
                Str1 = Str1 + " and ui_desc like '%" + hkdb.GetStr(query_content.Text) + "%' ";
                Str2 = Str2 + " and ui_desc like '%" + hkdb.GetStr(query_content.Text) + "%' ";
            }
            if (!string.IsNullOrEmpty(bm.SelectedItem.Value))
            {
                //Str2 = " where ";
                if (bm.SelectedItem.Value == "1000000")
                {
                    Str1 = Str1 + " and b.yn_bmglz='是'";
                    Str2 = Str2 + " and a.yn_bmglz='是'";
                }
                else
                {
                    Str1 = Str1 + " and b.ui_ssbm= '" + bm.SelectedItem.Value + "' ";
                    Str2 = Str2 + " and a.ui_ssbm= '" + bm.SelectedItem.Value + "' ";
                }
            }
            if (DropDownList1.SelectedItem.Value.ToString() == "ytj")
            {
                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from hk_Wdrc a left join YH b on a.syz=b.ui_id left join BM c on b.ui_ssbm=c.bm_id " + Str1);
                DataSet ds = SqlHelper.ExecuteDs("select b.ui_desc,c.bm_mc as bm,d.zwmc as zw,* from hk_Wdrc a left join YH b on a.syz=b.ui_id left join BM c on b.ui_ssbm=c.bm_id left join ZW d on b.ui_zw=d.zwid " + Str1 + "order by a.cjsj desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                GridView1.DataSource = ds;
            }
            else
            {
                DataTable datar = new DataTable();
                var date= d.ToString("yyyy-MM-dd");
                datar = SqlHelper.ExecuteDt("SELECT DateAdd(day,number,'" + txtEdate.Text + "') as a FROM master..spt_values WHERE type = 'p' AND number <= DateDiff(day, '" + txtEdate.Text + "', Convert(varchar(10),'" + date + "',23))  ");
                var r = datar.Rows[1]["a"];
                AspNetPager1.RecordCount = 0;
                GridView1.DataSource = null;
                DataSet ds = new DataSet();
                DataSet dd = new DataSet();
                DataSet ds_show = new DataSet();
                for (int i = 0; i < datar.Rows.Count - 1; i++)
                {
                    AspNetPager1.RecordCount += (int)SqlHelper.ExecuteScalar("select COUNT (*) from(select distinct a.ui_id,a.ui_desc,'" + Convert.ToDateTime(datar.Rows[i]["a"]).ToString("yyyy-MM-dd") + "' as cjsj,c.bm_mc as bm,d.zwmc as zw from wit_soft.dbo.yh a left join wit_soft.dbo.hk_Wdrc b on a.ui_id = b.syz  left join BM c on a.ui_ssbm = c.bm_id left join ZW d on a.ui_zw = d.zwid where a.ui_id not in(select aa.ui_id from wit_soft.dbo.yh aa left join wit_soft.dbo.hk_Wdrc bb on aa.ui_id = bb.syz  where CONVERT(varchar(10), bb.cjsj, 23)= '" + Convert.ToDateTime(datar.Rows[i]["a"]).ToString("yyyy-MM-dd") + "' ) " + Str2 + ") as f");

                    ds = SqlHelper.ExecuteDs(" select distinct a.ui_id,a.ui_desc,'' as rcid,'' as rczt,'" + Convert.ToDateTime(datar.Rows[i]["a"]).ToString("yyyy-MM-dd") + "' as cjsj,c.bm_mc as bm,d.zwmc as zw from wit_soft.dbo.yh a left join wit_soft.dbo.hk_Wdrc b on a.ui_id = b.syz left join BM c on a.ui_ssbm = c.bm_id left join ZW d on a.ui_zw = d.zwid where a.ui_id not in(select aa.ui_id from wit_soft.dbo.yh aa left join wit_soft.dbo.hk_Wdrc bb on aa.ui_id = bb.syz  where CONVERT(varchar(10), bb.cjsj, 23)= '" + Convert.ToDateTime(datar.Rows[i]["a"]).ToString("yyyy-MM-dd") + "' ) " + Str2 + "order by cjsj desc");
                    dd.Merge(ds);
                    //ds.Add(dd);
                    //AspNetPager1.RecordCount += (int)SqlHelper.ExecuteScalar("select count(*) from(SELECT  isnull(g.cjsj, '"+datar.Rows[i]["a"]+"') as cjsj, a.ui_desc, c.bm_mc, d.zwmc, a.ui_id,a.yn_bmglz,a.ui_ssbm FROM YH a left join BM c on a.ui_ssbm = c.bm_id left join ZW d on a.ui_zw = d.zwid left join hk_Wdrc g on a.ui_id = g.syz  WHERE(NOT EXISTS(SELECT * FROM hk_Wdrc b WHERE a.ui_id = b.syz))) as f" + Str2);
                    //DataSet ds = SqlHelper.ExecuteDs("select * from( SELECT  isnull(g.cjsj, '"+datar.Rows[i]["a"]+"') as cjsj,g.rcid,isnull(g.rczt,'无') as rczt, a.ui_desc, c.bm_mc as bm, d.zwmc as zw, a.ui_id, a.yn_bmglz, a.ui_ssbm FROM YH a left join BM c on a.ui_ssbm = c.bm_id left join ZW d on a.ui_zw = d.zwid left join hk_Wdrc g on a.ui_id = g.syz  WHERE(NOT EXISTS(SELECT * FROM hk_Wdrc b WHERE a.ui_id = b.syz))) as f " + Str2 + "order by cjsj desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                }
                //for (int i=0;i<ds.Count;i++) {         AspNetPager3.PageSize * (AspNetPager3.CurrentPageIndex - 1), AspNetPager3.PageSize
                //    GridView1.DataSource = ds.Merge();
                //}
                int j = 0;
                if (AspNetPager1.CurrentPageIndex == 1)
                {
                    j = 0;
                }else
                {
                    j = AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1);
                }
                int k = AspNetPager1.PageSize;
                if (AspNetPager1.RecordCount/ AspNetPager1.PageSize+1== AspNetPager1.CurrentPageIndex)
                {
                    k = AspNetPager1.RecordCount - AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1);
                }
                else
                {
                    k = AspNetPager1.PageSize;
                }
                
                DataTable datat = new DataTable();
                DataRow row = datat.NewRow();
                datat.Columns.Add("ui_id");
                datat.Columns.Add("ui_desc");
                datat.Columns.Add("rcid");
                datat.Columns.Add("rczt");
                datat.Columns.Add("cjsj");
                datat.Columns.Add("bm");
                datat.Columns.Add("zw");
                for (int i = j; i < j+k; i++)
                {
                    row["ui_id"] = dd.Tables[0].Rows[i]["ui_id"].ToString();
                    row["ui_desc"] = dd.Tables[0].Rows[i]["ui_desc"].ToString();
                    row["rcid"] = dd.Tables[0].Rows[i]["rcid"].ToString();
                    row["rczt"] = dd.Tables[0].Rows[i]["rczt"].ToString();
                    row["cjsj"] = dd.Tables[0].Rows[i]["cjsj"].ToString();
                    row["bm"] = dd.Tables[0].Rows[i]["bm"].ToString();
                    row["zw"] = dd.Tables[0].Rows[i]["zw"].ToString();
                    datat.Rows.Add(row);   //向表中添加行元素
                    row = datat.NewRow();  //相当于清空一下row  否则下次循环不能赋值  rows不能重复赋值
                }
                ds_show.Tables.Add(datat.Copy());
                GridView1.DataSource = ds_show;
                //AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT count(*) FROM YH a left join BM c on a.ui_ssbm = c.bm_id left join ZW d on a.ui_zw = d.zwid WHERE(NOT EXISTS (SELECT * FROM hk_Wdrc b WHERE a.ui_id = b.syz))" + Str1);
                //DataSet ds = SqlHelper.ExecuteDs("SELECT ui_id,ui_desc,c.bm_mc,d.zwmc FROM YH a left join BM c on a.ui_ssbm = c.bm_id left join ZW d on a.ui_zw = d.zwid WHERE(NOT EXISTS (SELECT * FROM hk_Wdrc b WHERE a.ui_id = b.syz)) " + Str1 + "order by a.cjsj desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);

            }
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

    }
}