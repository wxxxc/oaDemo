<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kqspsm_View.aspx.cs" Inherits="hkpro.oa.kqgl.Kqspsm_View"
    ValidateRequest="false" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��������˵��</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>��������˵��
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
                            <font color="red">*</font>���ƣ�
                        </td>
                        <td style="width: 80%" colspan="3">
                            <asp:TextBox ID="smmc" runat="server" CssClass="mytext" Width="96%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" style="width: 20%">
                            ���ͣ�
                        </td>
                        <td style="width: 30%">
                            <asp:RadioButtonList ID="smlx" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Text="��ٵ�" Value="��ٵ�" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="����˵����" Value="����˵����"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="form-item" style="width: 20%">
                            <font color="red">*</font>������Ա��
                        </td>
                        <td style="width: 30%">
                            <asp:DropDownList ID="syry" runat="server" Width="90%">
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                <asp:ListItem Text="������Ա" Value="������Ա"></asp:ListItem>
                                <asp:ListItem Text="���ſ���������Ա" Value="���ſ���������Ա"></asp:ListItem>
                                <asp:ListItem Text="���������ֹ��쵼" Value="���������ֹ��쵼"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <textarea runat="server" id="editor" name="editor" rows="10" cols="10" style="width: 100%;
                                height: 280px;"></textarea>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button CssClass="mybtn" ID="SaveAddBtn" runat="server" Text="���沢�½�" OnClick="Save_Click"
                    Visible="false" />
                <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="����" OnClick="Save_Click">
                </asp:Button>
                <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click"
                    Visible="false" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')"></asp:Button>
                <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="smmc"
        ErrorMessage="����������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="syry"
        ErrorMessage="��ѡ��������Ա">&nbsp;
    </asp:RequiredFieldValidator>
    <script type="text/javascript">
        var ue = UE.getEditor('editor');
    </script>
    </form>
</body>
</html>
