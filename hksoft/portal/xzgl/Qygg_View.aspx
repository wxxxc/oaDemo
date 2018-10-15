<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qygg_View.aspx.cs" Inherits="hkpro.portal.xzgl.Qygg_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>公告管理</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" border="0" align="center" cellpadding="4" cellspacing="0">
        <tr>
            <td align="center" height="30">
                <asp:Label ID="ggzt" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" height="30">
                分类：<asp:Label ID="ggflmc" runat="server"></asp:Label>
                | 时间：<asp:Label ID="kssj" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="ggnr" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="fujian" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="fbr_label" runat="server" Enabled="false" Text="发布时间："></asp:Label>
                <asp:Label ID="fqsj" runat="server" Enabled="false"></asp:Label>
            </td>
        </tr>
        <tr id="hkshow1">
            <td align="center" height="30">
                <input type="button" name="print" class="mybtn" value="打 印" onclick="javascript:PrintPage4()">
                <input type="button" name="BackBtn" value="关 闭" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>
