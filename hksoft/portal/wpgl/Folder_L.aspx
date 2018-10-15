<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Folder_L.aspx.cs" Inherits="hkpro.portal.wpgl.Folder_L" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="Form1" runat="server">
    <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td width="8px" height="8px">
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td height="22px">
            </td>
            <td>
                &nbsp;<b>我的文件夹</b>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td valign="top">
                <asp:TreeView ID="TreeView1" runat="server" Font-Size="10pt" BorderStyle="None" ForeColor="black"
                    NodeWrap="True" ShowLines="True" ExpandDepth="4" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged">
                </asp:TreeView>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
