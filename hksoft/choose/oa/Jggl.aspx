<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Jggl.aspx.cs" Inherits="hksoft.choose.oa.Jggl" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>机构管理</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
     <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script>
        function killErrors() {
            return true;
        }
        window.onerror = killErrors;	
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <br>
    <br>
    <asp:TreeView ID="ListTreeView" runat="server" NodeIndent="10" ShowLines="True"></asp:TreeView>
    </form>
</body>
</html>
