using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.flow
{
    public partial class WorkFlow_Seal : System.Web.UI.Page
    {
        mydb hkdb = new mydb(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                BindAttr();

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlow WHERE wfNo='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "'");
                if (dr.Read())
                {
                    lblfid.Text = dr["FK_fid"].ToString();
                    lblwfid.Text = dr["wfID"].ToString();
                }
                dr.Close();
            }

            GridviewBind();
        }

        public void BindAttr()
        {
            AddBtn.Attributes["onclick"] = "javascript:return addseal();";
        }

        public void GridviewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM hk_WorkFlowSeal WHERE FK_wfno='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "' ORDER BY fsID DESC");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //增加
        protected void AddBtn_Click(object sender, EventArgs e)
        {
            mydb.Alert_Reload_Close("提交成功");
        }

        protected void OnRow_Command(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "del")
            {
                int ID = Convert.ToInt32(e.CommandArgument);
                SqlHelper.ExecuteSql("DELETE FROM hk_WorkFlowSeal WHERE fsID='" + ID + "'");
                GridviewBind();
            }
        }

        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";      //单击变色

                LinkButton ld = (LinkButton)e.Row.FindControl("LBtn_Del");
                ld.Attributes.Add("onclick", "javascript:return confirm('您确认要删除[" + e.Row.Cells[0].Text.ToString() + "]印章域吗？')");
                LinkButton lm = (LinkButton)e.Row.FindControl("LBtn_Mod");
                
                //非IE
                //lm.Attributes.Add("onclick", "var num=Math.random();window.open('WorkFlow_Seal_Mod.aspx?tmp=' + num + '&id=" + lm.CommandArgument + "','window','height=200,width=450,top=150,left=300,toolbar=no,menubar=no,scrollbars=no, resizable=yes,location=no, status=no');window.location='#'");
                //IE
                lm.Attributes.Add("onclick", "var num=Math.random();window.showModalDialog('WorkFlow_Seal_Mod.aspx?tmp=' + num + '&id=" + lm.CommandArgument + "','window','dialogWidth:450px;DialogHeight=200px;status:no;help=no;scroll=no');window.location='#'");
            }
        }
    }
}
