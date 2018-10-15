using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.khgl
{
    public partial class Khwh01_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11701", "0");

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";
                    SaveAddBtn.Visible = false;
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

                        Labelhfr1.Text = datar["hfr1"].ToString();
                        Labelhfqk1.Text = datar["hfqk1"].ToString();
                        Labelhfqk2.Text = datar["hfqk2"].ToString();
                        Labelhfqk3.Text = datar["hfqk3"].ToString();
                        Labelhfsj2.Text = string.Format("{0:d}", datar["hfsj2"]);
                        Labelhfsj3.Text = string.Format("{0:d}", datar["hfsj3"]);
                        Labelhfsj1.Text = string.Format("{0:d}", datar["hfsj1"]);
                        Labelhfr2.Text = datar["hfr2"].ToString();
                        Labelhfr3.Text = datar["hfr3"].ToString();
                        datar.Close();
                        btnqk.Visible = false;
                    }
                    else
                    {
                        datar.Close();
                        mydb.Alert("此记录不存在,可能已被删除！");
                    }
                }
                else
                {
                    lbltitle.Text = "新增";
                    SaveAddBtn.Visible = true;
                }

            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;

            if (lbltitle.Text == "新增")
            {
                SqlHelper.ExecuteSql("insert into OA_KHDA01(gmr,sf,cs,gmrdh,gmrdw,gmrbs,gmrzw,gmrq,spmc,gmsl,email,yzdz,gmbz,syr,syrdh,syrdz,syrdw,sjzg,sybz) values ('" + hkdb.GetStr(gmr.Text) + "', '" + hkdb.GetStr(sf.Text) + "', '" + hkdb.GetStr(cs.Text) + "', '" + hkdb.GetStr(gmrdh.Text) + "', '" + hkdb.GetStr(gmrdw.Text) + "', '" + hkdb.GetStr(gmrbs.Text) + "', '" + hkdb.GetStr(gmrzw.Text) + "', '" + hkdb.GetStr(gmrq.Text) + "', '" + hkdb.GetStr(spmc.Text) + "', '" + hkdb.GetStr(gmsl.Text) + "', '" + hkdb.GetStr(email.Text) + "', '" + hkdb.GetStr(yzdz.Text) + "', '" + hkdb.GetStr(gmbz.Text) + "', '" + hkdb.GetStr(syr.Text) + "', '" + hkdb.GetStr(syrdh.Text) + "', '" + hkdb.GetStr(syrdz.Text) + "', '" + hkdb.GetStr(syrdw.Text) + "', '" + hkdb.GetStr(sjzg.Text) + "', '" + hkdb.GetStr(sybz.Text) + "')");
                if (s == "SaveAddBtn")
                {
                    gmr.Text = "";
                    sf.Text = "";
                    cs.Text = "";
                    gmrdw.Text = "";
                    gmrbs.Text = "";
                    gmrzw.Text = "";
                    gmrq.Text = "";
                    spmc.Text = "";
                    gmsl.Text = "";
                    email.Text = "";
                    yzdz.Text = "";
                    gmbz.Text = "";
                    syr.Text = "";
                    syrdh.Text = "";
                    syrdz.Text = "";
                    syrdw.Text = "";
                    sjzg.Text = "";
                    gmrdh.Text = "";
                    sybz.Text = "";
                    mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Khwh01.aspx");
                }
                else
                {
                    mydb.Alert_Refresh_Close("保存成功！", "Khwh01.aspx");
                }
            }
            else
            {
                SqlHelper.ExecuteSql("update OA_KHDA01 set gmr ='" + hkdb.GetStr(gmr.Text) + "', sf= '" + hkdb.GetStr(sf.Text) + "', cs ='" + hkdb.GetStr(cs.Text) + "', gmrdh ='" + hkdb.GetStr(gmrdh.Text) + "', gmrdw ='" + hkdb.GetStr(gmrdw.Text) + "', gmrbs= '" + hkdb.GetStr(gmrbs.Text) + "', gmrzw ='" + hkdb.GetStr(gmrzw.Text) + "', gmrq= '" + hkdb.GetStr(gmrq.Text) + "', spmc= '" + hkdb.GetStr(spmc.Text) + "', gmsl ='" + hkdb.GetStr(gmsl.Text) + "', email ='" + hkdb.GetStr(email.Text) + "', yzdz ='" + hkdb.GetStr(yzdz.Text) + "', gmbz ='" + hkdb.GetStr(gmbz.Text) + "', syr= '" + hkdb.GetStr(syr.Text) + "', syrdh= '" + hkdb.GetStr(syrdh.Text) + "', syrdz= '" + hkdb.GetStr(syrdz.Text) + "', syrdw ='" + hkdb.GetStr(syrdw.Text) + "', sjzg ='" + hkdb.GetStr(sjzg.Text) + "', sybz= '" + hkdb.GetStr(sybz.Text) + "' where khid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

                if (s == "SaveBtn")
                {
                    mydb.Alert_Refresh_Close("保存成功！", "Khwh01.aspx");
                }
                else
                {
                    mydb.Alert_Refresh_Close("保存成功！", "Khwh01.aspx");
                }
            }
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            gmr.Text = "";
            sf.Text = "";
            cs.Text = "";
            gmrdw.Text = "";
            gmrbs.Text = "";
            gmrzw.Text = "";
            gmrq.Text = "";
            spmc.Text = "";
            gmsl.Text = "";
            email.Text = "";
            yzdz.Text = "";
            gmbz.Text = "";
            syr.Text = "";
            syrdh.Text = "";
            syrdz.Text = "";
            syrdw.Text = "";
            sjzg.Text = "";
            gmrdh.Text = "";
            sybz.Text = "";
        }
    }
}
