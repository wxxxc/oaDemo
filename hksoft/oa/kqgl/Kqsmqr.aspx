<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kqsmqr.aspx.cs" Inherits="hkpro.oa.kqgl.Kqsmqr" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>考勤说明确认</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" method="post" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td style="height: 10px"></td>
            </tr>
            <tr>
                <td valign="top" align="center">
                    <table cellspacing="0" cellpadding="0" border="0" width="100%">
                        <tr>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_y.gif)"
                                align="center">
                                <a href="Kqsmqr.aspx" class="mail_top">待确认记录</a>
                            </td>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                align="center">
                                <a href="Kqsmqr2.aspx" class="black">已确认记录</a>
                            </td>
                            <td align="right">
                                <asp:DropDownList ID="query_tj" runat="server">
                                    <asp:ListItem Value="sqrmc" Selected="True">申请人</asp:ListItem>
                                    <asp:ListItem Value="kqqksm">考勤情况说明</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="150"></asp:TextBox>
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="查 询" OnClick="Query_Click"></asp:Button>
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                        EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                        <Columns>
                            <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="日期">
                                <HeaderStyle Width="80px" />
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:popView('Kqsmqr_View.aspx?id=<%# Eval("sid") %>')"
                                        class="gvlink">
                                        <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("qdsj", "{0:yyyy-MM-dd}") %>'></asp:Label></a>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="ynqd1" HeaderText="上午签到">
                                <HeaderStyle Width="60px" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ynqt1" HeaderText="上午签退">
                                <HeaderStyle Width="60px" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ynqd2" HeaderText="下午签到">
                                <HeaderStyle Width="60px" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ynqt2" HeaderText="下午签退">
                                <HeaderStyle Width="60px" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ynqd3" HeaderText="晚上签到">
                                <HeaderStyle Width="60px" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ynqt3" HeaderText="晚上签退">
                                <HeaderStyle Width="60px" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="smzt" HeaderText="状态">
                                <HeaderStyle Width="55px" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="kqqksm" HeaderText="考勤情况说明"></asp:BoundField>
                            <asp:BoundField DataField="sqrmc" HeaderText="申请人"></asp:BoundField>
                            <asp:BoundField DataField="sqbmmc" HeaderText="所属部门"></asp:BoundField>
                            <asp:BoundField DataField="sssj" HeaderText="送审时间" DataFormatString="{0:yyyy-MM-dd}"
                                HtmlEncode="False">
                                <HeaderStyle Width="80px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sscs" HeaderText="送审次数">
                                <HeaderStyle Width="60px" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                        </Columns>
                        <RowStyle CssClass="hkRowStyle" />
                        <HeaderStyle CssClass="hkHeadStyle" />
                        <AlternatingRowStyle CssClass="hkAltRowStyle" />
                        <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td style="height: 22px">
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                        ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                        NumericButtonCount="10" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                        PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
                        InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go">
                    </webdiyer:AspNetPager>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
