using System;
using System.Net;
using haoke365;

namespace hkpro
{
    public partial class Logout_A : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            switch (this.Session["systype"].ToString())
            {
                case "E":
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port,dl_rk) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "','WebAPP')");
                    Session.Clear();
                    Server.Transfer("Index_Eam_A.aspx");
                    break;
                case "F":
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port,dl_rk) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "','WebAPP')");
                    Session.Clear();
                    Server.Transfer("Index_Pms_A.aspx");
                    break;
                case "yz":
                    Session.Clear();
                    Server.Transfer("Index_Pms_Yz_A.aspx");
                    break;
                case "zh":
                    Session.Clear();
                    Server.Transfer("Index_Pms_Zh_A.aspx");
                    break;
                case "O":
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port,dl_rk) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "','WebAPP')");
                    Session.Clear();
                    Server.Transfer("Default_A.aspx");
                    break;
                case "P":
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port,dl_rk) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "','WebAPP')");
                    Session.Clear();
                    Server.Transfer("Index_Portal_A.aspx");
                    break;
                case "R":
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port,dl_rk) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "','WebAPP')");
                    Session.Clear();
                    Server.Transfer("Index_Report_A.aspx");
                    break;
                case "M":
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port,dl_rk) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "','WebAPP')");
                    Session.Clear();
                    Server.Transfer("Index_Scm_A.aspx");
                    break;
                case "G":
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port,dl_rk) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "','WebAPP')");
                    Session.Clear();
                    Server.Transfer("Index_Scm_Gys_A.aspx");
                    break;
                case "V":
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port,dl_rk) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "','WebAPP')");
                    Session.Clear();
                    Server.Transfer("Index_Vip_A.aspx");
                    break;
                case "hy":
                    Session.Clear();
                    Server.Transfer("Index_Vip_Hy_A.aspx");
                    break;
                case "K":
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port,dl_rk) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "','WebAPP')");
                    Session.Clear();
                    Server.Transfer("Index_Kms_A.aspx");
                    break;
                case "H":
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port,dl_rk) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "','WebAPP')");
                    Session.Clear();
                    Server.Transfer("Index_HR_A.aspx");
                    break;
                case "C":
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port,dl_rk) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "','WebAPP')");
                    Session.Clear();
                    Server.Transfer("Index_Crm_A.aspx");
                    break;
                default:
                    SqlHelper.ExecuteSql("insert into hk_DLRZ(dl_id,dl_rq,dl_ip,dl_jqm,dl_zt,dl_port,dl_rk) values('" + this.Session["userid"] + "',GETDATE(),'" + Request.UserHostAddress + "','" + Dns.GetHostName() + "','注销系统','" + Request.ServerVariables["REMOTE_PORT"] + "','WebAPP')");
                    Session.Clear();
                    Server.Transfer("Default_A.aspx");
                    break;
            }
        }
    }
}
