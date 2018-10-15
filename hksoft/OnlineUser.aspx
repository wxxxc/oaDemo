<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineUser.aspx.cs" Inherits="hkpro.OnlineUser" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <meta http-equiv="refresh" content="10" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <br>
    &nbsp;当前共有<asp:Label ID="lblrs" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>人在线&nbsp;&nbsp;
    <font color="red">注：每位用户的在线状态与其在各自"消息设置"(屏幕右上角)中的"提醒间隔时间"属性值有关。</font>
    <asp:TreeView ID="ListTreeView" runat="server" CollapseImageUrl="images/n.gif" ExpandImageUrl="images/y.gif"
        NodeIndent="10" ShowLines="True" ForeColor="black">
    </asp:TreeView>
    </form>
</body>
</html>
