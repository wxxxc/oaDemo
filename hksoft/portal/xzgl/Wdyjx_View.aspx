<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wdyjx_View.aspx.cs" Inherits="hkpro.portal.xzgl.Wdyjx_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>我的意见箱</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                查看意见
            </td>
            <td class="td_base" style="width: 20%">
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td class="form-item">
                                        意见标题：
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblyjbt" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <asp:Label ID="lblnr" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        发表人：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:Label ID="lblfbrmc" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        发表时间：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:Label ID="lblfbsj" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        相关附件：
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="fujian" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>回复内容：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="hfnr" runat="server" Width="96%" TextMode="MultiLine" Rows="3" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="确定回复" OnClick="Save_Click"
                                Visible="false"></asp:Button>
                            <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="hfnr"
        ErrorMessage="请输入回复内容">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
