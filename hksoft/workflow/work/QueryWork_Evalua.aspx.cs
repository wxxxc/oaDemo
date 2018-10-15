using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class QueryWork_Evalua : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static string strfName, strfnName , Name;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT A.*,B.fName FROM hk_Work A LEFT OUTER JOIN hk_Form B ON (A.FK_fid=B.fID) WHERE wID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (datar1.Read())
                {
                    strfnName = datar1["NextNodeName"].ToString();
                    Number.Text = datar1["wNo"].ToString();
                    Name = datar1["wName"].ToString();
                    strfName = datar1["fName"].ToString();
                }
                datar1.Close();
            }

            //审批备注
            if (!IsPostBack)
            {
                string sql_appcomm = "SELECT nr FROM hk_Cyy WHERE fl='02' and zt='正常' and cjr='" + this.Session["UserID"] + "'";
                bd.Bind_DropDownList(dp_appcomm, sql_appcomm, "nr", "nr", "请选择", "请选择");
            }
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            string strBaseLocation = Server.MapPath("../../Attach/flow/work/");
            string TruePath = string.Empty;
            string Temp1 = string.Empty;

            if (uploadFile.PostedFile.ContentLength != 0)
            {
                string fileName = System.IO.Path.GetFileName(uploadFile.PostedFile.FileName);
                string extName = System.IO.Path.GetExtension(fileName);

                Random g = new Random();
                string rad = g.Next(10000).ToString();
                Temp1 = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString() + rad;
                uploadFile.PostedFile.SaveAs(strBaseLocation + Temp1 + extName);
                TruePath = Temp1 + extName;

                SqlHelper.ExecuteSql("INSERT INTO hk_WorkAppComm(ac_wfID,ac_fName,ac_wfName,acContent,acAttName,acAttNewName,FK_uid,AddTime) values ('" + hkdb.GetStr(Request.QueryString["id"]) + "','" + strfnName + "','" + Name + "','" + hkdb.GetStr(txt_AppComm.Text) + "','" + fileName + "','" + TruePath + "','" + this.Session["userid"] + "',GETDATE())");
            }
            else
            {
                if (txt_AppComm.Text.Trim() == "")
                {

                }
                else
                {
                    SqlHelper.ExecuteSql("INSERT INTO hk_WorkAppComm(ac_wfID,ac_fName,ac_wfName,acContent,acAttName,acAttNewName,FK_uid,AddTime) values ('" + hkdb.GetStr(Request.QueryString["id"]) + "','" + strfnName + "','" + Name + "','" + hkdb.GetStr(txt_AppComm.Text) + "','','','" + this.Session["userid"] + "',GETDATE())");
                }
            }

            mydb.Alert_Close("保存成功！");
        }
    }
}
