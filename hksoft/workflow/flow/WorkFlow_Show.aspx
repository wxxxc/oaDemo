<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlow_Show.aspx.cs"
    Inherits="hkpro.workflow.flow.WorkFlow_Show" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>查看工作流 - 工作流管理</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                查看工作流
            </td>
            <td class="td_base" width="20%">
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" colspan="2">
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td colspan="2" align="center">
                            <b>基本信息</b>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" width="20%">
                            流程名称：
                        </td>
                        <td width="80%">
                            <asp:Label ID="lblwfName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            对应表单：
                        </td>
                        <td>
                            <asp:Label ID="lblfName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            流程状态：
                        </td>
                        <td>
                            <asp:Label ID="lblwfStatus" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            允许监控用户：
                        </td>
                        <td>
                            <asp:Label ID="lblwfUserNames" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            使用人部门：
                        </td>
                        <td>
                            <asp:Label ID="lblwfDept" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            结束后归档：
                        </td>
                        <td>
                            <asp:Label ID="lblFK_ffid" runat="server" Width="95%"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td colspan="2" align="center">
                            <b>工作文号</b>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" width="20%">
                            允许修改文号：
                        </td>
                        <td width="80%">
                            <asp:Label ID="lblynModFileNo" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <img alt="" onclick="javascript:popHelp('../../Help/flow/FileNo.htm');" src="../../Images/help.gif"
                                border="0">
                            自动文号表达式：
                        </td>
                        <td>
                            <asp:Label ID="lblFileNo" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            自动编号计数器：
                        </td>
                        <td>
                            <asp:Label ID="lblFileStartNo" runat="server" ToolTip="即相同流程下开始编号的数字"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            自动编号位数：
                        </td>
                        <td>
                            <asp:Label ID="lblFileDigit" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" height="30">
                <input id="Button3" class="btn btn-danger" onclick="javascript:window.close()" type="button"
                    value=" 关闭 " />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="lblwfUserIDs" runat="server" Width="90%" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblwfDeptIDs" runat="server" Width="90%" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblfNo" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblwfNo" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>
