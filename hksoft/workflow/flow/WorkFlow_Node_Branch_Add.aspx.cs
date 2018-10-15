using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.workflow.flow
{
    public partial class WorkFlow_Node_Branch_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                BindAttr();
            }

            if (!IsPostBack)
            {
                KeyID.Text = Request.QueryString["KeyID"];

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.*,B.fName,C.wfName FROM hk_WorkFlowNode A LEFT OUTER JOIN hk_Form B ON(A.FK_fid=B.fID) LEFT OUTER JOIN hk_WorkFlow C ON(A.FK_wfid=C.wfID) WHERE fnID='" + hkdb.GetStr(Request.QueryString["FlowId"]) + "'");
                if (dr.Read())
                {
                    FormNumber.Text = dr["FK_fno"].ToString();
                    lblfid.Text = dr["FK_fid"].ToString();
                    lblfname.Text = dr["fName"].ToString();
                    lblwfid.Text = dr["FK_wfid"].ToString();
                    lblwfno.Text = dr["FK_wfno"].ToString();
                    lblwfname.Text = dr["wfName"].ToString();
                }
                dr.Close();
            }
        }

        public void BindAttr()
        {
            fbName.Attributes.Add("readonly", "readonly");
            fbType.Attributes.Add("readonly", "readonly");

            SaveBtn.Attributes["onclick"] = "javascript:return chknull();";
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("INSERT INTO hk_WorkFlowBranch(FK_fid,FK_fno,FK_wfid,FK_wfno,fbTofnid,fbNo,fbName,fbType,fbCondi,fbValue,FK_fnid) values ('" + lblfid.Text + "','" + hkdb.GetStr(FormNumber.Text) + "','" + lblwfid.Text + "','" + lblwfno.Text + "','" + hkdb.GetStr(KeyID.Text) + "','" + lblno.Text + "','" + hkdb.GetStr(fbName.Text) + "','" + hkdb.GetStr(fbType.Text) + "','" + fbCondi.SelectedValue + "','" + hkdb.GetStr(fbValue.Text) + "','" + hkdb.GetStr(Request.QueryString["FlowId"]) + "')");
            mydb.Alert_Close("保存成功！");
        }
    }
}
