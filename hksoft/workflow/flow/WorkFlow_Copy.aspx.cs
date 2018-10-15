using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.flow
{
    public partial class WorkFlow_Copy : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                string sql_wfno = "SELECT wfNo,wfName FROM hk_WorkFlow WHERE wfNo!='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "' ORDER BY wfID DESC";
                bd.Bind_DropDownList(dp_wfno, sql_wfno, "wfNo", "wfName", "请选择", "请选择");
            }
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlow WHERE wfNo='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "'");
            if (dr.Read())
            {
                Random g = new Random();
                string rad = g.Next(10000).ToString();

                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowNode WHERE FK_wfno='" + dp_wfno.SelectedValue + "'");
                while (datar1.Read())
                {
                    SqlHelper.ExecuteSql("INSERT INTO hk_WorkFlowNode(ynEditAtt,ynDelAtt,NextNodeNum,FK_fid,FK_fno,FK_wfid,FK_wfno,fnNo,fnNum,fnName,LeftMargin,TopMargin,fnUserIDs,fnUserNames,fnDeptIDs,fnDeptNames,fnRoleIDs,fnRoleNames,ReviewMode,SelectMode,TimeLimit,ynEndAudi,FK_uid,FK_did,fnQxStr,FK_rid,AddTime,fnPosition) values ('" + datar1["ynEditAtt"].ToString() + "','" + datar1["ynDelAtt"].ToString() + "','" + datar1["NextNodeNum"].ToString() + "','" + dr["FK_fid"].ToString() + "','" + dr["FK_fno"].ToString() + "','" + dr["wfID"].ToString() + "','" + dr["wfNo"].ToString() + "','" + datar1["fnNo"].ToString() + rad + "','" + datar1["fnNum"].ToString() + "','" + datar1["fnName"].ToString() + "','" + datar1["LeftMargin"].ToString() + "','" + datar1["TopMargin"].ToString() + "','" + datar1["fnUserIDs"].ToString() + "','" + datar1["fnUserNames"].ToString() + "','" + datar1["fnDeptIDs"].ToString() + "','" + datar1["fnDeptNames"].ToString() + "','" + datar1["fnRoleIDs"].ToString() + "','" + datar1["fnRoleNames"].ToString() + "','" + datar1["ReviewMode"].ToString() + "','" + datar1["SelectMode"].ToString() + "','" + datar1["TimeLimit"].ToString() + "','" + datar1["ynEndAudi"].ToString() + "','" + this.Session["userid"] + "','" + this.Session["deptid"] + "','" + this.Session["deptqx"] + "','" + this.Session["roleid"] + "',GETDATE(),'" + datar1["fnPosition"].ToString() + "')");
                }
                datar1.Close();

                SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowNodeLine WHERE FK_wfno='" + dp_wfno.SelectedValue + "'");
                while (datar2.Read())
                {
                    SqlHelper.ExecuteSql("INSERT INTO hk_WorkFlowNodeLine(StartNum,EndNum,nlContent,FK_fnno,FK_wfno) values ('" + datar2["StartNum"].ToString() + "','" + datar2["EndNum"].ToString() + "','" + datar2["nlContent"].ToString() + "','" + datar2["FK_fnno"].ToString() + rad + "','" + dr["wfno"].ToString() + "')");
                }
                datar2.Close();
            }
            dr.Close();

            mydb.Alert_Refresh_Close("保存成功！","WorkFlow.aspx?FormId=" + hkdb.GetStr(Request.QueryString["FormId"]) + "");
        }
    }
}
