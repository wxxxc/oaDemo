<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wdkq_Gzr.aspx.cs" Inherits="hkpro.oa.kqgl.Wdkq_Gzr" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>查看我的工作日</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="ShowDay" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1">
                    <tr>
                        <td>
                            切换年份：<asp:DropDownList ID="year" runat="server" AutoPostBack="true" OnSelectedIndexChanged="year_SelectedIndexChanged">
                                <asp:ListItem Text="2015年" Value="2015"></asp:ListItem>
                                <asp:ListItem Text="2016年" Value="2016"></asp:ListItem>
                                <asp:ListItem Text="2017年" Value="2017"></asp:ListItem>
                                <asp:ListItem Text="2018年" Value="2018"></asp:ListItem>
                                <asp:ListItem Text="2019年" Value="2019"></asp:ListItem>
                                <asp:ListItem Text="2020年" Value="2020"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label runat="server" ID="labelgzr" BackColor="red" Width="40" Height="20"></asp:Label>&nbsp;代表工作日&nbsp;&nbsp;
                            <asp:Label runat="server" ID="label1" BackColor="#ffff00" Width="40" Height="20"></asp:Label>&nbsp;代表休息日
                        </td>
                        <td align="right" style="height: 25">
                            <input id="hcellstatus" type="hidden" runat="server">
                            <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript:window.close()"
                                 />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <font color="red">注:如果您的工作日设置有误，请联系考勤管理员进行修改</font>
                        </td>
                        <td align="right" style="height: 25">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table id="daytable" cellspacing="0" cellpadding="0" width="100%" align="center"
                                border="1" runat="server" class="gbtext" style="border-collapse: collapse" bordercolor="#93bee2">
                                <tr height="30">
                                    <td align="center" style="cursor: hand" bgcolor="#e8f4ff">
                                        星期一
                                    </td>
                                    <td align="center" style="cursor: hand" bgcolor="#e8f4ff">
                                        星期二
                                    </td>
                                    <td align="center" style="cursor: hand" bgcolor="#e8f4ff">
                                        星期三
                                    </td>
                                    <td align="center" style="cursor: hand" bgcolor="#e8f4ff">
                                        星期四
                                    </td>
                                    <td align="center" style="cursor: hand" bgcolor="#e8f4ff">
                                        星期五
                                    </td>
                                    <td align="center" style="cursor: hand" bgcolor="#e8f4ff">
                                        星期六
                                    </td>
                                    <td align="center" style="cursor: hand" bgcolor="#e8f4ff">
                                        星期日
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
