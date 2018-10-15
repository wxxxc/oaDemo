using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.dxgl
{
    public partial class Dxqx : System.Web.UI.Page
    {
        public int ListType = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if ((Request["ListType"] != null))
            {
                ListType = Int32.Parse(Request["ListType"].ToString());
            }
            else
            {
                ListType = 1;
            }

            if (!IsPostBack)
            {
                hkdb.PassTo("11003", "11003");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //页面绑定 
                GridViewBind();
            }
        }

        //gv绑定 
        public void GridViewBind()
        {
            if (ListType == 1)
            {
                string Str1 = " WHERE UI_YNDX= 'Y' AND UI_LX='企业'";
                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM YH A" + Str1);
                DataSet ds = SqlHelper.ExecuteDs("SELECT A.UI_ID,A.UI_DESC,A.UI_YDDH,A.UI_BGDH,A.UI_MAIL,B.ZWMC FROM ZW B RIGHT OUTER JOIN YH A ON (A.UI_ZW=B.ZWID)" + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                GridView1.DataSource = ds;
            }
            else
            {
                CancelQX.Visible = false;
                AddQX.Visible = true;

                string Str1 = " WHERE UI_YNDX= 'N' AND UI_LX='企业'";
                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM YH A" + Str1);
                DataSet ds = SqlHelper.ExecuteDs("SELECT A.UI_ID,A.UI_DESC,A.UI_YDDH,A.UI_BGDH,A.UI_MAIL,B.ZWMC FROM ZW B RIGHT OUTER JOIN YH A ON (A.UI_ZW=B.ZWID)" + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                GridView1.DataSource = ds;
            }

            GridView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        //取消权限
        protected void CancelQX_Click(object sender, EventArgs e)
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
                SqlHelper.ExecuteSql("UPDATE YH SET UI_YNDX='N' WHERE UI_ID IN('" + cal + "')");
                mydb.Alert("已取消短信发送权限！");
                GridViewBind();
            }
            else
            {
                mydb.Alert("请先选中用户，再执行取消！");
            }
        }

        //添加权限 
        protected void AddQX_Click(object sender, EventArgs e)
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
                SqlHelper.ExecuteSql("UPDATE YH SET UI_YNDX='Y' WHERE UI_ID IN('" + cal + "')");
                mydb.Alert("已增加短信发送权限！");
                GridViewBind();
            }
            else
            {
                mydb.Alert("请先选中用户，再执行添加！");
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

        public string GetSelectImage(string NormalImg, string SelectedImg, int selected, int position)
        {
            if (selected == position)
            {
                return SelectedImg;
            }
            else
            {
                return NormalImg;
            }
        }

        //常规设定 
        protected void YSQ_Click(object sender, System.EventArgs e)
        {
            Server.Transfer("dxqx.aspx?id=2&ListType=1");
        }

        //邮箱配置
        protected void WSQ_Click(object sender, System.EventArgs e)
        {
            Server.Transfer("dxqx.aspx?id=2&ListType=2");
        }
    }
}
