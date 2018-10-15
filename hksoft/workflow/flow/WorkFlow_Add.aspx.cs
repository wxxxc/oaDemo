using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.flow
{
    public partial class WorkFlow_Add : System.Web.UI.Page
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

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_Form WHERE fID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (dr.Read())
                {
                    fNo.Text = dr["fNo"].ToString();
                    dr.Close();
                    fName.SelectedValue = Request.QueryString["id"].ToString();
                }
                else
                {
                    dr.Close();
                    mydb.Alert_Close("请先选中左侧表单，再点击新建工作流！");
                    return;
                }
            }

            if (!IsPostBack)
            {
                Random g = new Random();
                string rad = g.Next(10000).ToString();
                wfNo.Text = "" + System.DateTime.Now.Year.ToString() + "" + System.DateTime.Now.Month.ToString() + "" + System.DateTime.Now.Day.ToString() + "" + System.DateTime.Now.Hour.ToString() + "" + System.DateTime.Now.Minute.ToString() + "" + System.DateTime.Now.Second.ToString() + "" + System.DateTime.Now.Millisecond.ToString() + "" + rad + "";
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

        //保存
        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("INSERT INTO hk_WorkFlow(wfStatus,FK_fid,FK_fno,wfNo,wfName,wfUserIDs,wfUserNames,wfDeptIDs,wfDeptNames,FK_uid,FK_did,wfQxStr,FK_rid,AddTime,FK_ffid,FileNo,FileStartNo,FileDigit,ynModFileNo) values ('" + wfStatus.SelectedValue + "','" + fName.SelectedValue + "','" + hkdb.GetStr(fNo.Text) + "','" + hkdb.GetStr(wfNo.Text) + "','" + hkdb.GetStr(wfName.Text) + "','" + hkdb.GetStr(wfUserIDs.Text) + "','" + hkdb.GetStr(wfUserNames.Text) + "','" + hkdb.GetStr(wfDeptIDs.Text) + "','" + hkdb.GetStr(wfDept.Text) + "','" + this.Session["userid"] + "','" + this.Session["deptid"] + "','" + this.Session["deptqx"] + "','" + this.Session["roleid"] + "',GETDATE(),'" + FK_ffid.SelectedValue + "','" + hkdb.GetStr(FileNo.Text) + "','" + hkdb.GetStr(FileStartNo.Text) + "','" + hkdb.GetStr(FileDigit.Text) + "','" + rb_ynModFileNo.SelectedValue + "')");
            mydb.Alert_Refresh_Close("保存成功！","WorkFlow.aspx?FormId=" + Request.QueryString["id"] + "");
        }

        //下一步设置节点
        protected void NextNodeBtn_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("INSERT INTO hk_WorkFlow(wfStatus,FK_fid,FK_fno,wfNo,wfName,wfUserIDs,wfUserNames,wfDeptIDs,wfDeptNames,FK_uid,FK_did,wfQxStr,FK_rid,AddTime,FK_ffid,FileNo,FileStartNo,FileDigit,ynModFileNo) values ('" + wfStatus.SelectedValue + "','" + fName.SelectedValue + "','" + hkdb.GetStr(fNo.Text) + "','" + hkdb.GetStr(wfNo.Text) + "','" + hkdb.GetStr(wfName.Text) + "','" + hkdb.GetStr(wfUserIDs.Text) + "','" + hkdb.GetStr(wfUserNames.Text) + "','" + hkdb.GetStr(wfDeptIDs.Text) + "','" + hkdb.GetStr(wfDept.Text) + "','" + this.Session["userid"] + "','" + this.Session["deptid"] + "','" + this.Session["deptqx"] + "','" + this.Session["roleid"] + "',GETDATE(),'" + FK_ffid.SelectedValue + "','" + hkdb.GetStr(FileNo.Text) + "','" + hkdb.GetStr(FileStartNo.Text) + "','" + hkdb.GetStr(FileDigit.Text) + "','" + rb_ynModFileNo.SelectedValue + "')");
            Response.Redirect("WorkFlow_Node.aspx?FlowNumber=" + wfNo.Text + "");
        }

        //下一步复制流程
        protected void NextCopyBtn_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("INSERT INTO hk_WorkFlow(wfStatus,FK_fid,FK_fno,wfNo,wfName,wfUserIDs,wfUserNames,wfDeptIDs,wfDeptNames,FK_uid,FK_did,wfQxStr,FK_rid,AddTime,FK_ffid,FileNo,FileStartNo,FileDigit,ynModFileNo) values ('" + wfStatus.SelectedValue + "','" + fName.SelectedValue + "','" + hkdb.GetStr(fNo.Text) + "','" + hkdb.GetStr(wfNo.Text) + "','" + hkdb.GetStr(wfName.Text) + "','" + hkdb.GetStr(wfUserIDs.Text) + "','" + hkdb.GetStr(wfUserNames.Text) + "','" + hkdb.GetStr(wfDeptIDs.Text) + "','" + hkdb.GetStr(wfDept.Text) + "','" + this.Session["userid"] + "','" + this.Session["deptid"] + "','" + this.Session["deptqx"] + "','" + this.Session["roleid"] + "',GETDATE(),'" + FK_ffid.SelectedValue + "','" + hkdb.GetStr(FileNo.Text) + "','" + hkdb.GetStr(FileStartNo.Text) + "','" + hkdb.GetStr(FileDigit.Text) + "','" + rb_ynModFileNo.SelectedValue + "')");
            Response.Redirect("WorkFlow_Copy.aspx?FlowNumber=" + wfNo.Text + "&FormId=" + Request.QueryString["id"] + "");
        }
    }
}
