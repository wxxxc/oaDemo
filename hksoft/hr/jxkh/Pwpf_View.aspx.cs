using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Pwpf_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object Sender, EventArgs E)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("81107", "0");

                //评委类型
                SqlDataReader dr_pw = SqlHelper.ExecuteReader("SELECT PWLX FROM HR_Kpdf_Pw WHERE PID='" + this.Session["userid"] + "'");
                if (dr_pw.Read())
                {
                    lblpwlx.Text = dr_pw["PWLX"].ToString();
                    dr_pw.Close();
                }
                else
                {
                    dr_pw.Close();
                    mydb.Alert_Goto("对不起，您并未被设定为评委，不能继续！", "Pwpf.aspx");
                }

                //考评项目
                SqlDataReader dr_xm = SqlHelper.ExecuteReader("SELECT KPQS,KPZT,XMFJ FROM HR_Kpdf_Kpxm01 WHERE KPID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (dr_xm.Read())
                {
                    lblxmmc.Text = dr_xm["KPQS"].ToString();
                    lblkpzt.Text = dr_xm["KPZT"].ToString();
                    Number.Text = dr_xm["XMFJ"].ToString();
                }
                dr_xm.Close();

                //公共评分材料
                bd.GetAtt(Number.Text, "h22", "hr/jxgl", fujian);

                GridViewBind();
            }
        }

        //gv绑定 
        public void GridViewBind()
        {
            string sql2 = " WHERE A.SSKPID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'";

            //不显示评委本人的记录
            //sql2 += " AND A.SSBID<>'" + this.Session["userid"] + "'";

            //只显示当前评委类型的项
            string sql = "";
            switch (lblpwlx.Text)
            {
                case "总经理评委":
                    sql = " AND A2.Pw_zr='是'";
                    break;
                case "副主管评委":
                    sql = " AND A2.Pw_fzr='是'";
                    break;
                case "一般评委":
                    sql = " AND A2.Pw_ybpw='是'";
                    break;
                case "工作人员评委":
                    sql = " AND A2.Pw_gzry='是'";
                    break;
            }

            DataSet ds = SqlHelper.ExecuteDs("SELECT DISTINCT A.SSKPID,B.*,(SELECT SUM(FZ) FROM HR_Kpdf_Kpxm02 WHERE SSKPID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' AND SSBID=B.BID)AS GWF,(SELECT COUNT(*) FROM HR_Kpdf_Kpxm02 A1 LEFT OUTER JOIN HR_Kpdf_Pfxm A2 ON(A1.ssxmid=A2.xmid) WHERE A1.SSKPID=A.SSKPID AND A1.SSBID=A.SSBID " + sql + ")AS YKP,(SELECT COUNT(*) FROM HR_Kpdf_Kpxm04 WHERE SSKPID=A.SSKPID AND SSBID=A.SSBID AND PFRID='" + this.Session["userid"] + "')AS SJKP FROM HR_Kpdf_Kpxm02 A LEFT OUTER JOIN HR_Kpdf_Bkpr01 B ON(A.SSBID=B.BID) " + sql2 + " ORDER BY B.BID");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //gv行处理 
        public void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";

                Label ln = (Label)e.Row.FindControl("lblkpid");
                Label lb = (Label)e.Row.FindControl("lblbid");
                Label ly = (Label)e.Row.FindControl("lblypf");
                Label ls = (Label)e.Row.FindControl("lblsjpf");
                Label ll = (Label)e.Row.FindControl("lbltxt");

                ll.Text = null;

                //判断考评项目状态
                if (lblkpzt.Text == "已生效")
                {
                    if (Convert.ToInt32(ly.Text) == Convert.ToInt32(ls.Text))
                    {
                        //已评分完成，且有可评分项
                        if (Convert.ToInt32(ly.Text) != 0)
                        {
                            //判断评委是否允许修改评分
                            if (bd.CheckRepeat("SELECT p_code FROM HR_Kpdf_Paramt WHERE p_code='ModiScore' AND p_value='是'") == "true")
                            {
                                ll.Text += "<a href='#' onclick=\"javascript:popWin_w('Pwpf_View_Add.aspx?kpid=" + ln.Text + "&bid=" + lb.Text + "')\" class='gvlink'>修改</a>&nbsp;";
                            }

                            //查看
                            ll.Text += "<a href='#' onclick=\"javascript:popWin_w('Pwpf_View_Show.aspx?kpid=" + ln.Text + "&bid=" + lb.Text + "')\" class='gvlink'>查看</a>";
                        }
                    }
                    else
                    {
                        //未评分完成

                        //判断是否一般评委
                        if (bd.CheckRepeat("SELECT PID FROM HR_Kpdf_Pw WHERE PID='" + this.Session["UserID"] + "' AND PWLX='一般评委'") == "true")
                        {
                            //判断是否超期
                            if (bd.CheckRepeat("SELECT KPID FROM HR_Kpdf_Kpxm01 WHERE KPID='" + ln.Text + "' AND JZRQ<convert(char(10),getdate(),111)") == "true")
                            {
                                //判断超期后是否允许再评分
                                if (bd.CheckRepeat("SELECT * FROM HR_Kpdf_Paramt WHERE p_code='LateScore' AND P_Value='是'") == "true")
                                {
                                    ll.Text += "&nbsp;<a href='#' onclick=\"javascript:popWin_w('Pwpf_View_Add.aspx?kpid=" + ln.Text + "&bid=" + lb.Text + "')\" class='gvlink'>评分</a>";
                                }
                            }
                            else
                            {
                                ll.Text += "&nbsp;<a href='#' onclick=\"javascript:popWin_w('Pwpf_View_Add.aspx?kpid=" + ln.Text + "&bid=" + lb.Text + "')\" class='gvlink'>评分</a>";
                            }
                        }
                        else
                        {
                            ll.Text += "&nbsp;<a href='#' onclick=\"javascript:popWin_w('Pwpf_View_Add.aspx?kpid=" + ln.Text + "&bid=" + lb.Text + "')\" class='gvlink'>评分</a>";
                        }
                    }
                }
                else
                {
                    //查看
                    ll.Text += "<a href='#' onclick=\"javascript:popWin_w('Pwpf_View_Show.aspx?kpid=" + ln.Text + "&bid=" + lb.Text + "')\" class='gvlink'>查看</a>";
                }
            }
        }
    }
}
