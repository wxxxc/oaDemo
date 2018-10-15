using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.khgl
{
    public partial class Khhf01_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11702", "0");

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";
                    SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KHDA01 where khid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        gmr.Text = datar["gmr"].ToString();
                        sf.Text = datar["sf"].ToString();
                        cs.Text = datar["cs"].ToString();
                        gmrdh.Text = datar["gmrdh"].ToString();
                        gmrdw.Text = datar["gmrdw"].ToString();
                        gmrbs.Text = datar["gmrbs"].ToString();
                        gmrzw.Text = datar["gmrzw"].ToString();
                        gmrq.Text = string.Format("{0:d}", datar["gmrq"]);
                        spmc.Text = datar["spmc"].ToString();
                        gmsl.Text = datar["gmsl"].ToString();
                        email.Text = datar["email"].ToString();
                        yzdz.Text = datar["yzdz"].ToString();
                        gmbz.Text = datar["gmbz"].ToString();
                        syr.Text = datar["syr"].ToString();
                        syrdh.Text = datar["syrdh"].ToString();
                        syrdz.Text = datar["syrdz"].ToString();
                        syrdw.Text = datar["syrdw"].ToString();
                        sjzg.Text = datar["sjzg"].ToString();
                        sybz.Text = datar["sybz"].ToString();

                        RBL1hfqk.SelectedValue = datar["hfqk1"].ToString();
                        RBL2hfqk.SelectedValue = datar["hfqk2"].ToString();
                        RBL3hfqk.SelectedValue = datar["hfqk3"].ToString();
                        datar.Close();
                    }
                    else
                    {
                        datar.Close();
                        mydb.Alert("此记录不存在,可能已被删除！");
                    }
                }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string s = btn.ID;

            if (!string.IsNullOrEmpty(RBL1hfqk.SelectedValue))
            {
                SqlHelper.ExecuteSql("update OA_KHDA01 set hfqk1 ='" + RBL1hfqk.SelectedValue + "', hfr1= '" + this.Session["userid"] + "', hfsj1 =GETDATE() where khid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            }

            if (!string.IsNullOrEmpty(RBL2hfqk.SelectedValue))
            {
                SqlHelper.ExecuteSql("update OA_KHDA01 set hfqk2 ='" + RBL2hfqk.SelectedValue + "', hfr2= '" + this.Session["userid"] + "', hfsj2 =GETDATE() where khid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            }

            if (!string.IsNullOrEmpty(RBL3hfqk.SelectedValue))
            {
                SqlHelper.ExecuteSql("update OA_KHDA01 set hfqk3 ='" + RBL3hfqk.SelectedValue + "', hfr3= '" + this.Session["userid"] + "', hfsj3 =GETDATE() where khid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            }

            //判断btn 
            if (s == "SaveBtn")
            {
                mydb.Alert_Refresh_Close("保存成功！", "Khhf01.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！", "Khhf01.aspx");
            }

        }

    }
}
