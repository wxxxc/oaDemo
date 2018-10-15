<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YxSet.aspx.cs" Inherits="hkpro.YxSet" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>个人设置</title>
</head>
<body class="main">
    <form id="Setup" method="post" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="center">
                            <br />
                            <table cellspacing="0" cellpadding="0" border="0" width="98%">
                                <tr>
                                    <td style="height: 21px; width: 91px; background-image: url(images/tab_b_n.gif)"
                                        align="center">
                                        <a href="myset.aspx?i=2" class="black">常规设定</a>
                                    </td>
                                    <td style="width: 91px; background-image: url(images/tab_b_y.gif)" align="center">
                                        <a href="yxset.aspx" class="mail_top">邮箱配置</a>
                                    </td>
                                    <asp:Panel ID="p_gys" runat="server">
                                        <td style="width: 91px; background-image: url(images/tab_b_n.gif)" align="center">
                                            <a href="zmset.aspx" class="black">自定义桌面</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(images/tab_b_n.gif)" align="center">
                                            <a href="dbset.aspx" class="black">自定义驾驶舱</a>
                                        </td>
                                    </asp:Panel>
                                    <td>
                                        &nbsp;&nbsp;<font color="red">注:参数修改后需注销并重新登录本系统才能生效</font>
                                    </td>
                                </tr>
                            </table>
                            <!--邮箱-->
                            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td style="width: 20%" class="form-item">
                                        <font color="red">*</font>邮箱地址：
                                    </td>
                                    <td style="width: 80%">
                                        <asp:TextBox ID="yxdz" runat="server" CssClass="mytext" Width="150" MaxLength="30"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>SMTP地址：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="smtp" runat="server" CssClass="mytext" Width="150" MaxLength="30"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>您的签名：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="qm" runat="server" CssClass="mytext" Width="150" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>SMTP端口：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="port" runat="server" CssClass="mytext" Width="150" MaxLength="8"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>登录帐号：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="dlm" runat="server" CssClass="mytext" Width="150" MaxLength="20"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>登录密码：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="dlmm" runat="server" CssClass="mytext" Width="150" MaxLength="20"
                                            TextMode="Password"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>确认密码：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="qrmm" runat="server" CssClass="mytext" Width="150" MaxLength="20"
                                            TextMode="Password"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="btns" runat="server" Text="保 存" OnClick="Save_Click">
                            </asp:Button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="yxdz"
        ErrorMessage="请输入邮箱地址！">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="smtp"
        ErrorMessage="请输入邮箱SMTP地址！">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="qm"
        ErrorMessage="请输入您的签名！">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="port"
        ErrorMessage="请输入SMTP端口！">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="dlm"
        ErrorMessage="请输入邮箱登录名！">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="dlmm"
        ErrorMessage="请输入邮箱登录密码！">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="qrmm"
        ErrorMessage="请输入确认密码">&nbsp; 
    </asp:RequiredFieldValidator>
    <asp:CompareValidator ID="Compare1" runat="server" ControlToValidate="dlmm" Type="String"
        ControlToCompare="qrmm" ErrorMessage="登录密码与确认密码不符！">&nbsp;
    </asp:CompareValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="dlm"
        Display="none" ErrorMessage="登录名必需为数字、字母或二者组合" ValidationExpression="^\w+$" runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="dlmm"
        Display="none" ErrorMessage="登录密码必需为数字、字母或二者组合" ValidationExpression="^\w+$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="port"
        Display="none" ErrorMessage="SMTP端口必需为数字" ValidationExpression="^\d+$" runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="smtp"
        Display="none" ErrorMessage="SMTP地址格式不正确" ValidationExpression="^(smtp|SMTP)\.(\S|\s)+$"
        runat="server">
    </asp:RegularExpressionValidator>
    </form>
</body>
</html>
