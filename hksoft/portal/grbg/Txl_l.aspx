<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Txl_l.aspx.cs" Inherits="hkpro.portal.grbg.Txl_l" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>Ա��ͨѶ¼</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <br />
        &nbsp;        
        <a href="Txl_r.aspx" target="rformtxl" title="�����ʾȫ����Ϣ" class="gvlink">��ʾȫ����¼</a>
        <br />
        <asp:TreeView ID="ListTreeView" runat="server"
            NodeIndent="10" ShowLines="True">
        </asp:TreeView>
    </form>
</body>
</html>
