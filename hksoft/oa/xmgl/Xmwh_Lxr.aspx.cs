using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.xmgl
{
    public partial class Xmwh_Lxr : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            xmid.Text = (string)Request.QueryString["id"].ToString();
            if (!IsPostBack)
            {
                hkdb.PassTo("11505", "0");

                if (string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SaveBtn.Enabled = false;
                    PrnBtn.Enabled = false;
                }

                if (!string.IsNullOrEmpty(Request.QueryString["lxrid"]))
                {
                    lxrid.Text = Request.QueryString["lxrid"];
                    SqlDataReader dr = SqlHelper.ExecuteReader("select * from oa_xmgl_lxr where lxrid='" + hkdb.GetStr(Request.QueryString["lxrid"].ToString()) + "'");
                    if (dr.Read())
                    {
                        xm.Text = dr["xm"].ToString();
                        dh.Text = dr["dh"].ToString();
                        gzdw.Text = dr["gzdw"].ToString();
                        bm.Text = dr["bm"].ToString();
                        zw.Text = dr["zw"].ToString();
                        gjry.SelectedValue = dr["gjry"].ToString();
                        mail.Text = dr["mail"].ToString();
                        yzdz.Text = dr["yzdz"].ToString();
                        bz.Text = dr["bz"].ToString();
                    }
                    dr.Close();
                }
            }

            GridViewBind();
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(lxrid.Text))
            {
                SqlHelper.ExecuteSql("insert into OA_XMGL_LXR(xmid,xm,dh,gzdw,bm,zw,gjry,mail,yzdz,bz) values('" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "','" + hkdb.GetStr(xm.Text) + "', '" + hkdb.GetStr(dh.Text) + "', '" + hkdb.GetStr(gzdw.Text) + "','" + hkdb.GetStr(bm.Text) + "','" + hkdb.GetStr(zw.Text) + "','" + hkdb.GetStr(gjry.Text) + "','" + hkdb.GetStr(mail.Text) + "','" + hkdb.GetStr(yzdz.Text) + "','" + hkdb.GetStr(bz.Text) + "')");
            }
            else
            {
                SqlHelper.ExecuteSql("update oa_xmgl_lxr set xm='" + hkdb.GetStr(xm.Text) + "',dh='" + hkdb.GetStr(dh.Text) + "',gzdw='" + hkdb.GetStr(gzdw.Text) + "',bm='" + hkdb.GetStr(bm.Text) + "',zw='" + hkdb.GetStr(zw.Text) + "',gjry='" + gjry.SelectedValue + "',mail='" + hkdb.GetStr(mail.Text) + "',yzdz='" + hkdb.GetStr(yzdz.Text) + "',bz='" + hkdb.GetStr(bz.Text) + "' where lxrid='" + hkdb.GetStr(lxrid.Text) + "'");
            }

            xm.Text = "";
            dh.Text = "";
            gzdw.Text = "";
            bm.Text = "";
            gjry.SelectedValue = "";
            mail.Text = "";
            yzdz.Text = "";
            bz.Text = "";
            zw.Text = "";
            lxrid.Text = "";

            mydb.Alert("保存成功！");

            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            SqlDataSource1.SelectCommand = "";
            SqlDataSource1.SelectCommand = "select * from OA_XMGL_LXR where xmid='" + hkdb.GetStr(Request.QueryString["id"]) + "'";
            SqlDataSource1.DeleteCommand = "";
            SqlDataSource1.DeleteCommand = "delete from OA_XMGL_LXR where lxrid=@lxrid";

            PrnBtn.Attributes.Add("onclick", "Javascript:popPrn('xm_lxr_prn.aspx?&i1=" + xmid.Text + "');");
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
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
