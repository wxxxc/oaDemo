<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wdjsb_Day.aspx.cs" Inherits="hkpro.portal.rcgl.Wdjsb_Day" %>

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
<body class="main">
    <form id="Form1" method="post" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                    <tr>
                        <td style="height: 40px">
                            快速检索：<asp:DropDownList ID="nian" runat="server">
                                <asp:ListItem Value="2010">2010年</asp:ListItem>
                                <asp:ListItem Value="2011">2011年</asp:ListItem>
                                <asp:ListItem Value="2012">2012年</asp:ListItem>
                                <asp:ListItem Value="2013">2013年</asp:ListItem>
                                <asp:ListItem Value="2014">2014年</asp:ListItem>
                                <asp:ListItem Value="2015">2015年</asp:ListItem>
                                <asp:ListItem Value="2016">2016年</asp:ListItem>
                                <asp:ListItem Value="2017">2017年</asp:ListItem>
                                <asp:ListItem Value="2018">2018年</asp:ListItem>
                                <asp:ListItem Value="2019">2019年</asp:ListItem>
                                <asp:ListItem Value="2020">2020年</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="dropMonth" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dropMonth_SelectedIndexChanged">
                                <asp:ListItem Value="一月">01月</asp:ListItem>
                                <asp:ListItem Value="二月">02月</asp:ListItem>
                                <asp:ListItem Value="三月">03月</asp:ListItem>
                                <asp:ListItem Value="四月">04月</asp:ListItem>
                                <asp:ListItem Value="五月">05月</asp:ListItem>
                                <asp:ListItem Value="六月">06月</asp:ListItem>
                                <asp:ListItem Value="七月">07月</asp:ListItem>
                                <asp:ListItem Value="八月">08月</asp:ListItem>
                                <asp:ListItem Value="九月">09月</asp:ListItem>
                                <asp:ListItem Value="十月">10月</asp:ListItem>
                                <asp:ListItem Value="十一月">11月</asp:ListItem>
                                <asp:ListItem Value="十二月">12月</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="dropDay" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dropDay_SelectedIndexChanged">
                                <asp:ListItem Value="1">01日</asp:ListItem>
                                <asp:ListItem Value="2">02日</asp:ListItem>
                                <asp:ListItem Value="3">03日</asp:ListItem>
                                <asp:ListItem Value="4">04日</asp:ListItem>
                                <asp:ListItem Value="5">05日</asp:ListItem>
                                <asp:ListItem Value="6">06日</asp:ListItem>
                                <asp:ListItem Value="7">07日</asp:ListItem>
                                <asp:ListItem Value="8">08日</asp:ListItem>
                                <asp:ListItem Value="9">09日</asp:ListItem>
                                <asp:ListItem Value="10">10日</asp:ListItem>
                                <asp:ListItem Value="11">11日</asp:ListItem>
                                <asp:ListItem Value="12">12日</asp:ListItem>
                                <asp:ListItem Value="13">13日</asp:ListItem>
                                <asp:ListItem Value="14">14日</asp:ListItem>
                                <asp:ListItem Value="15">15日</asp:ListItem>
                                <asp:ListItem Value="16">16日</asp:ListItem>
                                <asp:ListItem Value="17">17日</asp:ListItem>
                                <asp:ListItem Value="18">18日</asp:ListItem>
                                <asp:ListItem Value="19">19日</asp:ListItem>
                                <asp:ListItem Value="20">20日</asp:ListItem>
                                <asp:ListItem Value="21">21日</asp:ListItem>
                                <asp:ListItem Value="22">22日</asp:ListItem>
                                <asp:ListItem Value="23">23日</asp:ListItem>
                                <asp:ListItem Value="24">24日</asp:ListItem>
                                <asp:ListItem Value="25">25日</asp:ListItem>
                                <asp:ListItem Value="26">26日</asp:ListItem>
                                <asp:ListItem Value="27">27日</asp:ListItem>
                                <asp:ListItem Value="28">28日</asp:ListItem>
                                <asp:ListItem Value="29">29日</asp:ListItem>
                                <asp:ListItem Value="30">30日</asp:ListItem>
                                <asp:ListItem Value="31">31日</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td align="right">
                            <asp:LinkButton ID="cmdMonth" runat="server" OnClick="cmdMonth_Click" CssClass="black"><img src="../../images/portal/month.gif" border="0">&nbsp;按月查</asp:LinkButton>
                            <asp:LinkButton ID="cmdWeek" runat="server" OnClick="cmdWeek_Click" CssClass="black"><img src="../../images/portal/week.gif" border="0">&nbsp;按周查</asp:LinkButton>
                            <asp:LinkButton ID="cmdDay" runat="server" Enabled="False"><img src="../../images/portal/day.gif" border="0">&nbsp;按日查</asp:LinkButton>
                            <asp:Button ID="Button1" runat="server" Text="查 询" CssClass="mybtn" OnClick="cmdQuery_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table width="100%" class="headcenter" cellspacing="0" cellpadding="0" bordercolordark="#ffffff"
                                bordercolor="#888888" border="0">
                                <tr style="background-color: #C0C0C0; height: 25">
                                    <td>
                                        &nbsp;<asp:LinkButton ID="cmdLastday" runat="server" CssClass="black" OnClick="cmdLastday_Click"><img src="../../images/portal/left_arrow.gif" alt="上一日" border="0" />上一日</asp:LinkButton>
                                    </td>
                                    <td align="center">
                                        <asp:Label ID="lblHeader" runat="server">2001年11月28日 星期日</asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:LinkButton ID="cmdNextday" runat="server" CssClass="black" OnClick="cmdNextday_Click">下一日<img src="../../images/portal/right_arrow.gif" alt="下一日" border="0" /></asp:LinkButton>&nbsp;
                                    </td>
                                </tr>
                            </table>
                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tr>
                                    <td valign="bottom" height="20">
                                        &nbsp;今日事情
                                    </td>
                                    <td align="right">
                                        <asp:ImageButton ID="cmdAddNew" OnClick="cmdAddNew_Click" runat="server" ImageUrl="../../images/portal/add_small.gif"
                                            ToolTip="新增个人日程"></asp:ImageButton>&nbsp;
                                    </td>
                                </tr>
                            </table>
                            <hr class="hr1" />
                            <% =ssubject()%>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
