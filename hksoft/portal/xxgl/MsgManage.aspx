<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MsgManage.aspx.cs" Inherits="hkpro.portal.xxgl.MsgManage" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>消息中心</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />

    <script language="JavaScript">
        TimeStart = 20;
        function MsgTimer() {
            if (TimeStart == 0)
                window.close();
            if (document.getElementById("TimeShow"))
                document.getElementById("TimeShow").innerHTML = TimeStart;
            TimeStart--;
            var timer = setTimeout("MsgTimer()", 1000);
        }
    </script>
</head>
<body onload="MsgTimer();" topmargin="0" leftmargin="0" class="msg">
    <form id="MsgManage" method="post" runat="server">
        <table cellspacing="0" cellpadding="0" style="width: 100%;" border="0">
            <tr>
                <td style="height: 27px; background-image: url(../../images/topbg.jpg);">&nbsp;<img src="../../images/page.gif" alt="最新消息" />&nbsp;<asp:Label ID="lblInstruction"
                    runat="server">未读消息</asp:Label>
                </td>
                <td align="right" style="background-image: url(../../images/topbg.jpg);">
                    <span id="TimeShow" style="font-weight: bold; color: #ff0000"></span><span id="words">&nbsp;秒后自动关闭</span>
                    <asp:Button ID="btnHistory" runat="server" Enabled="False" Text="历史记录" CssClass="mybtn"
                        CausesValidation="false"></asp:Button>
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 30%; height: 25px">
                    <asp:Label ID="lblSender" runat="server">发送人：</asp:Label>
                </td>
                <td style="width: 70%;">
                    <asp:Label ID="txtrealName" runat="server" />
                    <asp:TextBox ID="txtMsgID" runat="server" Visible="False" Width="7px" />
                    <asp:TextBox ID="txtSender" runat="server" Visible="False" Width="9px" />
                    <asp:Label ID="txtfssj" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    <asp:Label ID="lblContent" runat="server">内容：</asp:Label>
                </td>
                <td valign="top">
                    <asp:TextBox onkeypress="Reply()" ID="txtContent" runat="server" Width="96%" Height="120px"
                        TextMode="MultiLine" CssClass="mytextarea" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td style="height: 30px">
                    <asp:Button ID="btnReply" runat="server" Enabled="False" Text="回 复" OnClick="btnReply_Click"
                        CssClass="mybtn" CausesValidation="true"></asp:Button>
                    <asp:Button ID="btnNext" runat="server" Enabled="False" Text="下一条" OnClick="btnNext_Click"
                        CssClass="mybtn"></asp:Button>
                    <asp:Button ID="btnRead" runat="server" Text="我知道了" OnClick="btnRead_Click" CssClass="mybtn"></asp:Button>
                    <asp:Label ID="lblShortCut" runat="server" />
                </td>
            </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtContent"
            ErrorMessage="请输入消息内容">&nbsp;
        </asp:RequiredFieldValidator>

    </form>
</body>
</html>

