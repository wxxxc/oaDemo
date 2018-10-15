<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dxzhye.aspx.cs" Inherits="hkpro.portal.dxgl.Dxzhye" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>短信帐号余额</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <br />
                            <br />
                            <table border="0" align="center" cellpadding="0" cellspacing="1" width="98%">
                                <tr>
                                    <td align="right" style="width: 60%">
                                        平台用户名：
                                        <asp:TextBox CssClass="mytext" ID="yhm" runat="server" Width="120" MaxLength="20"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        平台密码：
                                        <asp:TextBox CssClass="mytext" ID="ptmm" runat="server" TextMode="Password" Width="120"
                                            MaxLength="20"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        确认密码：
                                        <asp:TextBox CssClass="mytext" ID="Rnewpwd" runat="server" TextMode="Password" Width="120"
                                            MaxLength="20"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        选择平台服务器：
                                        <asp:DropDownList ID="fwq" runat="server" Width="120">
                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                            <asp:ListItem Text="服务器一" Value="se1.china-sms.com"></asp:ListItem>
                                            <asp:ListItem Text="服务器二" Value="se2.china-sms.com"></asp:ListItem>
                                            <asp:ListItem Text="服务器三" Value="se3.china-sms.com"></asp:ListItem>
                                            <asp:ListItem Text="服务器四" Value="se4.china-sms.com"></asp:ListItem>
                                            <asp:ListItem Text="服务器五" Value="se5.china-sms.com"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        短信发送最大重试次数：
                                        <asp:TextBox CssClass="mytext" ID="cscs" runat="server" Width="120" MaxLength="20"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        设置报警余额最小提示金额(分)：
                                        <asp:TextBox CssClass="mytext" ID="bjye" runat="server" Width="120" MaxLength="20"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        设置报警余额提醒的手机号：
                                        <asp:TextBox CssClass="mytext" ID="txsj" runat="server" Width="120" MaxLength="20"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:CheckBox ID="ynrz" runat="server" Text="是否记录运行日志" />
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <font color="red"><b>当前余额(分)：</b></font>
                                        <asp:TextBox ID="dqye" runat="server" CssClass="mytext" ReadOnly="true" Text="30"
                                            Width="120" />
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 30" align="right">
                                        <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="  保存  " OnClick="Save_Click">
                                        </asp:Button>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="yhm"
        ErrorMessage="请输入平台用户名">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ptmm"
        ErrorMessage="请输入平台密码">&nbsp; </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Rnewpwd"
        ErrorMessage="请输入确认密码">&nbsp; </asp:RequiredFieldValidator>
    <asp:CompareValidator ID="Compare1" runat="server" ControlToValidate="ptmm" Type="String"
        ControlToCompare="rnewpwd" ErrorMessage="平台密码与确认密码不符！">&nbsp;</asp:CompareValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="fwq"
        ErrorMessage="请选择服务器">&nbsp; </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="cscs"
        ErrorMessage="请输入最大重试次数">&nbsp; </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="bjye"
        ErrorMessage="请输入最小提示余额">&nbsp; </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txsj"
        ErrorMessage="请输入提醒的手机号">&nbsp; </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="yhm"
        Display="none" ErrorMessage="用户名必需为数字、字母或二者组合" ValidationExpression="^\w+$" runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="ptmm"
        Display="none" ErrorMessage="平台密码必需为数字、字母或二者组合" ValidationExpression="^\w+$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="Rnewpwd"
        Display="none" ErrorMessage="确认密码必需为数字、字母或二者组合" ValidationExpression="^\w+$"
        runat="server">
    </asp:RegularExpressionValidator>
    </form>
</body>
</html>
