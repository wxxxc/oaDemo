using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.yjgl
{
    public partial class Feijx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10102,1002", "0");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                GridViewBind();
            }
        }

        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        public void GridViewBind()
        {
            DataSet ds;

            if (fjly.SelectedValue == "s")
            {
                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) AS NUMS FROM hk_Mail_JS WHERE SCBZ='是' AND JSR='" + this.Session["UserID"] + "'");
                ds = SqlHelper.ExecuteDs("SELECT A.JSID AS ID,A.JSBT AS BT,(CASE WHEN msbz='是' THEN '***密送邮件***' ELSE jsrNames END)AS jsrNames2,ISNULL((SELECT TOP 1 'y' FROM hk_AttUpload WHERE attKey=A.yjfj),'n')AS FJBZ,A.fsrName,A.fssj,A.zyjb,A.msbz FROM hk_Mail_JS A WHERE SCBZ='是' AND JSR='" + this.Session["UserID"] + "' ORDER BY FSSJ DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            }
            else
            {
                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) AS NUMS FROM hk_Mail_FS WHERE SCBZ='是' AND fsrID='" + this.Session["UserID"] + "'");
                ds = SqlHelper.ExecuteDs("SELECT A.YJID AS ID,A.FSBT AS BT,(CASE WHEN msbz='是' THEN '***密送邮件***' ELSE jsrNames END)AS jsrNames2,ISNULL((SELECT TOP 1 'y' FROM hk_AttUpload WHERE attKey=A.yjfj),'n')AS FJBZ,A.fsrName,A.fssj,A.zyjb,A.msbz FROM hk_Mail_FS A WHERE SCBZ='是' AND fsrID='" + this.Session["UserID"] + "' ORDER BY FSSJ DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            }

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

        //彻底删除
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
                if (fjly.SelectedValue == "s")
                {
                    SqlHelper.ExecuteSql("DELETE FROM hk_Mail_JS WHERE JSID IN('" + cal + "')");
                }
                else
                {
                    SqlHelper.ExecuteSql("DELETE FROM hk_Mail_FS WHERE YJID IN('" + cal + "')");
                }
                
                GridViewBind();
            }
            else
            {
                mydb.Alert("删除失败,请先选中记录！");
            }
        }

        //还原
        protected void Rev_Click(object sender, EventArgs e)
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
                if (fjly.SelectedValue == "s")
                {
                    SqlHelper.ExecuteSql("UPDATE hk_Mail_JS SET scbz='否' WHERE JSID IN('" + cal + "')");
                }
                else
                {
                    SqlHelper.ExecuteSql("UPDATE hk_Mail_FS SET scbz='否' WHERE YJID IN('" + cal + "')");
                }

                GridViewBind();
            }
            else
            {
                mydb.Alert("还原失败,请先选中记录！");
            }
        }
    }
}
