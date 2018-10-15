using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.wpgl
{
    public partial class Showdisk : System.Web.UI.Page
    {
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10109", "0");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //判断文件夹 
                string sql = "SELECT * FROM hk_NetDisk_Dir WHERE UserID='" + this.Session["userid"] + "'";
                if (bd.CheckRepeat(sql) == "true")
                {
                    DelBtn.Enabled = true;
                    //UpBtn.Enabled = true;

                    DropDownListBind();
                    GridViewBind();
                }
                else
                {
                    DelBtn.Enabled = false;
                    //UpBtn.Enabled = false;
                }
            }
        }

        public void DropDownListBind()
        {
            bd.Bind_DropDownList_disk(DirList, "", "全部");

            bd.Bind_DropDownList_disk(DirList2, "", "请选择文件夹");
        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " WHERE B.USERID='" + this.Session["userid"] + "'";
            if (!string.IsNullOrEmpty(DirList.SelectedValue))
            {
                Str1 = Str1 + " AND A.DIRID='" + DirList.SelectedValue + "'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM HK_NETDISK_URL A LEFT OUTER JOIN HK_NETDISK_DIR B ON (A.DIRID=B.DIRID)" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,B.DIRID,B.NAME,ROUND(A.CONTAIN/1024,2)AS CONTAIN2 FROM HK_NETDISK_URL A LEFT OUTER JOIN HK_NETDISK_DIR B ON (A.DIRID=B.DIRID)" + Str1 + " ORDER BY A.CREATEDATE DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;

            //UpBtn.Attributes.Add("onclick", "Javascript:popMod2('UploadFile.aspx?DirID=" & DirList.SelectedValue & "');") 
            GridView1.DataBind();
        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
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

        protected void DirList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(DirList.SelectedValue))
            {
                UpBtn.Enabled = true;
            }
            else
            {
                UpBtn.Enabled = false;
            }
 
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
                SqlHelper.ExecuteSql("DELETE FROM HK_NETDISK_URL WHERE URLID IN('" + cal + "')");
                mydb.Alert("删除成功！");

                GridViewBind();
            }
            else
            {
                mydb.Alert("请先选中文件后再删除！");
            }
        }

        //移动 
        protected void Move_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(DirList2.SelectedValue))
            {
                mydb.Alert("请选择文件夹再确定移动！");
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
                SqlHelper.ExecuteSql("UPDATE HK_NETDISK_URL SET DIRID='" + DirList2.SelectedValue + "' WHERE URLID IN('" + cal + "')");
                mydb.Alert("文件移动成功！");
                GridViewBind();
            }
            else
            {
                mydb.Alert("请先选中文件后再移动！");
            }
        }

        //上传
        protected void Upload_Click(object sender, EventArgs e)
        {
            Response.Write("<script language=javascript>");
            Response.Write("window.location='UploadFile.aspx?DirID=" + DirList.SelectedValue + "';<");
            Response.Write("/script>");
        }
    }
}
