<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MySignet_Add.aspx.cs" Inherits="hkpro.workflow.seal.MySignet_Add" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>����˽��</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">    
        <tr>
            <td valign="top" align="center">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td style="width: 20%" class="form-item">
                            <font color="red">*</font>ӡ�����ƣ�
                        </td>
                        <td style="width: 80%">
                            <asp:TextBox ID="sName" runat="server" CssClass="mytext" Width="96%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>ӡ�����룺
                        </td>
                        <td>
                            <asp:TextBox ID="sPwd" runat="server" CssClass="mytext" Width="96%" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>ȷ�����룺
                        </td>
                        <td>
                            <asp:TextBox ID="sPwdConfirm" runat="server" CssClass="mytext" Width="96%" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>ӡ��ͼƬ��
                        </td>
                        <td>
                            <input id="sPicName" runat="server" style="width: 96%" type="file" name="sPicName"
                                class="mytext" />
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ��ע��
                        </td>
                        <td>
                            <asp:TextBox ID="sRemark" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                Rows="3"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 30px" align="center">
                <asp:Button CssClass="btn btn-success" ID="SaveBtn" runat="server" Text=" ���� " OnClick="Save_Click">
                </asp:Button>
                <input type="button" name="BackBtn" value=" ���� " class="btn btn-info" onclick="javascript:location.href='MySignet.aspx';" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="sName"
        ErrorMessage="������ӡ������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="sPwd"
        ErrorMessage="������ӡ������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="sPwdConfirm"
        ErrorMessage="������ȷ������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ControlToValidate="sPwd"
        Display="none" ErrorMessage="ӡ���������Ϊ���֡���ĸ��������" ValidationExpression="^\w+$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="sPwd"
        Type="String" ControlToCompare="sPwdConfirm" ErrorMessage="ӡ��������ȷ�����벻����">&nbsp;
    </asp:CompareValidator>
    </form>
</body>
</html>
