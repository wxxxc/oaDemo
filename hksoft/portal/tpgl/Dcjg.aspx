<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dcjg.aspx.cs" Inherits="hkpro.portal.tpgl.Dcjg" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="Form1" runat="server">
    <table cellspacing="0" cellpadding="0" width="100%" align="center">
        <tr>
            <td style="height: 5">
            </td>
        </tr>
    </table>
    <asp:PlaceHolder ID="place1" runat="server"></asp:PlaceHolder>
    <div align="center">
        <input type="button" name="RecBtn" value="返 回" class="mybtn" onclick="javascript:location.href='cksj.aspx?lx=q'" /></div>
    </form>
</body>
</html>
