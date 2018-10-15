using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Jqfzsd_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11711", "0");

                BindAttr();

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM OA_KQ_JQFZ WHERE JQID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        jqnf.Text = string.Format("{0:yyyy}", datar["jqnf"]);
                        jqmc.Text = datar["jqmc"].ToString();
                        shjts.Text = datar["shjts"].ToString();
                        bjts.Text = datar["bjts"].ToString();
                        UserName.Text = datar["UserNames"].ToString();
                        UserID.Text = datar["UserIDs"].ToString();
                        jqsm.Text = datar["jqsm"].ToString();
                        datar.Close();

                        jqnf.Enabled = false;
                    }
                    else
                    {
                        datar.Close();
                        mydb.Alert_Close("此记录不存在,可能已被删除！");
                    }
                }
                else
                {
                    lbltitle.Text = "新增";
                    SaveAddBtn.Visible = true;
                }
            }
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");
        }

        //清空 
        protected void Clear_Click()
        {
            jqnf.Text = "";
            jqmc.Text = "";
            shjts.Text = "";
            bjts.Text = "";
            UserID.Text = "";
            UserName.Text = "";
            jqsm.Text = "";
        }

        //保存 
        protected void Save_Click(object sender, EventArgs e)
        {
            if (lbltitle.Text == "新增")
            {
                SqlHelper.ExecuteSql("INSERT INTO OA_KQ_JQFZ(JQNF,JQMC,SHJTS,BJTS,UserIDs,UserNames,JQSM,CJR,CJSJ) values('" + hkdb.GetStr(jqnf.Text) + "-01-01','" + hkdb.GetStr(jqmc.Text) + "','" + hkdb.GetStr(shjts.Text) + "','" + hkdb.GetStr(bjts.Text) + "','" + hkdb.GetStr(UserID.Text) + "','" + hkdb.GetStr(UserName.Text) + "','" + hkdb.GetStr(jqsm.Text) + "','" + this.Session["userid"] + "',GETDATE())");
            }
            else
            {
                SqlHelper.ExecuteSql("UPDATE OA_KQ_JQFZ SET JQMC='" + hkdb.GetStr(jqmc.Text) + "',SHJTS='" + hkdb.GetStr(shjts.Text) + "',BJTS='" + hkdb.GetStr(bjts.Text) + "',UserIDs='" + hkdb.GetStr(UserID.Text) + "',UserNames='" + hkdb.GetStr(UserName.Text) + "',JQSM='" + hkdb.GetStr(jqsm.Text) + "',XGR='" + this.Session["userid"] + "',XGSJ=GETDATE() WHERE JQID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            }

            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                Clear_Click();
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Jqfzsd.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！","Jqfzsd.aspx");
            }
        }
    }
}
