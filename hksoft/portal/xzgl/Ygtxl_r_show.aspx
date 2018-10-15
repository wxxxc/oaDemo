<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ygtxl_r_show.aspx.cs" Inherits="hkpro.portal.xzgl.Ygtxl_r_show" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>Ա��ͨѶ¼</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table class="form" border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="center" colspan="4">
                                <b>������Ϣ</b>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item" style="width: 20%">�������ţ�
                            </td>
                            <td style="width: 30%">
                                <asp:Label ID="Folder" runat="server"></asp:Label>
                            </td>
                            <td class="form-item" style="width: 20%">����ţ�
                            </td>
                            <td style="width: 30%">
                                <asp:Label ID="PxNum" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">������
                            </td>
                            <td>
                                <asp:Label ID="Name" runat="server"></asp:Label>
                            </td>
                            <td class="form-item">���ţ�
                            </td>
                            <td>
                                <asp:Label ID="Worknum" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">ְλ��
                            </td>
                            <td>
                                <asp:Label ID="Post" runat="server"></asp:Label>
                            </td>
                            <td class="form-item">�Ա�
                            </td>
                            <td>
                                <asp:Label ID="Sex" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">���գ�
                            </td>
                            <td>
                                <script>SetNeed('BothDay')</script>
                                <asp:Label ID="BothDay" runat="server"></asp:Label>
                            </td>
                            <td class="form-item">�칫�绰��
                            </td>
                            <td>
                                <asp:Label ID="Officetel" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">���棺
                            </td>
                            <td>
                                <asp:Label ID="Fax" runat="server"></asp:Label>
                            </td>
                            <td class="form-item">�ֻ���
                            </td>
                            <td>
                                <asp:Label ID="MoveTel" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">סլ�绰��
                            </td>
                            <td>
                                <asp:Label ID="HomeTel" runat="server"></asp:Label>
                            </td>
                            <td class="form-item">E-mail ��
                            </td>
                            <td>
                                <asp:Label ID="Email" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">QQ�ţ�
                            </td>
                            <td>
                                <asp:Label ID="QQNum" runat="server"></asp:Label>
                            </td>
                            <td class="form-item">MSN��
                            </td>
                            <td>
                                <asp:Label ID="MsnNum" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">�ڲ���ʱͨ��
                            </td>
                            <td>
                                <asp:Label ID="NbNum" runat="server"></asp:Label>
                            </td>
                            <td class="form-item">�������룺
                            </td>
                            <td>
                                <asp:Label ID="ZipCode" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">ͨ�ŵ�ַ��
                            </td>
                            <td colspan="3">
                                <asp:Label ID="Address" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">��ע��Ϣ��
                            </td>
                            <td colspan="3">
                                <asp:Label ID="Remark" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center">
                                <asp:Button ID="Button2" runat="server" Text="����" CssClass="mybtn" OnClick="Button2_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:TextBox ID="Number" runat="server" Visible="False"></asp:TextBox>
        <asp:Label ID="Unit" runat="server" Width="18%" Visible="False"></asp:Label>
        <asp:Label ID="FoldersID" runat="server" Visible="False" Width="18%"></asp:Label>
        <asp:Label ID="Respon" runat="server" Width="90%" Visible="False"></asp:Label>
    </form>
</body>
</html>
