<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tpdc_view.aspx.cs" Inherits="hkpro.portal.tpgl.Tpdc_view" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>投票调查项目</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>调查调查项目
            </td>
            <td class="td_base" width="20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td style="width: 20%" class="form-item">
                            <font color="red">*</font>项目名称：
                        </td>
                        <td style="width: 80%">
                            <asp:TextBox ID="xmmc" runat="server" CssClass="mytext" Width="40%" MaxLength="30"></asp:TextBox>
                            <asp:RadioButtonList ID="lx" runat="server" RepeatDirection="horizontal" RepeatLayout="flow"
                                Visible="false">
                                <asp:ListItem Text="企业" Value="企业" Selected="true"></asp:ListItem>
                                <asp:ListItem Text="供应商" Value="供应商"></asp:ListItem>
                                <asp:ListItem Text="会员" Value="会员"></asp:ListItem>
                                <asp:ListItem Text="物业业主" Value="物业业主"></asp:ListItem>
                                <asp:ListItem Text="物业租户" Value="物业租户"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            说明：
                        </td>
                        <td>
                            <asp:TextBox ID="sm" runat="server" CssClass="mytextarea" Width="90%" TextMode="multiLine"
                                Rows="6"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保 存" OnClick="Save_Click">
                </asp:Button>
                <asp:Button CssClass="mybtn" ID="SetBtn" runat="server" Text="置为有效" OnClick="Set_Click"
                    Visible="false" OnClientClick="return confirm('确认要将此项目置为生效状态吗？')"></asp:Button>
                <input type="button" name="BackBtn" value="关 闭" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="xmmc"
        ErrorMessage="请输入项目名称">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
