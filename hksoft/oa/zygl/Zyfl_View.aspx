<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Zyfl_View.aspx.cs" Inherits="hkpro.oa.zygl.Zyfl_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��Դ����</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>��Դ����
            </td>
            <td class="td_base" style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td style="width: 35%" class="form-item">
                            <font color="red">*</font>�������ƣ�
                        </td>
                        <td>
                            <asp:TextBox ID="flmc" runat="server" CssClass="mytext" Width="300" MaxLength="15"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>������Ա��
                        </td>
                        <td>
                            <asp:DropDownList ID="glry" runat="server" Width="300">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ��ע��
                        </td>
                        <td>
                            <asp:TextBox ID="bz" runat="server" CssClass="mytextarea" Width="300" TextMode="multiLine"
                                Rows="5"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button CssClass="mybtn" ID="SaveAddBtn" runat="server" Text="���沢�½�" OnClick="Save_Click"
                    Visible="false"></asp:Button>
                <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="����" OnClick="Save_Click">
                </asp:Button>
                <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="ɾ��" Visible="false"
                    OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" OnClick="Del_Click"></asp:Button>
                <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="flmc"
        ErrorMessage="�������������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator123" runat="server" ControlToValidate="glry"
        ErrorMessage="��ѡ�������Ա">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="bz"
        Display="none" ErrorMessage="��ע���ݲ��ܳ���50����" ValidationExpression="^(\s|\S){0,50}$"
        runat="server">
    </asp:RegularExpressionValidator>
    </form>
</body>
</html>
