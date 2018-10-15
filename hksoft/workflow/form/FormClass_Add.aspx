<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormClass_Add.aspx.cs"
    Inherits="hkpro.workflow.form.FormClass_Add" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>������</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">     
        <tr>
            <td valign="top" align="center">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td style="width: 20%" class="form-item">
                            <font color="red">*</font>�������ƣ�
                        </td>
                        <td style="width: 80%">
                            <asp:TextBox ID="fcName" runat="server" CssClass="mytext" Width="96%" MaxLength="30"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ��ע��
                        </td>
                        <td>
                            <asp:TextBox ID="fcRemark" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                Rows="6"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 30px" align="center">
                <asp:Button CssClass="btn btn-success" ID="SaveAddBtn" runat="server" Text="���沢�½�" OnClick="Save_Click" />
                <asp:Button CssClass="btn btn-primary" ID="SaveBtn" runat="server" Text="�� ��" OnClick="Save_Click">
                </asp:Button>
                <input type="button" name="BackBtn" value="�� ��" class="btn btn-info" onclick="javascript:location.href='FormClass.aspx'" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="fcName"
        ErrorMessage="�������������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="fcRemark"
        Display="none" ErrorMessage="��ע���ܳ���100����" ValidationExpression="^(\s|\S){0,100}$"
        runat="server">
    </asp:RegularExpressionValidator>
    </form>
</body>
</html>
