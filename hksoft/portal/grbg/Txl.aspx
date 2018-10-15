<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Txl.aspx.cs" Inherits="hkpro.portal.grbg.Txl" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>员工通讯录</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="height: 25px;" class="td_base">
                    员工通讯录
                </td>
            </tr>
            <tr>
                <td valign="top" align="center">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td colspan="2" width="22%" height="500" valign="top">
                                <iframe name="lheadtxl" marginwidth="0" marginheight="0" src="Txl_l.aspx"
                                    frameborder="0" width="100%" height="500" scrolling="auto"></iframe>
                            </td>
                            <td colspan="2" width="78%" valign="top" height="500">
                                <iframe name="rformtxl" marginwidth="0" marginheight="0" src="Txl_r.aspx"
                                    frameborder="1" width="100%" height="500" scrolling="auto"></iframe>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <input type="button" name="BackBtn" value="关 闭" class="mybtn" onclick="javascript:window.close()" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
