using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.yjgl
{
    public partial class Sjx : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                string a = null;
                if (Request.QueryString["i"] != "2")
                {
                    //用户类型 
                    if (this.Session["systype"].ToString() == "G")
                    {
                        a = "1002";
                    }
                    else
                    {
                        a = "10102";
                    }
                }
                else
                {
                    a = "0";
                }

                hkdb.PassTo("10102,1002", a);

                DropDownListBind();

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                GridViewBind();
            }
        }

        //dp绑定 
        public void DropDownListBind()
        {
            //绑定部门
            bd.Bind_DropDownList_bm(ssbm, "", "", "");
        }

        //刷新 
        protected void Receive_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        public void GridViewBind()
        {
            string str1 = " WHERE JSR='" + this.Session["userid"] + "' AND SCBZ='否'";

            if (!string.IsNullOrEmpty(ssbm.SelectedValue))
            {
                str1 = str1 + " AND FsrID IN(SELECT UI_ID FROM YH WHERE UI_SSBM='" + ssbm.SelectedValue + "')";
            }

            if (!string.IsNullOrEmpty(fsr.Text))
            {
                str1 = str1 + " AND (FsrID LIKE '%" + hkdb.GetStr(fsr.Text) + "%' OR fsrName LIKE '%" + hkdb.GetStr(fsr.Text) + "%')";
            }

            switch (jsfa.SelectedValue)
            {
                case "0":
                    str1 = str1 + " AND JSZT='0'";
                    break;
                case "1":
                    str1 = str1 + " AND JSZT='1'";
                    break;
                case "普通":
                    str1 = str1 + " AND ZYJB='普通'";
                    break;
                case "重要":
                    str1 = str1 + " AND ZYJB='重要'";
                    break;
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) AS NUMS FROM hk_Mail_JS" + str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,(CASE WHEN msbz='是' THEN '***密送邮件***' ELSE jsrNames END)AS jsrNames2,ISNULL((SELECT TOP 1 'y' FROM hk_AttUpload WHERE attKey=A.yjfj),'n')AS FJBZ FROM hk_Mail_JS A " + str1 + " ORDER BY FSSJ DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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
                SqlHelper.ExecuteSql("UPDATE hk_Mail_JS SET SCBZ='是' WHERE JSID IN('" + cal + "')");
                GridViewBind();
            }
            else
            {
                mydb.Alert("删除失败,请先选中记录！");
            }
        }
    }
}
