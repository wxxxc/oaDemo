<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cldd_View.aspx.cs" Inherits="hkpro.oa.clgl.Cldd_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>��������</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                �鿴��������
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
                                    <td style="width: 20%" class="form-item">
                                        �����ص㣺
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="fcdd" runat="server" Width="90%" CssClass="mytext" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td style="width: 20%" class="form-item">
                                        ����ص㣺
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="dddd" runat="server" Width="90%" CssClass="mytext" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ���벿�ţ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="sqbm" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        ����������
                                    </td>
                                    <td>
                                        <asp:TextBox ID="czrs" runat="server" Width="90%" CssClass="mytext" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ��ʻʱ��(��)��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="kssj" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        ��ʻʱ��(��)��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="jssj" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �˳���ʽ��
                                    </td>
                                    <td colspan="3">
                                        <asp:RadioButtonList ID="ccxs" runat="server" RepeatLayout="Flow" RepeatDirection="horizontal">
                                            <asp:ListItem Text="����" Value="����" Selected="true"></asp:ListItem>
                                            <asp:ListItem Text="��ͨ" Value="��ͨ"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �������ɣ�
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="ccsy" runat="server" Width="96%" CssClass="mytextarea" TextMode="multiLine"
                                            Rows="3" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ��ע��
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="bz" runat="server" Width="96%" CssClass="mytextarea" TextMode="multiLine"
                                            Rows="3" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ���복����
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="xycl" runat="server" Width="90%" CssClass="mytext" Enabled="false">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item">
                                        �����ʻԱ��
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="jsy" runat="server" Width="90%" CssClass="mytext" Enabled="false">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <hr class="hr1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>���䳵����
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="xzcl" runat="server" Width="90%" CssClass="mytext">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item">
                                        �����ʻԱ��
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="xzjsy" runat="server" Width="90%" CssClass="mytext">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>���������
                                    </td>
                                    <td colspan="3" style="width: 400px; height: 30px">
                                        <asp:TextBox ID="spyj" runat="server" TextMode="multiLine" Rows="2" Width="340px"
                                            CssClass="mytextarea" />&nbsp;<img src="../../images/choose.gif" onclick="openA('../../choose/portal/Spyjview.aspx?page=xpsp')"
                                                alt="ѡ��ϵͳ�ṩ���������" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" EnableClientScript="false"
                                            ControlToValidate="spyj" ErrorMessage="����">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <asp:Panel ID="Panelghsm" runat="server" Visible="false">
                                    <tr>
                                        <td class="form-item">
                                            <font color="red">*</font>�黹˵����
                                        </td>
                                        <td colspan="3" style="width: 400px; height: 30px">
                                            <asp:TextBox ID="ghsm" runat="server" TextMode="multiLine" Rows="2" Width="340px"
                                                CssClass="mytextarea" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" EnableClientScript="false"
                                                ControlToValidate="ghsm" ErrorMessage="����">
                                            </asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                </asp:Panel>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <asp:CheckBox ID="xxtz" runat="server" Checked="true" Text="վ����Ϣ֪ͨ������" />
                                        <asp:CheckBox ID="dxtz" runat="server" Text="�ֻ�����֪ͨ������" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SpBtn" runat="server" Text="ͬ��ʹ��" OnClick="shenpi_Click" />
                            <asp:Button CssClass="mybtn" ID="ThBtn" runat="server" Text="�ܾ�ʹ��" OnClick="TuiHui_Click"
                                CausesValidation="false" />
                            <asp:Button CssClass="mybtn" ID="QRGH" runat="server" Text="ȷ�Ϲ黹" CausesValidation="false"
                                OnClick="QRGH_Click" Visible="false"></asp:Button>
                            <input type="button" name="BackBtn" value=" �ر� " class="mybtn" onclick="javascript:window.close()" />
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
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="xzcl"
        ErrorMessage="��ѡ����">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
