<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Folder_R.aspx.cs" Inherits="hkpro.portal.wpgl.Folder_R" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>����Ŀ¼</title>
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td class="td_base" style="height: 25">
                &nbsp;<asp:Label ID="lblsta" runat="server" Text="-> �޸�״̬" ForeColor="Yellow" Font-Size="Medium"></asp:Label>
            </td>
            <td align="right" class="td_base">
                <asp:Button CssClass="mybtn" ID="AddBtn" runat="server" Text="�� ��" OnClick="Save_Click"
                    CausesValidation="false"></asp:Button>
                <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="�� ��" OnClick="Save_Click"
                    Enabled="false"></asp:Button>
                <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="ɾ ��" OnClick="Del_Click"
                    OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" Enabled="false"></asp:Button>
                <asp:Button ID="ReturnBtn" runat="server" Text="�� ��" CssClass="mybtn" OnClick="ReturnBtn_Click"
                    CausesValidation="False" />&nbsp;
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="form">
        <tr>
            <td style="width: 20%" class="form-item">
                <font color="red">*</font>�ļ������ƣ�
            </td>
            <td style="width: 80%">
                <asp:TextBox ID="mlid" runat="server" Visible="false"></asp:TextBox>
                <asp:TextBox ID="mlmc" runat="server" CssClass="mytext" Width="80%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="form-item">
                �ϼ��ļ��У�
            </td>
            <td>
                <asp:DropDownList ID="DirList" runat="server" Width="80%">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" class="form-item">
            </td>
            <td>
                <asp:CheckBox ID="share" Text="�Ƿ�����ļ���" runat="server" />
                <asp:Image ID="Image1" runat="server" ImageUrl="../../images/help.gif" ToolTip="�����û���������������������ļ����µ�����" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="mlmc"
        ErrorMessage="�������ļ�������">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
