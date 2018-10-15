<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qclsxx.aspx.cs" Inherits="hkpro.portal.xtgl.Qclsxx" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>数据清除</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td style="height: 10">
            </td>
        </tr>
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" border="0" width="98%" align="center">
                    <tr>
                        <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                            align="center">
                            <a href="Qcrz.aspx" class="black">清除日志信息</a>
                        </td>
                        <td style="width: 91px; background-image: url(../../images/tab_b_y.gif)" align="center">
                            <a href="Qclsxx.aspx" class="mail_top">清除站内消息</a>
                        </td>
                        <td align="right">
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0" class="form">
                    <tr>
                        <td align="right">
                            清除日期(自)：
                        </td>
                        <td>
                            <asp:TextBox ID="txtSdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                CssClass="mytext" Width="150"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            清除日期(至)：
                        </td>
                        <td>
                            <asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                CssClass="mytext" Width="150"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="开始清除历史消息" Width="150px"
                                OnClick="Del_Click">
                            </asp:Button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSdate"
        ErrorMessage="请选择开始日期">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEdate"
        ErrorMessage="请选择截止日期">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
