using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.flow
{
    public partial class WorkFlow_Seal_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                BindAttr();
            }

            if (!IsPostBack)
            {
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlow WHERE wfNo='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "'");
                if (dr.Read())
                {
                    lblfid.Text = dr["FK_fid"].ToString();
                    lblfno.Text = dr["FK_fno"].ToString();
                    lblwfid.Text = dr["wfID"].ToString();
                }
                dr.Close();

                //电子印章
                string sql_seal = "SELECT clNo,clName FROM hk_FormColumn WHERE FK_fno='" + lblfno.Text + "'AND clType='[电子印章]'";
                bd.Bind_DropDownList(sealarea, sql_seal, "clNo", "clName", "请选择", "请选择");
            }
        }

        public void BindAttr()
        {
            chUserNames.Attributes.Add("readonly", "readonly");
            SaveBtn.Attributes["onclick"] = "javascript:return chknull();";
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("INSERT INTO hk_WorkFlowSeal(FK_fid,FK_fno,FK_wfid,FK_wfno,fsNo,fsName,fsUserIDs,fsUserNames) values ('" + lblfid.Text + "','" + lblfno.Text + "','" + lblwfid.Text + "','" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "','" + sealarea.SelectedValue + "','" + sealarea.SelectedItem.Text + "','" + hkdb.GetStr(chUserIDs.Text) + "','" + hkdb.GetStr(chUserNames.Text) + "')");
            mydb.Alert_Close("保存成功！");
        }
    }
}
