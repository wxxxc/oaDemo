using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Ygtxl_r : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static string strsql, SqlStrMid, Namefile, XMStr, strtypeid;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (Request.QueryString["typeId"] != null)
            {
                strtypeid = "&typeId=" + Request.QueryString["typeId"] + "";
                strsql = " and FoldersID = '" + hkdb.GetStr(Server.UrlDecode(Request.QueryString["typeId"])) + "'";
            }
            else
            {
                strtypeid = "";
                strsql = "";
            }

            if (!IsPostBack)
            {
                hkdb.PassTo("11310", "0");

                if (Request.QueryString["typeId"] != null)
                {
                    SqlDataReader dr = SqlHelper.ExecuteReader("select * from hk_Ygtxl_lb where id='" + int.Parse(Request.QueryString["typeid"]) + "' ");
                    if (dr.Read())
                    {
                        Namefile = dr["name"].ToString();
                    }
                    else
                    {
                        Namefile = "未选择类别";
                    }
                    dr.Close();
                }
                else
                {
                    Namefile = "未选择类别";
                }

                BindAttr();

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //页面绑定 
                GridViewBind();
            }

            XMStr = null;
            SqlDataReader dr_jy = SqlHelper.ExecuteReader("select distinct substring(dbo.fun_getPY(name),1,1) as FYNAME from hk_Ygtxl");
            while (dr_jy.Read())
            {
                string SQL_GetCount = "select count(id) from hk_Ygtxl where substring(dbo.fun_getPY(name),1,1)='" + dr_jy["FYNAME"] + "'";
                string XMCount = "" + hkdb.GetCount(SQL_GetCount) + "";
                XMStr += "<a href='ygtxl_r.aspx?XS=" + dr_jy["FYNAME"] + "" + strtypeid + "' class=gvlink>" + dr_jy["FYNAME"] + "(" + XMCount + ")</a>&nbsp;&nbsp;";
            }
            dr_jy.Close();
        }

        public void BindAttr()
        {
            LinkButton5.Attributes["onclick"] = "javascript:return delf();";
            updatebtn.Attributes["onclick"] = "javascript:return modcheck();";
            DelBtn.Attributes["onclick"] = "javascript:return delcheck();";
            showbtn.Attributes["onclick"] = "javascript:return modcheck();";
        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " where 1=1 " + strsql + " ";

            if (Request.QueryString["Unit"] != null)
            {
                Str1 = Str1 + " and Unit like '%" + hkdb.GetStr(Server.UrlDecode(Request.QueryString["Unit"])) + "%'";
            }

            if (Request.QueryString["Respon"] != null)
            {
                Str1 = Str1 + " and Respon like '%" + hkdb.GetStr(Server.UrlDecode(Request.QueryString["Respon"])) + "%'";
            }

            if (!string.IsNullOrEmpty(jsSex.Text))
            {
                Str1 = Str1 + " AND Sex LIKE '%" + hkdb.GetStr(jsSex.Text) + "%'";
            }

            if (!string.IsNullOrEmpty(jsPost.Text))
            {
                Str1 = Str1 + " AND Post LIKE '%" + hkdb.GetStr(jsPost.Text) + "%'";
            }

            if (!string.IsNullOrEmpty(jsName.Text))
            {
                Str1 = Str1 + " AND Name LIKE '%" + hkdb.GetStr(jsName.Text) + "%'";
            }

            DataSet ds;
            if (Request.QueryString["XS"] != null)
            {
                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(id) from hk_Ygtxl " + Str1 + " and substring(dbo.fun_getPY(name),1,1)='" + Request.QueryString["XS"] + "'");
                ds = SqlHelper.ExecuteDs("select * from hk_Ygtxl " + Str1 + " and substring(dbo.fun_getPY(name),1,1)='" + Request.QueryString["XS"] + "'", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            }
            else
            {
                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(id) from hk_Ygtxl " + Str1);
                ds = SqlHelper.ExecuteDs("select * from hk_Ygtxl " + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            }

            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //分页
        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }

        private string CheckCbxDel()
        {
            string str = "0";
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                GridViewRow row = GridView1.Rows[i];
                CheckBox Chk = (CheckBox)row.FindControl("CheckSelect");
                Label LabVis = (Label)row.FindControl("LabVisible");
                if (Chk.Checked == true)
                {
                    if (str == "")
                    {
                        str = LabVis.Text.ToString();
                    }
                    else
                    {
                        str = str + "," + LabVis.Text.ToString();
                    }
                }
            }
            return str;
        }

        private string CheckCbxNameDel()
        {
            string str = string.Empty;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                GridViewRow row = GridView1.Rows[i];
                CheckBox Chk = (CheckBox)row.FindControl("CheckSelect");
                Label LabVis = (Label)row.FindControl("LabNameVisible");
                if (Chk.Checked == true)
                {
                    if (str == "")
                    {
                        str = LabVis.Text.ToString();
                    }
                    else
                    {
                        str = str + "," + LabVis.Text.ToString();
                    }
                }
            }
            return str;
        }

        private string CheckCbxUpdate()
        {
            string str = string.Empty;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                GridViewRow row = GridView1.Rows[i];
                CheckBox Chk = (CheckBox)row.FindControl("CheckSelect");
                Label LabVis = (Label)row.FindControl("LabVisible");
                if (Chk.Checked == true)
                {
                    if (str == "")
                    {
                        str = LabVis.Text.ToString();
                    }
                    else
                    {
                        str = str + "," + LabVis.Text.ToString();
                    }
                }
            }
            return str;
        }

        protected void ImageButton3_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            string CheckStr = CheckCbxDel();

            SqlHelper.ExecuteSql("Delete from hk_Ygtxl where ID in (" + CheckStr + ")");
            mydb.InsertLog("删除员工通讯录[" + CheckCbxNameDel() + "]", "11310");
            GridViewBind();
        }

        protected void ImageButton2_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["typeId"] != null)
            {
                Response.Redirect("Ygtxl_r_mod.aspx?id=" + CheckCbxUpdate() + "&typeId=" + Request.QueryString["typeId"] + "");
            }
            else
            {
                Response.Redirect("Ygtxl_r_mod.aspx?id=" + CheckCbxUpdate() + "");
            }
        }

        protected void ImageButton1_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["typeId"] != null)
            {
                Response.Redirect("Ygtxl_r_add.aspx?typeId=" + Request.QueryString["typeId"] + "");
            }
            else
            {
                Response.Redirect("Ygtxl_r_add.aspx");
            }
        }

        protected void ImageButton6_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["typeId"] != null)
            {
                Response.Redirect("Ygtxl_r_show.aspx?id=" + CheckCbxUpdate() + "&typeId=" + Request.QueryString["typeId"] + "");
            }
            else
            {
                Response.Redirect("Ygtxl_r_show.aspx?id=" + CheckCbxUpdate() + "");
            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["typeId"] != null)
            {
                Response.Redirect("Ygtxl_lb_add.aspx?id=" + CheckCbxUpdate() + "&typeId=" + Request.QueryString["typeId"] + "");
            }
            else
            {
                Response.Redirect("Ygtxl_lb_add.aspx?id=" + CheckCbxUpdate() + "");
            }
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            if (Request.QueryString["typeId"] != null)
            {
                DelNode(Request.QueryString["typeid"], Request.QueryString["typeid"]);
                this.Response.Write("<script language=javascript>alert('提交成功！'); window.parent.lhead.location='Ygtxl_l.aspx'</script>");
            }
            else
            {
                mydb.Alert("请先在左边的树形菜单中选择分类！");
                return;
            }
        }

        private void DelNode(string IDStr, string PID)
        {
            //删除最根节点
            SqlHelper.ExecuteSql("Delete from hk_Ygtxl_lb where id='" + IDStr + "'");
            SqlDataReader mydr = SqlHelper.ExecuteReader("select * from hk_Ygtxl_lb where (ParentNodesID=" + IDStr.ToString() + ")  order by id asc");
            while (mydr.Read())
            {
                SqlHelper.ExecuteSql("Delete from hk_Ygtxl_lb where id='" + mydr["ID"].ToString() + "'");
                SqlDataReader mydr1 = SqlHelper.ExecuteReader("select * from hk_Ygtxl_lb where ParentNodesID=" + mydr["id"] + " ");
                if (mydr1.Read())
                {
                    string IDStr1 = mydr["ID"].ToString();
                    string PID1 = mydr["ParentNodesID"].ToString();
                    DelNode(IDStr1, PID1);
                }
                mydr1.Close();
            }
            mydr.Close();
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["typeId"] != null)
            {
                Response.Redirect("Ygtxl_lb_mod.aspx?id=" + Request.QueryString["typeid"] + "");
            }
            else
            {
                mydb.Alert("请先在左边的树形菜单中选择分类！");
                return;
            }
        }
    }
}