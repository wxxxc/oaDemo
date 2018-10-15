using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Kqsjbg_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11730", "0");

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * from OA_KQXX WHERE RYBH='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' AND KQRQ='" + hkdb.GetStr(Request.QueryString["rq"].ToString()) + "'");
                    if (dr.Read())
                    {
                        rybh.Text = dr["rybh"].ToString();
                        xm.Text = dr["xm"].ToString();
                        kqrq.Text = hkdb.GetDate(dr["kqrq"].ToString());
                        sb1.Text = dr["sb1"].ToString();
                        xb2.Text = dr["xb2"].ToString();
                        sb3.Text = dr["sb3"].ToString();
                        xb4.Text = dr["xb4"].ToString();
                        sb5.Text = dr["sb5"].ToString();
                        xb6.Text = dr["xb6"].ToString();

                        cdcs1.Text = dr["cdcs1"].ToString();
                        ztcs1.Text = dr["ztcs1"].ToString();
                        wqdcs1.Text = dr["wqdcs1"].ToString();
                        wqtcs1.Text = dr["wqtcs1"].ToString();
                        kgcs1.Text = dr["kgcs1"].ToString();

                        cdcs2.Text = dr["cdcs2"].ToString();
                        ztcs2.Text = dr["ztcs2"].ToString();
                        wqdcs2.Text = dr["wqdcs2"].ToString();
                        wqtcs2.Text = dr["wqtcs2"].ToString();
                        kgcs2.Text = dr["kgcs2"].ToString();

                        cdcs3.Text = dr["cdcs3"].ToString();
                        ztcs3.Text = dr["ztcs3"].ToString();
                        wqdcs3.Text = dr["wqdcs3"].ToString();
                        wqtcs3.Text = dr["wqtcs3"].ToString();
                        kgcs3.Text = dr["kgcs3"].ToString();

                        bgyy.Text = dr["bgyy"].ToString();
                        dr.Close();
                    }
                    else
                    {
                        dr.Close();
                    }
                }
                else
                {
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }
            }
        }

        //保存 
        protected void Save_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE OA_KQXX SET SB1='" + hkdb.GetStr(sb1.Text) + "',xb2='" + hkdb.GetStr(xb2.Text) + "',sb3='" + hkdb.GetStr(sb3.Text) + "',xb4='" + hkdb.GetStr(xb4.Text) + "',sb5='" + hkdb.GetStr(sb5.Text) + "',xb6='" + hkdb.GetStr(xb6.Text) + "',cdcs1='" + hkdb.GetStr(cdcs1.Text) + "',ztcs1='" + hkdb.GetStr(ztcs1.Text) + "',wqdcs1='" + hkdb.GetStr(wqdcs1.Text) + "',wqtcs1='" + hkdb.GetStr(wqtcs1.Text) + "',kgcs1='" + hkdb.GetStr(kgcs1.Text) + "',cdcs2='" + hkdb.GetStr(cdcs2.Text) + "',ztcs2='" + hkdb.GetStr(ztcs2.Text) + "',wqdcs2='" + hkdb.GetStr(wqdcs2.Text) + "',wqtcs2='" + hkdb.GetStr(wqtcs2.Text) + "',kgcs2='" + hkdb.GetStr(kgcs2.Text) + "',cdcs3='" + hkdb.GetStr(cdcs3.Text) + "',ztcs3='" + hkdb.GetStr(ztcs3.Text) + "',wqdcs3='" + hkdb.GetStr(wqdcs3.Text) + "',wqtcs3='" + hkdb.GetStr(wqtcs3.Text) + "',kgcs3='" + hkdb.GetStr(kgcs3.Text) + "',bgr='" + this.Session["UserID"] + "',bgsj=GETDATE(),bgyy='" + hkdb.GetStr(bgyy.Text) + "' WHERE RYBH='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' AND KQRQ='" + hkdb.GetStr(Request.QueryString["rq"].ToString()) + "'");

            mydb.Alert_Close("保存成功！");
        }
    }
}
