<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gzzd_Add.aspx.cs" Inherits="hkpro.portal.xzgl.Gzzd_Add"
    ValidateRequest="false" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�����ƶ�</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                ���������ƶ�
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
                                    <td class="form-item">
                                        <font color="red">*</font>���ࣺ
                                    </td>
                                    <td colspan="3">
                                        <asp:DropDownList ID="zdfl" runat="server" Width="76%">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="lx" runat="server" Visible="false">
                                            <asp:ListItem Text="��ҵ����" Value="��ҵ" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="��Ӧ�̹���" Value="��Ӧ��"></asp:ListItem>
                                            <asp:ListItem Text="��Ա����" Value="��Ա"></asp:ListItem>
                                            <asp:ListItem Text="��ҵҵ������" Value="��ҵҵ��"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>���⣺
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="zdbt" runat="server" CssClass="mytext" Width="96%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ����ʣ�
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="ztc" runat="server" CssClass="mytext" Width="96%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        �ƶȵȼ���
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="zddj" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        �ܼ���
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="mj" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ���ĵ�λ��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="fwdw" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        �ĺţ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="wh" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <textarea runat="server" id="editor" name="editor" rows="10" cols="10" style="width: 100%;
                                            height: 160px;"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ������
                                    </td>
                                    <td colspan="3">
                                        <input id="fj" runat="server" type="file" style="width: 550px;" class="mytext" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SaveAddBtn" runat="server" Text="���沢�½�" OnClick="Save_Click">
                            </asp:Button>
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="�� ��" OnClick="Save_Click">
                            </asp:Button>
                            <asp:Button ID="Button2" Text="�� ��" OnClick="Clear_Click" runat="Server" CausesValidation="false"
                                class="mybtn" />
                            <input type="button" name="BackBtn" value="�� ��" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblAttachSize" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="zdbt"
        ErrorMessage="���������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="zdfl"
        ErrorMessage="��ѡ�����">&nbsp;
    </asp:RequiredFieldValidator>
    <script type="text/javascript">
        var ue = UE.getEditor('editor');
    </script>
    </form>
</body>
</html>
