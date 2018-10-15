<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Jsyda_View.aspx.cs" Inherits="hkpro.oa.clgl.Jsyda_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��ʻԱ����</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>��ʻԱ
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
                                    <td style="width: 35%" class="form-item">
                                        <font color="red">*</font>������
                                    </td>
                                    <td style="width: 65%">
                                        <asp:TextBox ID="xm" runat="server" CssClass="mytext" Width="300" MaxLength="5"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ���䣺
                                    </td>
                                    <td>
                                        <asp:TextBox ID="nl" runat="server" CssClass="mytext" Width="300" MaxLength="2"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �Ա�
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="xb" runat="server" RepeatLayout="flow" RepeatDirection="horizontal">
                                            <asp:ListItem Text="Ů" Value="Ů"></asp:ListItem>
                                            <asp:ListItem Text="��" Value="��" Selected="true"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>���빫˾���ڣ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="jrrq" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                            Width="300" MaxLength="10"></asp:TextBox>
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
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td>
                                        <asp:Label ID="jdr_label" runat="server" Enabled="false"></asp:Label>
                                        <asp:Label ID="jdsj" runat="server" Enabled="false"></asp:Label>
                                        <asp:Label ID="jdr" runat="server" Enabled="false"></asp:Label>&nbsp;&nbsp;&nbsp;
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
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="xm"
        ErrorMessage="����������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="jrrq"
        ErrorMessage="��ѡ����빫˾����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="nl"
        Display="none" ValidationExpression="^\d{2}" ErrorMessage="�������Ϊ��λ����" runat="server">
    </asp:RegularExpressionValidator>
    <asp:CompareValidator ID="CompareValidator1" ControlToValidate="jrrq" Display="none"
        Operator="DataTypeCheck" ErrorMessage="���빫˾���ڸ�ʽ���󣬸�ʽ�ο�1980-07-07��1980/07/07"
        Type="date" runat="server">
    </asp:CompareValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="bz"
        Display="none" ErrorMessage="��ע���ݲ��ܳ���50����" ValidationExpression="^(\s|\S){0,50}$"
        runat="server">
    </asp:RegularExpressionValidator>
    </form>
</body>
</html>
