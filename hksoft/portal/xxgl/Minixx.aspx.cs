using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.portal.xxgl
{
    public partial class Minixx : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10101,1001", "0");

                BindAttr();

                if (Request.QueryString["lx"] == "g")
                {
                    SqlDataReader dr = SqlHelper.ExecuteReader("SELECT TOP 1 UI_ID,UI_DESC FROM YH A LEFT OUTER JOIN YH_SCM B ON(A.UI_ID=B.SSYHID) WHERE UI_GYS='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                    if (dr.Read())
                    {
                        UserID.Text = dr["ui_id"].ToString();
                        UserName.Text = dr["ui_desc"].ToString();
                        dr.Close();
                    }
                    else
                    {
                        dr.Close();
                        mydb.Alert_Close("该供应商没有可用帐号，不能发送消息！");
                    }
                }
                else
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                    {
                        UserID.Text = Request.QueryString["id"];
                        UserName.Text = Request.QueryString["mc"];
                    }
                }
            }
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");
        }

        //发送程序 
        protected void Send_Click(object sender, EventArgs e)
        {
            string upstr = nr.Text.Replace("'", "''");
            SqlHelper.ExecuteSql("EXEC sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + hkdb.GetStr(UserID.Text).TrimEnd(',') + "','" + hkdb.GetStr(upstr) + "'");

            UserID.Text = "";
            UserName.Text = "";
            nr.Text = "";

            mydb.Alert_Close("消息发送成功！");
        }
    }
}
