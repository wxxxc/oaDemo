<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ygtxl_r_mod.aspx.cs" Inherits="hkpro.portal.xzgl.Ygtxl_r_mod" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script>
    function chknull() {
        if (document.getElementById('Name').value == '') {
            alert('��������Ϊ��');
            form1.Name.focus();
            return false;
        }

        if (document.getElementById('Folder').value == '') {
            alert('��ѡ�����');
            form1.Folder.focus();
            return false;
        }

        if (document.getElementById('Email').value != '') {
            var objRe = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
            if (!objRe.test(document.getElementById('Email').value)) {
                alert('Email��ʽ����ȷ');
                form1.Email.focus();
                return false;
            }

        }

        if (document.getElementById('PxNum').value == '') {
            alert('����Ų���Ϊ�գ����û�п�����дΪ0');
            form1.PxNum.focus();
            return false;
        }

        if (document.getElementById('PxNum').value != '') {
            var objRe = /^\d+(\.\d+)?$/;
            if (!objRe.test(document.getElementById('PxNum').value)) {
                alert("�����ֻ��Ϊ����");
                form1.PxNum.focus();
                return false;
            }
        }
    }
</script>
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
                            <td class="form-item" style="width: 20%">
                                <font color="red">*</font>�������
                            </td>
                            <td style="width: 30%">
                                <asp:DropDownList ID="Folder" runat="server" Width="90%">
                                </asp:DropDownList>
                            </td>
                            <td class="form-item" style="width: 20%">
                                <font color="red">*</font>����ţ�
                            </td>
                            <td style="width: 30%">
                                <asp:TextBox ID="PxNum" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item" style="width: 20%">
                                <font color="red">*</font>������
                            </td>
                            <td style="width: 30%">
                                <asp:TextBox ID="Name" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                            </td>
                            <td class="form-item" style="width: 20%">���ţ�
                            </td>
                            <td style="width: 30%">
                                <asp:TextBox ID="Worknum" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">ְλ��
                            </td>
                            <td>
                                <asp:TextBox ID="Post" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                            </td>
                            <td class="form-item">�Ա�
                            </td>
                            <td>
                                <asp:DropDownList ID="Sex" runat="server" Width="90%">
                                    <asp:ListItem>��</asp:ListItem>
                                    <asp:ListItem>Ů</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">���գ�
                            </td>
                            <td>
                                <asp:TextBox ID="BothDay" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                            </td>
                            <td class="form-item">�칫�绰��
                            </td>
                            <td>
                                <asp:TextBox ID="Officetel" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">���棺
                            </td>
                            <td>
                                <asp:TextBox ID="Fax" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                            </td>
                            <td class="form-item">�ֻ���
                            </td>
                            <td>
                                <asp:TextBox ID="MoveTel" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">סլ�绰��
                            </td>
                            <td>
                                <asp:TextBox ID="HomeTel" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                            </td>
                            <td class="form-item">E-mail ��
                            </td>
                            <td>
                                <asp:TextBox ID="Email" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">QQ�ţ�
                            </td>
                            <td>
                                <asp:TextBox ID="QQNum" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                            </td>
                            <td class="form-item">MSN��
                            </td>
                            <td>
                                <asp:TextBox ID="MsnNum" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">�ڲ���ʱͨ��
                            </td>
                            <td>
                                <asp:TextBox ID="NbNum" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                            </td>
                            <td class="form-item">�������룺
                            </td>
                            <td>
                                <asp:TextBox ID="ZipCode" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">ͨ�ŵ�ַ��
                            </td>
                            <td colspan="3">
                                <asp:TextBox ID="Address" runat="server" Width="96%" CssClass="mytext"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">��ע��Ϣ��
                            </td>
                            <td colspan="3">
                                <asp:TextBox ID="Remark" runat="server" TextMode="MultiLine" Width="96%" Height="47px" CssClass="mytextarea"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center">
                                <asp:Button ID="Button1" runat="server" Text="ȷ��" CssClass="mybtn" OnClick="Button1_Click" />
                                <asp:Button ID="Button2" runat="server" Text="����" CssClass="mybtn" OnClick="Button2_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:TextBox ID="Number" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="Unit" runat="server" Width="18%" Visible="False"></asp:TextBox>
        <asp:TextBox ID="Respon" runat="server" Width="18%" Visible="False"></asp:TextBox>
    </form>
</body>
</html>
