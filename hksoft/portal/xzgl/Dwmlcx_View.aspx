<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dwmlcx_View.aspx.cs" Inherits="hkpro.portal.xzgl.Dwmlcx_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��λ��¼</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                �鿴��λ��¼
            </td>
            <td class="td_base" style="width: 20%">
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td class="form-item">
                            ��λ���ƣ�
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="dwmc" runat="server" CssClass="mytext" Width="96%" MaxLength="50"
                                ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" style="width: 20%">
                            ��λ���ͣ�
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox ID="dwlx" runat="server" CssClass="mytext" Width="90%" MaxLength="20"
                                ReadOnly="true"></asp:TextBox>
                        </td>
                        <td class="form-item" style="width: 20%">
                            ��λ����
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox ID="dwjb" runat="server" CssClass="mytext" Width="90%" MaxLength="10"
                                ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            �ϼ����ţ�
                        </td>
                        <td>
                            <asp:TextBox ID="sjbm" runat="server" CssClass="mytext" Width="90%" MaxLength="20"
                                ReadOnly="true"></asp:TextBox>
                        </td>
                        <td class="form-item" style="width: 80">
                            �����ˣ�
                        </td>
                        <td>
                            <asp:TextBox ID="fzr" runat="server" CssClass="mytext" Width="90%" MaxLength="10"
                                ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ��λ��ַ��
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="dwdz" runat="server" CssClass="mytext" Width="96%" MaxLength="50"
                                ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            �������룺
                        </td>
                        <td>
                            <asp:TextBox ID="yzbm" runat="server" CssClass="mytext" Width="90%" MaxLength="6"
                                ReadOnly="true"></asp:TextBox>
                        </td>
                        <td class="form-item" style="width: 80">
                            ��λ�绰��
                        </td>
                        <td>
                            <asp:TextBox ID="dwdh" runat="server" CssClass="mytext" Width="90%" MaxLength="20"
                                ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ������룺
                        </td>
                        <td>
                            <asp:TextBox ID="czhm" runat="server" CssClass="mytext" Width="90%" MaxLength="20"
                                ReadOnly="true"></asp:TextBox>
                        </td>
                        <td class="form-item" style="width: 80">
                            �����ʼ���
                        </td>
                        <td>
                            <asp:TextBox ID="dzyj" runat="server" CssClass="mytext" Width="90%" MaxLength="30"
                                ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            �򵥽��ܣ�
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="jdjs" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                Rows="3" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ��ע��
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="bz" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                Rows="3" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <input type="button" name="BackBtn" value="�� ��" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
