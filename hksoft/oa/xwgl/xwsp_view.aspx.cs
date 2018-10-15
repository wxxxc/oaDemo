using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.oa.xwgl
{
    public partial class xwsp_view1 : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11103", "0");
                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));

                SqlDataReader datar = SqlHelper.ExecuteReader("select a.*,b.flmc from OA_XWNR a,oa_xwfl b where a.fl=b.flid and xwid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (datar.Read())
                {
                    xwbt.Text = datar["xwbt"].ToString();
                    xwzy.Text = datar["xwzy"].ToString();
                    xwly.Text = datar["xwly"].ToString();
                    xwfl.Text = datar["flmc"].ToString();
                    xwzz.Text = datar["xwzz"].ToString();
                    lblnr.Text = datar["xwnr"].ToString();
                    spyj.Text = datar["spyj"].ToString();
                    xwsj.Text = hkdb.GetDate(datar["xwsj"].ToString());
                    savefj.Text = datar["fjmc"].ToString();
                    savelj.Text = datar["fjlj"].ToString();
                    savefj.NavigateUrl = (datar["fjlj"] == System.DBNull.Value ? "" : "../.." + datar["fjlj"].ToString()) + datar["fjmc"].ToString();

                    if (datar["zt"].ToString() == "已发布")
                    {
                        PassBtn.Visible = false;
                    }
                    else if (datar["zt"].ToString() == "已停用")
                    {
                        StopBtn.Visible = false;
                    }
                    ycxx.Text = datar["cjr"].ToString();
                    datar.Close();
                }
                else
                {
                    datar.Close();
                    mydb.Alert("此记录不存在,可能已被删除！");
                }
            }
        }

        //同意申请
        protected void Pass_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("update OA_XWNR set zt='已发布',spr='" + this.Session["userid"] + "',spsj=GETDATE(),spyj='" + hkdb.GetStr(spyj.Text) + "' where xwid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            Dxyj_Click("1");
            mydb.Alert_Refresh_Close("发布成功！", "Xwsp.aspx");
        }

        //拒绝申请
        protected void Stop_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("update OA_XWNR set zt='已停用',spr='" + this.Session["userid"] + "',spsj=GETDATE(),spyj='" + hkdb.GetStr(spyj.Text) + "' where xwid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            Dxyj_Click("2");
            mydb.Alert_Refresh_Close("停用成功！", "Xwsp.aspx");
        }

        //退回申请 
        protected void Back_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("update OA_XWNR set zt='草稿',spr='" + this.Session["userid"] + "',spsj=GETDATE(),spyj='" + hkdb.GetStr(spyj.Text) + "' where xwid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            Dxyj_Click("3");
            mydb.Alert_Refresh_Close("退回成功！", "Xwsp.aspx");
        }

        protected void Dxyj_Click(string mess)
        {
            //Msg 
            if (xxtz.Checked == true | dxtz.Checked == true)
            {
                string message = null;

                switch (mess)
                {
                    case "1":
                        message = "您撰写的[" + xwbt.Text + "]新闻已发布!" + this.Session["username"].ToString();
                        break;
                    case "2":
                        message = "您撰写的[" + xwbt.Text + "]新闻已停用!" + this.Session["username"].ToString();
                        break;
                    default:
                        message = "您撰写的[" + xwbt.Text + "]新闻已退回!" + this.Session["username"].ToString();
                        break;
                }

                hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), ycxx.Text, message);
            }
        }
    }
}
