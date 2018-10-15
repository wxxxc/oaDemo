<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wdjsb.aspx.cs" Inherits="hkpro.portal.rcgl.Wdjsb" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�ҵļ��±�</title>
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

        //���� F5 ˢ�¼��ȼ� 
        document.onkeydown = function () {
            if (event.keyCode == 8 || event.keyCode == 116 || (event.ctrlKey && event.keyCode == 116)) {
                alert("��ֹˢ����ҳ��");
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
                            ���ټ�����<asp:DropDownList ID="nian" runat="server">
                                <asp:ListItem Value="2010">2010��</asp:ListItem>
                                <asp:ListItem Value="2011">2011��</asp:ListItem>
                                <asp:ListItem Value="2012">2012��</asp:ListItem>
                                <asp:ListItem Value="2013">2013��</asp:ListItem>
                                <asp:ListItem Value="2014">2014��</asp:ListItem>
                                <asp:ListItem Value="2015">2015��</asp:ListItem>
                                <asp:ListItem Value="2016">2016��</asp:ListItem>
                                <asp:ListItem Value="2017">2017��</asp:ListItem>
                                <asp:ListItem Value="2018">2018��</asp:ListItem>
                                <asp:ListItem Value="2019">2019��</asp:ListItem>
                                <asp:ListItem Value="2020">2020��</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="dropMonth" runat="server">
                                <asp:ListItem Value="һ��">01��</asp:ListItem>
                                <asp:ListItem Value="����">02��</asp:ListItem>
                                <asp:ListItem Value="����">03��</asp:ListItem>
                                <asp:ListItem Value="����">04��</asp:ListItem>
                                <asp:ListItem Value="����">05��</asp:ListItem>
                                <asp:ListItem Value="����">06��</asp:ListItem>
                                <asp:ListItem Value="����">07��</asp:ListItem>
                                <asp:ListItem Value="����">08��</asp:ListItem>
                                <asp:ListItem Value="����">09��</asp:ListItem>
                                <asp:ListItem Value="ʮ��">10��</asp:ListItem>
                                <asp:ListItem Value="ʮһ��">11��</asp:ListItem>
                                <asp:ListItem Value="ʮ����">12��</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td align="right">
                            <asp:LinkButton ID="cmdMonth" runat="server" Enabled="False"><img src="../../images/portal/month.gif" border="0" alt="���²�">&nbsp;���²�</asp:LinkButton>
                            <asp:LinkButton ID="cmdWeek" runat="server" OnClick="cmdWeek_Click" CssClass="black"><img src="../../images/portal/week.gif" border="0" alt="���ܲ�">&nbsp;���ܲ�</asp:LinkButton>
                            <asp:LinkButton ID="cmdDay" runat="server" OnClick="cmdDay_Click" CssClass="black"><img src="../../images/portal/day.gif" border="0" alt="���ղ�">&nbsp;���ղ�</asp:LinkButton>
                            <asp:Button ID="cmdQuery" runat="server" Text="�� ѯ" CssClass="mybtn" OnClick="cmdQuery_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Calendar ID="calSchedule" runat="server" Width="100%" Height="520" SelectedDate="<%#Getdate()%>"
                                BackColor="transparent" BorderColor="#999999" ShowGridLines="true" PrevMonthText="<img src=../../images/portal/left_arrow.gif alt=��һ�� border=0 />��һ��"
                                NextMonthText="��һ��<img src=../../images/portal/right_arrow.gif alt=��һ�� border=0 />"
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
