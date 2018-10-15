<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DbSet_View.aspx.cs" Inherits="hkpro.DbSet_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="CssJs/WebCalendar.js"></script>
    <script src="CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>��ʻ������</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                ����������
            </td>
            <td class="td_base" width="20%">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table cellspacing="0" cellpadding="0" width="100%" border="0" align="center">
                    <tr>
                        <td colspan="2">
                            <table border="0" cellpadding="0" cellspacing="0" align="center" class="form" width="100%">
                                <tr>
                                    <td class="form-item" width="20%">
                                        ���������ƣ�
                                    </td>
                                    <td width="80%">
                                        <asp:DropDownList ID="Name" runat="server" Width="90%">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ��ʾ������
                                    </td>
                                    <td>
                                        <asp:TextBox ID="topnum" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="BtnS" runat="server" Text="ȷ ��" OnClick="Save_Click" />
                            <input type="button" name="BackBtn" value="�� ��" class="mybtn" onclick="javascript:window.close()"
                                 />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Name"
        ErrorMessage="���޿�ѡ�������رմ˴��ڣ�">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="topnum"
        ErrorMessage="��������ʾ����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="topnum"
        Display="none" ErrorMessage="��ʾ����ӦΪ����0������" ValidationExpression="^[1-9]{1}[\d]*$"
        runat="server">
    </asp:RegularExpressionValidator>
    </form>
</body>
</html>
