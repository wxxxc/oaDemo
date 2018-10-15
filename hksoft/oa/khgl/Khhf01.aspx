<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Khhf01.aspx.cs" Inherits="hkpro.oa.khgl.Khhf01" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>客户回访</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server" method="post">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" border="0" width="100%">
                        <tr>
                            <td colspan="4" style="height: 5px"></td>
                        </tr>
                        <tr>
                            <td align="right" style="height: 25px">购买人：
                            </td>
                            <td>
                                <asp:TextBox ID="gmr" runat="server" CssClass="mytext" Width="150px" />
                            </td>
                            <td align="right" style="height: 25px">省份：
                            </td>
                            <td>
                                <asp:TextBox ID="sf" runat="server" CssClass="mytext" Width="150px" />
                            </td>
                            <td align="right" style="height: 25px">城市：
                            </td>
                            <td>
                                <asp:TextBox ID="cs" runat="server" CssClass="mytext" Width="150px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="height: 25px">单位：
                            </td>
                            <td>
                                <asp:TextBox ID="gmrdw" runat="server" CssClass="mytext" Width="150px" />
                            </td>
                            <td align="right" style="height: 25px">商品名称：
                            </td>
                            <td>
                                <asp:TextBox ID="spmc" runat="server" CssClass="mytext" Width="150px" />
                            </td>
                            <td align="right" style="height: 25px">购买数量：
                            </td>
                            <td>
                                <asp:TextBox ID="gmsls" runat="server" Width="61" CssClass="mytext"></asp:TextBox>&nbsp;至&nbsp;<asp:TextBox
                                    ID="gmsle" runat="server" Width="61" CssClass="mytext"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="height: 25px">购买日期：
                            </td>
                            <td colspan="5">
                                <asp:TextBox ID="txtSdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                    CssClass="mytext" Width="100"></asp:TextBox>
                                至
                            <asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                CssClass="mytext" Width="100"></asp:TextBox>
                                <asp:DropDownList ID="DDLzdgl" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ChangeDDLzdgl"
                                    ToolTip="当选择某个自动过滤条件时，其它查询条件将不起作用">
                                    <asp:ListItem Text="全部客户" Value="0" Selected="true"></asp:ListItem>
                                    <asp:ListItem Text="超30天未回访的客户" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="超180天未回访的客户" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="超300天未回访的客户" Value="10"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="查 询" OnClick="Query_Click"
                                    CausesValidation="False" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 5px"></td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="khid" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="khid" HeaderText="编号">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="购买人">
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popView('khhf01_view.aspx?id=<%# Eval("khid") %>')"
                                                    class="gvlink">
                                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("gmr") %>'></asp:Label></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="gmrdh" HeaderText="电话">
                                            <HeaderStyle Width="100px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="gmrdw" HeaderText="单位"></asp:BoundField>
                                        <asp:BoundField DataField="gmrq" HeaderText="购买日期" DataFormatString="{0:yyyy-MM-dd}"
                                            HtmlEncode="False">
                                            <HeaderStyle Width="75px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="spmc" HeaderText="商品名称"></asp:BoundField>
                                        <asp:BoundField DataField="gmsl" HeaderText="购买数量">
                                            <HeaderStyle Width="70px" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="hfqk1" HeaderText="1个月回访">
                                            <HeaderStyle Width="60px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="hfqk2" HeaderText="6个月回访">
                                            <HeaderStyle Width="60px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="hfqk3" HeaderText="10个月回访">
                                            <HeaderStyle Width="70px" />
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
                            <td colspan="2" style="height: 22px">
                                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                    ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                                    NumericButtonCount="10" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                    PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
                                    InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go">
                                </webdiyer:AspNetPager>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
