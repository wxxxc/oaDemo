﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Qygg : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11301", "11301");

                OperQx();

                //使用范围
                if (this.Session["systype"].ToString() == "A")     //主登录页
                {
                    SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT xh FROM hk_Init WHERE produID IN('M','V','F')");
                    if (datar1.Read())
                    {
                        lx.Visible = true;
                    }
                    datar1.Close();
                }
                else  //子登录页
                {
                    if (this.Session["systype"].ToString() == "M" | this.Session["systype"].ToString() == "V" | this.Session["systype"].ToString() == "F")
                    {
                        lx.Visible = true;
                    }
                }

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //页面绑定 
                GridViewBind();
            }
        }

        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(AddBtn, "11301a", Session["roleqx"].ToString());
            hkdb.QxValid(DelBtn, "11301d", Session["roleqx"].ToString());
            hkdb.QxValid(UseBtn, "11301u", Session["roleqx"].ToString());
            hkdb.QxValid(StopBtn, "11301u", Session["roleqx"].ToString());
        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = "";

            if (!string.IsNullOrEmpty(lx.SelectedValue))
            {
                Str1 = Str1 + " AND LX='" + lx.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str1 = Str1 + " AND " + query_tj.SelectedItem.Value + " LIKE '%" + hkdb.GetStr(query_content.Text) + "%'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM HK_QYGG A,YH B WHERE A.LRR=B.UI_ID AND A.GGLB='1' " + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT GGID,GGZT,LX,GGFL,ZT,KSSJ,JSSJ,LRR,LRSJ,UI_DESC FROM HK_QYGG A,YH B WHERE A.LRR=B.UI_ID AND A.GGLB='1' " + Str1 + " ORDER BY LRSJ DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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

        //删除
        protected void Del_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

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
                SqlHelper.ExecuteSql("DELETE FROM HK_QYGG WHERE GGID IN ('" + cal + "')");
                mydb.Alert("删除成功！");
                GridViewBind();
            }
            else
            {
                mydb.Alert("删除失败,请先选中记录！");
            }
        }

        //发布
        protected void Use_Click(object sender, EventArgs e)
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
                SqlHelper.ExecuteSql("UPDATE HK_QYGG SET ZT='已发布' WHERE GGID IN ('" + cal + "')");
                mydb.Alert("发布成功！");
                GridViewBind();
            }
            else
            {
                mydb.Alert("发布失败,请先选中记录！");
            }
        }

        //暂停 
        protected void Stop_Click(object sender, EventArgs e)
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
                SqlHelper.ExecuteSql("UPDATE HK_QYGG SET ZT='停用' WHERE GGID IN('" + cal + "')");
                mydb.Alert("暂停成功！");
                GridViewBind();
            }
            else
            {
                mydb.Alert("暂停失败,请先选中记录！");
            }
        }

        public string getggflbyid(string id)
        {
            string ggfl = "";
            ggfl=Convert.ToString(SqlHelper.ExecuteScalar("SELECT mc FROM hk_Zdylx WHERE id='" + id + "'"));
            return ggfl;
        }
    }
}
