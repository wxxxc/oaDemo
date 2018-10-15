<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zsshowzj.aspx.cs" Inherits="hkpro.oa.zsgl.zsshowzj" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script>
        function showfrom(str) {
            var num = Math.random();
            window.open("zsShowZj_view.aspx?tmp=" + num + "&id=" + str + "&Number=<%=Request.QueryString["Number"] %>", "_blank", "height=560, width=800,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=60,left=130")
}

    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" height="350">
            <tr>
                <td valign="top">
                    <table width="100%" height="35" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td height="35">
                                <table width="100%" height="35" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="17">&nbsp;
                                        </td>
                                        <td valign="top">
                                            <table cellspacing="0" cellpadding="5" width="100%" border="0">
                                                <tr>
                                                    <td valign="top">
                                                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
                                                            <tr>
                                                                <td align="right">
                                                                    <asp:Button CssClass="mybtn" ID="Btnfhzs" runat="server" Text="返回知识" OnClick="Btnfhzs_Click"></asp:Button>
                                                                    <asp:Button CssClass="mybtn" ID="Btntjzs" runat="server" Text="推荐知识" OnClick="Btntjzs_Click"></asp:Button>
                                                                    <asp:Button CssClass="mybtn" ID="Btndyzs" runat="server" Text="订阅知识" OnClick="Btndyzs_Click"></asp:Button>
                                                                    <asp:Button CssClass="mybtn" ID="Btnsczs" runat="server" Text="收藏知识" OnClick="Btnsczs_Click"></asp:Button>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" valign="top">
                                                        <strong><font size="2">
                                                        <%=Namefile%></font></strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">
                                                        <asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound"
                                                            AutoGenerateColumns="False" DataKeyNames="id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                            <PagerSettings Visible="False" />
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Labelxh" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                    <HeaderStyle Width="30px" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="章节标题">
                                                                    <ItemTemplate>
                                                                        <%# DataBinder.Eval(Container.DataItem, "Name") %>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Wrap="False" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="录入时间">
                                                                    <HeaderStyle Width="120px" />
                                                                    <ItemTemplate>
                                                                        <%# DataBinder.Eval(Container.DataItem, "Settime", "{0:yyyy-MM-dd HH:mm}")%>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="相关操作">
                                                                    <HeaderStyle Width="80px" />
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblid" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "id")%>'
                                                                            Visible="false"></asp:Label>
                                                                        <asp:Label ID="lbln" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Number")%>'
                                                                            Visible="false"></asp:Label>
                                                                        <asp:Label ID="Label1" runat="server"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <HeaderStyle CssClass="hkHeadStyle" />
                                                            <RowStyle CssClass="hkRowStyle" />
                                                            <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                            <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="17">&nbsp;
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
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
