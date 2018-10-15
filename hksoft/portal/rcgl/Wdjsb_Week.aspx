<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wdjsb_Week.aspx.cs" Inherits="hkpro.portal.rcgl.Wdjsb_Week" %>

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
</head>
<body class="main">
    <form id="from1" method="post" runat="server">
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
                            <asp:DropDownList ID="dropMonth" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dropMonth_SelectedIndexChanged">
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
                            <asp:DropDownList ID="dropDay" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dropDay_SelectedIndexChanged">
                                <asp:ListItem Value="1">01��</asp:ListItem>
                                <asp:ListItem Value="2">02��</asp:ListItem>
                                <asp:ListItem Value="3">03��</asp:ListItem>
                                <asp:ListItem Value="4">04��</asp:ListItem>
                                <asp:ListItem Value="5">05��</asp:ListItem>
                                <asp:ListItem Value="6">06��</asp:ListItem>
                                <asp:ListItem Value="7">07��</asp:ListItem>
                                <asp:ListItem Value="8">08��</asp:ListItem>
                                <asp:ListItem Value="9">09��</asp:ListItem>
                                <asp:ListItem Value="10">10��</asp:ListItem>
                                <asp:ListItem Value="11">11��</asp:ListItem>
                                <asp:ListItem Value="12">12��</asp:ListItem>
                                <asp:ListItem Value="13">13��</asp:ListItem>
                                <asp:ListItem Value="14">14��</asp:ListItem>
                                <asp:ListItem Value="15">15��</asp:ListItem>
                                <asp:ListItem Value="16">16��</asp:ListItem>
                                <asp:ListItem Value="17">17��</asp:ListItem>
                                <asp:ListItem Value="18">18��</asp:ListItem>
                                <asp:ListItem Value="19">19��</asp:ListItem>
                                <asp:ListItem Value="20">20��</asp:ListItem>
                                <asp:ListItem Value="21">21��</asp:ListItem>
                                <asp:ListItem Value="22">22��</asp:ListItem>
                                <asp:ListItem Value="23">23��</asp:ListItem>
                                <asp:ListItem Value="24">24��</asp:ListItem>
                                <asp:ListItem Value="25">25��</asp:ListItem>
                                <asp:ListItem Value="26">26��</asp:ListItem>
                                <asp:ListItem Value="27">27��</asp:ListItem>
                                <asp:ListItem Value="28">28��</asp:ListItem>
                                <asp:ListItem Value="29">29��</asp:ListItem>
                                <asp:ListItem Value="30">30��</asp:ListItem>
                                <asp:ListItem Value="31">31��</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td align="right">
                            <asp:LinkButton ID="cmdMonth" runat="server" OnClick="cmdMonth_Click" CssClass="black"><img src="../../images/portal/month.gif" border="0">&nbsp;���²�</asp:LinkButton>
                            <asp:LinkButton ID="cmdWeek" runat="server" Enabled="False"><img src="../../images/portal/week.gif" border="0">&nbsp;���ܲ�</asp:LinkButton>&nbsp;
                            <asp:LinkButton ID="cmdDay" runat="server" OnClick="cmdDay_Click" CssClass="black"><img src="../../images/portal/day.gif" border="0">&nbsp;���ղ�</asp:LinkButton>
                            <asp:Button ID="Button1" runat="server" Text="�� ѯ" CssClass="mybtn" OnClick="cmdQuery_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                <tr style="background-color: #C0C0C0; height: 25">
                                    <td>
                                        &nbsp;<asp:LinkButton ID="cmdLastday" runat="server" CssClass="black" OnClick="cmdLastday_Click"><img src="../../images/portal/left_arrow.gif" alt="��һ��" border="0" />��һ��</asp:LinkButton>
                                    </td>
                                    <td align="center">
                                        <asp:Label ID="lblHeader" runat="server">2001��11��28�� ������</asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:LinkButton ID="cmdNextday" runat="server" CssClass="black" OnClick="cmdNextday_Click">��һ��<img src="../../images/portal/right_arrow.gif" alt="��һ��" border="0" /></asp:LinkButton>&nbsp;
                                    </td>
                                </tr>
                            </table>
                            <table style="border-right: #999999 1px; border-top: #999999 1px; border-left: #999999 1px;
                                width: 100%; border-bottom: #999999 1px; border-collapse: collapse; height: 500"
                                bordercolor="#999999" cellspacing="0" cellpadding="0" rules="all" border="1">
                                <tr style="font-weight: bold" align="center">
                                    <td style="height: 25px">
                                        ������
                                    </td>
                                    <td style="height: 25px">
                                        ����һ
                                    </td>
                                    <td style="height: 25px">
                                        ���ڶ�
                                    </td>
                                    <td style="height: 25px">
                                        ������
                                    </td>
                                    <td style="height: 25px">
                                        ������
                                    </td>
                                    <td style="height: 25px">
                                        ������
                                    </td>
                                    <td style="height: 25px">
                                        ������
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" width="14.3%">
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                            <tr>
                                                <td style="font-weight: bold; color: red">
                                                    <a style="color: red" href="wdjsb_day.aspx?vdate=<% =sDate(0)%>">
                                                        <% =day(sDate(0))%></a>
                                                </td>
                                                <td align="right">
                                                    <a href="wdjsb_add.aspx?reurl=wdjsb_week.aspx&amp;day=<%=sDate(0)%>">
                                                        <img alt="���������ճ�" src="../../images/portal/add_small.gif" border="0"></a>
                                                </td>
                                            </tr>
                                        </table>
                                        <%=ssubject(0)%>
                                    </td>
                                    <td valign="top" width="14.3%">
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                            <tr>
                                                <td style="font-weight: bold; color: black">
                                                    <a style="color: black" href="wdjsb_day.aspx?vdate=<% =sDate(1)%>">
                                                        <% =day(sDate(1))%></a>
                                                </td>
                                                <td align="right">
                                                    <a href="wdjsb_add.aspx?reurl=wdjsb_week.aspx&amp;day=<%=sDate(1)%>">
                                                        <img alt="���������ճ�" src="../../images/portal/add_small.gif" border="0"></a>
                                                </td>
                                            </tr>
                                        </table>
                                        <%=ssubject(1)%>
                                    </td>
                                    <td valign="top" width="14.3%">
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                            <tr>
                                                <td style="font-weight: bold; color: black">
                                                    <a style="color: black" href="wdjsb_day.aspx?vdate=<% =sDate(2)%>">
                                                        <% =day(sDate(2))%></a>
                                                </td>
                                                <td align="right">
                                                    <a href="wdjsb_add.aspx?reurl=wdjsb_week.aspx&amp;day=<%=sDate(2)%>">
                                                        <img alt="���������ճ�" src="../../images/portal/add_small.gif" border="0"></a>
                                                </td>
                                            </tr>
                                        </table>
                                        <%=ssubject(2)%>
                                    </td>
                                    <td valign="top" width="14.3%">
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                            <tr>
                                                <td style="font-weight: bold; color: black">
                                                    <a style="color: black" href="wdjsb_day.aspx?vdate=<% =sDate(3)%>">
                                                        <% =day(sDate(3))%></a>
                                                </td>
                                                <td align="right">
                                                    <a href="wdjsb_add.aspx?reurl=wdjsb_week.aspx&amp;day=<%=sDate(3)%>">
                                                        <img alt="���������ճ�" src="../../images/portal/add_small.gif" border="0"></a>
                                                </td>
                                            </tr>
                                        </table>
                                        <%=ssubject(3)%>
                                    </td>
                                    <td valign="top" width="14.3%">
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                            <tr>
                                                <td style="font-weight: bold; color: black">
                                                    <a style="color: black" href="wdjsb_day.aspx?vdate=<% =sDate(4)%>">
                                                        <% =day(sDate(4))%></a>
                                                </td>
                                                <td align="right">
                                                    <a href="wdjsb_add.aspx?reurl=wdjsb_week.aspx&amp;day=<%=sDate(4)%>">
                                                        <img alt="���������ճ�" src="../../images/portal/add_small.gif" border="0"></a>
                                                </td>
                                            </tr>
                                        </table>
                                        <%=ssubject(4)%>
                                    </td>
                                    <td valign="top" width="14.3%">
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                            <tr>
                                                <td style="font-weight: bold; color: black">
                                                    <a style="color: black" href="wdjsb_day.aspx?vdate=<% =sDate(5)%>">
                                                        <% =day(sDate(5))%></a>
                                                </td>
                                                <td align="right">
                                                    <a href="wdjsb_add.aspx?reurl=wdjsb_week.aspx&amp;day=<%=sDate(5)%>">
                                                        <img alt="���������ճ�" src="../../images/portal/add_small.gif" border="0"></a>
                                                </td>
                                            </tr>
                                        </table>
                                        <%=ssubject(5)%>
                                    </td>
                                    <td valign="top">
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                            <tr>
                                                <td style="font-weight: bold; color: red">
                                                    <a style="color: red" href="wdjsb_day.aspx?vdate=<% =sDate(6)%>">
                                                        <% =day(sDate(6))%></a>
                                                </td>
                                                <td align="right">
                                                    <a href="wdjsb_add.aspx?reurl=wdjsb_week.aspx&amp;day=<%=sDate(6)%>">
                                                        <img alt="���������ճ�" src="../../images/portal/add_small.gif" border="0"></a>
                                                </td>
                                            </tr>
                                        </table>
                                        <%=ssubject(6)%>
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
