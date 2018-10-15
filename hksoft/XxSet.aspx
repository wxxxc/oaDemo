<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XxSet.aspx.cs" Inherits="hkpro.XxSet" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>消息设置</title>
    <script>
        function SoundSelect() {
            s = document.form1.RemindSound.value;
            if (s != "0") {
                //str = "<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='#' width='0' height='0'><param name='movie' value='images/Sounds/" + s + "'><param name=quality value=high><embed src='images/Sounds/" + s + "' width='0' height='0' quality='autohigh' wmode='opaque' type='application/x-shockwave-flash' plugspace='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash'></embed></object>"
                str = "<embed src='images/Sounds/" + s + "' width='0' height='0'></embed>"
                document.getElementById("msgsound").innerHTML = str;
            }
        }
    </script>
</head>
<body class="main">
    <form id="form1" method="post" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0" class="form">
                                <tr>
                                    <td class="form-item" style="width: 20%; height: 25">
                                        是否需要提醒：
                                    </td>
                                    <td style="width: 80%">
                                        <asp:DropDownList ID="ynRemind" runat="server" Width="150">
                                            <asp:ListItem Text="是" Value="是"></asp:ListItem>
                                            <asp:ListItem Text="否" Value="否"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="height: 25">
                                        消息提醒形式：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="RemindMode" runat="server" Width="150">
                                            <asp:ListItem Text="图标闪动并弹出窗口" Value="是"></asp:ListItem>
                                            <asp:ListItem Text="仅图标闪动" Value="否"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="height: 25">
                                        提醒间隔时间：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="RemindTime" runat="server" Width="150">
                                            <asp:ListItem Value="10000" Text="10秒"></asp:ListItem>
                                            <asp:ListItem Value="30000" Text="30秒"></asp:ListItem>
                                            <asp:ListItem Value="60000" Text="1分钟"></asp:ListItem>
                                            <asp:ListItem Value="300000" Text="5分钟"></asp:ListItem>
                                            <asp:ListItem Value="600000" Text="10分钟"></asp:ListItem>
                                            <asp:ListItem Value="900000" Text="15分钟"></asp:ListItem>
                                            <asp:ListItem Value="1500000" Text="30分钟"></asp:ListItem>
                                            <asp:ListItem Value="3600000" Text="60分钟"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="height: 25">
                                        消息提醒声音：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="RemindSound" runat="server" Width="150">
                                            <asp:ListItem Value="0.swf">无</asp:ListItem>
                                            <asp:ListItem Value="1.swf">语音1</asp:ListItem>
                                            <asp:ListItem Value="2.swf">语音2</asp:ListItem>
                                            <asp:ListItem Value="3.swf">语音3</asp:ListItem>
                                            <asp:ListItem Value="4.swf">QQ</asp:ListItem>
                                            <asp:ListItem Value="5.swf">MSN</asp:ListItem>
                                            <asp:ListItem Value="6.swf">水滴</asp:ListItem>
                                            <asp:ListItem Value="7.swf">硬币</asp:ListItem>
                                            <asp:ListItem Value="8.swf">心跳</asp:ListItem>
                                            <asp:ListItem Value="9.swf">叮咚</asp:ListItem>
                                            <asp:ListItem Value="10.swf">光速</asp:ListItem>
                                            <asp:ListItem Value="11.swf">回音</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保 存" OnClick="Save_Click">
                            </asp:Button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div align="right" id="msgsound">
    </div>
    </form>
</body>
</html>
