<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zszj_show.aspx.cs" Inherits="hkpro.oa.zsgl.zszj_show" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>查看章节</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                查看章节
            </td>
            <td class="td_base" width="20%">
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2" align="center">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td valign="top">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                                <tr>
                                    <td class="form-item">
                                        章节标题：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Name" runat="server" Width="650" CssClass="mytext" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="lblnr" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        附件列表：
                                    </td>
                                    <td>
                                        <asp:Label ID="fjlb" runat="server" Width="520"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="height: 30">
                            <input type="button" name="BackBtn" value=" 关闭 " class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:TextBox ID="Number" runat="server" Visible="false"></asp:TextBox>
    </form>
</body>
</html>
