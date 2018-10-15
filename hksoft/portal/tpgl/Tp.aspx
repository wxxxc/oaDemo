<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tp.aspx.cs" Inherits="hkpro.portal.tpgl.Tp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form runat="server" id="form1">
    <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td style="height: 30" align="center">
                <b>《<asp:Label ID="xmname" runat="server" ForeColor="blue"></asp:Label>》</b>
            </td>
        </tr>
        <tr style="height: 30">
            <td>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                    </ItemTemplate>
                </asp:Repeater>
            </td>
        </tr>
        <tr style="height: 50">
            <td align="center">
                <asp:Button CssClass="mybtn" ID="SaveBtn" OnClick="Save_Click" runat="server" Text="投上一票">
                </asp:Button>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
