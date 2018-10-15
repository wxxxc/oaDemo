using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using haoke365;
using System.Data;
using System.Data.SqlClient;
namespace hksoft.oa.rwgl
{
    public partial class indexwenze : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10302", "0");
                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));


                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT A.*,B.UI_DESC,C.MC AS RWXZ_MC FROM OA_RWD01 A LEFT OUTER JOIN YH B ON (A.FBR=B.UI_ID) LEFT OUTER JOIN HK_ZDYLX C ON(A.RWXZ=C.ID) WHERE A.RWID='" + hkdb.GetStr(Request.QueryString["rwid"].ToString()) + "' AND (RWZT='已发布' or rwzt='已完成')");
                if (datar.Read())
                {
                    rwidstr.Text = datar["rwid"].ToString();

                    rwly.Text = datar["source"].ToString();
                    rwdh.Text = datar["rwdh"].ToString();
                    lblrwbt.Text = datar["rwbt"].ToString();
                    lbljjcd.Text = datar["jjcd"].ToString();
                    lblrwxz.Text = datar["RWXZ_MC"].ToString();
                    lbljsdx.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["jsdx"].ToString() + "','1'"));
                    qtld.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["qtld"].ToString() + "','1'"));
                    zrld.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["zrld"].ToString() + "','1'"));
                    zrr.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["zrr"].ToString() + "','1'"));
                    lblksrq.Text = datar["ksrq"].ToString();
                    lbljzrq.Text = datar["jzrq"].ToString();
                    lblnr.Text = hkdb.GetStrTeOut(datar["rwnr"].ToString());
                    lblynxs.Text = datar["ynxs"].ToString();
                    //savefj.Text = datar["fjmc"].ToString();

                    fbrmc.Text = datar["ui_desc"].ToString();
                    fqsj.Text = string.Format("{0:d}", datar["fbsj"]);
                    savefj.Text = datar["fjmc"].ToString();
                    savefj.NavigateUrl = (datar["fjlj"] == System.DBNull.Value ? "" : "../.." + datar["fjlj"]) + datar["fjmc"].ToString();

                    datar.Close();

                    if (lblynxs.Text == "是")
                    {
                        Panelrq.Visible = true;
                    }

                    //页面绑定 
                    GridViewBind();
                }
                else
                {
                    datar.Close();
                    mydb.Alert_Close("此记录不存在,可能已被完成或删除！");
                    return;
                }
            }
        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " where ssrwid='" + hkdb.GetStr(rwidstr.Text) + "' ";

            DataSet ds = SqlHelper.ExecuteDs("select a.jsid,a.jszt,a.clsj,a.bzsm,a.fjlj,a.fjmc,a.fpxs,a.fpsm,case when(a.fjmc=''or a.fjmc is null) then 'n' else 'down' end as fjmc2,b.ui_desc from OA_RWD02 a left outer join yh b on (a.jsr=b.ui_id)" + Str1 + "order by jssj desc");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
        public string isshowfj(string path)
        {
            string display = "";
            if (path == "../.." || path == "")
            {
                display = "display:none";
            }
            else
            {
                display = "display:block";
            }
            return display;
        }
    }
}