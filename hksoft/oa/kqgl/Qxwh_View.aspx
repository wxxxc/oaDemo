<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qxwh_View.aspx.cs" Inherits="hkpro.oa.kqgl.Qxwh_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>Ա�������趨</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                Ա�������趨
            </td>
            <td class="td_base" width="20%">
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
                                    <td colspan="4" align="center">
                                        <b>==������Ϣ==</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ������˾��
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblssgs" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        ���룺
                                    </td>
                                    <td style="width: 30%">
                                        <asp:Label ID="lblyhbm" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        ������
                                    </td>
                                    <td style="width: 30%">
                                        <asp:Label ID="lblxm" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ���ţ�
                                    </td>
                                    <td>
                                        <asp:Label ID="lblbm" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        ְλ��
                                    </td>
                                    <td>
                                        <asp:Label ID="lblzw" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ��ɫ��
                                    </td>
                                    <td>
                                        <asp:Label ID="lbljs" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        ״̬��
                                    </td>
                                    <td>
                                        <asp:Label ID="lblzt" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center">
                                        <b>==�����������==</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ��Ӧ����ID��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="kqid" runat="server" Width="150"></asp:TextBox><font color="red">*</font>
                                    </td>
                                    <td class="form-item">
                                        ��ְ���ڣ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ui_rzrq" runat="server" Width="150" onclick="SelectDate(this,'yyyy-MM-dd')"></asp:TextBox><font
                                            color="red">*</font>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        &nbsp;
                                    </td>
                                    <td colspan="3">
                                        <asp:CheckBox ID="kqspry1" runat="server" Text="���ſ���������Ա" />
                                        <asp:CheckBox ID="kqspry2" runat="server" Text="���������ֹ��쵼" />
                                        <asp:CheckBox ID="kqspry3" runat="server" Text="�������������쵼" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        &nbsp;
                                    </td>
                                    <td colspan="3">
                                        <asp:CheckBox ID="kqglry" runat="server" Text="���ڹ�����Ա" />
                                        <asp:CheckBox ID="tskqry" runat="server" Text="���⿼����Ա" />
                                        <asp:CheckBox ID="ynnjtj" runat="server" Text="���벿�����ͳ��" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="�� ��" OnClick="Save_Click"
                                ></asp:Button>
                            <input type="button" name="BackBtn" value="�� ��" class="mybtn" onclick="javascript:window.close()"
                                 />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="kqid"
        ErrorMessage="�������Ӧ�Ŀ���ID">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ui_rzrq"
        ErrorMessage="��������ְ����">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
