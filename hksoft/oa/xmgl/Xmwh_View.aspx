<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Xmwh_View.aspx.cs" Inherits="hkpro.oa.xmgl.Xmwh_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>��Ŀά��</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>��Ŀ��Ϣ
            </td>
            <td class="td_base" width="20%">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table cellspacing="0" cellpadding="0" width="98%" border="0" align="center">
                    <tr>
                        <td style="height: 10px">
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center">
                                <tr>
                                    <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_y.gif)"
                                        align="center">
                                        <a href="xmwh_view.aspx?id=<%=xmid.Text %>" class="mail_top">��Ŀ�嵥</a>
                                    </td>
                                    <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                        <a href="xmwh_gzjl.aspx?id=<%=xmid.Text %>" class="black">���ټ�¼</a>
                                    </td>
                                    <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                        <a href="xmwh_lxr.aspx?id=<%=xmid.Text %>" class="black">��ϵ��</a>
                                    </td>
                                    <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                        <a href="xmwh_fj.aspx?id=<%=xmid.Text %>" class="black">��Ŀ����</a>
                                    </td>
                                    <td align="right" colspan="4">
                                        <asp:Button CssClass="mybtn" ID="SaveAddBtn" runat="server" Text="���沢�½�" OnClick="Save_Click" />
                                        <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="����" OnClick="Save_Click">
                                        </asp:Button>
                                        <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript:window.close()" />
                                    </td>
                                </tr>
                            </table>
                            <table border="0" cellpadding="0" cellspacing="0" align="center" class="form" width="100%">
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>��Ŀ���ƣ�
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="xmmc" runat="server" CssClass="mytext" Width="96%" MaxLength="50"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        ����ʡ�ݣ�
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="sssf" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        �������У�
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="sscs" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>��Ŀ���ȣ�
                                    </td>
                                    <td colspan="3">
                                        <asp:DropDownList ID="xmjd" runat="server" Width="96%">
                                            <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="�����Ա���" Value="�����Ա���"></asp:ListItem>
                                            <asp:ListItem Text="�쵼ͬ��" Value="�쵼ͬ��"></asp:ListItem>
                                            <asp:ListItem Text="��˾ͨ��" Value="��˾ͨ��"></asp:ListItem>
                                            <asp:ListItem Text="˫��Э��" Value="˫��Э��"></asp:ListItem>
                                            <asp:ListItem Text="ǩ��Э��" Value="ǩ��Э��"></asp:ListItem>
                                            <asp:ListItem Text="��Ŀ���" Value="��Ŀ���"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="xmid" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="xmmc"
        ErrorMessage="��������Ŀ����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="xmjd"
        ErrorMessage="��ѡ����Ŀ����">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
