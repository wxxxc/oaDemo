<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilesManage_show.aspx.cs"
    Inherits="hkpro.oa.dagl.FilesManage_show" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>�������</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr id="hkshow1">
            <td class="td_base" width="80%" height="25px">
                �鿴������Ϣ
            </td>
            <td class="td_base" width="20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form"
                    id="hktable">
                    <tr>
                        <td style="width: 20%" class="form-item" nowrap="nowrap">
                            �����ţ�
                        </td>
                        <td style="width: 30%">
                            <asp:Label ID="lblNumber" runat="server"></asp:Label>
                        </td>
                        <td class="form-item" nowrap="nowrap" width="20%">
                            �������ƣ�
                        </td>
                        <td width="30%">
                            <asp:Label ID="lblName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" nowrap="nowrap">
                            ������⣺
                        </td>
                        <td>
                            <asp:Label ID="lblRoomName" runat="server"></asp:Label>
                        </td>
                        <td class="form-item" nowrap="nowrap">
                            ��������
                        </td>
                        <td>
                            <asp:Label ID="lblBackYear" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" nowrap="nowrap">
                            ��ʼ���ڣ�
                        </td>
                        <td>
                            <asp:Label ID="lblStarttime" runat="server"></asp:Label>
                        </td>
                        <td class="form-item" nowrap="nowrap">
                            ��ֹ���ڣ�
                        </td>
                        <td>
                            <asp:Label ID="lblEndtime" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" nowrap="nowrap">
                            �������ţ�
                        </td>
                        <td>
                            <asp:Label ID="lblUnitName" runat="server"></asp:Label>
                        </td>
                        <td class="form-item" nowrap="nowrap">
                            ���ƻ�����
                        </td>
                        <td>
                            <asp:Label ID="lblBzPost" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" nowrap="nowrap">
                            �������ޣ�
                        </td>
                        <td>
                            <asp:Label ID="lblBgTime" runat="server"></asp:Label>
                        </td>
                        <td class="form-item" nowrap="nowrap">
                            �����ܼ���
                        </td>
                        <td>
                            <asp:Label ID="lblDengJi" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" nowrap="nowrap">
                            ȫ �� �ţ�
                        </td>
                        <td>
                            <asp:Label ID="lblQuanZong" runat="server"></asp:Label>
                        </td>
                        <td class="form-item" nowrap="nowrap">
                            Ŀ ¼ �ţ�
                        </td>
                        <td>
                            <asp:Label ID="lblMulu" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" nowrap="nowrap">
                            �����ݺţ�
                        </td>
                        <td>
                            <asp:Label ID="lblDaGuan" runat="server"></asp:Label>
                        </td>
                        <td class="form-item" nowrap="nowrap">
                            ������ţ�
                        </td>
                        <td>
                            <asp:Label ID="lblBaoXian" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" nowrap="nowrap">
                            �� ΢ �ţ�
                        </td>
                        <td>
                            <asp:Label ID="lblSuoWei" runat="server"></asp:Label>
                        </td>
                        <td class="form-item" nowrap="nowrap">
                            ƾ֤���
                        </td>
                        <td>
                            <asp:Label ID="lblPinZheng" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" nowrap="nowrap">
                            ƾ֤���(��)��
                        </td>
                        <td>
                            <asp:Label ID="lblPzStartNum" runat="server"></asp:Label>
                        </td>
                        <td class="form-item" nowrap="nowrap">
                            ƾ֤���(ֹ)��
                        </td>
                        <td>
                            <asp:Label ID="lblPzEndNum" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" nowrap="nowrap">
                            ҳ ����
                        </td>
                        <td>
                            <asp:Label ID="lblYeShu" runat="server"></asp:Label>
                        </td>
                        <td class="form-item" nowrap="nowrap">
                            ״̬��
                        </td>
                        <td>
                            <asp:Label ID="lblState" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" nowrap="nowrap">
                            ��ע��
                        </td>
                        <td colspan="3" height="24">
                            <asp:Label ID="lblRemark" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" nowrap="nowrap">
                            ʹ�÷�Χ��
                        </td>
                        <td width="85%" colspan="3">
                            <asp:Label ID="lblwfDept" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id="hkshow2">
            <td colspan="2" align="center" style="height: 30">
                <input type="button" name="print" class="mybtn" value="�� ӡ" onclick="javascript:PrintPage3()">
                <input type="button" name="BackBtn" value="�� ��" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
