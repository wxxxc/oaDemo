using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class wdzs_manage : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public static string Namefile;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10111", "0");

                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KnowLedge   where  Number='" + hkdb.GetStr(Request.QueryString["Number"]) + "' ");
                if (datar.Read())
                {
                    Namefile = datar["LittleName"].ToString();
                }
                else
                {
                    Namefile = "没有此小类";
                }
                datar.Close();

                BindAttr();

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
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*)AS NUMS FROM OA_KlChap WHERE KmNumber='" + hkdb.GetStr(Request.QueryString["Number"]) + "'");
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM OA_KlChap WHERE KmNumber='" + hkdb.GetStr(Request.QueryString["Number"]) + "'", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //gv行处理 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
                CheckBox cb = (CheckBox)e.Row.FindControl("chkSelect");
                if (cb != null)
                    e.Row.Attributes.Add("ondblclick", cb.ClientID + ".checked=(!" + cb.ClientID + ".checked);");
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lid = (Label)e.Row.FindControl("lableId");
                Label lno = (Label)e.Row.FindControl("LNumber");

                Label lbl1 = (Label)e.Row.FindControl("lblshow");
                Label lbl2 = (Label)e.Row.FindControl("lblmod");

                lbl1.Text = " <a href=\"javascript:void(0)\" onclick=\"showfrom(" + lid.Text + ");\"class=\"gvlink\">查看</a>";
                lbl2.Text = " <a href=\"javascript:void(0)\" onclick=\"updatefrom(" + lid.Text + ");\"class=\"gvlink\">修改</a>";
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
            SqlHelper.ExecuteSql("DELETE FROM OA_KlChap WHERE ID in(" + chkStr + ")");
            GridViewBind();
        }
    }
}
