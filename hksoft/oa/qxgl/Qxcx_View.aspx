<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qxcx_View.aspx.cs" Inherits="hkpro.oa.qxgl.Qxcx_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>ȥ���Ʋ�ѯ</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                ��ѯȥ����Ϣ
            </td>
            <td class="td_base" width="20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2" align="center">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td class="form-item" style="width: 20%">
                            ���⣺
                        </td>
                        <td colspan="3" style="width: 80%">
                            <asp:TextBox ID="bt" runat="server" CssClass="mytext" Width="96%" Enabled="false"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            Ԥ��ʱ�䣺
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="kssj" runat="server" CssClass="mytext" Width="140" MaxLength="10"
                                Enabled="false"></asp:TextBox>
                            ��
                            <asp:TextBox ID="jzsj" runat="server" CssClass="mytext" Width="140" MaxLength="10"
                                Enabled="false"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ����ˣ�
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="UserName" runat="server" CssClass="mytext" Width="96%" Enabled="false"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ��ϵ������
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="lxff" runat="server" CssClass="mytext" Width="96%" Enabled="false"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ˵����
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="sm" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                Rows="5" Enabled="false"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <input type="button" name="BackBtn" value=" �ر� " class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
