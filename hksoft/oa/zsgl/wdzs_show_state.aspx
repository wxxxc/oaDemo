<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wdzs_show_state.aspx.cs"
    Inherits="hkpro.oa.zsgl.wdzs_show_state" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>�ҵ�֪ʶ</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" height="25px">
                ��ѡ�����֪ʶ[<font color="red"><%=ShowTitle%></font>]״̬
            </td>
        </tr>
        <tr align="center">
            <td valign="top">
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td colspan="2" height="15px">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Panel ID="Panel1" runat="server" Height="50px" Width="100%" Visible="false"
                                HorizontalAlign="Center">
                                ��ǰ״̬Ϊ[<font color="red"><%=State %></font>]����û��ͨ���������Ƿ��������
                                <br />
                                <br />
                                <asp:Button ID="BtnS" runat="server" Text="����" OnClick="BtnS_Click" CssClass="mybtn" />&nbsp;
                                <input id="Btnc1" type="button" value="�ر�" onclick="window.close()" class="mybtn" />
                            </asp:Panel>
                            <asp:Panel ID="Panel2" runat="server" Height="50px" Width="100%" Visible="false"
                                HorizontalAlign="Center">
                                ��ǰ״̬Ϊ[<font color="red"><%=State %></font>]����ȴ�֪ʶ����Ա����
                                <br />
                                <br />
                                <input id="Btnc2" type="button" value="�ر�" onclick="window.close()" class="mybtn" />
                            </asp:Panel>
                            <asp:Panel ID="Panel3" runat="server" Height="50px" Width="100%" Visible="false"
                                HorizontalAlign="Center">
                                ��ǰ״̬Ϊ[<font color="red"><%=State %></font>]���Ƿ����¿���
                                <br />
                                <br />
                                <asp:Button ID="Btnkq" runat="server" Text="����" OnClick="Btnkq_Click" CssClass="mybtn" />&nbsp;
                                <input id="Btnc3" type="button" value="�ر�" onclick="window.close()" class="mybtn" />
                            </asp:Panel>
                            <asp:Panel ID="Panel4" runat="server" Height="50px" Width="100%" Visible="false"
                                HorizontalAlign="Center">
                                ��ǰ״̬Ϊ[<font color="red"><%=State %></font>]���Ƿ���������
                                <br />
                                <br />
                                <asp:Button ID="BtnSa" runat="server" Text="����" OnClick="BtnSa_Click" CssClass="mybtn" />&nbsp;
                                <input id="Btnc4" type="button" value="�ر�" onclick="window.close()" class="mybtn" />
                            </asp:Panel>
                            <asp:Panel ID="Panel5" runat="server" Height="50px" Width="100%" Visible="false"
                                HorizontalAlign="Center">
                                ��ǰ״̬Ϊ[<font color="red"><%=State %></font>]���Ƿ���ֹ
                                <br />
                                <br />
                                <asp:Button ID="Btnstop" runat="server" Text="��ֹ" OnClick="Btnstop_Click" CssClass="mybtn" />&nbsp;
                                <input id="Btnc5" type="button" value="�ر�" onclick="window.close()" class="mybtn" />
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
