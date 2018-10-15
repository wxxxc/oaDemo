using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.flow
{
    public partial class WorkFlow_Node_Branch : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static string strlist, SqlStr;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                BindAttr();

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowNode WHERE fnID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (dr.Read())
                {
                    fnNum.Text = dr["fnNum"].ToString();
                    fnName.Text = dr["fnName"].ToString();
                    lblwfno.Text = dr["FK_wfno"].ToString();
                    lblfno.Text = dr["FK_fno"].ToString();
                    strlist = "" + dr["NextNodeNum"].ToString() + "0";
                }
                dr.Close();

                string sql_dpStep = "SELECT fnID,fnName FROM hk_WorkFlowNode WHERE fnNum IN (" + strlist + ") AND FK_wfno='" + lblwfno.Text + "'";
                bd.Bind_DropDownList(dpStep, sql_dpStep, "fnID", "fnName", "请选择", "请选择");
            }

            if (dpStep.SelectedValue != "请选择")
            {
                GridVidwBind("WHERE fbTofnid='" + dpStep.SelectedValue + "' AND FK_fnid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            }
            else
            {
                GridVidwBind("WHERE fbTofnid='0'");
            }
        }

        public void BindAttr()
        {
            fnNum.Attributes.Add("readonly", "readonly");
            fnName.Attributes.Add("readonly", "readonly");
            AddBtn.Attributes["onclick"] = "javascript:return addbranch();";
        }

        public void GridVidwBind(string strSql)
        {
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM hk_WorkFlowBranch " + strSql + " ");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //增加
        protected void AddBtn_Click(object sender, EventArgs e)
        {
            mydb.Alert_Reload_Close("保存成功");
        }

        protected void OnRow_Command(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "del")
            {
                int ID = Convert.ToInt32(e.CommandArgument);

                SqlHelper.ExecuteSql("DELETE FROM hk_WorkFlowBranch WHERE fbID='" + ID + "'");
                GridVidwBind(" WHERE fbTofnid='" + dpStep.SelectedValue + "' AND FK_fnid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            }
        }

        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";      //单击变色

                LinkButton ld = (LinkButton)e.Row.FindControl("LBtn_Del");
                ld.Attributes.Add("onclick", "javascript:return confirm('您确认要删除该字段的条件[" + e.Row.Cells[0].Text.ToString() + "]吗？')");

                LinkButton lm = (LinkButton)e.Row.FindControl("LBtn_Mod");
                
                //非IE
                //lm.Attributes.Add("onclick", "var num=Math.random();window.open('WorkFlow_Node_Branch_Mod.aspx?tmp=' + num + '&id=" + lm.CommandArgument + "','window','height=200,width=450,top=150,left=300,toolbar=no,menubar=no,scrollbars=no, resizable=yes,location=no, status=no');window.location='#'");
                //IE
                lm.Attributes.Add("onclick", "var num=Math.random();window.showModalDialog('WorkFlow_Node_Branch_Mod.aspx?tmp=' + num + '&id=" + lm.CommandArgument + "','window','dialogWidth:460px;DialogHeight=280px;status:no;help=no;scroll=no');window.location='#'");
            }
        }
    }
}
