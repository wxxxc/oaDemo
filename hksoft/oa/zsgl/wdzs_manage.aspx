<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wdzs_manage.aspx.cs" Inherits="hkpro.oa.zsgl.wdzs_manage" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>管理章节</title>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script>
        function showfrom(str) {
            var num = Math.random();
            window.open("zszj_show.aspx?tmp=" + num + "&id=" + str + "&Number=<%=Request.QueryString["Number"] %>", "_blank", "height=560, width=800,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=60,left=130")
}

function updatefrom(str) {
    var num = Math.random();
    window.open("zszj_update.aspx?tmp=" + num + "&id=" + str + "&Number=<%=Request.QueryString["Number"] %>", "_blank", "height=560, width=800,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=60,left=130")
}


function addfrom() {
    var num = Math.random();
    window.open("zszj_add.aspx?tmp=" + num + "&Number=<%=Request.QueryString["Number"] %>", "_blank", "height=560, width=800,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=60,left=130")
}
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="top">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td height="10"></td>
                        </tr>
                        <tr>
                            <td height="35">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="height: 25px;">&nbsp;
                                        </td>
                                        <td valign="top">
                                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                                <tr>
                                                    <td valign="top" style="height: 25px;">
                                                        <strong><font color="red">对应小类：<%=Namefile %></font></strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">
                                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                                                            DataKeyNames="Id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="选择">
                                                                    <HeaderStyle Width="30px" />
                                                                    <ItemStyle HorizontalAlign="Center" Wrap="True" />
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chkSelect" runat="server" ToolTip="双击每行任意位置可以选中或取消选择框" />
                                                                        <asp:Label ID="lblVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Id") %>'
                                                                            Visible="False" Width="0px"></asp:Label>
                                                                        <asp:Label ID="lblNameVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>'
                                                                            Visible="False" Width="0px"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="章节标题">
                                                                    <HeaderStyle Wrap="False" />
                                                                    <ItemTemplate>
                                                                        <%# DataBinder.Eval(Container.DataItem, "Name") %>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Wrap="False" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="录入时间">
                                                                    <HeaderStyle Wrap="False" Width="120" />
                                                                    <ItemTemplate>
                                                                        <%# DataBinder.Eval(Container.DataItem, "Settime", "{0:yyyy-MM-dd HH:mm}")%>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="相关操作">
                                                                    <HeaderStyle Wrap="False" Width="100px" />
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lableId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "id")%>'
                                                                            Visible="false"></asp:Label>
                                                                        <asp:Label ID="LNumber" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Number")%>'
                                                                            Visible="false"></asp:Label>
                                                                        <asp:Label ID="lblshow" runat="server"></asp:Label>
                                                                        <asp:Label ID="lblmod" runat="server"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Wrap="False" HorizontalAlign="Center" />
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
                                            <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td style="height: 30px" colspan="3">
                                                        <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="删除章节" OnClick="Del_Click"></asp:Button>
                                                        <input type="button" name="AddBtn" id="AddBtn" runat="server" value="新建章节" class="mybtn"
                                                            onclick="javascript: addfrom();" />
                                                        <input type="button" name="BackBtn" value=" 关闭 " class="mybtn" onclick="javascript: window.close()" />
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="17">&nbsp;
                                        </td>
                                    </tr>
                                </table>
                                <table width="100%" height="34" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="width: 125; height: 25" align="center">&nbsp; <a href="javascript:void(0)" onclick="chkAllw()" class="page_text">全选</a>
                                            <a href="javascript:void(0)" onclick="nochkAll()" class="page_text">全消</a> <a href="javascript:void(0)"
                                                onclick="revchkAll()" class="page_text">反选</a>
                                        </td>
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
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
