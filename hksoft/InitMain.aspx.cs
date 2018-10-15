using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro
{
    public partial class InitMain : System.Web.UI.Page
    {
        BindData bd = new BindData();

        protected void page_load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("1");

            if (!IsPostBack)
            {
                //公共信息
                if (this.Session["systype"].ToString() == "A")     //主登录页
                {

                }
                else  //子登录页
                {
                    if (this.Session["systype"].ToString() == "R")
                    {
                        mydb.Alert("提示:首次点击【报表示例】中的报表时，需要1分钟左右的加载时间，还请耐心等待！");
                    }
                }

                //物业
                if (bd.CheckRepeat("SELECT Xh FROM hk_Init WHERE ProduID='F' AND ChildVersion='0'") == "true")
                {
                    lblpms.Text = "0";
                }
                else
                {
                    lblpms.Text = "1";
                }

                //资产
                if (bd.CheckRepeat("SELECT Xh FROM hk_Init WHERE ProduID='E' AND ChildVersion='0'") == "true")
                {
                    lbleam.Text = "0";
                }
                else
                {
                    lbleam.Text = "1";
                }

                GridViewBind();
            }

            string strPath = "";

            SqlDataReader datarTB = SqlHelper.ExecuteReader("select a.*,b.name,b.id as bid,b.Path,b.ProduID from hk_MyDesk a left outer join hk_DeskTop b on (a.ssdmid=b.id)  where username='" + this.Session["userid"] + "'  order by orderid asc");
            this.Label.Text = null;
            int glTMP1 = 0;
            this.Label.Text += "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" >";
            this.Label.Text += "<tr>";
            while (datarTB.Read())
            {
                string lstr = null;
                if (datarTB["bid"].ToString() == "yj")
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("select top  " + datarTB["topnum"] + "  jsid,jsbt,fssj,fsrName from hk_Mail_JS where jsr='" + this.Session["userid"] + "' and scbz='否' and jszt='0' order by fssj desc");
                    lstr += "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\">";
                    while (datar.Read())
                    {
                        lstr += "<tr><td>&nbsp;·<a  class=\"gvlink\" href=portal/yjgl/Viewyj.aspx?type=s&id=" + datar["jsid"] + "  title=\"发送人：" + datar["fsrName"] + "  发送时间：" + datar["fssj"] + "\">" + datar["jsbt"] + "</a></td><td>" + datar["fsrName"] + "</td><td>" + string.Format("{0:d}", datar["fssj"]) + "</td></tr>";
                    }
                    lstr += "</table>";
                    datar.Close();
                }
                //P未读邮件

                if (datarTB["bid"].ToString() == "gg")
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("select top  " + datarTB["topnum"] + " ggid,ggzt,lrr,lrsj from hk_QYGG  where zt='已发布' and lx='企业' and gglb='1' and getdate() between kssj and jssj order by lrsj desc");
                    lstr += "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\">";
                    while (datar.Read())
                    {
                        lstr += "<tr><td >&nbsp;·<a class=\"gvlink\" href=#  onclick=javascript:popMod('portal/xzgl/qygg_view.aspx?id=" + datar["ggid"] + "')  title=\"录入人：" + datar["lrr"] + " \">" + datar["ggzt"] + "</a></td><td>" + string.Format("{0:d}", datar["lrsj"]) + "</td></tr>";
                    }
                    lstr += "</table>";
                    datar.Close();
                }
                //P最新公告

                if (datarTB["bid"].ToString() == "gz")
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("select top  " + datarTB["topnum"] + " * from hk_GZZD where zt='已发布' and lx='企业' order by cjsj desc");
                    lstr += "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\">";
                    while (datar.Read())
                    {
                        lstr += "<tr><td>&nbsp;·<a class=\"gvlink\" href=#  onclick=javascript:popMod('portal/xzgl/gzzd_view.aspx?id=" + datar["zdid"] + "') title=\"创建人：" + datar["cjr"] + "&#13;发文单位：" + datar["fwdw"] + " \">" + datar["zdbt"] + "</a></td><td>" + string.Format("{0:d}", datar["cjsj"]) + "</td></tr>";
                    }
                    lstr += "</table>";
                    datar.Close();
                }
                //P规章制度

                if (datarTB["bid"].ToString() == "jh")
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("select top  " + datarTB["topnum"] + "  jhid,ztmb,jhyf,jhnf,zt,jhz from OA_GZJH01  where jhz='" + this.Session["userid"] + "' and jhsx='0' order by jhnf desc,jhyf desc");
                    lstr += "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\">";
                    while (datar.Read())
                    {
                        lstr += "<tr><td >&nbsp;·<a class=\"gvlink\" href=#  onclick=javascript:popMod('oa/jhgl/wdjh_mod.aspx?id=" + datar["jhid"] + "') title=\"计划者：" + datar["jhz"] + " \">" + datar["ztmb"] + "</a></td><td>" + datar["zt"] + "</td><td>" + datar["jhnf"] + "-" + datar["jhyf"] + "</td></tr>";
                    }
                    lstr += "</table>";
                    datar.Close();
                }
                //O我的计划

                if (datarTB["bid"].ToString() == "hy")
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("select top  " + datarTB["topnum"] + " a.id,a.hyzt,a.kssj,a.fqr from oa_hyqc a where zt='已审批' and a.kssj>=GETDATE() and cjry like '%" + this.Session["userid"].ToString() + ",%' order by a.fqsj desc");
                    lstr += "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\">";
                    while (datar.Read())
                    {
                        lstr += "<tr><td >&nbsp;·<a class=\"gvlink\" href=#  onclick=javascript:popMod('oa/hygl/hycx_view.aspx?id=" + datar["id"] + "') title=\"发起人：" + datar["fqr"] + " \">" + datar["hyzt"] + "</a></td><td>" + string.Format("{0:d}", datar["kssj"]) + "</td></tr>";
                    }
                    lstr += "</table>";
                    datar.Close();
                }
                //O我的会议

                if (datarTB["bid"].ToString() == "zs")
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("select top  " + datarTB["topnum"] + " * from OA_KnowLedge where State= '正常' order by LastTime desc");
                    lstr += "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\">";
                    while (datar.Read())
                    {
                        lstr += "<tr><td >&nbsp;·<a class=\"gvlink\" href=#  onclick=javascript:popMod('oa/zsgl/zsshow.aspx?id=" + datar["id"] + "') title=\"状态：" + datar["state"] + " \">" + datar["Title"] + "</a></td><td>" + string.Format("{0:d}", datar["LastTime"]) + "</td></tr>";
                    }
                    lstr += "</table>";
                    datar.Close();
                }
                //O知识中心

                if (datarTB["bid"].ToString() == "xw")
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("select top  " + datarTB["topnum"] + " * from OA_XWNR where zt='已发布' order by cjsj desc");
                    lstr += "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\">";
                    while (datar.Read())
                    {
                        lstr += "<tr><td >&nbsp;·<a class=\"gvlink\" href=#  onclick=javascript:popMod('oa/xwgl/xwcx_view.aspx?id=" + datar["xwid"] + "') title=\"作者：" + datar["xwzz"] + "&#13;新闻来源：" + datar["xwly"] + " \">" + datar["xwbt"] + "</a></td><td>" + string.Format("{0:d}", datar["cjsj"]) + "</td></tr>";
                    }
                    lstr += "</table>";
                    datar.Close();
                }
                //O新闻中心

                if (datarTB["bid"].ToString() == "zc")
                {
                    
                        SqlDataReader datar = SqlHelper.ExecuteReader("select top  " + datarTB["topnum"] + " wpid,wpmc,wpzt,wptxm from as_wp where bgrid= '" + this.Session["userid"] + "' order by wptxm desc");
                        lstr += "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\">";
                        while (datar.Read())
                        {
                            if (lbleam.Text == "0")
                            {
                                lstr += "<tr><td >&nbsp;·<a class=\"gvlink\" href=#  onclick=javascript:popMod('eam/zcbb/Zcll_View.aspx?id=" + datar["wpid"] + "')>" + datar["wpmc"] + "+(" + datar["wptxm"] + ")</a></td><td>" + datar["wpzt"] + "</td></tr>";
                            }
                            else
                            {
                                lstr += "<tr><td >&nbsp;·<a class=\"gvlink\" href=#  onclick=javascript:popMod('eam2/zcbb/Zcll_View.aspx?id=" + datar["wpid"] + "')>" + datar["wpmc"] + "+(" + datar["wptxm"] + ")</a></td><td>" + datar["wpzt"] + "</td></tr>";
                            }
                        }
                        lstr += "</table>";
                        datar.Close();
                }
                //E我保管的资产

                if (datarTB["bid"].ToString() == "wp")
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("select top  " + datarTB["topnum"] + " lyid,lydh,lyzt,sqrmc,sqsj from as_lyd01 where sqrid= '" + this.Session["userid"] + "' order by sqsj desc");
                    lstr += "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\">";
                    while (datar.Read())
                    {
                        if (lbleam.Text == "0")
                        {
                            lstr += "<tr><td >&nbsp;·<a class=\"gvlink\" href=#  onclick=javascript:popWin_w('eam/wply/lydlr_mod.aspx?id=" + datar["lyid"] + "') title=\"申请人：" + datar["sqrmc"] + " \">" + datar["lydh"] + "</a></td><td>" + datar["lyzt"] + "</td><td>" + string.Format("{0:d}", datar["sqsj"]) + "</td></tr>";
                        }
                        else
                        {
                            lstr += "<tr><td >&nbsp;·<a class=\"gvlink\" href=#  onclick=javascript:popWin_w('eam2/wply/lydlr_mod.aspx?id=" + datar["lyid"] + "') title=\"申请人：" + datar["sqrmc"] + " \">" + datar["lydh"] + "</a></td><td>" + datar["lyzt"] + "</td><td>" + string.Format("{0:d}", datar["sqsj"]) + "</td></tr>";
                        }
                    }
                    lstr += "</table>";
                    datar.Close();
                }
                //E我领用的物品

                if (datarTB["bid"].ToString() == "cx")
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("select top  " + datarTB["topnum"] + " cx_id,cx_zt,cx_fbr,cx_sdate from SC_CXHD where cx_sdate<=GETDATE() and cx_edate >=GETDATE()");
                    lstr += "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\">";
                    while (datar.Read())
                    {
                        lstr += "<tr><td >&nbsp;·<a class=\"gvlink\" href=#  onclick=javascript:popMod('scm/cxtj/cxhdcx_view.aspx?url=index&id=" + datar["cx_id"] + "') title=\"发布人：" + datar["cx_fbr"] + " \">" + datar["cx_zt"] + "</a></td><td>" + string.Format("{0:d}", datar["cx_sdate"]) + "</td></tr>";
                    }
                    lstr += "</table>";
                    datar.Close();
                }
                //G促销活动

                if (datarTB["bid"].ToString() == "bd")
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("select top  " + datarTB["topnum"] + " bd_id,bd_bt,bd_zt,bd_sdate,bd_scr from SC_BD01 where bd_zt='正常' and bd_sdate<=GETDATE() and bd_edate>=GETDATE()");
                    lstr += "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\">";
                    while (datar.Read())
                    {
                        lstr += "<tr><td >&nbsp;·<a class=\"gvlink\" href=#  onclick=javascript:popMod('scm/bdgl/bdcx_view.aspx?id=" + datar["bd_id"] + "') title=\"生成人：" + datar["bd_scr"] + " \">" + datar["bd_bt"] + "</a></td><td>" + datar["bd_zt"] + "</td><td>" + string.Format("{0:d}", datar["bd_sdate"]) + "</td></tr>";
                    }
                    lstr += "</table>";
                    datar.Close();
                }
                //G排行榜单

                if (datarTB["bid"].ToString() == "mb")
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("select top  " + datarTB["topnum"] + " mbid,mbmc,jdsj from VI_MBDA where mbzt='已启用'");
                    lstr += "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\">";
                    while (datar.Read())
                    {
                        lstr += "<tr><td >&nbsp;·<a class=\"gvlink\" href=#  onclick=javascript:popMod('vip/mbgl/mbcx_view.aspx?id=" + datar["mbid"] + "')>" + datar["mbmc"] + "</a></td><td>" + string.Format("{0:d}", datar["jdsj"]) + "</td></tr>";
                    }
                    lstr += "</table>";
                    datar.Close();
                }
                //V模板中心

                if (datarTB["bid"].ToString() == "lp")
                {
                    if (lblpms.Text == "0")
                    {
                        string str = "";
                        //判断公司
                        if (this.Session["qyid"].ToString() != "001")
                        {
                            str = str + " where ssgs= '" + this.Session["qyid"] + "'";
                        }

                        SqlDataReader datar = SqlHelper.ExecuteReader("select top  " + datarTB["topnum"] + " lpid,name,qy_jc from fc_lp a left outer JOIN QY b on(a.ssgs=b.qy_id)" + str + " order by lpid desc");
                        lstr += "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\">";
                        while (datar.Read())
                        {
                            lstr += "<tr><td >&nbsp;·<a  class=\"gvlink\" href=# onclick=javascript:popMod('pms/zzgl/xqxx_view.aspx?id=" + datar["lpid"] + "&type=r')>" + datar["name"] + "</a></td><td>" + datar["qy_jc"] + "</td></tr>";
                        }
                        lstr += "</table>";
                        datar.Close();
                    }
                    else
                    {
                        SqlDataReader datar = SqlHelper.ExecuteReader("select top  " + datarTB["topnum"] + " lpid,name from fc_lp a order by lpid desc");
                        lstr += "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\">";
                        while (datar.Read())
                        {
                            lstr += "<tr><td >&nbsp;·<a  class=\"gvlink\" href=# onclick=javascript:popMod('pms2/zzgl/xqxx_view.aspx?id=" + datar["lpid"] + "&type=r')>" + datar["name"] + "</a></td></tr>";
                        }
                        lstr += "</table>";
                        datar.Close();
                    }
                }//F最新房产 


                if (datarTB["bid"].ToString() == "ts")
                {
                    if (lblpms.Text == "0")
                    {
                        string str = "";
                        //判断公司
                        if (this.Session["qyid"].ToString() != "001")
                        {
                            str = str + " where e.ssgs= '" + this.Session["qyid"] + "'";
                        }

                        SqlDataReader datar = SqlHelper.ExecuteReader("select top  " + datarTB["topnum"] + " a.id,a.cellcode,a.tsnr,a.tsdate from zh_zhts a left outer join fc_cell b on a.cellcode=b.cellid left outer join FC_DY c on (b.ssdyid=c.dyid) left outer join FC_LG d on (c.sslgid=d.lgid) left outer join FC_LP e on (d.sslpid=e.lpid) left outer JOIN QY f on (e.ssgs=f.qy_id)" + str + "order by a.id desc");
                        lstr += "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\">";
                        while (datar.Read())
                        {
                            lstr += "<tr><td >&nbsp;·<a class=\"gvlink\" href=#  onclick=javascript:popMod('pms/yzgl/zhtscx_show.aspx?id=" + datar["id"] + "&cellid=" + datar["cellcode"] + "')>" + datar["tsnr"] + "</a></td><td>" + string.Format("{0:d}", datar["tsdate"]) + "</td></tr>";
                        }
                        lstr += "</table>";
                        datar.Close();
                    }
                    else
                    {
                        SqlDataReader datar = SqlHelper.ExecuteReader("select top  " + datarTB["topnum"] + " a.id,a.cellcode,a.tsnr,a.tsdate from zh_zhts a order by a.id desc");
                        lstr += "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\">";
                        while (datar.Read())
                        {
                            lstr += "<tr><td >&nbsp;·<a class=\"gvlink\" href=#  onclick=javascript:popMod('pms2/yzgl/zhtscx_show.aspx?id=" + datar["id"] + "&cellid=" + datar["cellcode"] + "')>" + datar["tsnr"] + "</a></td><td>" + string.Format("{0:d}", datar["tsdate"]) + "</td></tr>";
                        }
                        lstr += "</table>";
                        datar.Close();
                    }
                }//F业主投诉

                if (datarTB["bid"].ToString() == "yw")
                {
                    if (lblpms.Text == "0")
                    {
                        string str = "";
                        //判断公司
                        if (this.Session["qyid"].ToString() != "001")
                        {
                            str = str + " and ssgs= '" + this.Session["qyid"] + "'";
                        }

                        SqlDataReader datar = SqlHelper.ExecuteReader("select top  " + datarTB["topnum"] + " id,title,ddate from WY_YWHHY  where DDATE>=getdate() " + str + " order by ddate");
                        lstr += "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\">";
                        while (datar.Read())
                        {
                            lstr += "<tr><td >&nbsp;·<a class=\"gvlink\" href=#  onclick=javascript:popMod('pms/ywhgl/ywhhycx_view.aspx?id=" + datar["id"] + "')>" + datar["title"] + "</a></td><td>" + string.Format("{0:d}", datar["ddate"]) + "</td></tr>";
                        }
                        lstr += "</table>";
                        datar.Close();
                    }
                    else
                    {
                        SqlDataReader datar = SqlHelper.ExecuteReader("select top " + datarTB["topnum"] + " id,title,ddate from WY_YWHHY where DDATE>=getdate() order by ddate");
                        lstr += "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\">";
                        while (datar.Read())
                        {
                            lstr += "<tr><td >&nbsp;·<a class=\"gvlink\" href=#  onclick=javascript:popMod('pms2/ywhgl/ywhhycx_view.aspx?id=" + datar["id"] + "')>" + datar["title"] + "</a></td><td>" + string.Format("{0:d}", datar["ddate"]) + "</td></tr>";
                        }
                        lstr += "</table>";
                        datar.Close();
                    }
                }//F待开会议

                switch (datarTB["ProduID"].ToString())
                {
                    case "F":
                        if (lblpms.Text == "0")
                        {
                            strPath = "pms/" + datarTB["Path"].ToString();
                        }
                        else
                        {
                            strPath = "pms2/" + datarTB["Path"].ToString();
                        }
                        break;
                    case "E":
                        if (lbleam.Text == "0")
                        {
                            strPath = "eam/" + datarTB["Path"].ToString();
                        }
                        else
                        {
                            strPath = "eam2/" + datarTB["Path"].ToString();
                        }
                        break;
                    default:
                        strPath = datarTB["Path"].ToString();
                        break;
                }

                this.Label.Text += " <td width=\"49%\" valign=\"top\"> <table width=\"100%\" height=\"12\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td></td> </tr></table><table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td valign=\"top\" ><table width=\"100%\" height=\"5\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr> <td width=\"5\"  background=\"images/head_bg_m.gif\"><img src=\"images/head_bg_l.gif\" /></td> <td width=\"142\" background=\"images/head_bg_m.gif\"><img src=\"images/arrow.gif\" />&nbsp;<a href=\"" + strPath + "\" class=\"top_text\" title=\"查看全部\" target=\"_blank\"><strong><u>" + datarTB["Name"].ToString() + "</u></strong></a></td><td background=\"images/head_bg_m.gif\" align=\"right\"><A href=\"javascript:_update(" + datarTB["id"].ToString() + ");\"><img src=\"images/index_set.gif\"  border=\"0\" /></a>&nbsp;<A href=\"javascript:_del(" + datarTB["id"].ToString() + ");\"><img src=\"images/index_del.gif\"  border=\"0\" /></a></td><td width=\"12\" background=\"images/head_bg_m.gif\" align=\"right\"><img src=\"images/head_bg_r.gif\" /></td></tr></table><table width=\"100%\" height=\"" + int.Parse(datarTB["topnum"].ToString()) * 25 + "px\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#FFFFFF\" style=\"border-right: #6795B4 1px solid;border-left: #6795B4 1px solid;\"><tr ><td valign=\"top\">" + lstr + "</td></tr></table><table width=\"100%\" height=\"1\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-bottom: #6795B4 1px solid;\" ><tr> <td ></td></tr></table></td></tr> </table></td><td width=\"2%\">&nbsp;</td>";
                //this.Label.Text += " <td width=\"49%\" valign=\"top\"> <table width=\"100%\" height=\"12\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td></td> </tr></table><table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td valign=\"top\" ><table width=\"100%\" height=\"5\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr> <td width=\"5\"  background=\"images/head_bg_m.gif\"><img src=\"images/head_bg_l.gif\" /></td> <td width=\"142\" background=\"images/head_bg_m.gif\"><img src=\"images/arrow.gif\" />&nbsp;<strong>" + datarTB["Name"].ToString() + "</strong></td><td background=\"images/head_bg_m.gif\" align=\"right\"><A href=\"javascript:_update(" + datarTB["id"].ToString() + ");\"><img src=\"images/index_set.gif\"  border=\"0\" /></a>&nbsp;<A href=\"javascript:_del(" + datarTB["id"].ToString() + ");\"><img src=\"images/index_del.gif\"  border=\"0\" /></a></td><td width=\"12\" background=\"images/head_bg_m.gif\" align=\"right\"><img src=\"images/head_bg_r.gif\" /></td></tr></table><table width=\"100%\" height=\"" + int.Parse(datarTB["topnum"].ToString()) * 25 + "px\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#FFFFFF\" style=\"border-right: #6795B4 1px solid;border-left: #6795B4 1px solid;\"><tr ><td valign=\"top\">" + lstr + "</td></tr></table><table width=\"100%\" height=\"1\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-bottom: #6795B4 1px solid;\" ><tr> <td ></td></tr></table></td></tr> </table></td><td width=\"2%\">&nbsp;</td>";

                glTMP1 = glTMP1 + 1;
                if (glTMP1 == 2)
                {
                    Label.Text += "</tr><TR>";
                    glTMP1 = 0;
                }
            }
            this.Label.Text += " </table>";
            datarTB.Close();
        }

        public void GridViewBind()
        {
            //投票调查 
            SqlDataReader datar1 = SqlHelper.ExecuteReader("select ID,ProjectName from hk_Poll_Project where ProjectTag='1' and ProjectType='企业'");
            if (datar1.Read())
            {
                tpdc.Text = "当前正在举行《" + datar1["ProjectName"] + "》投票调查";
                dcjg.Text = "查看结果";

                int i = (int)SqlHelper.ExecuteScalar("select count(*) as nums from hk_Poll_Data where ProjectID=" + datar1["ID"] + " and yhid='" + this.Session["userid"] + "'");
                if (i == 0)
                {
                    cytp.Text = "参与投票";
                }
            }
            datar1.Close();
        }

        public void Ggxx_Click(object sender, EventArgs e)
        {
            switch (ggxx.SelectedValue)
            {
                case "dwml":
                    //Server.Transfer("portal/xzgl/dwmlcx.aspx");
                    Response.Redirect("portal/xzgl/dwmlcx.aspx");
                    break;
                case "spdb":
                    //Server.Transfer("portal/xzgl/spdbcx.aspx");
                    Response.Redirect("portal/xzgl/spdbcx.aspx");
                    break;
            }
        }
    }
}
