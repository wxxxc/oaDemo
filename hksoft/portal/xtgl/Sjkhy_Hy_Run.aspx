<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sjkhy_Hy_Run.aspx.cs" Inherits="hkpro.portal.xtgl.Sjkhy_Hy_Run" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>���ݿ⻹ԭ</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main" onload="remove_load();">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td style="height: 25px;" class="td_base">
                <font color="yellow">�Ƿ�ȷ����ԭ��������Ϊ</font><asp:Label ID="lblrq" runat="server" ForeColor="Red"></asp:Label><font
                    color="yellow">�����ݿ⣺</font><asp:Label ID="lbldb" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0" class="form">
                    <tr>
                        <td style="height: 30px" align="center">
                            <font color="red">Ϊ�������ݶ�ʧ��ǿ�ҽ�����������ʹ�ñ�ϵͳʱ��ִ�����ݻ�ԭ��</font>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 30px" align="center">
                <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="ȷ ��" OnClick="Save_Click" />
                <input type="button" name="BackBtn" value="�� ��" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
