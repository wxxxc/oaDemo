using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Pwpf_View_Show : System.Web.UI.Page
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
                    mydb.Alert_Close("对不起，您并未被设定为评委，无法查看！");
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

            //GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string sql = " WHERE A.SSKPID = '" + hkdb.GetStr(Request.QueryString["kpid"].ToString()) + "' AND A.SSBID = '" + hkdb.GetStr(Request.QueryString["bid"].ToString()) + "'";

            //只显示当前评委类型的项
            switch (lblpwlx.Text)
            {
                //case "总经理评委":
                //sql += " AND B.Pw_zr='是'";
                //break;
                //case "副主管评委":
                //sql += " AND B.Pw_fzr='是'";
                //break;
                //case "一般评委":
                //sql += " AND B.Pw_ybpw='是'";
                //break;
                case "工作人员评委":
                    sql += " AND B.Pw_gzry='是'";
                    break;
            }

            //可以查看"本人及其它工作人员评委"的评分结果
            string sql1 = " WHERE PFRID='" + this.Session["UserID"] + "' OR PWLX='工作人员评委'";

            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,(CASE WHEN A.FZ<=10 THEN A.PFDJ_Y-0.1 ELSE A.PFDJ_Y-1 END)AS PFDJ_Y2,(CASE WHEN A.FZ<=10 THEN A.PFDJ_L-0.1 ELSE A.PFDJ_L-1 END)AS PFDJ_L2,ISNULL((SELECT CASE WHEN xmmc NOT IN('德','能','勤','廉') THEN '绩' ELSE xmmc END FROM HR_Kpdf_Pfxm WHERE xmid=B.upid),b.xmmc)AS xmfl,ISNULL(C.SJPF,0)AS SJPF,C.PFBZ FROM HR_Kpdf_Kpxm02 A LEFT OUTER JOIN HR_Kpdf_Pfxm B ON(A.SSXMID=B.XMID) FULL JOIN (SELECT * FROM HR_Kpdf_Kpxm04 " + sql1 + ") C ON(A.MXID=C.SSMXID) " + sql + " ORDER BY B.PXH");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //查询 
        public void Query_Click(object sender, EventArgs e)
        {
            //获取密钥
            string pwdstr = SqlHelper.ExecuteScalar("SELECT CXMY FROM HR_Kpdf_PW WHERE PID='" + this.Session["userid"] + "'").ToString();

            //加密
            byte[] data = System.Text.Encoding.Unicode.GetBytes(cxmy.Text.ToCharArray());
            System.Security.Cryptography.MD5CryptoServiceProvider md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] result = md5.ComputeHash(data);
            string sResult = System.Text.Encoding.Unicode.GetString(result);
            string EnPswdStr = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(cxmy.Text.ToString(), "MD5");

            //对比
            if (EnPswdStr != pwdstr)
            {
                mydb.Alert("查询密钥错误！");
            }
            else
            {
                GridViewBind();
            }
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
    }
}
