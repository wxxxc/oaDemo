<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tpdc_view.aspx.cs" Inherits="hkpro.portal.tpgl.Tpdc_view" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>ͶƱ������Ŀ</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>���������Ŀ
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
                            <font color="red">*</font>��Ŀ���ƣ�
                        </td>
                        <td style="width: 80%">
                            <asp:TextBox ID="xmmc" runat="server" CssClass="mytext" Width="40%" MaxLength="30"></asp:TextBox>
                            <asp:RadioButtonList ID="lx" runat="server" RepeatDirection="horizontal" RepeatLayout="flow"
                                Visible="false">
                                <asp:ListItem Text="��ҵ" Value="��ҵ" Selected="true"></asp:ListItem>
                                <asp:ListItem Text="��Ӧ��" Value="��Ӧ��"></asp:ListItem>
                                <asp:ListItem Text="��Ա" Value="��Ա"></asp:ListItem>
                                <asp:ListItem Text="��ҵҵ��" Value="��ҵҵ��"></asp:ListItem>
                                <asp:ListItem Text="��ҵ�⻧" Value="��ҵ�⻧"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ˵����
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
                <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="�� ��" OnClick="Save_Click">
                </asp:Button>
                <asp:Button CssClass="mybtn" ID="SetBtn" runat="server" Text="��Ϊ��Ч" OnClick="Set_Click"
                    Visible="false" OnClientClick="return confirm('ȷ��Ҫ������Ŀ��Ϊ��Ч״̬��')"></asp:Button>
                <input type="button" name="BackBtn" value="�� ��" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="xmmc"
        ErrorMessage="��������Ŀ����">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
