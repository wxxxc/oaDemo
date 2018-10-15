using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class AddWork_My : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            SqlHelper.ExecuteSql("DELETE FROM hk_Work WHERE wStatus='等待送审' AND PromoterID='" + this.Session["UserID"].ToString() + "'");

            if (!IsPostBack)
            {
                hkdb.PassTo("1004,10105", "0");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                BindDplist();
                GridviewBind();
            }
        }

        public void BindDplist()
        {
            string sql_fName = "SELECT fID,fName FROM hk_Form ORDER BY fID DESC";
            bd.Bind_DropDownList(txt_fName, sql_fName, "fID", "fName", "0", "所有表单类型");
        }

        public void GridviewBind()
        {
            string Str1 = string.Empty;

            if (txt_fName.SelectedValue != "0")
            {
                Str1 = Str1 + " and A.FK_fid ='" + txt_fName.SelectedValue + "'";
            }

            if (txt_wSerialNo.Text.Trim() != "")
            {
                Str1 = Str1 + " and A.wSerialNo = '" + hkdb.GetStr(txt_wSerialNo.Text) + "'";
            }

            if (txt_wStatus.SelectedValue != "所有类型")
            {
                Str1 = Str1 + " and A.wStatus= '" + txt_wStatus.SelectedValue + "'";
            }

            if (txt_PromoterName.Text != "")
            {
                Str1 = Str1 + " and B.ui_desc like '%" + hkdb.GetStr(txt_PromoterName.Text) + "%'";
            }

            if (Name.Text != "")
            {
                Str1 = Str1 + " and A.wName like '%" + hkdb.GetStr(Name.Text) + "%'";
            }

            if (txt_sdate.Text != "" && txt_edate.Text != "")
            {
                Str1 = Str1 + " AND (A.AddTime between '" + hkdb.GetStr(txt_sdate.Text) + "'and  '" + hkdb.GetStr(txt_edate.Text) + "' or convert(char(10),cast(A.AddTime as datetime),120)=convert(char(10),cast('" + txt_sdate.Text + "' as datetime),120) or convert(char(10),cast(A.AddTime as datetime),120)=convert(char(10),cast('" + txt_edate.Text + "' as datetime),120) ) ";
            }

            if (wTitle.Text != "")
            {
                Str1 = Str1 + " and A.wTitle like '%" + hkdb.GetStr(wTitle.Text) + "%'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*)AS NUMS FROM hk_Work A LEFT OUTER JOIN yh B ON(A.PromoterID=B.ui_id) WHERE FK_uid ='" + this.Session["userid"] + "'" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,B.ui_desc,c.fName FROM hk_Work A LEFT OUTER JOIN yh B ON(A.PromoterID=B.ui_id) LEFT OUTER JOIN hk_Form C ON(A.FK_fid=C.fID) WHERE A.FK_uid ='" + this.Session["userid"] + "'" + Str1 + " ORDER BY A.wID DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";

                Label ln = (Label)e.Row.FindControl("lblwID");
                Label ll = (Label)e.Row.FindControl("lbltxt");
                ll.Text = null;

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_Work WHERE wID='" + ln.Text + "'");
                if (dr.Read())
                {
                    ll.Text += "<a href='#' onclick='window.open (\"QueryWork_Exp.aspx?id=" + dr["wID"] + "\", \"_blank\", \"height=1, width=1,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=0,left=0\")' class='gvlink'>导出</a>";
                }
                dr.Close();

                SqlDataReader dr2 = SqlHelper.ExecuteReader("SELECT * FROM hk_Work WHERE wID='" + ln.Text + "' AND PromoterID='" + this.Session["userid"] + "' AND (wStatus='正在办理' OR wStatus='等待办理')");
                if (dr2.Read())
                {
                    ll.Text += "&nbsp;<a href='#' onclick='if (!confirm(\"您确定要结束此工作吗？\")) return false;window.open (\"QueryWork_Finish.aspx?id=" + dr2["wID"] + "\", \"_blank\", \"height=1, width=1,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=110,left=110\")' class='gvlink'>结束</a>&nbsp;<a href='#' onclick='window.open (\"QueryWork_Remind.aspx?id=" + dr2["wID"] + "\", \"_blank\", \"height=220, width=600,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=110,left=110\")' class='gvlink'>催办</a>";
                }
                dr2.Close();

                SqlDataReader dr3 = SqlHelper.ExecuteReader("SELECT * FROM hk_Work WHERE wID='" + ln.Text + "' AND PromoterID='" + this.Session["userid"] + "' AND wStatus='驳回审批'");
                if (dr3.Read())
                {
                    ll.Text += "&nbsp;<a href='AddWork_Add.aspx?FlowNumber=" + dr3["fk_wfno"].ToString() + "&FormID=" + dr3["fk_fid"].ToString() + "&wid=" + dr3["wid"].ToString() + "' class='gvlink'>重新发起</a>";
                }
                dr3.Close();
            }
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridviewBind();
        }

        protected void QueBtn_Click1(object sender, EventArgs e)
        {
            GridviewBind();
        }
    }
}
