using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class HandleWork_EnTrust : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public static string strfnName, Name, strwUserIDs, strwUserNames;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                BindAttr();

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_Work WHERE wID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (dr.Read())
                {
                    Name = dr["wName"].ToString();
                    strfnName = dr["NextNodeName"].ToString();
                    strwUserIDs = dr["wUserIDs"].ToString().Replace("" + this.Session["userid"].ToString() + ",", "");
                    strwUserNames = dr["wUserNames"].ToString().Replace("" + this.Session["username"].ToString() + ",", "");
                }
                dr.Close();
            }
        }

        public void BindAttr()
        {
            txt_EnUserName.Attributes.Add("readonly", "readonly");
            SaveBtn.Attributes["onclick"] = "javascript:return chknull();";
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE hk_Work SET wUserIDs='" + hkdb.GetStr(txt_EnUserID.Text) + "," + strwUserIDs + "',wUserNames='" + hkdb.GetStr(txt_EnUserName.Text) + "," + strwUserNames + "' WHERE wID='" + int.Parse(Request.QueryString["id"]) + "'");
            
            SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_Work WHERE wID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            if (datar1.Read())
            {
                SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkEnTrust WHERE etNo='" + datar1["wNo"] + "' AND FK_uid='" + this.Session["userid"] + "'");
                if (!datar2.Read())
                {
                    SqlHelper.ExecuteSql("INSERT INTO hk_WorkEnTrust(FK_fid,FK_fno,FK_wfid,FK_wfno,FK_fnno,FK_fnnum,etNo,etSerialNo,etName,etContent,etPromoterID,etEndUserIDs,etEndUserNames,FK_uid,AddTime,etStatus,etUserID,etTitle) values ('" + datar1["FK_fid"] + "','" + datar1["FK_fno"] + "','" + datar1["FK_wfid"] + "','" + datar1["FK_wfno"] + "','" + datar1["NextNodeNo"] + "','" + datar1["NextNodeNum"] + "','" + datar1["wNo"] + "','" + datar1["wSerialNo"] + "','" + datar1["wName"] + "','" + datar1["wContent"] + "','" + datar1["PromoterID"] + "','" + datar1["EndUserIDs"] + "','" + datar1["EndUserNames"] + "','" + this.Session["userid"] + "',GETDATE(),'等待办理','" + hkdb.GetStr(txt_EnUserID.Text) + "','" + datar1["wTitle"] + "')");
                }
                datar2.Close();
            }
            datar1.Close();

            SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + hkdb.GetStr(txt_EnUserID.Text) + "','委托工作：[" + Name + "]需要办理，委托人[" + this.Session["username"].ToString() + "]'");
            mydb.Alert_Goto("委托成功！", "HandleWork.aspx");
        }
    }
}
