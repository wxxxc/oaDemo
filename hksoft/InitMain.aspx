<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InitMain.aspx.cs" Inherits="hkpro.InitMain" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�ҵ���ҳ</title>
    <link href="CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="CssJs/Choose.js"></script>
</head>
<script>
    function _del(a) {
        msg = "ȷ�������治��ʾ��ģ����?";
        if (window.confirm(msg)) {

            window.open("initmain_del.aspx?id=" + a + "", "_blank", "height=1, width=1,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no")
        }
    }

    function _update(a) {
        var aw = 380;
        var ah = 130;
        var al = (screen.width - aw) / 2 - 100;
        var at = (screen.height - ah) / 5 + 200;
        window.open("initmain_update.aspx?id=" + a + "", "_blank", "height=130, width=380,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no,top=" + at + ",left=" + al + "")
    }
</script>
<body class="main">
    <form id="Form1" method="post" runat="server">
    <table width="100%" cellspacing="0" cellpadding="0" border="0" class="index_title">
        <tr>
            <td>
                &nbsp;&nbsp;<asp:Label ID="tpdc" runat="server" ForeColor="#333333"></asp:Label>
                <a href="portal/tpgl/tp.aspx" target="_blank" class="red">
                    <asp:Label ID="cytp" runat="server" Font-Underline="true"></asp:Label></a> <a href="portal/tpgl/fxdcjg.aspx"
                        target="_blank" class="red">
                        <asp:Label ID="dcjg" runat="server" Font-Underline="true"></asp:Label></a>
            </td>
            <td align="right">
                <asp:DropDownList ID="ggxx" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Ggxx_Click">
                    <asp:ListItem Text="�鿴������Ϣ" Value=""></asp:ListItem>
                    <asp:ListItem Text="==��λ��¼==" Value="dwml"></asp:ListItem>
                    <asp:ListItem Text="==��Ƶ�㲥==" Value="spdb"></asp:ListItem>
                </asp:DropDownList>
                <a href="#" onclick="javascript:popAdd('portal/xzgl/wdyjx_add.aspx');" class="red">
                    <img src="images/ask.gif" border="0" alt="����������鵽�����" /><u>�����</u></a> <a href="#"
                        onclick="javascript:popView('portal/grbg/txl.aspx');" class="red">
                        <img src="images/book.gif" border="0" alt="�鿴��ԱͨѶ��Ϣ" /><u>ͨѶ¼</u></a>&nbsp;&nbsp;
            </td>
        </tr>
    </table>
    <table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
            <td>
                <asp:Label ID="Label" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblpms" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lbleam" runat="server" Visible="false"></asp:Label>
    </form>
</body>
</html>
