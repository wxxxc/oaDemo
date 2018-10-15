using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.bmgl
{
    public partial class Qyda : System.Web.UI.Page
    {
        BindData bd = new BindData();
        mydb hkdb = new mydb();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("60308", "60308");

                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM QY WHERE QY_ID='001'");
                if (datar.Read())
                {
                    qybm.Text = datar["qy_id"].ToString();
                    qc.Text = datar["qy_qc"].ToString();
                    jc.Text = datar["qy_jc"].ToString();
                    lx.Text = datar["qy_lx"].ToString();
                    dz.Text = datar["qy_dz"].ToString();
                    yzbm.Text = datar["qy_yzbm"].ToString();
                    dh.Text = datar["qy_dh"].ToString();
                    cz.Text = datar["qy_cz"].ToString();
                    wz.Text = datar["qy_wz"].ToString();
                    mail.Text = datar["qy_mail"].ToString();
                    //gsh.Text = datar["qy_gsh"].ToString();
                    //dsh.Text = datar["qy_dsh"].ToString();
                    //khyh.Text = datar["qy_khyh"].ToString();
                    //yhzh.Text = datar["qy_yhzh"].ToString();
                    pp.Text = datar["qy_pp"].ToString();

                    ywmc.Text = datar["qy_ywmc"].ToString();
                    //frdb.Text = datar["qy_frdb"].ToString();
                    //zcsj.Text = hkdb.GetDate(datar["qy_zcsj"].ToString());
                    sshy.Text = datar["qy_sshy"].ToString();
                    //zczj.Text = datar["qy_zczj"].ToString();
                    ygrs.Text = datar["qy_ygrs"].ToString();
                    qyjj.Text = datar["qy_qyjj"].ToString();
                    qy_fjylurl.Text = datar["qy_fjylurl"].ToString();
                    datar.Close();
                }
                else
                {
                    datar.Close();
                    mydb.Alert_Close("未检索到企业档案信息！");
                }

                //判断PMS、EAM
                string sql = "SELECT Xh FROM hk_INIT WHERE ProduID='F' OR ProduID='E'";
                if (bd.CheckRepeat(sql) == "true")
                {
                    if (this.Session["systype"].ToString() == "F" | this.Session["systype"].ToString() == "E" | this.Session["systype"].ToString() == "A")
                    {
                        AddBtn.Visible = true;
                        GridView1.Visible = true;

                        //页面绑定
                        GridViewBind();
                    }
                }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }
            var a = qy_fjylurl.Text;
            //SqlHelper.ExecuteSql("UPDATE QY SET QY_QC='" + hkdb.GetStr(qc.Text) + "',QY_PP='" + hkdb.GetStr(pp.Text) + "',QY_JC='" + hkdb.GetStr(jc.Text) + "',QY_LX='" + hkdb.GetStr(lx.Text) + "',QY_DZ='" + hkdb.GetStr(dz.Text) + "',QY_YZBM='" + hkdb.GetStr(yzbm.Text) + "',QY_DH='" + hkdb.GetStr(dh.Text) + "',QY_CZ ='" + hkdb.GetStr(cz.Text) + "',QY_WZ='" + hkdb.GetStr(wz.Text) + "',QY_MAIL='" + hkdb.GetStr(mail.Text) + "',QY_GSH='" + hkdb.GetStr(gsh.Text) + "',QY_DSH='" + hkdb.GetStr(dsh.Text) + "',QY_KHYH='" + hkdb.GetStr(khyh.Text) + "',QY_YHZH='" + hkdb.GetStr(yhzh.Text) + "',qy_ywmc='" + hkdb.GetStr(ywmc.Text) + "',qy_frdb='" + hkdb.GetStr(frdb.Text) + "',qy_zcsj='" + hkdb.GetStr(zcsj.Text) + "',qy_sshy='" + hkdb.GetStr(sshy.Text) + "',qy_zczj='" + hkdb.GetNum(zczj.Text) + "',qy_ygrs='" + hkdb.GetStr(ygrs.Text) + "',qy_qyjj='" + hkdb.GetStr(qyjj.Text) + "' WHERE QY_ID='001'");
            SqlHelper.ExecuteSql("UPDATE QY SET qy_fjylurl='"+ a+"', QY_QC='" + hkdb.GetStr(qc.Text) + "',QY_PP='" + hkdb.GetStr(pp.Text) + "',QY_JC='" + hkdb.GetStr(jc.Text) + "',QY_LX='" + hkdb.GetStr(lx.Text) + "',QY_DZ='" + hkdb.GetStr(dz.Text) + "',QY_YZBM='" + hkdb.GetStr(yzbm.Text) + "',QY_DH='" + hkdb.GetStr(dh.Text) + "',QY_CZ ='" + hkdb.GetStr(cz.Text) + "',QY_WZ='" + hkdb.GetStr(wz.Text) + "',QY_MAIL='" + hkdb.GetStr(mail.Text) + "',qy_ywmc='" + hkdb.GetStr(ywmc.Text)  + "',qy_sshy='" + hkdb.GetStr(sshy.Text) +" ',qy_ygrs = '" + hkdb.GetStr(ygrs.Text) +"' ,qy_qyjj='" + hkdb.GetStr(qyjj.Text) + "' WHERE QY_ID='001'");
            mydb.Alert("保存成功！");
        }

        //gv绑定
        public void GridViewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM QY WHERE QY_ID<>'001'");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //gv行处理
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}
