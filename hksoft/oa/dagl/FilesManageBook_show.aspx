<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilesManageBook_show.aspx.cs"
    Inherits="hkpro.oa.dagl.FilesManageBook_show" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr id="hkshow1">
            <td class="td_base" width="80%" height="25px">
                �鿴�ļ���Ϣ
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
                        <td class="form-item" width="20%">
                            �ļ��ţ�
                        </td>
                        <td width="30%">
                            <asp:Label ID="lblNum" runat="server"></asp:Label>
                        </td>
                        <td width="20%" class="form-item">
                            �ļ�����ʣ�
                        </td>
                        <td width="30%">
                            <asp:Label ID="lblName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            �ļ����⣺
                        </td>
                        <td>
                            <asp:Label ID="lblwjTitle" runat="server"></asp:Label>
                        </td>
                        <td class="form-item">
                            �ļ������⣺
                        </td>
                        <td>
                            <asp:Label ID="lblOtherTitle" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ���ĵ�λ��
                        </td>
                        <td>
                            <asp:Label ID="lblFwCompany" runat="server"></asp:Label>
                        </td>
                        <td class="form-item">
                            �������ڣ�
                        </td>
                        <td>
                            <asp:Label ID="lblFwTime" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            �ܼ���
                        </td>
                        <td>
                            <asp:Label ID="lblMiji" runat="server"></asp:Label>
                        </td>
                        <td class="form-item">
                            �����ȼ���
                        </td>
                        <td>
                            <asp:Label ID="lblDengji" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            �ļ����ࣺ
                        </td>
                        <td>
                            <asp:Label ID="lblWjType" runat="server"></asp:Label>
                        </td>
                        <td class="form-item">
                            �������
                        </td>
                        <td>
                            <asp:Label ID="lblGwType" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            �ļ�ҳ����
                        </td>
                        <td>
                            <asp:Label ID="lblWjNum" runat="server"></asp:Label>
                        </td>
                        <td class="form-item">
                            ��ӡҳ����
                        </td>
                        <td>
                            <asp:Label ID="lblDyNum" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ��������
                        </td>
                        <td>
                            <asp:Label ID="lblFilesName" runat="server"></asp:Label>
                        </td>
                        <td class="form-item">
                            ��ע��
                        </td>
                        <td>
                            <asp:Label ID="lblRemark" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            �ļ�������
                        </td>
                        <td colspan="3">
                            <asp:Label ID="fujian" runat="server"></asp:Label>
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
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>
