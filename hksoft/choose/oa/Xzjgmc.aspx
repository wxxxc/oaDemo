<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Xzjgmc.aspx.cs" Inherits="hksoft.choose.oa.Xzjgmc" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>选择的机构名称</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
     <script type="text/javascript" src="../../CssJs/Choose.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <div><br/><br/><br/><br/>
            选择的机构：<asp:TextBox ID="jigou" runat="server" CssClass="mytext"></asp:TextBox>
            <asp:TextBox ID="GzdwId" runat="server" style="DISPLAY: none"></asp:TextBox> 
            <asp:TextBox ID="dQxStr" runat="server" style="DISPLAY: none"></asp:TextBox> 
        </div>
    </form>
</body>
</html>
