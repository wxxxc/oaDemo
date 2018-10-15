using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class wdzs : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        public static string Namefile;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");
            
            if (!IsPostBack)
            {
                hkdb.PassTo("10111", "0");
                
                SqlDataReader dr = SqlHelper.ExecuteReader("select * from OA_KlClassSub   where  id='" + hkdb.GetStr(Request.QueryString["LittleId"]) + "' ");
                if (dr.Read())
                {
                    Namefile = dr["Name"].ToString();
                }
                else
                {
                    Namefile = "没有此小类";
                }
                dr.Close();

                BindAttr();

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //页面绑定 
                GridViewBind();
            }
        }

        public void BindAttr()
        {
            DelBtn.Attributes["onclick"] = "javascript:return delcheck();";
        }

        //gv绑定 
        public void GridViewBind()
        {
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*)AS NUMS FROM OA_KnowLedge WHERE LittleId='" + hkdb.GetStr(Request.QueryString["LittleId"]) + "' AND Username = '" + this.Session["userid"] + "'");
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM OA_KnowLedge WHERE LittleId='" + hkdb.GetStr(Request.QueryString["LittleId"]) + "' AND Username = '" + this.Session["userid"] + "'", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //gv行处理 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";      //单击变色
                CheckBox cb = (CheckBox)e.Row.FindControl("chkSelect");         //双击选中/取消复选框 
                if (cb != null)
                    e.Row.Attributes.Add("ondblclick", cb.ClientID + ".checked=(!" + cb.ClientID + ".checked);");
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lid = (Label)e.Row.FindControl("lableId");
                Label lno = (Label)e.Row.FindControl("LNumber");

                Label lbl1 = (Label)e.Row.FindControl("lblshow");
                Label lbl2 = (Label)e.Row.FindControl("lblmod");
                Label lbl3 = (Label)e.Row.FindControl("lbldesign");
                Label lbl4 = (Label)e.Row.FindControl("lblzt");

                lbl1.Text = " <a href=\"javascript:void(0)\" onclick=\"showflow(" + lid.Text + ");\" class=\"gvlink\">查看</a>";
                lbl2.Text = " <a href=\"javascript:void(0)\" onclick=\"modflow(" + lid.Text + ");\" class=\"gvlink\">修改</a>";
                lbl3.Text = " <a href=\"javascript:void(0)\" onclick='window.open (\"wdzs_manage.aspx?Number=" + lno.Text + "\", \"_blank\", \"height=650, width=900,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no,top=0,left=0\")' class=\"gvlink\">管理章节</a>";

                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KnowLedge  where  id='" + lid.Text + "'  ");
                if (datar.Read())
                {
                    lbl4.Text = " <a href=\"javascript:void(0)\" onclick=\"Statefrom(" + lid.Text + ");\"class=\"gvlink\">" + datar["State"] + "</a>";
                }
                datar.Close();
            }
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        //获取删除行
        private string chkDelete()
        {
            string str = "0";
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                GridViewRow row = GridView1.Rows[i];
                CheckBox chk = (CheckBox)row.FindControl("chkSelect");
                Label lblVis = (Label)row.FindControl("lblVisible");
                if (chk.Checked == true)
                {
                    if (str == "")
                    {
                        str = lblVis.Text.ToString();
                    }
                    else
                    {
                        str = str + "," + lblVis.Text.ToString();
                    }
                }
            }
            return str;
        }

        protected void Del_Click(object sender, EventArgs e)
        {
            string chkStr = chkDelete();
            SqlHelper.ExecuteSql("DELETE FROM OA_KnowLedge WHERE ID in(" + chkStr + ")");
            GridViewBind();
        }

    }
}
