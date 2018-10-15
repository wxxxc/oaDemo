<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clck.aspx.cs" Inherits="hkpro.oa.clgl.Clck" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>车辆查看</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 40px">检索主题：<asp:DropDownList ID="query_tj" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Query_Click">
                                <asp:ListItem Value="w">未借出的车辆</asp:ListItem>
                                <asp:ListItem Value="y">已借出的车辆</asp:ListItem>
                            </asp:DropDownList>
                            </td>
                            <td align="right"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="mytable table-responsive">
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="false" OnRowDataBound="OnRow_Bound"
                                    AutoGenerateColumns="False" DataKeyNames="id" EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                             <HeaderStyle CssClass="mw30"  />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="id" HeaderText="编号">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                            <FooterStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="cph" HeaderText="车牌号">
                                            <HeaderStyle CssClass="mw80"  />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="clmc" HeaderText="车辆名称">
                                             <HeaderStyle CssClass="mwp8"  />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="车辆管理员">
                                            <HeaderStyle CssClass="mw120"  />
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="zdzs" HeaderText="最大载数(人)">
                                             <HeaderStyle CssClass="mw80"  />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="qyrq" HeaderText="启用日期" DataFormatString="{0:yyyy-MM-dd}"
                                            HtmlEncode="False">
                                             <HeaderStyle CssClass="mw80"  />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="cz" HeaderText="残值(万)">
                                        <HeaderStyle CssClass="mw80"  />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <PagerStyle CssClass="hkBottomStyle" Font-Bold="False" Font-Italic="False"
                                        Font-Names="Batang" Font-Overline="False" Font-Strikeout="True" ForeColor="#0000C0" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                    <PagerSettings PageButtonCount="25" />
                                </asp:GridView>
                                    </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
