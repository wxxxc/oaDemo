<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Role_View.aspx.cs" Inherits="hkpro.portal.jsgl.Role_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>��ɫ����</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>��ɫ��Ϣ
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
                            <font color="red">*</font>��ɫ���ƣ�
                        </td>
                        <td style="width: 80%">
                            <asp:TextBox ID="jsmc" runat="server" CssClass="mytext" Width="90%" MaxLength="30"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ��ע��
                        </td>
                        <td>
                            <asp:TextBox ID="bz" runat="server" CssClass="mytextarea" Width="90%" TextMode="multiLine"
                                Rows="6"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button CssClass="btn btn-primary" ID="SaveAddBtn" runat="server" Text="���沢�½�" OnClick="Save_Click"
                    Visible="false"></asp:Button>
                <asp:Button CssClass="btn btn-success" ID="SaveBtn" runat="server" Text="�� ��" OnClick="Save_Click">
                </asp:Button>
                <asp:Button CssClass="btn btn-warning" ID="DelBtn" runat="server" Text="ɾ ��" OnClick="Del_Click"
                    Visible="false" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')"></asp:Button>
                <input type="button" name="BackBtn" value="�� ��" class="btn btn-danger" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="bz"
        Display="none" ErrorMessage="��ע���ݲ��ܳ���100����" ValidationExpression="^(\s|\S){0,100}$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="jsmc"
        ErrorMessage="�������ɫ����">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
