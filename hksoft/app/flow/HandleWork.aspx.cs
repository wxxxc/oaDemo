using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.app.flow
{
    public partial class HandleWork : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                AspNetPager1.PageSize = 10;

                DropDownListBind();

                //绑定数据 
                ListViewBind();
            }
        }

        public void DropDownListBind()
        {
            string sql = "SELECT fID,fName FROM hk_Form ORDER BY fID DESC";
            bd.Bind_DropDownList(dp_fname, sql, "fID", "fName", "0", "所有表单类型");
        }

        public void ListViewBind()
        {
            string Str1 = " WHERE (CHARINDEX('," + this.Session["userid"].ToString() + ",',','+wUserIDs+',')>0)";

            //已经加签，且在待办人员中有除“8888-文书管理员”之外其它人员的时候，则不显示
            if (this.Session["UserID"].ToString() == "8888")
            {
                Str1 = Str1 + " AND (A.ynJQ='否' OR (A.ynJQ='是' AND wUserIDs='8888,'))";
            }

            if (dp_fname.SelectedValue != "0")
            {
                Str1 = Str1 + " and A.FK_fid ='" + dp_fname.SelectedValue + "'";
            }

            if (wTitle.Text != "")
            {
                Str1 = Str1 + " and A.wTitle like '%" + hkdb.GetStr(wTitle.Text) + "%'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM hk_Work A LEFT OUTER JOIN hk_Form B ON(A.FK_fid=B.fID) LEFT OUTER JOIN hk_WorkFlowNode C ON(A.FK_fnno=C.fnNo) " + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.wID,A.NextNodeID,A.FK_wfno,A.FK_fid,'['+B.fName+']'+A.wTitle AS wTitle,'当前步骤:'+A.NextNodeName AS NextNodeName,'发起人:'+D.ui_desc AS ui_desc FROM hk_Work A LEFT OUTER JOIN hk_Form B ON(A.FK_fid=B.fID) LEFT OUTER JOIN hk_WorkFlowNode C ON(A.FK_fnno=C.fnNo) LEFT OUTER JOIN yh D ON(A.PromoterID=D.ui_id) " + Str1 + " ORDER BY A.wID DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            ListView1.DataSource = ds;
            ListView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            ListViewBind();
        }

        protected void Query_Click(object sender, EventArgs e)
        {
            ListViewBind();
        }

        protected void rblBl_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblBl.SelectedValue == "y")
            {
                Server.Transfer("HandleWork_Finished.aspx");
            }
            else
            {
                Server.Transfer("HandleWork.aspx");
            }
        }
    }
}
