<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wdrc.aspx.cs" Inherits="hkpro.portal.rcgl.Wdrc" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>������־</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/MyJs.js" />
    <script type="text/javascript"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 40px">��ʾ��ʽ��<asp:DropDownList ID="xsfs" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Xsfs_Selected">
                                <asp:ListItem Text="������" Value="5" Selected="true"></asp:ListItem>
                                <asp:ListItem Text="�ղ�ѯ" Value="1"></asp:ListItem>
                                <asp:ListItem Text="�ܲ�ѯ" Value="7"></asp:ListItem>
                            </asp:DropDownList>
                                <asp:CheckBox ID="xsgzsj" Text="��ʾ������ʱ��" runat="server" AutoPostBack="true" OnCheckedChanged="Xsgzsj_Check" />
                            <%--    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ȼ���
                            <asp:Image ID="Image1" runat="server" ImageUrl="../../images/portal/0.gif" />��&nbsp;
                            <asp:Image ID="Image2" runat="server" ImageUrl="../../images/portal/1.gif" />��ͨ&nbsp;
                            <asp:Image ID="Image3" runat="server" ImageUrl="../../images/portal/2.gif" />��--%>
                            </td>
                            <td align="right">
                                <input type="button" name="AddBtn" value="�½���־" class="mybtn" onclick="javascript: popAdd('wdrc_add.aspx');" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <DayPilot:DayPilotCalendar ID="rl" runat="server" DataStartField="kssj" DataEndField="jssj"
                                    DataTextField="rczt" DataValueField="rcid" TimeFormat="Clock24Hours" NonBusinessHours="Hide"
                                    BusinessBeginsHour="9" BusinessEndsHour="18" FreetimeClickHandling="PostBack"
                                    EventClickHandling="PostBack" OnEventClick="DayPilotCalendar1_EventClick" OnFreeTimeClick="DayPilotCalendar1_FreeTimeClick"
                                    EventLeftBarColor="DarkCyan"></DayPilot:DayPilotCalendar>
                            </td>
                            <td valign="top">
                                <asp:DropDownList ID="DropYear" AutoPostBack="true" runat="server">
                                </asp:DropDownList>
                                ��
                            <asp:DropDownList ID="DropMonth" AutoPostBack="true" runat="server">
                            </asp:DropDownList>
                                ��&nbsp;
                            <asp:LinkButton ID="LinkButton1" runat="server" Text="�ص�����" OnClick="Today_Click"
                                CssClass="blue"></asp:LinkButton>
                                <asp:Calendar ID="Calendar1" OnSelectionChanged="selected_click" SelectionMode="day"
                                    Font-Size="9pt" ShowTitle="false" Width="200px" ShowNextPrevMonth="false" runat="server"
                                    ShowGridLines="true" BorderStyle="none">
                                    <OtherMonthDayStyle ForeColor="gray" />
                                    <TitleStyle BackColor="gray" ForeColor="blue" Font-Bold="true" />
                                    <SelectedDayStyle BackColor="#FFCC66" Font-Bold="true" />
                                    <WeekendDayStyle ForeColor="red" />
                                </asp:Calendar>
                                &nbsp;����<asp:DropDownList ID="today" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Today_Select">
                                    <asp:ListItem Text="ȫ��" Value="all"></asp:ListItem>
                                   <%-- <asp:ListItem Text="δ��ʼ" Value="wks"></asp:ListItem>
                                    <asp:ListItem Text="������" Value="jxz"></asp:ListItem>
                                    <asp:ListItem Text="�����" Value="ywc"></asp:ListItem>
                                    <asp:ListItem Text="���ڵȴ�������" Value="wait"></asp:ListItem>
                                    <asp:ListItem Text="���Ƴ�" Value="ytc"></asp:ListItem>--%>
                                </asp:DropDownList>
                                ����־
                            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" OnRowDataBound="OnRow_Bound"
                                AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="rcid"
                                EmptyDataText="û�в鵽�������������ݣ�" Width="100%" PageSize="10" CssClass="hkgv">
                                <Columns>
                                    <%--<asp:ImageField DataImageUrlField="yxj" DataImageUrlFormatString="../../images/portal/{0}.gif"
                                        HeaderText="����" SortExpression="yxj">
                                        <ItemStyle HorizontalAlign="center" />
                                        <HeaderStyle Width="30px" />
                                    </asp:ImageField>--%>
                                    <asp:BoundField DataField="rcid" HeaderText="����">
                                        <HeaderStyle CssClass="hidden" />
                                        <ItemStyle CssClass="hidden" />
                                        <FooterStyle CssClass="hidden" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="����" SortExpression="rczt">
                                        <ItemTemplate>
                                            <a href="#" onclick="javascript:popMod('wdrc_mod.aspx?id=<%# Eval("rcid") %>')" class="gvlink">
                                                <asp:Label ID="labelzt" runat="server" Text='<%# Bind("rczt") %>' />
                                            </a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <RowStyle CssClass="hkRowStyle" />
                                <HeaderStyle CssClass="hkHeadStyle" />
                                <PagerStyle CssClass="hkBottomStyle" Font-Bold="False" Font-Italic="False" Font-Names="Batang"
                                    Font-Overline="False" Font-Strikeout="True" ForeColor="#0000C0" />
                                <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                            </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:haokeConnectionString %>" />
    </form>
</body>
</html>
