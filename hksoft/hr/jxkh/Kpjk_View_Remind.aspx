<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kpjk_View_Remind.aspx.cs"
    Inherits="hkpro.oa.jxkh.Kpjk_View_Remind" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>

    <title>催办提醒</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table align="center" border="0" cellpadding="2" cellspacing="1" width="100%">
        <tr>
            <td colspan="2" height="30">
            </td>
        </tr>
        <tr>
            <td align="right">
                催办人员：
            </td>
            <td>
                <asp:Label ID="lblcbry" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" width="20%">
                提醒内容：
            </td>
            <td width="80%">
                <asp:TextBox ID="txnr" runat="server" Width="90%" CssClass="mytextarea" TextMode="MultiLine" Rows="3"></asp:TextBox>
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
                <asp:Button ID="SaveBtn" runat="server" Text="催 办" CssClass="btn btn-primary" OnClick="Save_Click" />
                <input type="button" name="BackBtn" value="关 闭" class="btn btn-danger" onclick="javascript:window.close()"
                                                    accesskey="q" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
