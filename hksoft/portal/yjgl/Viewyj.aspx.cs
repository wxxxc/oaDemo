using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.yjgl
{
    public partial class Viewyj : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10102,1002", "0");

                //from收件箱
                if (Request.QueryString["type"].ToString() == "s")
                {
                    SqlHelper.ExecuteSql("UPDATE hk_Mail_JS SET JSZT='1',JSSJ=GETDATE() WHERE JSID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

                    //显示
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT A.*,(CASE WHEN msbz='是' THEN '***密送邮件***' ELSE jsrNames END)AS jsrNames2,B.UI_DESC FROM hk_Mail_JS A LEFT OUTER JOIN YH B ON (A.JSR=B.UI_ID) WHERE JSID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        bt.Text = datar["jsbt"].ToString();
                        fjr.Text = datar["fsrName"].ToString();
                        sjr.Text = datar["ui_desc"].ToString() + "【" + datar["jsrNames2"].ToString() + "】";
                        rq.Text = datar["fssj"].ToString();
                        nr.Text = hkdb.GetStrTeOut(datar["jsnr"].ToString());

                        //附件
                        Number.Text = datar["yjfj"].ToString();
                        bd.GetAtt(Number.Text, "p01", "portal/yj", fujian);

                        datar.Close();
                    }
                    else
                    {
                        datar.Close();
                        mydb.Alert_Goto("该邮件不存在，可能已被删除！", "sjx.aspx?i=2");
                    }

                    //Init
                    WriteBtn.Visible = true;
                    ZhuanBtn.Visible = true;
                    DelBtn_s.Visible = true;
                    BackBtn_s.Visible = true;
                }
                else
                {
                    SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT A.* FROM hk_Mail_FS A WHERE YJID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar1.Read())
                    {
                        bt.Text = datar1["fsbt"].ToString();
                        fjr.Text = datar1["fsrName"].ToString();
                        sjr.Text = datar1["jsrNames"].ToString();
                        rq.Text = datar1["fssj"].ToString();
                        nr.Text = hkdb.GetStrTeOut(datar1["fsnr"].ToString());

                        //附件
                        Number.Text = datar1["yjfj"].ToString();
                        bd.GetAtt(Number.Text, "p01", "portal/yj", fujian);

                        datar1.Close();
                    }
                    else
                    {
                        datar1.Close();
                        mydb.Alert_Goto("该邮件不存在，可能已被删除！", "fajx.aspx");
                    }

                    //Init
                    p_cyzt.Visible = true;
                    BackBtn_f.Visible = true;
                    DelBtn_f.Visible = true;

                    GridViewBind();
                }
            }
        }

        public void GridViewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.JSZT,A.JSSJ,B.UI_DESC FROM hk_Mail_JS A LEFT OUTER JOIN YH B ON(A.JSR=B.UI_ID) WHERE SSYJID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' ORDER BY UI_DESC");
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

        //转发 
        protected void Zhuan_Click(object sender, EventArgs e)
        {
            Server.Transfer("xyj.aspx?type=zf&id=" + Request.QueryString["id"].ToString() + "");
        }

        //回复
        protected void Roll_Click(object sender, EventArgs e)
        {
            Server.Transfer("xyj.aspx?type=hf&id=" + Request.QueryString["id"].ToString() + "");
        }

        //收件删除
        protected void Del_Click_s(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE hk_Mail_JS SET SCBZ='是' WHERE JSID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            mydb.Alert_Goto("邮件已删除至废件箱！", "sjx.aspx?i=2");
        }

        //发件删除 
        protected void Del_Click_f(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE hk_Mail_FS SET SCBZ='是' WHERE YJID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            mydb.Alert_Goto("邮件已删除至废件箱！", "fajx.aspx");
        }
    }
}
