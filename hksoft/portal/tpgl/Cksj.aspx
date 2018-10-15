<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cksj.aspx.cs" Inherits="hkpro.portal.tpgl.Cksj" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form runat="server" id="form1">
    <table cellspacing="0" cellpadding="0" width="100%" align="center">
        <tr>
            <td style="height: 5">
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;<asp:Label ID="lxnr" runat="server" Visible="false">请选择类型：</asp:Label>
                <asp:DropDownList ID="qhlx" runat="server" Width="100px" OnSelectedIndexChanged="qhlx_SelectedIndexChanged"
                    AutoPostBack="true" Visible="false">
                    <asp:ListItem Text="企业" Value="企业"></asp:ListItem>
                    <asp:ListItem Text="供应商" Value="供应商"></asp:ListItem>
                    <asp:ListItem Text="会员" Value="会员"></asp:ListItem>
                    <asp:ListItem Text="物业业主" Value="物业业主"></asp:ListItem>
                    <asp:ListItem Text="物业租户" Value="物业租户"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <asp:PlaceHolder ID="place1" runat="server"></asp:PlaceHolder>
    </form>
</body>
</html>
