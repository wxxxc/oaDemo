using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jhgl
{
    public partial class Grjh_Mod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10201", "0");

                SqlDataReader dr = SqlHelper.ExecuteReader("select * from oa_gzjh01 where jhid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (dr.Read())
                {
                    ny.Text = dr["jhnf"].ToString() + "年" + dr["jhyf"].ToString() + "工作计划";
                    ztmb.Text = dr["ztmb"].ToString();
                    zt.Text = dr["zt"].ToString();
                    spyj.Text = dr["spyj"].ToString();
                    zwpj.Text = dr["zwpj"].ToString();
                    zgpjnr.Text = dr["zgpjnr"].ToString();
                    df.SelectedValue = dr["zgpjfs"].ToString();
                    ycxx.Text = dr["jhz"].ToString();
                    dr.Close();
                }
                else
                {
                    dr.Close();
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }

                switch (zt.Text)
                {
                    case "审核中":
                        spyjpanel.Visible = true;
                        spyj.ReadOnly = false;
                        SpBtn.Visible = true;
                        songshen.Visible = true;
                        break;
                    case "评价中":
                        spyjpanel.Visible = true;
                        zgpjpanel.Visible = true;
                        PjBtn.Visible = true;
                        zgpjnr.ReadOnly = false;
                        songshen.Visible = true;
                        break;
                    case "完成":
                        spyjpanel.Visible = true;
                        zgpjpanel.Visible = true;
                        break;
                }

                GridViewBind();
            }
        }

        //gv绑定 
        public void GridViewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("select id,gzzt,jhkssj,jhwcsj from OA_GZJH02 where jhid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //审批完成
        protected void Sp_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("update oa_gzjh01 set zt='评价中',spr='" + this.Session["userid"] + "',spsj=getdate(),spyj='" + hkdb.GetStr(spyj.Text) + "' where jhid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            
            if (xxtz.Checked == true | dxtz.Checked == true)
            {
                string message = this.Session["username"].ToString() + "已审批了您的工作计划,请查看!";
                hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), ycxx.Text, message);
            }

            mydb.Alert_Refresh_Close("计划已审批完成！", "grjh.aspx");
        }

        //评价完成 
        protected void Pj_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("update oa_gzjh01 set zt='完成',zgpjnr='" + hkdb.GetStr(zgpjnr.Text) + "',zgpjfs='" + df.SelectedValue + "' where jhid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            if (xxtz.Checked == true | dxtz.Checked == true)
            {
                string message = this.Session["username"].ToString() + "为您的工作计划作了评价,请查看!";
                hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), ycxx.Text, message);
            }

            mydb.Alert_Close("计划已评价完成！");
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
