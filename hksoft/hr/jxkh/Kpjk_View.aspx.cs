using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Kpjk_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object Sender, EventArgs E)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("81109", "0");

                //考评项目
                SqlDataReader dr_xm = SqlHelper.ExecuteReader("SELECT KPQS FROM HR_Kpdf_Kpxm01 WHERE KPID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (dr_xm.Read())
                {
                    lblxmmc.Text = dr_xm["KPQS"].ToString();
                }
                dr_xm.Close();

                GridViewBind();
            }
        }

        //gv绑定 
        public void GridViewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("EXEC sp_HR_Kpdf_Kpjk '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //结束考评
        protected void Save_Click(object Sender, EventArgs E)
        {
            SqlHelper.ExecuteSql("UPDATE HR_Kpdf_Kpxm01 SET KPZT='已结束',JSR='" + this.Session["userid"] + "',JSSJ=GETDATE() WHERE KPID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

            mydb.Alert_Goto("结束考评成功！", "Kpjk.aspx");
        }

        //总经理评分补零
        protected void Zero_Click(object Sender, EventArgs E)
        {
            //获取当前考评项目中的总经理评委ID
            string strZrid = "";
            string strZrxm = "";
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT PID,PWXM FROM HR_Kpdf_Pw WHERE PWLX='总经理评委'");
            while (dr.Read())
            {
                SqlDataReader dr3 = SqlHelper.ExecuteReader("SELECT * FROM HR_Kpdf_Kpxm01 WHERE CHARINDEX('" + dr["PID"].ToString() + "',cypwIDs)>0 AND KPID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (dr3.Read()) 
                {
                    strZrid = dr["PID"].ToString();
                    strZrxm = dr["PWXM"].ToString();
                }
                dr3.Close();
            }
            dr.Close();

            //显示当前评委类型的项
            string sql = " WHERE SSKPID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' AND B.Pw_zr='是'";

            //1.检索全部被考评人的全部评分项目
            SqlDataReader dr1 = SqlHelper.ExecuteReader("SELECT A.*,(CASE WHEN A.FZ<=10 THEN A.PFDJ_Y-0.1 ELSE A.PFDJ_Y-1 END)AS PFDJ_Y2,(CASE WHEN A.FZ<=10 THEN A.PFDJ_L-0.1 ELSE A.PFDJ_L-1 END)AS PFDJ_L2 FROM HR_Kpdf_Kpxm02 A LEFT OUTER JOIN HR_Kpdf_Pfxm B ON(A.SSXMID=B.XMID)" + sql);
            while (dr1.Read())
            {
                //2.判断总经理评委、各被考评人 + 各评分项目下是否有值
                SqlDataReader dr2 = SqlHelper.ExecuteReader("SELECT * FROM HR_Kpdf_Kpxm04 WHERE SSMXID='" + dr1["MXID"].ToString() + "' AND SSBID='" + dr1["ssbid"].ToString() + "' AND PFRID='" + strZrid + "'");
                if (dr2.Read())
                {
                    SqlHelper.ExecuteSql("UPDATE HR_Kpdf_Kpxm04 SET SJPF=0,PFBZ='默认补零',XGPFSJ=GETDATE(),XGPFCS=XGPFCS+1 WHERE SSMXID='" + dr1["MXID"].ToString() + "' AND SSBID='" + dr1["ssbid"].ToString() + "' AND PFRID='" + strZrid + "'");
                }
                else
                {
                    SqlHelper.ExecuteSql("INSERT INTO HR_Kpdf_Kpxm04(ssmxid,sskpid,ssbid,ssxmid,ssxmmc,sjxmid,sjxmmc,sjpf,pfbz,pfrid,pfrmc,pfsj,pwlx) VALUES('" + dr1["MXID"].ToString() + "','" + dr1["SSKPID"].ToString() + "','" + dr1["SSBID"].ToString() + "','" + dr1["SSXMID"].ToString() + "','" + dr1["SSXMMC"].ToString() + "','" + dr1["SJXMID"].ToString() + "','" + dr1["SJXMMC"].ToString() + "',0,'默认补零','" + strZrid + "','" + strZrxm + "',GETDATE(),'总经理评委')");
                }
                dr2.Close();
            }
            dr1.Close();

            ZeroBtn.Enabled = false;

            GridViewBind();

            mydb.Alert("补零成功！");
        }

        //gv行处理 
        public void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";

                Label ln = (Label)e.Row.FindControl("lblpid");
                Label ly = (Label)e.Row.FindControl("lblpfxm");
                Label ls = (Label)e.Row.FindControl("lblsjpf");
                Label ll = (Label)e.Row.FindControl("lbltxt");

                ll.Text = null;

                if (Convert.ToInt32(ly.Text) != Convert.ToInt32(ls.Text))
                {
                    if (Convert.ToInt32(ly.Text) != 0)
                    {
                        ll.Text += "<a href='#' onclick='window.open (\"Kpjk_View_Remind.aspx?kpid=" + Request.QueryString["id"].ToString() + "&bid=" + ln.Text + "\", \"_blank\", \"height=220, width=600,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=110,left=110\")' class='gvlink'>催办提醒</a>";
                    }

                    SaveBtn.Visible = false;
                }
            }
        }
    }
}
