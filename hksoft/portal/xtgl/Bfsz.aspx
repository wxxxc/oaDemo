<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bfsz.aspx.cs" Inherits="hkpro.portal.xtgl.Bfsz" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>数据库备份</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td style="height: 10">
            </td>
        </tr>
        <tr>
            <td align="center">
                <table cellspacing="0" cellpadding="0" border="0" width="98%" align="center">
                    <tr>
                        <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                            align="center">
                            <a href="Sjkbf.aspx" class="black">数据库备份</a>
                        </td>
                        <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                            <a href="Sjkhy.aspx" class="black">数据库还原</a>
                        </td>
                        <td style="width: 91px; background-image: url(../../images/tab_b_y.gif)" align="center">
                            <a href="Bfsz.aspx" class="mail_top">备份设置</a>
                        </td>
                        <td align="right">
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <table cellspacing="0" cellpadding="0" width="98%" border="0" class="form">
                    <tr>
                        <td class="form-item" style="width: 20%">
                            <font color="red">*</font>连接地址：
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox CssClass="mytext" ID="dburl" runat="server" Width="90%" MaxLength="50"></asp:TextBox>
                        </td>
                        <td class="form-item" style="width: 20%">
                            <font color="red">*</font>备份数据库：
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox CssClass="mytext" ID="dbname" runat="server" Width="90%" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>连接用户名：
                        </td>
                        <td>
                            <asp:TextBox CssClass="mytext" ID="dbuser" runat="server" Width="90%" MaxLength="50"></asp:TextBox>
                        </td>
                        <td class="form-item">
                            <font color="red">*</font>连接密码：
                        </td>
                        <td>
                            <asp:TextBox CssClass="mytext" ID="dbpwd" runat="server" TextMode="Password" Width="90%"
                                MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>存放位置：
                        </td>
                        <td>
                            <asp:TextBox CssClass="mytext" ID="savepath" runat="server" Width="90%"></asp:TextBox>
                        </td>
                        <td class="form-item">
                            <font color="red">*</font>存放名称：
                        </td>
                        <td>
                            <asp:TextBox CssClass="mytext" ID="savename" runat="server" Width="90%" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 30" align="center">
                <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保 存" OnClick="Save_Click">
                </asp:Button>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dburl"
        ErrorMessage="请输入连接地址">&nbsp; </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="dbname"
        ErrorMessage="请输入备份数据库">&nbsp; </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="dbuser"
        ErrorMessage="请输入连接用户名">&nbsp; </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="dbpwd"
        ErrorMessage="请输入连接密码">&nbsp; </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="savepath"
        ErrorMessage="请输入存放位置">&nbsp; </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="savename"
        ErrorMessage="请输入存放名称">&nbsp; </asp:RequiredFieldValidator>
    </form>
</body>
</html>
