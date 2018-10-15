<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ygtxl_l.aspx.cs" Inherits="hkpro.portal.xzgl.Ygtxl_l" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>员工通讯录</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <br />
        &nbsp;        
        <a href="Ygtxl_r.aspx" target="rform11310" title="点击显示全部信息" class="gvlink">显示全部记录</a>
        <br />
        <asp:TreeView ID="ListTreeView" runat="server"
            NodeIndent="10" ShowLines="True">
        </asp:TreeView>
    </form>
</body>
</html>
