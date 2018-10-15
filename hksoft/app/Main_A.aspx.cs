using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro
{
    public partial class Main_A : System.Web.UI.Page
    {
        public string msgicon = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                ListViewBind();
            }

            int msgnum = (Int32)SqlHelper.ExecuteScalar("select count(*) from OA_Rwd01 a left join OA_Rwd02 b on a .rwid=b.ssrwid where b.jszt='未接收' and a.fbsj+1<GETDATE() and a.rwzt='已发布' and b.jsr='" + this.Session["userid"] + "'");
            int msgnun1= (Int32)SqlHelper.ExecuteScalar("select count(*) from OA_Rwd01 a left join OA_Rwd02 b on a .rwid=b.ssrwid where b.jszt!='已办结' and a.ynxs='是' and a.jzrq<GETDATE() and b.jsr='" + this.Session["userid"] + "'");
            if (msgnum == 0 && msgnun1==0)
            {
                msgicon = "";
            }
            else
            {
                msgicon = "<span class=\"heartbit\"></span><span class=\"point\"></span>";
            }
        }

        //绑定子程序 
        public void ListViewBind()
        {
            //我的消息
            lblMsgCount.Text = SqlHelper.ExecuteScalar("select count(*)as nums from hk_Mess_JS where jsr='" + this.Session["UserID"].ToString() + "' AND zt='0'").ToString();
            if (lblMsgCount.Text != "0")
            {
                p_msg_sub.Visible = true;
            }

            //公告通知
            lblNoticeCount.Text = SqlHelper.ExecuteScalar("select count(*) from hk_QYGG A LEFT OUTER JOIN YH B ON(A.LRR = B.UI_ID) LEFT OUTER JOIN hk_ZDYLX C ON(A.GGFL = C.ID) where A.zt = '已发布' and A.lx = '企业' and gglb = '1'").ToString();
            if (lblNoticeCount.Text != "0")
            {
                p_notice_sub.Visible = true;
            }


            //未接收任务
            Label2.Text = SqlHelper.ExecuteScalar("select count(*) from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid where r2.jsr='" + this.Session["userid"].ToString() + "' and r2.jszt='未接收' and r1.rwzt='已发布'").ToString();
            if (Label2.Text != "0")
            {
                Panel2.Visible = true;
            }

            //办理中任务
            Label1.Text = SqlHelper.ExecuteScalar("select count(*) from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid where r2.jsr='" + Session["userid"].ToString() + "' and r2.jszt='已接收' and r1.rwzt='已发布'").ToString();
            if (Label1.Text != "0")
            {
                Panel1.Visible = true;
            }

            //送审中任务
            Label5.Text = SqlHelper.ExecuteScalar("select count(*) from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid where r2.jsr='" + Session["userid"].ToString() + "' and r2.jszt='送审中' and r1.rwzt='已发布'").ToString();
            if (Label5.Text != "0")
            {
                Panel4.Visible = true;
            }


            //已办结
            Label6.Text = SqlHelper.ExecuteScalar("select count(*) from OA_Rwd02 r2 left join OA_Rwd01 r1 on r1.rwid=r2.ssrwid where r2.jsr='" + Session["userid"].ToString() + "' and r2.jszt='已办结' and (r1.rwzt='已发布'or r1.rwzt='已完成')").ToString();
            if (Label6.Text != "0")
            {
                Panel7.Visible = true;
            }
            ////待办工作
            //if (this.Session["systype"].ToString() == "O")
            //{
            //    p_flow1.Visible = true;
            //    p_flow2.Visible = true;
            //    lblWorkCount.Text = SqlHelper.ExecuteScalar("SELECT count(*) FROM hk_Work WHERE (CHARINDEX('," + this.Session["userid"].ToString() + ",',','+wUserIDs+',') > 0)").ToString();
            //    if (lblWorkCount.Text != "0")
            //    {
            //        p_flow_sub.Visible = true;
            //    }
            //}
        }
    }
}
