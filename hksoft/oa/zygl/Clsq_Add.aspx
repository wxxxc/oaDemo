<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clsq_Add.aspx.cs" Inherits="hkpro.oa.zygl.Clsq_Add" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>�ҵ�����</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                ������������
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
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>ѡ�ó�����
                                    </td>
                                    <td style="width: 30%">
                                        <asp:DropDownList ID="xycl" runat="server" Width="90%" CssClass="mytext">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>����������
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="czrs" runat="server" Width="90%" CssClass="mytext" MaxLength="5"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>�����ص㣺
                                    </td>
                                    <td>
                                        <asp:TextBox ID="fcdd" runat="server" Width="90%" CssClass="mytext" MaxLength="10"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        <font color="red">*</font>����ص㣺
                                    </td>
                                    <td>
                                        <asp:TextBox ID="dddd" runat="server" Width="90%" CssClass="mytext" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ���벿�ţ�
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="sqbm" runat="server" Width="90%" CssClass="mytext" Enabled="false">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item">
                                        ��ʻԱ��
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="jsy" runat="server" Width="90%" CssClass="mytext">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>��ʻʱ��(��)��
                                    </td>
                                    <td colspan="3">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="width: 108px">
                                                    <asp:TextBox ID="xssj_s" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                                        Width="100" MaxLength="10"></asp:TextBox>
                                                </td>
                                                <td style="width: 70">
                                                    <asp:DropDownList ID="sxs" runat="server" Width="60">
                                                        <asp:ListItem Text="Сʱ" Value="" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="06��" Value="06:"></asp:ListItem>
                                                        <asp:ListItem Text="07��" Value="07:"></asp:ListItem>
                                                        <asp:ListItem Text="08��" Value="08:"></asp:ListItem>
                                                        <asp:ListItem Text="09��" Value="09:"></asp:ListItem>
                                                        <asp:ListItem Text="10��" Value="10:"></asp:ListItem>
                                                        <asp:ListItem Text="11��" Value="11:"></asp:ListItem>
                                                        <asp:ListItem Text="12��" Value="12:"></asp:ListItem>
                                                        <asp:ListItem Text="13��" Value="13:"></asp:ListItem>
                                                        <asp:ListItem Text="14��" Value="14:"></asp:ListItem>
                                                        <asp:ListItem Text="15��" Value="15:"></asp:ListItem>
                                                        <asp:ListItem Text="16��" Value="16:"></asp:ListItem>
                                                        <asp:ListItem Text="17��" Value="17:"></asp:ListItem>
                                                        <asp:ListItem Text="18��" Value="18:"></asp:ListItem>
                                                        <asp:ListItem Text="19��" Value="19:"></asp:ListItem>
                                                        <asp:ListItem Text="20��" Value="20:"></asp:ListItem>
                                                        <asp:ListItem Text="21��" Value="21:"></asp:ListItem>
                                                        <asp:ListItem Text="22��" Value="22:"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="sfz" runat="server" Width="60">
                                                        <asp:ListItem Text="����" Value="" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="00��" Value="00:"></asp:ListItem>
                                                        <asp:ListItem Text="05��" Value="05:"></asp:ListItem>
                                                        <asp:ListItem Text="10��" Value="10:"></asp:ListItem>
                                                        <asp:ListItem Text="15��" Value="15:"></asp:ListItem>
                                                        <asp:ListItem Text="20��" Value="20:"></asp:ListItem>
                                                        <asp:ListItem Text="25��" Value="25:"></asp:ListItem>
                                                        <asp:ListItem Text="30��" Value="30:"></asp:ListItem>
                                                        <asp:ListItem Text="35��" Value="35:"></asp:ListItem>
                                                        <asp:ListItem Text="40��" Value="40:"></asp:ListItem>
                                                        <asp:ListItem Text="45��" Value="45:"></asp:ListItem>
                                                        <asp:ListItem Text="50��" Value="50:"></asp:ListItem>
                                                        <asp:ListItem Text="55��" Value="55:"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>��ʻʱ��(��)��
                                    </td>
                                    <td colspan="3">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="width: 108px">
                                                    <asp:TextBox ID="xssj_e" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                                        Width="100" MaxLength="10"></asp:TextBox>
                                                </td>
                                                <td style="width: 70">
                                                    <asp:DropDownList ID="exs" runat="server" Width="60">
                                                        <asp:ListItem Text="Сʱ" Value="" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="06��" Value="06:"></asp:ListItem>
                                                        <asp:ListItem Text="07��" Value="07:"></asp:ListItem>
                                                        <asp:ListItem Text="08��" Value="08:"></asp:ListItem>
                                                        <asp:ListItem Text="09��" Value="09:"></asp:ListItem>
                                                        <asp:ListItem Text="10��" Value="10:"></asp:ListItem>
                                                        <asp:ListItem Text="11��" Value="11:"></asp:ListItem>
                                                        <asp:ListItem Text="12��" Value="12:"></asp:ListItem>
                                                        <asp:ListItem Text="13��" Value="13:"></asp:ListItem>
                                                        <asp:ListItem Text="14��" Value="14:"></asp:ListItem>
                                                        <asp:ListItem Text="15��" Value="15:"></asp:ListItem>
                                                        <asp:ListItem Text="16��" Value="16:"></asp:ListItem>
                                                        <asp:ListItem Text="17��" Value="17:"></asp:ListItem>
                                                        <asp:ListItem Text="18��" Value="18:"></asp:ListItem>
                                                        <asp:ListItem Text="19��" Value="19:"></asp:ListItem>
                                                        <asp:ListItem Text="20��" Value="20:"></asp:ListItem>
                                                        <asp:ListItem Text="21��" Value="21:"></asp:ListItem>
                                                        <asp:ListItem Text="22��" Value="22:"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="efz" runat="server" Width="60">
                                                        <asp:ListItem Text="����" Value="" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="00��" Value="00:"></asp:ListItem>
                                                        <asp:ListItem Text="05��" Value="05:"></asp:ListItem>
                                                        <asp:ListItem Text="10��" Value="10:"></asp:ListItem>
                                                        <asp:ListItem Text="15��" Value="15:"></asp:ListItem>
                                                        <asp:ListItem Text="20��" Value="20:"></asp:ListItem>
                                                        <asp:ListItem Text="25��" Value="25:"></asp:ListItem>
                                                        <asp:ListItem Text="30��" Value="30:"></asp:ListItem>
                                                        <asp:ListItem Text="35��" Value="35:"></asp:ListItem>
                                                        <asp:ListItem Text="40��" Value="40:"></asp:ListItem>
                                                        <asp:ListItem Text="45��" Value="45:"></asp:ListItem>
                                                        <asp:ListItem Text="50��" Value="50:"></asp:ListItem>
                                                        <asp:ListItem Text="55��" Value="55:"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �˳���ʽ��
                                    </td>
                                    <td colspan="3">
                                        <asp:RadioButtonList ID="ccxs" runat="server" RepeatLayout="Flow" RepeatDirection="horizontal">
                                            <asp:ListItem Text="��ͨ" Value="��ͨ" Selected="true"></asp:ListItem>
                                            <asp:ListItem Text="����" Value="����"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>�������ɣ�
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="ccsy" runat="server" Width="96%" CssClass="mytextarea" TextMode="multiLine"
                                            Rows="3"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ��ע��
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="bz" runat="server" Width="96%" CssClass="mytextarea" TextMode="multiLine"
                                            Rows="5"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <asp:CheckBox ID="xxtz" runat="server" Checked="true" Text="վ����Ϣ֪ͨ��������Ա" />
                                        <asp:CheckBox ID="dxtz" runat="server" Text="�ֻ�����֪ͨ��������Ա" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30px" valign="middle">
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="���沢����" OnClick="Save_Click">
                            </asp:Button>
                            <asp:Button CssClass="mybtn" ID="UseBtn" runat="server" Text="ֱ��ʹ��" OnClick="Save_Click"
                                Visible="false"></asp:Button>
                            <asp:Button ID="Button2" Text="���" OnClick="Clear_Click" runat="Server" CausesValidation="false"
                                CssClass="mybtn" />
                            <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <font color="red">��ʾ��ֻ�С�δ�����״̬�ĳ�����������</font>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--����label-->
    <asp:Label ID="ycxx" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="fcdd"
        ErrorMessage="�����뷢���ص�">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator123" runat="server" ControlToValidate="dddd"
        ErrorMessage="�����뵽��ص�">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator124" runat="server" ControlToValidate="czrs"
        ErrorMessage="�������������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="xssj_s"
        ErrorMessage="��������ʻʱ��(��)">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="sxs"
        ErrorMessage="��ѡ����ʻʱ��(��)(Сʱ)">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="sfz"
        ErrorMessage="��ѡ����ʻʱ��(��)(����)">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="xssj_e"
        ErrorMessage="��������ʻʱ��(��)">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="exs"
        ErrorMessage="��ѡ����ʻʱ��(��)(Сʱ)">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="efz"
        ErrorMessage="��ѡ����ʻʱ��(��)(����)">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="xycl"
        ErrorMessage="��ѡ����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ccsy"
        ErrorMessage="�������������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="czrs"
        Display="none" ErrorMessage="������������Ϊ����" ValidationExpression="^\d+$" runat="server">
    </asp:RegularExpressionValidator>
    <asp:CompareValidator ID="CompareValidator2" ControlToValidate="xssj_s" Display="none"
        Operator="DataTypeCheck" ErrorMessage="��ʻʱ��(��)��ʽ���󣬸�ʽ�ο�2008-01-01��2008/01/01"
        Type="date" runat="server">
    </asp:CompareValidator>
    <asp:CompareValidator ID="CompareValidator3" ControlToValidate="xssj_e" Display="none"
        Operator="DataTypeCheck" ErrorMessage="��ʻʱ��(��)��ʽ���󣬸�ʽ�ο�2008-12-31��2008/12/31"
        Type="date" runat="server">
    </asp:CompareValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="ccsy"
        Display="none" ErrorMessage="�������ɲ��ܳ���50����" ValidationExpression="^(\s|\S){0,50}$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="bz"
        Display="none" ErrorMessage="��ע���ܳ���50����" ValidationExpression="^(\s|\S){0,50}$"
        runat="server">
    </asp:RegularExpressionValidator>
    </form>
</body>
</html>
