<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wdjsb.aspx.cs" Inherits="hkpro.portal.rcgl.Wdjsb" %>

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
    <script>
        if (window.Event)
            document.captureEvents(Event.MOUSEUP);

        function nocontextmenu() {
            event.cancelBubble = true
            event.returnValue = false;
            return false;
        }

        function norightclick(e) {
            if (window.Event) {
                if (e.which == 2 || e.which == 3)
                    return false;
            }
            else
                if (event.button == 2 || event.button == 3) {
                    event.cancelBubble = true
                    event.returnValue = false;
                    return false;
                }
        }
        document.oncontextmenu = nocontextmenu; // for IE5+ 
        document.onmousedown = norightclick; // for all others 
        //--> 

        //屏蔽 F5 刷新键等键 
        document.onkeydown = function () {
            if (event.keyCode == 8 || event.keyCode == 116 || (event.ctrlKey && event.keyCode == 116)) {
                alert("禁止刷新网页！");
                event.keyCode = 0;
                return false;
            }
        } 
    </script>
</head>
<body class="main" <%=str_NoticeMsg%>>
    <form id="form1" method="post" runat="server">
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
                            <asp:DropDownList ID="dropMonth" runat="server">
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
                        </td>
                        <td align="right">
                            <asp:LinkButton ID="cmdMonth" runat="server" Enabled="False"><img src="../../images/portal/month.gif" border="0" alt="按月查">&nbsp;按月查</asp:LinkButton>
                            <asp:LinkButton ID="cmdWeek" runat="server" OnClick="cmdWeek_Click" CssClass="black"><img src="../../images/portal/week.gif" border="0" alt="按周查">&nbsp;按周查</asp:LinkButton>
                            <asp:LinkButton ID="cmdDay" runat="server" OnClick="cmdDay_Click" CssClass="black"><img src="../../images/portal/day.gif" border="0" alt="按日查">&nbsp;按日查</asp:LinkButton>
                            <asp:Button ID="cmdQuery" runat="server" Text="查 询" CssClass="mybtn" OnClick="cmdQuery_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Calendar ID="calSchedule" runat="server" Width="100%" Height="520" SelectedDate="<%#Getdate()%>"
                                BackColor="transparent" BorderColor="#999999" ShowGridLines="true" PrevMonthText="<img src=../../images/portal/left_arrow.gif alt=上一月 border=0 />上一月"
                                NextMonthText="下一月<img src=../../images/portal/right_arrow.gif alt=下一月 border=0 />"
                                BorderStyle="None" DayNameFormat="Full" OnDayRender="calSchedule_DayRender" OnSelectionChanged="calSchedule_SelectionChanged"
                                FirstDayOfWeek="Monday">
                                <TodayDayStyle BorderWidth="2px" BorderStyle="Solid" BorderColor="CornflowerBlue">
                                </TodayDayStyle>
                                <DayStyle Font-Size="9pt" VerticalAlign="Top"></DayStyle>
                                <NextPrevStyle CssClass="black"></NextPrevStyle>
                                <DayHeaderStyle Height="10px"></DayHeaderStyle>
                                <TitleStyle Height="10px"></TitleStyle>
                                <WeekendDayStyle ForeColor="Red"></WeekendDayStyle>
                            </asp:Calendar>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
