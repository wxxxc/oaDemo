<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zssc.aspx.cs" Inherits="hkpro.oa.zsgl.zssc" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>知识排行</title>
    <script>
        function showfrom(str) {
            var num = Math.random();
            window.open("zsshow.aspx?tmp=" + num + "&id=" + str + "", "_blank", "height=700, width=900,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=80,left=60")
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td colspan="2" style="height: 10px"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table cellspacing="0" cellpadding="0" border="0">
                                    <tr>
                                        <td style="height: 21px; width: 61px; background-image: url(../../images/tab_n.gif)"
                                            align="center">
                                            <a href="zsph.aspx?i=2" class="black">知识点击</a>
                                        </td>
                                        <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                            <a href="zstj.aspx" class="black">知识推荐</a>
                                        </td>
                                        <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                            <a href="zsdy.aspx" class="black">知识订阅</a>
                                        </td>
                                        <td style="width: 61px; background-image: url(../../images/tab_y.gif)" align="center">
                                            <a href="zssc.aspx" class="mail_top">知识收藏</a>
                                        </td>
                                        <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                            <a href="zxzs.aspx" class="black">最新知识</a>
                                        </td>
                                        <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                            <a href="zsqltj.aspx" class="black">强力推荐</a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound" DataKeyNames="id"
                                    OnRowCommand="GridView1_RowCommand" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <HeaderStyle Width="30px" />
                                            <ItemTemplate>
                                                <%# (Container.DataItemIndex+1).ToString()%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Title" HeaderText="知识名称">
                                            <ItemStyle />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="作者">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "Realname")%>
                                            </ItemTemplate>
                                            <ItemStyle Width="80px" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="收藏数">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "ScNum")%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="right" Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="相关操作">
                                            <HeaderStyle Width="140px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <a href="javascript:void(0)" onclick="showfrom(<%# DataBinder.Eval(Container.DataItem, "id") %>);"
                                                    class="gvlink">查看</a>
                                                <asp:Label ID="HyId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "id")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:LinkButton ID="tuijian" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>'
                                                    CommandName="tuijian" CssClass="gvlink">推荐</asp:LinkButton>
                                                <asp:LinkButton ID="dingyue" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>'
                                                    CommandName="dingyue" CssClass="gvlink">订阅</asp:LinkButton>
                                                <asp:LinkButton ID="shoucang" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>'
                                                    CommandName="shoucang" CssClass="gvlink">收藏</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <RowStyle CssClass="hkRowStyle" />
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
        <asp:DropDownList ID="dpform" runat="server" Visible="False">
        </asp:DropDownList>
    </form>
</body>
</html>
