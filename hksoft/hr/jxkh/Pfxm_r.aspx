<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pfxm_r.aspx.cs" Inherits="hkpro.oa.jxkh.Pfxm_r" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>������Ŀ</title>
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>

    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table id="Table1" cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
            <tr>
                <td style="height:30">
                    ��ǰ״̬��<asp:Label ID="labelstatus" runat="server" Text="����" Font-Size="Medium" ForeColor="Red"></asp:Label>
                </td>
                <td align="right">
                    <asp:Button CssClass="btn btn-success" ID="SaveBtn" runat="server" Text="�� ��" OnClick="Save_Click"
                        AccessKey="s"></asp:Button>
                    <asp:Button CssClass="btn btn-primary" ID="AddBtn" runat="server" Text="�� ��" OnClick="Save_Click"
                        CausesValidation="false" AccessKey="a"></asp:Button>
                    <asp:Button CssClass="btn btn-danger" ID="DelBtn" runat="server" Text="ɾ ��" OnClick="Del_Click"
                        OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" AccessKey="d"></asp:Button>&nbsp;
                </td>
            </tr>
        </tbody>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td style="width: 20%" class="form-item">
                            ��Ŀ����<font color="red">*</font>��
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox CssClass="mytext" ID="xmmc" runat="server" Width="90%"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="form-item">
                            ��ֵ<font color="red">*</font>��
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox ID="fz" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            �ϼ���Ŀ��
                        </td>
                        <td>
                            <asp:DropDownList ID="upid" runat="server" Width="90%">
                            </asp:DropDownList>
                        </td>
                        <td class="form-item">
                            ����ϸ��
                        </td>
                        <td>
                            <asp:TextBox ID="kpxz" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                 <%--   <tr>
                        <td class="form-item">
                            �������ֵȼ�<font color="red">*</font>��</td>
                        <td colspan="3">
                            <asp:RadioButtonList ID="pfdj" runat="server" RepeatDirection="Horizontal" 
                                RepeatLayout="Flow" AutoPostBack="true" 
                                onselectedindexchanged="pfdj_SelectedIndexChanged">
                                <asp:ListItem Text="��" Value="��"></asp:ListItem>
                                <asp:ListItem Text="��" Value="��" Selected="True"></asp:ListItem>
                            </asp:RadioButtonList>
                            ����>=<asp:TextBox ID="pfdj_y" runat="server" CssClass="mytext" Width="60" Enabled="false">0</asp:TextBox>
                            >��>=<asp:TextBox ID="pfdj_l" runat="server" CssClass="mytext" Width="60" Enabled="false">0</asp:TextBox>
                            >��>=<asp:TextBox ID="pfdj_z" runat="server" CssClass="mytext" Width="60" Enabled="false">0</asp:TextBox>
                            ��<=<asp:TextBox ID="pfdj_c" runat="server" CssClass="mytext" Width="60" Enabled="false">0</asp:TextBox>��
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="form-item">
                            ��ע��
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="xmbz" runat="server" CssClass="mytextarea" Width="96%" TextMode="MultiLine"
                                Rows="3"></asp:TextBox>
                        </td>
                    </tr>
                  <%--  <tr>
                        <td class="form-item">
                            ��ίȨ�ޣ�</td>
                        <td colspan="3">
                            <asp:CheckBox ID="pw_zr" runat="server" Text="�ܾ�����ί" />
                            <asp:CheckBox ID="pw_fzr" runat="server" Text="��������ί" />
                            <asp:CheckBox ID="pw_ybpw" runat="server" Text="һ����ί" />
                            <asp:CheckBox ID="pw_gzry" runat="server" Text="������Ա��ί" AutoPostBack="true" 
                                oncheckedchanged="pw_gzry_CheckedChanged" />
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="form-item">
                            �����<font color="red">*</font>��
                        </td>
                        <td>
                            <asp:TextBox ID="pxh" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                        <td class="form-item">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblxmid" runat="server" Visible="false"></asp:Label>
        
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="xmmc"
        ErrorMessage="��������Ŀ����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="fz"
        ErrorMessage="�������ֵ">&nbsp;
    </asp:RequiredFieldValidator>
    <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator17" ControlToValidate="fz"
        Display="none" ErrorMessage="��ֵ����Ϊ��ֵ��" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>--%>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator17" ControlToValidate="fz"
        Display="none" ErrorMessage="��ֵ����Ϊ��ֵ��" ValidationExpression="^(\-|\+?)\d+(\.\d+)?$"
        runat="server">
    </asp:RegularExpressionValidator>
    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="pfdj_y"
        ErrorMessage="���������ֵȼ�-�ŷ�ֵ">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="pfdj_y"
        Display="none" ErrorMessage="���ֵȼ�-�ŷ�ֵ����Ϊ��ֵ��" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="pfdj_l"
        ErrorMessage="���������ֵȼ�-����ֵ">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="pfdj_l"
        Display="none" ErrorMessage="���ֵȼ�-����ֵ����Ϊ��ֵ��" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="pfdj_z"
        ErrorMessage="���������ֵȼ�-�з�ֵ">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="pfdj_z"
        Display="none" ErrorMessage="���ֵȼ�-�з�ֵ����Ϊ��ֵ��" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="pfdj_c"
        ErrorMessage="���������ֵȼ�-���ֵ">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="pfdj_c"
        Display="none" ErrorMessage="���ֵȼ�-���ֵ����Ϊ��ֵ��" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>--%>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="pxh"
        ErrorMessage="�����������">&nbsp;
    </asp:RequiredFieldValidator>
    <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="pxh"
        Display="none" ErrorMessage="����ű���Ϊ��ֵ��" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>--%>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="pxh"
        Display="none" ErrorMessage="����ű���Ϊ������" ValidationExpression="\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>
    </form>
</body>
</html>
