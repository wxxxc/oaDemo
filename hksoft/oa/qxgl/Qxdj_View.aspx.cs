using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.qxgl
{
    public partial class Qxdj_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11723", "0");

                BindAttr();

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";
                    SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_QXDJ where djid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        bt.Text = datar["bt"].ToString();
                        kssj.Text = string.Format("{0:yyyy-MM-dd HH:mm:ss}", datar["kssj"]);
                        jzsj.Text = string.Format("{0:yyyy-MM-dd HH:mm:ss}", datar["jzsj"]);
                        UserName.Text = datar["wcrNames"].ToString();
                        UserID.Text = datar["wcrIDs"].ToString();
                        lxff.Text = datar["lxff"].ToString();
                        sm.Text = datar["sm"].ToString();
                        datar.Close();
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
                }
            }
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (lbltitle.Text == "新增")
            {
                SqlHelper.ExecuteSql("insert into OA_QXDJ(kssj,jzsj,bt,sm,lxff,wcrIDs,wcrNames,djr,djsj) values('" + hkdb.GetStr(kssj.Text) + "','" + hkdb.GetStr(jzsj.Text) + "','" + hkdb.GetStr(bt.Text) + "','" + hkdb.GetStr(sm.Text) + "','" + hkdb.GetStr(lxff.Text) + "','" + hkdb.GetStr(UserID.Text) + "','" + hkdb.GetStr(UserName.Text) + "','" + this.Session["userid"] + "',getdate())");
            }
            else
            {
                SqlHelper.ExecuteSql("update OA_QXDJ set kssj='" + hkdb.GetStr(kssj.Text) + "',jzsj='" + hkdb.GetStr(jzsj.Text) + "',bt='" + hkdb.GetStr(bt.Text) + "',sm='" + hkdb.GetStr(sm.Text) + "',lxff='" + hkdb.GetStr(lxff.Text) + "',wcrIDs='" + hkdb.GetStr(UserID.Text) + "',wcrNames='" + hkdb.GetStr(UserName.Text) + "' where djid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            }

            mydb.Alert_Refresh_Close("保存成功！", "Qxdj.aspx");
        }
    }
}
