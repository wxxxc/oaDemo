<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_Zl.aspx.cs" Inherits="hkpro.View_Zl" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�鿴����</title>
    <link href="CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td style="width: 35%" class="form-item">
                                        �û���
                                    </td>
                                    <td style="width: 65%">
                                        <asp:Label ID="yhbm" runat="server" Enabled="false" /><asp:Label ID="Label1" runat="server"
                                            Enabled="false" Text="-" /><asp:Label ID="xm" runat="server" Enabled="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ������
                                    </td>
                                    <td>
                                        <asp:TextBox ID="xmxm" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �Ա�
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="xb" runat="server" Width="90%" Enabled="False">
                                            <asp:ListItem Text="��" Value="��"></asp:ListItem>
                                            <asp:ListItem Text="Ů" Value="Ů"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ���ţ�
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ssbm" runat="server" Width="90%" Enabled="False">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ְλ��
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="zw" runat="server" CssClass="mytext" Width="90%" Enabled="False">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �ƶ��绰��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="yddh" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �����ʼ���
                                    </td>
                                    <td>
                                        <asp:TextBox ID="mail" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �칫�绰��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="bgdh" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ����绰��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="czdh" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �������ڣ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="csrq" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
