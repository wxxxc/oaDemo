<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wdjsb_Tx.aspx.cs" Inherits="hkpro.portal.rcgl.Wdjsb_Tx" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>我的记事本</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <style>
        A:link
        {
            color: navy;
            text-decoration: underline;
        }
        A:visited
        {
            color: navy;
            text-decoration: underline;
        }
    </style>
</head>
<body class="main" onload="movePFW()">
    <form id="form1" method="post" runat="server">
    <table border="0" height="100%" align="center">
        <tr>
            <td>
                <img src="../../images/portal/time.gif">
                <asp:Label ID="Label1" runat="server" ForeColor="#C04000" Font-Size="Larger" Font-Bold="True"
                    EnableViewState="False">提  醒</asp:Label><hr class="hr1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTitle" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTotal" runat="server" ForeColor="#3300cc"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <button id="btnExit" onclick="javascript:void(0);window.close();" type="button" runat="server">
                    关闭</button>
            </td>
        </tr>
    </table>
    </form>
    <script language="javascript">
        window.resizeTo(220, 210);
        var windowW = 220  // wide
        var windowH = 210  // high
        var Yoffset = 0   // in pixels, negative values allowed
        var windowStep = 2 // move increment (pixels)
        var moveSpeed = 12 // move speed (larger is slower)
        Xoffset = 25;
        var windowX = (screen.width / 2) - (windowW / 2);
        windowX = screen.availWidth - Xoffset - windowW;
        var windowY = (screen.availHeight);
        var windowYstop = windowY - windowH - Yoffset;
        var windowYnow = windowY;
        window.focus();
        resizeTo(windowW, windowH);
        moveTo(windowX, windowY);

        function movePFW() {
            if (document.all) {
                if (windowYnow >= windowYstop) {
                    moveTo(windowX, windowYnow);
                    windowYnow = windowYnow - windowStep;
                    timer = setTimeout("movePFW()", moveSpeed);
                }
                else {
                    clearTimeout(timer);
                    setTimeout("moveBack()", 120000)
                    moveTo(windowX, windowYstop);
                }
            }
            else {
                moveTo(windowX, windowYstop);
            }
        }
        function moveBack() {
            if (document.all) {
                if (windowYnow <= windowY) {
                    moveTo(windowX, windowYnow);
                    windowYnow = windowYnow + windowStep;
                    timer1 = setTimeout("moveBack()", moveSpeed);
                }
                else {
                    clearTimeout(timer1);
                    moveTo(windowX, windowY);
                    self.close()
                }
            }
            else {
                moveTo(windowX, windowYstop);
                self.close()
            }
        }
    </script>
</body>
</html>
