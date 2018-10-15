<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QueryWork_Remind.aspx.cs"
    Inherits="hkpro.workflow.work.QueryWork_Remind" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>工作催办</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table align="center" border="0" cellpadding="2" cellspacing="1" width="100%">
        <tr>
            <td colspan="2" height="30">
            </td>
        </tr>
        <tr>
            <td align="right" width="20%">
                内容：
            </td>
            <td width="80%">
                <asp:TextBox ID="mscContent" runat="server" Width="90%" TextMode="MultiLine" Rows="2"
                    CssClass="mytextarea"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                催办人员：
            </td>
            <td>
                <asp:TextBox ID="wUserNames" runat="server" Height="55px" TextMode="MultiLine" Width="90%"
                    CssClass="mytextarea"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:CheckBox ID="xxtx" runat="server" Text="站内消息提醒" Checked="True" />
                <asp:CheckBox ID="dxtx" runat="server" Text="手机短信提醒" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" height="25">
                <asp:Button ID="SaveBtn" runat="server" Text=" 催办 " CssClass="mybtn" OnClick="SaveBtn_Click" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="wUserIDs" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>
