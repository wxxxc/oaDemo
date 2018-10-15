<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cshmm_Zh.aspx.cs" Inherits="hkpro.portal.yhgl.Cshmm_Zh" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>初始化密码</title>
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
                <table cellspacing="0" cellpadding="0" border="0" width="98%">
                    <tr>
                        <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                            align="center">
                            <a href="Cshmm.aspx?i=2" class="black">用户密码</a>
                        </td>
                        <asp:Panel ID="p_gys" runat="server" Visible="false">
                            <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                <a href="Cshmm_Gys.aspx" class="black">供应商密码</a>
                            </td>
                        </asp:Panel>
                        <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                            <a href="Cshmm_Yz.aspx" class="black">业主密码</a>
                        </td>
                        <td style="width: 91px; background-image: url(../../images/tab_b_y.gif)" align="center">
                            <a href="Cshmm_Zh.aspx" class="mail_top">租户密码</a>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <table cellspacing="0" cellpadding="0" width="98%" border="0" class="form">
                    <tr>
                        <td class="form-item" style="width: 20%">
                            <font color="red">*</font>租户编码：
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox CssClass="mytext" ID="zhid" runat="server" Width="90%" MaxLength="20"
                                AutoPostBack="true" OnTextChanged="zhid_TextChanged"></asp:TextBox>
                        </td>
                        <td class="form-item" style="width: 20%">
                            租户名称：
                        </td>
                        <td style="width: 30%">
                            <asp:Label ID="lblzhmc" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>新密码：
                        </td>
                        <td>
                            <asp:TextBox CssClass="mytext" ID="newpwd" runat="server" TextMode="password" Width="90%"
                                MaxLength="20"></asp:TextBox>
                        </td>
                        <td class="form-item">
                            <font color="red">*</font>确认新密码：
                        </td>
                        <td>
                            <asp:TextBox CssClass="mytext" ID="rnewpwd" runat="server" TextMode="Password" Width="90%"
                                MaxLength="20"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            &nbsp;
                        </td>
                        <td colspan="3">
                            <asp:Button CssClass="mybtn" ID="SetBtn" runat="server" Text="执行初始化" OnClick="Set_Click">
                            </asp:Button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="zhid"
        ErrorMessage="请输入租户编码">&nbsp; </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="newpwd"
        ErrorMessage="请输入新密码">&nbsp; </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rnewpwd"
        ErrorMessage="请输入确认密码">&nbsp; </asp:RequiredFieldValidator>
    <asp:CompareValidator ID="Compare1" runat="server" ControlToValidate="newpwd" Type="String"
        ControlToCompare="rnewpwd" ErrorMessage="新密码与确认密码不符！">&nbsp;</asp:CompareValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="newpwd"
        Display="none" ErrorMessage="新密码必需为数字、字母或二者组合" ValidationExpression="^\w+$" runat="server">
    </asp:RegularExpressionValidator>
    </form>
</body>
</html>
