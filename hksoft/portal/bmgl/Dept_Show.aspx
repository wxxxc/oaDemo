<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dept_Show.aspx.cs" Inherits="hkpro.portal.bmgl.Dept_Show" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>部门管理</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
        <tr>
            <td align="center" colspan="2" width="33%" style="height: 26px">
                <b>
                    <%=showtitle %></b>
            </td>
        </tr>
        <tr>
            <td align="right" nowrap="nowrap" width="20%" class="form-item">
                部门编码：
            </td>
            <td width="80%">
                <asp:Label ID="bmbm" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" nowrap="nowrap" class="form-item">
                部门名称：
            </td>
            <td>
                <asp:Label ID="bmmc" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" nowrap="nowrap" class="form-item">
                上级部门：
            </td>
            <td>
                <asp:Label ID="sjbmmc" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" nowrap="nowrap" class="form-item">
                部门负责人：
            </td>
            <td>
                <asp:Label ID="bmfzr" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" nowrap="nowrap" class="form-item">
                部门电话：
            </td>
            <td>
                <asp:Label ID="bmdh" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" nowrap="nowrap" class="form-item">
                部门传真：
            </td>
            <td>
                <asp:Label ID="bmcz" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" nowrap="nowrap" class="form-item">
                部门类型：
            </td>
            <td>
                <asp:Label ID="bmlx" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" nowrap="nowrap" class="form-item">
                部门管理权限：
            </td>
            <td class="mytd2">
                <asp:Label ID="bmglqx" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" nowrap="nowrap" class="form-item">
                备注：
            </td>
            <td>
                <asp:Label ID="bz" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <table align="center" border="0" cellpadding="4" cellspacing="0" width="100%">
        <tr>
            <td align="center" height="30">
                <asp:Button ID="ModBtn" runat="server" Text="修改此部门" CssClass="btn btn-primary" OnClick="Mod_Click" />
                <asp:Button ID="AddBtn" runat="server" Text="在此节点下增加" CssClass="btn btn-success" OnClick="Add_Click" />
                <asp:Button ID="DelBtn" runat="server" Text="删除此部门" CssClass="btn btn-danger" OnClick="Del_Click" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
