<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kqsmbg_View.aspx.cs" Inherits="hkpro.oa.kqgl.Kqsmbg_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>����˵�����</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                ����˵�����
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
                                        <font color="red">*</font>���ڣ�
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="qdsj" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                            Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="height: 25; width: 20%">
                                        &nbsp;
                                    </td>
                                    <td style="width: 30%">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ����ࣺ
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="ynqd1" runat="server" Text="ǩ��" />
                                        <asp:CheckBox ID="ynqt1" runat="server" Text="ǩ��" />
                                    </td>
                                    <td class="form-item" style="height: 25;">
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ����ࣺ
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="ynqd2" runat="server" Text="ǩ��" />
                                        <asp:CheckBox ID="ynqt2" runat="server" Text="ǩ��" />
                                    </td>
                                    <td class="form-item" style="height: 25;">
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ���ϰࣺ
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="ynqd3" runat="server" Text="ǩ��" />
                                        <asp:CheckBox ID="ynqt3" runat="server" Text="ǩ��" />
                                    </td>
                                    <td class="form-item" style="height: 25;">
                                        ���������
                                    </td>
                                    <td>
                                        <asp:Label ID="lblsscs" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �������˵����
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblkqqksm" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ˵��������
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="fujian" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ���벿�ţ�
                                    </td>
                                    <td>
                                        <asp:Label ID="lblsqbmmc" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        �����ˣ�
                                    </td>
                                    <td>
                                        <asp:Label ID="lblsqr" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="height: 25px">
                                    <td class="form-item">
                                        <font color="red">*</font>���ԭ��
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="bgyy" runat="server" Width="96%" TextMode="MultiLine" Rows="2" CssClass="mytextarea" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="ȷ�ϱ��" OnClick="Save_Click">
                            </asp:Button>
                            <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click"
                                OnClientClick="return confirm('ȷ��Ҫɾ���˿���˵����')"></asp:Button>
                            <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="qdsj"
        ErrorMessage="��ѡ������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="bgyy"
        ErrorMessage="��������ԭ��">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
