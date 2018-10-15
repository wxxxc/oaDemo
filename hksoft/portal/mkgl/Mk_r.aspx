<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mk_r.aspx.cs" Inherits="hkpro.portal.mkgl.Mk_r" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>ģ����Ϣ</title>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td style="height: 30">
                ��ǰ״̬��<asp:Label ID="labelstatus" runat="server" Text="�޸�" Font-Size="Medium" ForeColor="Red"></asp:Label>
            </td>
            <td align="right">
                <asp:Button CssClass="btn btn-success" ID="SaveBtn" runat="server" Text="�� ��" OnClick="Save_Click" Enabled="false">
                </asp:Button>
                <asp:Button CssClass="btn btn-primary" ID="AddBtn" runat="server" Text="�� ��" OnClick="Save_Click"
                    CausesValidation="false"></asp:Button>
                <asp:Button CssClass="btn btn-danger" ID="DelBtn" runat="server" Text="ɾ ��" OnClick="Del_Click"
                    OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" Enabled="false"></asp:Button>&nbsp;
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>ģ�����ͣ�
                        </td>
                        <td colspan="3">
                            <asp:DropDownList ID="modu_lx" runat="server" Width="96%" AutoPostBack="true" OnSelectedIndexChanged="modu_lx_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="form-item">
                            <font color="red">*</font>ģ����룺
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox CssClass="mytext" ID="moduid" runat="server" Width="90%" Enabled="false"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="form-item">
                            <font color="red">*</font>ģ�����ƣ�
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox ID="modumc" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            �ϼ�ģ�飺
                        </td>
                        <td>
                            <asp:DropDownList ID="moduupid" runat="server" Width="90%">
                            </asp:DropDownList>
                        </td>
                        <td class="form-item">
                            <font color="red">*</font>�ļ�·����
                        </td>
                        <td>
                            <asp:TextBox ID="moduwjlj" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ģ�����ʣ�
                        </td>
                        <td>
                            <asp:DropDownList ID="modu_xz" runat="server" Width="90%" ToolTip="�����������RS������ѡ�񱨱�ģ��">
                                <asp:ListItem Value="��׼ģ��" Text="��׼ģ��" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="����ģ��" Text="����ģ��"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="form-item">
                            <font color="red">*</font>ͼ��·����
                        </td>
                        <td>
                            <asp:TextBox ID="modu_icon" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ����������
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="modubz" runat="server" CssClass="mytextarea" Width="96%" TextMode="MultiLine"
                                Rows="3"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            �鿴Ȩ�ޣ�
                        </td>
                        <td>
                            <asp:CheckBox ID="cbcorp" runat="server" Text="��˾" ToolTip="�����Բ鿴ȫ������" />
                            <asp:CheckBox ID="cbdept" runat="server" Text="����" ToolTip="�����Բ鿴�����Ż��Ӳ��ŵ�����" />
                            <asp:CheckBox ID="cbindi" runat="server" Text="����" ToolTip="��ֻ�ܲ鿴���˵�����" />
                        </td>
                        <td class="form-item">
                            ģ��״̬��
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rbzt" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="����" Text="����" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="����" Text="����"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ����Ȩ�ޣ�
                        </td>
                        <td colspan="3">
                            <asp:RadioButtonList ID="yn_oper" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                AutoPostBack="true" OnSelectedIndexChanged="yn_oper_SelectedIndexChanged">
                                <asp:ListItem Text="����" Value="��"></asp:ListItem>
                                <asp:ListItem Text="������" Value="��" Selected="True"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <asp:Panel ID="p_oper" runat="server" Visible="false">
                        <tr>
                            <td class="form-item">
                                &nbsp;
                            </td>
                            <td colspan="3">
                                <asp:CheckBox ID="cbfull" runat="server" Text="ȫ��" AutoPostBack="true" OnCheckedChanged="cbfull_CheckedChanged"
                                    ToolTip="�����ؿ��Ƶ�������Ȩ��" />
                                <asp:CheckBox ID="cbadd" runat="server" Text="����" />
                                <asp:CheckBox ID="cbmod" runat="server" Text="�޸�" />
                                <asp:CheckBox ID="cbdel" runat="server" Text="ɾ��" />
                                <asp:CheckBox ID="cbexp" runat="server" Text="����" />
                                <asp:CheckBox ID="cbaud" runat="server" Text="����" ToolTip="������������ͣ�����á����õȲ���" />
                                <asp:CheckBox ID="cbexe" runat="server" Text="ִ��" ToolTip="������ʼ�������á���յȲ���" />
                                <asp:CheckBox ID="cbque" runat="server" Text="�鿴" />
                            </td>
                        </tr>
                    </asp:Panel>
                </table>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="modu_lx"
        ErrorMessage="��ѡ��ģ������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="moduid"
        ErrorMessage="������ģ�����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="ģ����������1��100000֮�����������"
        ControlToValidate="moduid" MinimumValue="1" MaximumValue="100000" Type="integer">&nbsp;
    </asp:RangeValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="modumc"
        ErrorMessage="������ģ������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="moduwjlj"
        ErrorMessage="�������ļ�·���������޿�����#����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="modu_icon"
        ErrorMessage="������ͼ��·��">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:CompareValidator ID="Compare1" runat="server" ControlToValidate="moduid" Operator="notequal"
        Type="String" ControlToCompare="moduupid" ErrorMessage="�ϼ�ģ�鲻��ѡ��ģ�飡">&nbsp;</asp:CompareValidator>
    </form>
</body>
</html>
