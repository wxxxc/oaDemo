<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Zwwh_Add.aspx.cs" Inherits="hkpro.portal.bmgl.Zwwh_Add" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>ְλ����</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                ����ְλ��Ϣ
            </td>
            <td class="td_base" style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td class="form-item" style="width: 20%">
                            <font color="red">*</font>ְλ���ƣ�
                        </td>
                        <td style="width: 80%">
                            <asp:TextBox ID="zwmc" runat="server" CssClass="mytext" Width="90%" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ְλ˵����
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="zwms" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ��λְ��
                        </td>
                        <td>
                            <textarea runat="server" id="editor" name="editor" rows="10" cols="10" style="width: 100%;
                                height: 250px;"></textarea>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button CssClass="btn btn-primary" ID="SaveAddBtn" runat="server" Text="���沢�½�" OnClick="Save_Click" />
                <asp:Button CssClass="btn btn-success" ID="SaveBtn" runat="server" Text="�� ��" OnClick="Save_Click">
                </asp:Button>
                <input type="button" name="BackBtn" value="�� ��" class="btn btn-danger" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="zwmc"
        ErrorMessage="������ְλ����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="zwms"
        Display="none" ErrorMessage="ְλ�������ܳ���100����" ValidationExpression="^(\s|\S){0,200}$"
        runat="server">
    </asp:RegularExpressionValidator>
    <script type="text/javascript">
        var ue = UE.getEditor('editor');
    </script>
    </form>
</body>
</html>
