<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bjdbrw_yhview.aspx.cs"
    Inherits="hkpro.oa.rwgl.bjdbrw_yhview" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>查看待办任务</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script src="../../res/js/jquery.js"></script>
     <script type="text/javascript">
        
        $(document).ready(function () {
             var b ="<%=savefj_yh.NavigateUrl %>";
        var a = "<%=savefj.NavigateUrl %>";
            if (a == "../.." || a == "") {
            $('#ff').css("display","none");
        }
            if (b == "../.." || b == "") {
            $('#f').css("display", "none");
        }
        })
       
    </script>
</head>
   
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td style="height: 25px;" class="td_base">
                查看[<asp:Label ID="rwdh" runat="server" ForeColor="yellow"></asp:Label>]待办任务
            </td>
        </tr>
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                        <td class="form-item">
                                            任务来源：
                                        </td>
                                        <td colspan="3">
                                           
                                              <asp:Label ID="rwly" runat="server" style="color:red; font-weight:bold"></asp:Label>      </td>
                                    </tr>
                                <tr>
                                    <td class="form-item">
                                        任务标题：
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblrwbt" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        接收人：
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lbljsdx" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                        <td class="form-item">牵头领导：
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="qtld" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">责任领导：
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="zrld" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">责任人：
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="zrr" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        任务等级：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:Label ID="lblrwxz" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        紧急程度：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:Label ID="lbljjcd" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <asp:Panel ID="Panelrq" runat="server" Visible="false">
                                    <tr>
                                        <td class="form-item">
                                            开始日期：
                                        </td>
                                        <td>
                                            <asp:Label ID="lblksrq" runat="server"></asp:Label>
                                        </td>
                                        <td class="form-item">
                                            截止日期：
                                        </td>
                                        <td>
                                            <asp:Label ID="lbljzrq" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </asp:Panel>
                                <tr>
                                    <td class="form-item">
                                        任务内容：
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblnr" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        限时待办：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblynxs" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        任务附件：
                                    </td>
                                    <td>
                                        
                             <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" id="ff" target="_blank">在线预览</a>
                             <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                                        <asp:HyperLink ID="savefj" Enabled="true" Target="_blank" runat="server" CssClass="gvlink"
                                            ToolTip="附件下载" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        发布人：
                                    </td>
                                    <td>
                                        <asp:Label ID="fbrmc" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        发布时间：
                                    </td>
                                    <td>
                                        <asp:Label ID="fqsj" runat="server"></asp:Label>
                                    </td>
                                </tr>
                               <%-- <tr>
                                    <td colspan="4" align="center">
                                        <b>分配情况</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        分配形式：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblfpxs" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        分配人员：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblfpry" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        分配说明：
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblfpsm" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>--%>
                                    <td colspan="4" align="center">
                                        <b>完成情况</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        完成说明：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblwcqk" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        完成附件：
                                    </td>
                                    <td>
                                        
                            <a href="<%=qy_fjylurl.Text %><%=savefj_yh.NavigateUrl %>" id="f" target="_blank">在线预览</a>
                             <asp:Label ID="Label1" Visible="false" runat="server"></asp:Label>
                                        <asp:HyperLink ID="savefj_yh" Enabled="true" Target="_blank" runat="server" CssClass="gvlink"
                                            ToolTip="附件下载" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        完成人：
                                    </td>
                                    <td>
                                        <asp:Label ID="wcrmc" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        完成时间：
                                    </td>
                                    <td>
                                        <asp:Label ID="wcsjmc" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center">
                                        <b>审批情况</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        审批意见：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblspyj" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        审批评价：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblsppj" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        审核人：
                                    </td>
                                    <td>
                                        <asp:Label ID="sprmc" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        审核时间：
                                    </td>
                                    <td>
                                        <asp:Label ID="spsjmc" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <input type="button" name="BackBtn" value="关 闭" class="btn btn-danger" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
