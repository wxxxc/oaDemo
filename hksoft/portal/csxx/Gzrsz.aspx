<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gzrsz.aspx.cs" Inherits="hkpro.portal.csxx.Gzrsz" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>����������</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td colspan="2" align="right" style="height: 30">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="form-item">
                            ѡ�����ڷ�Χ��
                        </td>
                        <td style="width: 80%">
                            <asp:TextBox ID="txtSdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                CssClass="mytext" Width="120"></asp:TextBox>
                            ��
                            <asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                CssClass="mytext" Width="120"></asp:TextBox>
                            <asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="��ʼά��" OnClick="Set_Click">
                            </asp:Button>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 30">
                        </td>
                        <td>
                            <font color="red">��ʾ������������Ϊ��λ������ά�����Ա�֤��ѵ���Ӧ�ٶȡ�</font>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSdate"
        ErrorMessage="�����뿪ʼ����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEdate"
        ErrorMessage="�������������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator2" ControlToValidate="txtSdate" Display="none"
        Operator="DataTypeCheck" ErrorMessage="��ʼ���ڸ�ʽ���󣬸�ʽ�ο�2008-01-01��2008/01/01" Type="date"
        runat="server">
    </asp:CompareValidator>
    <asp:CompareValidator ID="CompareValidator3" ControlToValidate="txtEdate" Display="none"
        Operator="DataTypeCheck" ErrorMessage="�������ڸ�ʽ���󣬸�ʽ�ο�2008-12-31��2008/12/31" Type="date"
        runat="server">
    </asp:CompareValidator>
    </form>
</body>
</html>
