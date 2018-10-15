<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zssp_view.aspx.cs" Inherits="hkpro.oa.zsgl.zssp_view" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>知识审批</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>知识审批
            </td>
            <td class="td_base" width="20%">
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td style="width: 20%" class="form-item">
                            名称：
                        </td>
                        <td style="width: 80%">
                            <asp:TextBox ID="TitleName" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            描述：
                        </td>
                        <td>
                            <asp:TextBox ID="Content" runat="server" CssClass="mytextarea" Width="90%" ReadOnly="true"
                                Rows="3" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            状态：
                        </td>
                        <td>
                            <asp:TextBox ID="State" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            作者：
                        </td>
                        <td>
                            <asp:TextBox ID="Realname" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            审批意见：
                        </td>
                        <td>
                            <asp:DropDownList ID="Shenpi" runat="server" CssClass="mytext" Width="90%">
                                <asp:ListItem>通过</asp:ListItem>
                                <asp:ListItem>拒绝</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text=" 保存 " OnClick="Save_Click">
                </asp:Button>
                <input type="button" name="BackBtn" value=" 关闭 " class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:Label ID="Username" runat="server" Width="90%" Visible="False"></asp:Label>
    </form>
</body>
</html>
