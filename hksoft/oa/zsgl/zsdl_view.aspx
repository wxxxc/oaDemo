<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zsdl_view.aspx.cs" Inherits="hkpro.oa.zsgl.zsdl_view" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>֪ʶ����ά��</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>֪ʶ����
            </td>
            <td class="td_base" width="20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td style="width: 35%" class="form-item">
                            <font  color="red">*</font>�������ƣ�
                        </td>
                        <td style="width: 65%">
                            <asp:TextBox ID="Name" runat="server" CssClass="mytext" Width="300" MaxLength="30"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button CssClass="mybtn" ID="SaveAddBtn" runat="server" Text="���沢�½�" OnClick="Save_Click"
                    Visible="false"></asp:Button>
                <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="����" OnClick="Save_Click"
                    ></asp:Button>
                <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click"
                    Visible="false" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" ></asp:Button>
                <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript:window.close()"
                     />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Name"
        ErrorMessage="�������������">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
