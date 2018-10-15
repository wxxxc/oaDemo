using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class HandleWork_Jq : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static string strfnName, Name;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                //短信
                dxtz.Visible = Convert.ToBoolean(hkdb.VeriSms());

                BindAttr();

                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT A.* FROM hk_Work A WHERE wID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (datar1.Read())
                {
                    lbltitle.Text = datar1["wTitle"].ToString();
                    strfnName = datar1["NextNodeName"].ToString();
                    Name = datar1["wName"].ToString();
                    UserID.Text = datar1["AttentUserIDs"].ToString();
                    UserName.Text = datar1["AttentUserNames"].ToString();
                }
                datar1.Close();

                //我的常用语
                string sql_appcomm = "SELECT nr FROM hk_Cyy WHERE fl='02' and zt='正常' and cjr='" + this.Session["UserID"] + "'";
                bd.Bind_DropDownList(dp_appcomm, sql_appcomm, "nr", "nr", "请选择", "请选择");
            }
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //更新工作记录
            SqlHelper.ExecuteSql("UPDATE hk_Work SET wUserIDs=wUserIDs+'" + hkdb.GetStr(UserID.Text) + "',wUserNames=wUserNames+'" + hkdb.GetStr(UserName.Text) + "',ynJQ='是' WHERE wID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");

            //记录审批意见
            SqlHelper.ExecuteSql("INSERT INTO hk_WorkAppComm(ac_wfID,ac_fName,ac_wfName,acContent,acAttName,acAttNewName,FK_uid,AddTime,ac_type) values ('" + hkdb.GetStr(Request.QueryString["id"]) + "','" + strfnName + "','" + Name + "','" + hkdb.GetStr(txt_AppComm.Text) + "','','','" + this.Session["userid"] + "',GETDATE(),'加签')");

            //Msg 
            if (xxtz.Checked == true | dxtz.Checked == true)
            {
                string message = this.Session["username"].ToString() + "加签给您一条标题为【" + lbltitle.Text + "】工作记录,请审批!";
                hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), UserID.Text, message);
            }

            mydb.Alert_Refresh_Close("加签成功！","HandleWork.aspx");
        }
    }
}
