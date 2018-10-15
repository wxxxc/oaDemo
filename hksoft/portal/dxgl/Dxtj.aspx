<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dxtj.aspx.cs" Inherits="hkpro.portal.dxgl.Dxtj" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>短信统计</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server" method="post">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 40px">统计方式:<asp:DropDownList ID="tjfs" runat="server" AutoPostBack="true" OnSelectedIndexChanged="tjfs_SelectedIndexChanged">
                                <asp:ListItem Value="zt" Text="按用户"></asp:ListItem>
                                <asp:ListItem Value="bm" Text="按部门"></asp:ListItem>
                            </asp:DropDownList>
                                <asp:Label ID="lbltitle" runat="server" Text="员工号或姓名:"></asp:Label><asp:TextBox ID="user"
                                    runat="server" CssClass="mytext" Width="80"></asp:TextBox>
                                发送时间:<asp:TextBox ID="txtSdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                    CssClass="mytext" Width="80"></asp:TextBox>至<asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')"
                                        runat="server" CssClass="mytext" Width="80"></asp:TextBox>
                                发送结果:<asp:DropDownList ID="fsjg" runat="server">
                                    <asp:ListItem Value="" Text="全部"></asp:ListItem>
                                    <asp:ListItem Value="0" Text="未发送"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="发送成功"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="发送失败"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="查 询" OnClick="Query_Click"></asp:Button>
                                <asp:Button CssClass="mybtn" ID="OutBtn" runat="server" Text="导 出" OnClick="Out_Click"></asp:Button>
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound1" AutoGenerateColumns="False"
                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="60px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="部门名称">
                                            <ItemTemplate>
                                                <asp:Label ID="Labelnr" runat="server" Text='<%# Bind("bm_mc") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="发送短信条数">
                                            <HeaderStyle Width="250px" />
                                            <ItemStyle HorizontalAlign="Right" />
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("nums") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                                <asp:GridView ID="GridView2" runat="server" OnRowDataBound="OnRow_Bound2" AutoGenerateColumns="False"
                                    EmptyDataText="没有查到符合条件的数据！"
                                    Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="60px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="用户编码">
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popView('dxtj_view.aspx?yh=<%# Eval("sSender") %>&mc=<%# Eval("ui_desc") %>&sd=<%=Data1 %>&ed=<%=Data2 %>')"
                                                    class="gvlink">
                                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("sSender") %>'></asp:Label></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ui_desc" HeaderText="用户姓名"></asp:BoundField>
                                        <asp:BoundField DataField="bm_mc" HeaderText="部门"></asp:BoundField>
                                        <asp:TemplateField HeaderText="发送短信条数">
                                            <HeaderStyle Width="150px" />
                                            <ItemStyle HorizontalAlign="Right" />
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("nums") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSdate"
            ErrorMessage="请选择开始日期">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEdate"
            ErrorMessage="请选择截止日期">&nbsp;
        </asp:RequiredFieldValidator>
    </form>
</body>
</html>
