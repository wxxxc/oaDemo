using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.rwgl
{
    public partial class dbrwcx_yhview : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10306", "0");
                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));

                //dp绑定 
                SqlDataReader datar = SqlHelper.ExecuteReader("select  A.*,B.mc from OA_RWD01 A LEFT OUTER JOIN hk_ZDYLX B ON(A.RWXZ=B.ID) where A.rwid='" + hkdb.GetStr(Request.QueryString["rwid"].ToString()) + "'");
                if (datar.Read())
                {
                    rwly.Text = datar["source"].ToString();
                    rwidstr.Text = datar["rwid"].ToString();
                    rwdh.Text = datar["rwdh"].ToString();
                    lbljjcd.Text = datar["jjcd"].ToString();
                    lblrwxz.Text = datar["mc"].ToString();
                    lbljsdx.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["jsdx"].ToString() + "','1'"));
                    qtld.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["qtld"].ToString() + "','1'"));
                    zrld.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["zrld"].ToString() + "','1'"));
                    zrr.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["zrr"].ToString() + "','1'"));
                    lblnr.Text = hkdb.GetStrTeOut(datar["rwnr"].ToString());
                    lblynxs.Text = datar["ynxs"].ToString();
                    lblksrq.Text = datar["ksrq"].ToString();
                    lbljzrq.Text = datar["jzrq"].ToString();

                    if (datar["ynxs"].ToString() == "是")
                    {
                        Panelrq.Visible = true;
                    }

                    lblrwbt.Text = datar["rwbt"].ToString();
                    fqsj.Text = string.Format("{0:d}", datar["fbsj"]);
                    savefj.Text = datar["fjmc"].ToString();
                    savelj.Text = datar["fjlj"].ToString();
                    savefj.NavigateUrl = (datar["fjlj"] == System.DBNull.Value ? "" : "../.." + datar["fjlj"]) + datar["fjmc"].ToString();

                    datar.Close();
                }
                else
                {
                    datar.Close();
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }
            }

            //页面绑定 
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " where ssrwid='" + hkdb.GetStr(rwidstr.Text) + "' ";

            DataSet ds = SqlHelper.ExecuteDs("select a.jsid,a.jszt,a.clsj,a.bzsm,a.fjlj,a.fjmc,a.thcs,a.fpxs,a.fpsm,d.ui_desc as spr,a.spsj,a.spyj,a.sppj,(case when (c.ynxs='是' and (a.jssj>c.jzrq or a.jssj is null))then 'yes' else 'no' end)as cszt,case when(a.fjmc=''or a.fjmc is null) then 'n' else 'down' end as fjmc2,b.ui_desc from OA_RWD02 a left outer join yh b on (a.jsr=b.ui_id)  left outer join OA_RWD01 c on (a.ssrwid=c.rwid) left outer join yh d on (a.spr=d.ui_id)" + Str1 + "order by jssj desc");
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
