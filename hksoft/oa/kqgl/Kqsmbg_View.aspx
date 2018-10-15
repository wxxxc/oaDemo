<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kqsmbg_View.aspx.cs" Inherits="hkpro.oa.kqgl.Kqsmbg_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>考勤说明变更</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                考勤说明变更
            </td>
            <td class="td_base" style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>日期：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="qdsj" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                            Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="height: 25; width: 20%">
                                        &nbsp;
                                    </td>
                                    <td style="width: 30%">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        上午班：
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="ynqd1" runat="server" Text="签到" />
                                        <asp:CheckBox ID="ynqt1" runat="server" Text="签退" />
                                    </td>
                                    <td class="form-item" style="height: 25;">
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        下午班：
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="ynqd2" runat="server" Text="签到" />
                                        <asp:CheckBox ID="ynqt2" runat="server" Text="签退" />
                                    </td>
                                    <td class="form-item" style="height: 25;">
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        晚上班：
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="ynqd3" runat="server" Text="签到" />
                                        <asp:CheckBox ID="ynqt3" runat="server" Text="签退" />
                                    </td>
                                    <td class="form-item" style="height: 25;">
                                        送审次数：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblsscs" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        考勤情况说明：
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblkqqksm" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        说明附件：
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="fujian" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        申请部门：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblsqbmmc" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        申请人：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblsqr" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="height: 25px">
                                    <td class="form-item">
                                        <font color="red">*</font>变更原因：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="bgyy" runat="server" Width="96%" TextMode="MultiLine" Rows="2" CssClass="mytextarea" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="确认变更" OnClick="Save_Click">
                            </asp:Button>
                            <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click"
                                OnClientClick="return confirm('确认要删除此考勤说明吗？')"></asp:Button>
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
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="qdsj"
        ErrorMessage="请选择日期">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="bgyy"
        ErrorMessage="请输入变更原因">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
