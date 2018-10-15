<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDisk.aspx.cs" Inherits="hkpro.portal.wpgl.ViewDisk" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>我的网盘</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td style="height: 25px" class="td_base">
                            <b>查看文件属性</b>
                        </td>
                        <td align="right" class="td_base">
                            <asp:Button ID="ReturnBtn" runat="server" Text="返 回" CssClass="mybtn" OnClick="ReturnBtn_Click"
                                CausesValidation="False" />&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table cellspacing="0" cellpadding="0" width="100%" border="0" class="form">
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        文件名称：
                                    </td>
                                    <td style="width: 80%">
                                        <asp:Label ID="lblName" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        所属目录：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblDir" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        文件类型：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblFileType" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        文件大小：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblContain" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        上传时间：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblCreateDate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
