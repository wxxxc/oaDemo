using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class QueryWork : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static string SqlStrStart, SqlStrMid, SqlStr, SqlStrStartCount, SqlStrCount;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            SqlHelper.ExecuteSql("DELETE FROM hk_Work WHERE wStatus='等待送审' AND PromoterID='" + this.Session["UserID"].ToString() + "'");

            if (!IsPostBack)
            {
                hkdb.PassTo("11403", "11403");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                BindDplist();

                DataBindToGridview(CreateMidSql());
            }
        }

        //组合查询SQL
        public string CreateMidSql()
        {
            string MidSql = string.Empty;

            //只要参与流程环节的经办人员（包括经办部门、经办角色下的人员）就能看到相应记录
            //MidSql = MidSql + " AND (A.FK_wfid IN(SELECT DISTINCT FK_wfid FROM hk_WorkFlowNode WHERE fnUserIDs<>'0' AND fnUserIDs<>'' AND CHARINDEX('" + this.Session["UserID"] + "',fnUserIDs)>0) OR A.FK_wfid IN(SELECT DISTINCT fk_wfid FROM hk_WorkFlowNode WHERE fnDeptNames<>'未设置' AND fnDeptNames<>'' AND CHARINDEX('" + this.Session["deptname"] + "',fnDeptNames)>0) OR A.FK_wfid IN(SELECT DISTINCT fk_wfid FROM hk_WorkFlowNode WHERE fnRoleNames<>'未设置' AND fnRoleNames<>'' AND CHARINDEX('" + Server.UrlDecode(Request.Cookies["haoke"].Values["rolename"].ToString()) + "',fnRoleNames)>0))";
            
            //只要已经作过待办审批的人员或者转发的人员，才能看到相应记录
            MidSql = MidSql + " AND (CHARINDEX('" + this.Session["UserID"] + "',A.EndUserIDs)>0 OR CHARINDEX('" + this.Session["UserID"] + "',A.AttentUserIDs)>0)";

            if (txt_fName.SelectedValue != "0")
            {
                MidSql = MidSql + " AND A.FK_fid ='" + txt_fName.SelectedValue + "'";
            }

            if (txt_wSerialNo.Text.Trim() != "")
            {
                MidSql = MidSql + " AND A.wSerialNo = '" + hkdb.GetStr(txt_wSerialNo.Text) + "'";
            }

            if (txt_wStatus.SelectedValue != "所有类型")
            {
                MidSql = MidSql + " AND A.wStatus= '" + txt_wStatus.SelectedValue + "'";
            }

            if (txt_PromoterName.Text != "")
            {
                MidSql = MidSql + " AND B.ui_desc LIKE '%" + hkdb.GetStr(txt_PromoterName.Text) + "%'";
            }

            if (Name.Text != "")
            {
                MidSql = MidSql + " AND A.wName LIKE '%" + hkdb.GetStr(Name.Text) + "%'";
            }

            if (txt_sdate.Text != "" && txt_edate.Text != "")
            {
                MidSql = MidSql + " AND (A.AddTime BETWEEN '" + hkdb.GetStr(txt_sdate.Text) + "' AND '" + hkdb.GetStr(txt_edate.Text) + "' OR convert(char(10),cast(A.AddTime as datetime),120)=convert(char(10),cast('" + txt_sdate.Text + "' as datetime),120) or convert(char(10),cast(A.AddTime as datetime),120)=convert(char(10),cast('" + txt_edate.Text + "' as datetime),120) ) ";
            }

            if (wTitle.Text != "")
            {
                MidSql = MidSql + " AND A.wTitle LIKE '%" + hkdb.GetStr(wTitle.Text) + "%'";
            }

            if (!string.IsNullOrEmpty(fqbm.SelectedValue))
            {
                //递归全部下级
                string cal1 = "";
                SqlDataReader datar1 = SqlHelper.ExecuteReader("EXEC sp_RECUR_BM '" + fqbm.SelectedValue + "'");
                while (datar1.Read())
                {
                    if (string.IsNullOrEmpty(cal1))
                    {
                        cal1 = datar1["bm_id"].ToString();
                    }
                    else
                    {
                        cal1 = cal1 + "','" + datar1["bm_id"].ToString();
                    }
                }
                datar1.Close();

                MidSql = MidSql + "  AND A.PromoterID IN(SELECT UI_ID FROM YH WHERE UI_SSBM IN('" + cal1 + "'))";
            }

            return MidSql;
        }

        public void BindDplist()
        {
            string sql_fname = "SELECT fID,fName FROM hk_Form ORDER BY fID DESC";
            bd.Bind_DropDownList(txt_fName, sql_fname, "fID", "fName", "0", "所有表单类型");

            //绑定部门
            bd.Bind_DropDownList_bm(fqbm, "", "", "");
        }

        public void DataBindToGridview(string Searchstr)
        {
            SqlStrStart = "SELECT A.*,B.ui_desc AS PromoterName,C.fName FROM hk_Work A LEFT OUTER JOIN yh B ON (A.PromoterID=B.ui_id) LEFT OUTER JOIN hk_Form C ON(A.FK_fid=C.fID) WHERE 1=1";
            SqlStrStartCount = "SELECT COUNT(*) FROM hk_Work A LEFT OUTER JOIN yh B ON (A.PromoterID=B.ui_id) WHERE  1=1";

            SqlStrMid = string.Empty;
            SqlStrMid = Searchstr;
            SqlStr = SqlStrStart + SqlStrMid;
            SqlStrCount = SqlStrStartCount + SqlStrMid;

            //排序条件
            string pxtj = " ORDER BY " + pxtj1.SelectedValue + " " + pxtj2.SelectedValue;

            string SQL_GetList_xs = "" + SqlStr + " " + pxtj + "";
            string SQL_GetCount = SqlStrCount;

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar(SQL_GetCount);
            DataSet ds = SqlHelper.ExecuteDs(SQL_GetList_xs, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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

                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_Work WHERE (CHARINDEX('," + this.Session["userid"].ToString() + ",',','+wUserIDs+',') > 0) AND wID='" + ln.Text + "' ");
                if (datar1.Read())
                {
                    ll.Text += "<a href='HandleWork_EnTrust.aspx?id=" + datar1["wID"] + "' class='gvlink'>委托</a>&nbsp;";
                }
                datar1.Close();

                SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT * FROM hk_Work WHERE wID='" + ln.Text + "'");
                if (datar2.Read())
                {
                    ll.Text += "<a href='#' onclick='window.open (\"QueryWork_Evalua.aspx?id=" + datar2["wID"] + "\", \"_blank\", \"height=250, width=600,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=110,left=110\")' class='gvlink'>追加审批</a>&nbsp;<a href='#' onclick='window.open (\"QueryWork_Zf.aspx?id=" + datar2["wID"] + "\", \"_blank\", \"height=300, width=600,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=110,left=110\")' class='gvlink'>转发</a>&nbsp;<a href='#' onclick='window.open (\"QueryWork_Exp.aspx?id=" + datar2["wID"] + "\", \"_blank\", \"height=1, width=1,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=0,left=0\")' class='gvlink'>导出</a>";
                }
                datar2.Close();
            }
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            DataBindToGridview(CreateMidSql());
        }

        protected void QueBtn_Click1(object sender, EventArgs e)
        {
            DataBindToGridview(CreateMidSql());
        }
    }
}
