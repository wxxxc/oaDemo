<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZmSet.aspx.cs" Inherits="hkpro.ZmSet" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>个人设置</title>
    <link href="CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="Setup" method="post" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="top">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center">
                                <br />
                                <table cellspacing="0" cellpadding="0" border="0" width="98%">
                                    <tr>
                                        <td style="height: 21px; width: 91px; background-image: url(images/tab_b_n.gif)"
                                            align="center">
                                            <a href="myset.aspx?i=2" class="black">常规设定</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(images/tab_b_n.gif)" align="center">
                                            <a href="yxset.aspx" class="black">邮箱配置</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(images/tab_b_y.gif)" align="center">
                                            <a href="zmset.aspx" class="mail_top">自定义桌面</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(images/tab_b_n.gif)" align="center">
                                            <a href="dbset.aspx" class="black">自定义驾驶舱</a>
                                        </td>
                                        <td>&nbsp;
                                        </td>
                                        <td align="right">
                                            <input type="button" name="AddBtn" value="增 加" class="mybtn" onclick="javascript: popAdd('zmset_view.aspx');" />
                                            <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="删 除" OnClientClick="return confirm('确认要执行删除吗？')"
                                                OnClick="Del_Click"></asp:Button>
                                        </td>
                                    </tr>
                                </table>
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="Item_Bound" AutoGenerateColumns="False"
                                    OnRowCommand="GridView1_RowCommand" DataKeyNames="id" EmptyDataText="没有查到符合条件的数据！" Width="98%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderStyle Width="30px"></HeaderStyle>
                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                            <HeaderTemplate>
                                                <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16; height: 16" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="id" HeaderText="编码">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                            <FooterStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="模块名称">
                                            <ItemTemplate>
                                                <asp:Label ID="Labelnr" runat="server" Text='<%# Bind("Name") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="排序">
                                            <HeaderStyle Width="70px" />
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "orderid") %>'
                                                    CommandName="shangyi" CssClass="gvlink">上移</asp:LinkButton>
                                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "orderid") %>'
                                                    CommandName="xiayi" CssClass="gvlink">下移</asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
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
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
