using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class Flow_Show_Visual : System.Web.UI.Page
    {
        public static string lblContent, nlContent;
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                nlContent = "";
                lblContent = "";

                lblwfno.Text = Request.QueryString["FlowNumber"].ToString();

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowNode WHERE FK_wfno='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "'");
                while (dr.Read())
                {
                    if (dr["fnPosition"].ToString() == "开始")
                    {
                        lblContent += "<vml:roundrect id=" + dr["fnNum"].ToString() + " ondblclick=Edit_Step(" + dr["fnID"].ToString() + "); style=\"Z-INDEX: 1; LEFT: " + dr["LeftMargin"].ToString() + "px; VERTICAL-ALIGN: middle; WIDTH: 100px; CURSOR: hand; POSITION: absolute; TOP: " + dr["TopMargin"].ToString() + "px; HEIGHT: 50px; TEXT-ALIGN: center\"   title=\"下一步骤：" + dr["NextNodeNum"].ToString() + "&#13;&#10;--&#13;&#10;经办人姓名：" + dr["fnUserNames"].ToString() + "&#13;&#10;--&#13;&#10;经办部门：" + dr["fnDeptNames"].ToString() + "&#13;&#10;--&#13;&#10;经办角色：" + dr["fnRoleNames"].ToString() + "&#13;&#10;--&#13;&#10;可写字段：" + dr["fnWriteName"].ToString() + "&#13;&#10;--&#13;&#10;审批人员选择：" + dr["SelectMode"].ToString() + "&#13;&#10;--&#13;&#10;审批模式：" + dr["ReviewMode"].ToString() + "&#13;&#10;--&#13;&#10;当前节点，" + dr["TimeLimit"].ToString() + "小时未审批自动结束\";  coordsize=\"21600,21600\" arcsize=\"4321f\" fillcolor=\"#00EE00\" receiverName=\"\" receiverID=\"\" readOnly=\"0\" flowFlag=\"0\" flowTitle=\"<b>" + dr["fnNum"].ToString() + "</b><br>" + dr["fnName"].ToString() + "\" passCount=\"0\" flowType=\"start\" table_id=\"" + dr["fnID"].ToString() + "\" inset=\"2pt,2pt,2pt,2pt\"><vml:shadowoffset=\"3px,3px\" color=\"#b3b3b3\" type=\"single\" on=\"T\"></vml:shadow><vml:textbox onselectstart=\"return false;\" inset=\"1pt,2pt,1pt,1pt\"><B>" + dr["fnNum"].ToString() + "</B><BR>" + dr["fnName"].ToString() + "</vml:textbox></vml:roundrect>";
                    }
                    else if (dr["fnPosition"].ToString() == "结束")
                    {
                        lblContent += "<vml:roundrect id=" + dr["fnNum"].ToString() + " ondblclick=Edit_Step(" + dr["fnID"].ToString() + "); style=\"Z-INDEX: 1; LEFT: " + dr["LeftMargin"].ToString() + "px; VERTICAL-ALIGN: middle; WIDTH: 100px; CURSOR: hand; POSITION: absolute; TOP: " + dr["TopMargin"].ToString() + "px; HEIGHT: 50px; TEXT-ALIGN: center\"   title=\"下一步骤：结束&#13;&#10;--&#13;&#10;经办人姓名：" + dr["fnUserNames"].ToString() + "&#13;&#10;--&#13;&#10;经办部门：" + dr["fnDeptNames"].ToString() + "&#13;&#10;--&#13;&#10;经办角色：" + dr["fnRoleNames"].ToString() + "&#13;&#10;--&#13;&#10;可写字段：" + dr["fnWriteName"].ToString() + "&#13;&#10;--&#13;&#10;审批人员选择：" + dr["SelectMode"].ToString() + "&#13;&#10;--&#13;&#10;审批模式：" + dr["ReviewMode"].ToString() + "&#13;&#10;--&#13;&#10;当前节点，" + dr["TimeLimit"].ToString() + "小时未审批自动结束\";  coordsize=\"21600,21600\" arcsize=\"4321f\" fillcolor=\"#F4A8BD\" receiverName=\"\" receiverID=\"\" readOnly=\"0\" flowFlag=\"0\" flowTitle=\"<b>" + dr["fnNum"].ToString() + "</b><br>" + dr["fnName"].ToString() + "\" passCount=\"0\" flowType=\"end\" table_id=\"" + dr["fnID"].ToString() + "\" inset=\"2pt,2pt,2pt,2pt\"><vml:shadowoffset=\"3px,3px\" color=\"#b3b3b3\" type=\"single\" on=\"T\"></vml:shadow><vml:textbox onselectstart=\"return false;\" inset=\"1pt,2pt,1pt,1pt\"><B>" + dr["fnNum"].ToString() + "</B><BR>" + dr["fnName"].ToString() + "</vml:textbox></vml:roundrect>";
                    }
                    else
                    {
                        lblContent += "<vml:roundrect id=" + dr["fnNum"].ToString() + " ondblclick=Edit_Step(" + dr["fnID"].ToString() + "); style=\"Z-INDEX: 1; LEFT: " + dr["LeftMargin"].ToString() + "px; VERTICAL-ALIGN: middle; WIDTH: 100px; CURSOR: hand; POSITION: absolute; TOP: " + dr["TopMargin"].ToString() + "px; HEIGHT: 50px; TEXT-ALIGN: center\"   title=\"下一步骤：" + dr["NextNodeNum"].ToString() + "&#13;&#10;--&#13;&#10;经办人姓名：" + dr["fnUserNames"].ToString() + "&#13;&#10;--&#13;&#10;经办部门：" + dr["fnDeptNames"].ToString() + "&#13;&#10;--&#13;&#10;经办角色：" + dr["fnRoleNames"].ToString() + "&#13;&#10;--&#13;&#10;可写字段：" + dr["fnWriteName"].ToString() + "&#13;&#10;--&#13;&#10;审批人员选择：" + dr["SelectMode"].ToString() + "&#13;&#10;--&#13;&#10;审批模式：" + dr["ReviewMode"].ToString() + "&#13;&#10;--&#13;&#10;当前节点，" + dr["TimeLimit"].ToString() + "小时未审批自动结束\";  coordsize=\"21600,21600\" arcsize=\"4321f\" fillcolor=\"#EEEEEE\" receiverName=\"\" receiverID=\"\" readOnly=\"0\" flowFlag=\"0\" flowTitle=\"<b>" + dr["fnNum"].ToString() + "</b><br>" + dr["fnName"].ToString() + "\" passCount=\"0\" flowType=\"\" table_id=\"" + dr["fnID"].ToString() + "\" inset=\"2pt,2pt,2pt,2pt\"><vml:shadowoffset=\"3px,3px\" color=\"#b3b3b3\" type=\"single\" on=\"T\"></vml:shadow><vml:textbox onselectstart=\"return false;\" inset=\"1pt,2pt,1pt,1pt\"><B>" + dr["fnNum"].ToString() + "</B><BR>" + dr["fnName"].ToString() + "</vml:textbox></vml:roundrect>";
                    }
                }
                dr.Close();

                SqlDataReader dr1 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowNodeLine WHERE FK_wfno='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "'");
                while (dr1.Read())
                {
                    nlContent += dr1["nlContent"].ToString();
                }
                dr1.Close();
            }
        }
    }
}
