<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArrangeWork_List.aspx.cs"
    Inherits="hkpro.workflow.work.ArrangeWork_List" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
     <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>工作归档</title>
    <script>
        function delfolder() {
            if (!confirm("您确定要删除文件夹吗？"))
                return false;
        }

        function folderMove() {
            var a = 0
            for (var i = 0; i < document.form1.elements.length; i++) {
                if (document.form1.elements[i].checked == true)
                { a = a + 1 }
            }

            if (a > 0) {
            }
            else {
                alert('请点击每项前的复选框，选中一项或多项后再转移！');
                return false;
            }

            if (window.confirm("您确认要转移选中的文件吗？")) {
                return true;
            }
            else {
                return false;
            }

        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td valign="top">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                        <tr>
                            <td>
                                <b>标题或文号：</b><asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="100"></asp:TextBox>
                                <asp:Button CssClass="btn btn-info" ID="QueBtn" runat="server" Text="查询" OnClick="Query_Click" />
                                <asp:Button CssClass="btn btn-danger" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click" />
                                <b>将选中文件转移至：</b><asp:DropDownList ID="dp_folder" runat="server" Width="120px">
                                </asp:DropDownList>
                                <asp:Button CssClass="btn btn-primary" ID="MoveBtn" runat="server" Text="转移" OnClick="MoveBtn_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td><div class="mytable table-responsive">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                                    EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="选择">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="mw30" />
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect" runat="server" ToolTip="双击每行任意位置可以选中或取消选择框" />
                                                <asp:Label ID="lblVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fdID") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                                <asp:Label ID="lblNameVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fdName") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="标题">
                                            <ItemTemplate>
                                                <a href='ArrangeWork_Show.aspx?id=<%# DataBinder.Eval(Container.DataItem, "fdID") %> '
                                                    class="gvlink">
                                                    <%# DataBinder.Eval(Container.DataItem, "fdTitle")%></a>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="mwp50" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="文号">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "fdName")%>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="mwp50" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="所属类别">
                                            <ItemTemplate>
                                                <%# ((Eval("ffName").ToString().Replace("-", "").Replace("|", "")))%>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="mw150" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <RowStyle CssClass="hkRowStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 105; height: 25" align="center">
                                <a href="javascript:void(0)" onclick="chkAllw()" class="page_text">全选</a> <a href="javascript:void(0)"
                                    onclick="nochkAll()" class="page_text">全消</a> <a href="javascript:void(0)" onclick="revchkAll()"
                                        class="page_text">反选</a>
                            </td>
                            <td>
                                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                    ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font class=page_text>共%RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                                    NumericButtonCount="10" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                    PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
                                    InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go">
                                </webdiyer:AspNetPager>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                        <tr>
                            <td>
                                <img border="0" src="../../images/arrow_r.gif" />&nbsp;&nbsp;<b>文件夹操作</b>
                            </td>
                        </tr>
                        <tr>
                            <td>当前文件夹：<%=strfoldername %>&nbsp;&nbsp;
                            <asp:Button CssClass="btn btn-success" ID="AddFolderBtn" runat="server" Text="新建子文件夹" OnClick="AddFolderBtn_Click"
                                Style="width: 100" />
                                <asp:Button CssClass="btn btn-primary" ID="RenameBtn" runat="server" Text="重命名文件夹" OnClick="RenameBtn_Click"
                                    Style="width: 100" />
                                <asp:Button CssClass="btn btn-danger" ID="DelFolderBtn" runat="server" Text="删除此文件夹" OnClick="DelFolderBtn_Click"
                                    Style="width: 100" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
