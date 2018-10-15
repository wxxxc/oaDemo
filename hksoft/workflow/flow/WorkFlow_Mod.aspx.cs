using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.flow
{
    public partial class WorkFlow_Mod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                BindDplist();
                BindAttr();

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlow WHERE wfID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (dr.Read())
                {
                    fNo.Text = dr["FK_fno"].ToString();
                    fName.SelectedValue = dr["FK_fid"].ToString();
                    wfNo.Text = dr["wfNo"].ToString();
                    wfStatus.SelectedValue = dr["wfStatus"].ToString();
                    wfName.Text = dr["wfName"].ToString();
                    wfUserIDs.Text = dr["wfUserIDs"].ToString();
                    wfUserNames.Text = dr["wfUserNames"].ToString();
                    wfDeptIDs.Text = dr["wfDeptIDs"].ToString();
                    wfDept.Text = dr["wfDeptNames"].ToString();
                    FK_ffid.SelectedValue = dr["FK_ffid"].ToString();
                    FileNo.Text = dr["FileNo"].ToString();
                    FileStartNo.Text = dr["FileStartNo"].ToString();
                    FileDigit.Text = dr["FileDigit"].ToString();
                    rb_ynModFileNo.SelectedValue = dr["ynModFileNo"].ToString();
                }
                dr.Close();
            }
        }

        public void BindDplist()
        {
            //流程表单
            string sql_fName = "SELECT fID,fName FROM hk_Form ORDER BY fID DESC";
            bd.Bind_DropDownList_NoBlank(fName, sql_fName, "fID", "fName", "", "");

            //归档文件夹
            if (!IsPostBack)
            {
                string sql_ffid = "SELECT ffID,ffLine+ffName AS ffName FROM hk_WorkFlowFolder ORDER BY ffQxStr ASC";
                bd.Bind_DropDownList(FK_ffid, sql_ffid, "ffID", "ffName", "0", "不归档");
            }
        }

        public void BindAttr()
        {
            wfUserNames.Attributes.Add("readonly", "readonly");
            wfDept.Attributes.Add("readonly", "readonly");
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE hk_WorkFlow SET FileNo='" + hkdb.GetStr(FileNo.Text) + "',FileStartNo='" + hkdb.GetStr(FileStartNo.Text) + "',FileDigit='" + hkdb.GetStr(FileDigit.Text) + "',ynModFileNo='" + rb_ynModFileNo.SelectedValue + "',wfStatus='" + wfStatus.SelectedValue + "',wfName='" + hkdb.GetStr(wfName.Text) + "',wfUserIDs='" + hkdb.GetStr(wfUserIDs.Text) + "',wfUserNames='" + hkdb.GetStr(wfUserNames.Text) + "',wfDeptIDs='" + hkdb.GetStr(wfDeptIDs.Text) + "',wfDeptNames='" + hkdb.GetStr(wfDept.Text) + "',FK_ffid='" + hkdb.GetStr(FK_ffid.SelectedValue) + "' WHERE wfID='" + int.Parse(Request.QueryString["id"]) + "' ");
            SqlHelper.ExecuteSql("UPDATE hk_Work SET MoniUserIDs='" + hkdb.GetStr(wfUserIDs.Text) + "',MoniUserNames='" + hkdb.GetStr(wfUserNames.Text) + "' WHERE FK_wfid='" + int.Parse(Request.QueryString["id"]) + "'  ");
            
            mydb.Alert_Reload_Close("保存成功");
        }
    }
}
