using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Pwpf_View_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object Sender, EventArgs E)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("81107", "0");

                //被考评人
                lblbkpr.Text = SqlHelper.ExecuteScalar("SELECT XM FROM HR_Kpdf_Bkpr01 WHERE BID='" + hkdb.GetStr(Request.QueryString["bid"].ToString()) + "'").ToString();

                //评委类型
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT PWLX FROM HR_Kpdf_Pw WHERE PID='" + this.Session["userid"] + "'");
                if (dr.Read())
                {
                    lblpwlx.Text = dr["PWLX"].ToString();
                    dr.Close();
                }
                else
                {
                    dr.Close();
                    mydb.Alert_Close("对不起，您并未被设定为评委，无法评分！");
                }

                //附件
                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT KPFJ FROM HR_Kpdf_Kpxm03 WHERE SSKPID='" + hkdb.GetStr(Request.QueryString["kpid"]) + "' AND SSBID='" + hkdb.GetStr(Request.QueryString["bid"]) + "'");
                if (datar.Read())
                {
                    Number.Text = datar["KPFJ"].ToString();
                }
                datar.Close();

                //评分材料
                bd.GetAtt(Number.Text, "h21", "hr/jxgl", fujian);
            }

            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string sql = " WHERE A.SSKPID='" + hkdb.GetStr(Request.QueryString["kpid"].ToString()) + "' AND A.SSBID = '" + hkdb.GetStr(Request.QueryString["bid"].ToString()) + "'";

            //只显示当前评委类型的项
            switch (lblpwlx.Text)
            {
                case "总经理评委":
                    sql += " AND (B.Pw_zr='是' OR B.Pw_gzry='是')";
                    break;
                case "副主管评委":
                    sql += " AND (B.Pw_fzr='是' OR B.Pw_gzry='是')";
                    break;
                case "一般评委":
                    sql += " AND (B.Pw_ybpw='是' OR B.Pw_gzry='是')";
                    break;
                case "工作人员评委":
                    sql += " AND B.Pw_gzry='是'";
                    break;
            }

            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,(CASE WHEN A.FZ<=10 THEN A.PFDJ_Y-0.1 ELSE A.PFDJ_Y-1 END)AS PFDJ_Y2,(CASE WHEN A.FZ<=10 THEN A.PFDJ_L-0.1 ELSE A.PFDJ_L-1 END)AS PFDJ_L2,ISNULL((SELECT CASE WHEN xmmc NOT IN('德','能','勤','廉') THEN '绩' ELSE xmmc END FROM HR_Kpdf_Pfxm WHERE xmid=B.upid),b.xmmc)AS xmfl,(CASE WHEN B.PW_GZRY='是' THEN ISNULL((SELECT SJPF FROM HR_Kpdf_Kpxm04 WHERE SSKPID=A.SSKPID AND SSMXID=A.MXID AND SSBID=A.SSBID),0) ELSE ISNULL(C.SJPF,0) END)AS SJPF,C.PFBZ,B.Pw_gzry FROM HR_Kpdf_Kpxm02 A LEFT OUTER JOIN HR_Kpdf_Pfxm B ON(A.SSXMID=B.XMID) FULL JOIN (SELECT * FROM HR_Kpdf_Kpxm04 WHERE PFRID='" + this.Session["UserID"] + "') C ON(A.MXID=C.SSMXID) " + sql + " ORDER BY B.PXH");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //gv行处理 
        private double sum_fz = 0;
        private double sum_sjpf = 0;
        public void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";

                string strXmfl = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "xmfl")).Trim();
                switch (strXmfl)
                {
                    case "德":
                        e.Row.ForeColor = Color.Red;
                        break;
                    case "能":
                        e.Row.ForeColor = Color.Blue;
                        break;
                    case "勤":
                        e.Row.ForeColor = Color.Orange;
                        break;
                    case "廉":
                        e.Row.ForeColor = Color.Green;
                        break;
                    default:
                        e.Row.ForeColor = Color.Gray;
                        break;
                }

                Label ln = (Label)e.Row.FindControl("lblgzry");
                Label lm = (Label)e.Row.FindControl("lblmxid");
                Label ll = (Label)e.Row.FindControl("lbltxt");
                Label ll2 = (Label)e.Row.FindControl("lbltxt2");

                if (lblpwlx.Text != "工作人员评委" && ln.Text == "否")
                {
                    SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT SJPF,PFBZ FROM HR_Kpdf_Kpxm04 WHERE ssmxid='" + lm.Text + "' AND pfrid='" + this.Session["UserID"] + "'");
                    if (datar1.Read())
                    {
                        ll2.Text += "修改";
                    }
                    else
                    {
                        ll.Text += "评分";
                    }
                    datar1.Close();
                }

                if (lblpwlx.Text == "工作人员评委" && ln.Text == "是")
                {
                    SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT SJPF,PFBZ FROM HR_Kpdf_Kpxm04 WHERE ssmxid='" + lm.Text + "' AND pfrid='" + this.Session["UserID"] + "'");
                    if (datar1.Read())
                    {
                        ll2.Text += "修改";
                    }
                    else
                    {
                        ll.Text += "评分";
                    }
                    datar1.Close();
                }
            }

            if (e.Row.RowIndex >= 0)
            {
                sum_fz += Convert.ToDouble(e.Row.Cells[3].Text);
                sum_sjpf += Convert.ToDouble(e.Row.Cells[9].Text);
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[3].Text = sum_fz.ToString("F1");
                e.Row.Cells[9].Text = sum_sjpf.ToString("F2");
            }
        }

        //关闭
        protected void Close_Click(object Sender, EventArgs E)
        {
            mydb.Refresh_Close("Pwpf_View.aspx?id=" + Request.QueryString["kpid"].ToString() + "");
        }

        //快速评分
        protected void Save_Click(object Sender, EventArgs E)
        {
            //只显示当前评委类型的项
            string sql = " WHERE SSKPID='" + hkdb.GetStr(Request.QueryString["kpid"].ToString()) + "' AND SSBID='" + hkdb.GetStr(Request.QueryString["bid"].ToString()) + "'";
            switch (lblpwlx.Text)
            {
                case "总经理评委":
                    sql += " AND B.Pw_zr='是'";
                    break;
                case "副主管评委":
                    sql += " AND B.Pw_fzr='是'";
                    break;
                case "一般评委":
                    sql += " AND B.Pw_ybpw='是'";
                    break;
                case "工作人员评委":
                    sql += " AND B.Pw_gzry='是'";
                    break;
            }


            //1.检索被考评人的全部评分项目
            SqlDataReader dr1 = SqlHelper.ExecuteReader("SELECT A.*,(CASE WHEN A.FZ<=10 THEN A.PFDJ_Y-0.1 ELSE A.PFDJ_Y-1 END)AS PFDJ_Y2,(CASE WHEN A.FZ<=10 THEN A.PFDJ_L-0.1 ELSE A.PFDJ_L-1 END)AS PFDJ_L2 FROM HR_Kpdf_Kpxm02 A LEFT OUTER JOIN HR_Kpdf_Pfxm B ON(A.SSXMID=B.XMID)" + sql);
            while (dr1.Read())
            {
                //2.计算本次评分
                double dbpf = 0;
                switch (pflx.SelectedValue)
                {
                    case "优":
                        dbpf = Convert.ToDouble(dr1["fz"].ToString())*(1-Convert.ToDouble(bfb.Text)/100);
                        break;
                    case "良":
                        dbpf = Convert.ToDouble(dr1["PFDJ_Y2"].ToString()) * (1 - Convert.ToDouble(bfb.Text) / 100);
                        break;
                    case "中":
                        dbpf = Convert.ToDouble(dr1["PFDJ_L2"].ToString()) * (1 - Convert.ToDouble(bfb.Text) / 100);
                        break;
                    case "差":
                        dbpf = Convert.ToDouble(dr1["Pfdj_c"].ToString()) * (1 - Convert.ToDouble(bfb.Text) / 100);
                        break;
                }
                
                //3.判断当前评委、各评分项目下是否有值
                SqlDataReader dr2 = SqlHelper.ExecuteReader("SELECT * FROM HR_Kpdf_Kpxm04 WHERE SSMXID='" + dr1["MXID"].ToString() + "' AND PFRID='" + this.Session["userid"] + "'");
                if (dr2.Read())
                {
                    SqlHelper.ExecuteSql("UPDATE HR_Kpdf_Kpxm04 SET SJPF=" + dbpf + ",PFBZ='',XGPFSJ=GETDATE(),XGPFCS=XGPFCS+1 WHERE SSMXID='" + dr1["MXID"].ToString() + "' AND PFRID='" + this.Session["userid"] + "'");
                }
                else
                {
                    SqlHelper.ExecuteSql("INSERT INTO HR_Kpdf_Kpxm04(ssmxid,sskpid,ssbid,ssxmid,ssxmmc,sjxmid,sjxmmc,sjpf,pfbz,pfrid,pfrmc,pfsj,pwlx) VALUES('" + dr1["MXID"].ToString() + "','" + dr1["SSKPID"].ToString() + "','" + dr1["SSBID"].ToString() + "','" + dr1["SSXMID"].ToString() + "','" + dr1["SSXMMC"].ToString() + "','" + dr1["SJXMID"].ToString() + "','" + dr1["SJXMMC"].ToString() + "'," + dbpf + ",'','" + this.Session["userid"] + "','" + this.Session["username"] + "',GETDATE(),'" + lblpwlx.Text + "')");
                }
                dr2.Close();
            }
            dr1.Close();

            mydb.Alert_Goto("快速评分成功！", "Pwpf_View_Add.aspx?kpid=" + Request.QueryString["kpid"].ToString() + "&bid=" + Request.QueryString["bid"].ToString() + "");
        }
    }
}
