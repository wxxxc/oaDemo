using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Qjdbg_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11728", "0");

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * from OA_KQ_QJD01 WHERE QID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (dr.Read())
                    {
                        qjlx.SelectedValue = dr["qjlx"].ToString();
                        gjlb.SelectedValue = dr["gjlb"].ToString();
                        qjkssj.Text = hkdb.GetDate(dr["qjkssj"].ToString());
                        qjkssd.SelectedValue = dr["qjkssd"].ToString();
                        qjjssj.Text = hkdb.GetDate(dr["qjjssj"].ToString());
                        qjjssd.SelectedValue = dr["qjjssd"].ToString();
                        qjts.Text = dr["qjts"].ToString();
                        lblqjly.Text = dr["qjly"].ToString();
                        lblgztzqk.Text = dr["gztzqk"].ToString();
                        lblsqr.Text = dr["sqrmc"].ToString();
                        lblsqbmmc.Text = dr["sqbmmc"].ToString();
                        Number.Text = dr["qjfj"].ToString();
                        bgyy.Text = dr["bgyy"].ToString();
                        dr.Close();

                        if (qjlx.SelectedValue == "公假")
                        {
                            lblgjlb.Visible = true;
                            gjlb.Visible = true;
                        }

                        bd.GetAtt(Number.Text, "o2", "oa/qjd", fujian);
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

        //确认变更 
        protected void Save_Click(object sender, EventArgs e)
        {
            //判断时间
            DateTime sdate = Convert.ToDateTime(qjkssj.Text);
            DateTime edate = Convert.ToDateTime(qjjssj.Text);
            if (sdate > edate)
            {
                mydb.Alert("请假截止日期不能小于开始日期！");
                return;
            }

            //判断请假天数
            double iQjts = Convert.ToDouble(SqlHelper.ExecuteScalar("SELECT DATEDIFF(day, '" + qjkssj.Text + "', '" + qjjssj.Text + "')+1").ToString());
            if (iQjts < Convert.ToDouble(qjts.Text))
            {
                mydb.Alert("请假天数超出了本次请假起止日期范围！");
                return;
            }

            SqlHelper.ExecuteSql("UPDATE OA_KQ_QJD01 SET QJLX='" + qjlx.SelectedValue + "',GJLB='" + gjlb.SelectedValue + "',QJKSSJ='" + hkdb.GetStr(qjkssj.Text) + "',QJKSSD='" + qjkssd.SelectedValue + "',QJJSSJ='" + hkdb.GetStr(qjjssj.Text) + "',QJJSSD='" + qjjssd.SelectedValue + "',QJTS='" + hkdb.GetStr(qjts.Text) + "',BGYY='" + hkdb.GetStr(bgyy.Text) + "',bgr='" + this.Session["UserID"] + "',bgsj=GETDATE() WHERE QID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");

            mydb.Alert_Refresh_Close("保存成功！","Qjdbg.aspx");
        }

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("DELETE FROM OA_KQ_QJD02 WHERE SSQID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");

            SqlHelper.ExecuteSql("DELETE FROM OA_KQ_QJD01 WHERE QID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");

            mydb.Alert_Refresh_Close("删除成功！","Qjdbg.aspx");
        }

        //请假类型切换
        protected void qjlx_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (qjlx.SelectedValue == "公假")
            {
                lblgjlb.Visible = true;
                gjlb.Visible = true;
            }
            else
            {
                gjlb.SelectedValue = "";
                lblgjlb.Visible = false;
                gjlb.Visible = false;
            }
        }
    }
}
