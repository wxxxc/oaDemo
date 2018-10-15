<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Flow_Show_List.aspx.cs"
    Inherits="hkpro.workflow.work.Flow_Show_List" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>

    <script language="javascript" src="../Flow/cssjs/flow.js"></script>

    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />

    <title>查看流程(列表视图)</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td valign="top">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound" AllowPaging="false"
                        EmptyDataText="没有查到符合条件的数据！" Width="100%" UseAccessibleHeader="false">
                        <Columns>
                            <asp:BoundField DataField="fnNum" HeaderText="序号">
                                <HeaderStyle Width="50px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fnName" HeaderText="步骤名称"></asp:BoundField>
                            <asp:TemplateField HeaderText="下一步骤">
                                <ItemTemplate>
                                    <asp:Label ID="lblfnPosition" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "fnPosition")%>'
                                        Visible="false"></asp:Label>
                                    <asp:Label ID="lblNextNodeNum" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "NextNodeNum")%>'
                                        Visible="false"></asp:Label>
                                    <asp:Label ID="lblbase" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="各项属性信息(鼠标停留查看)">
                                <HeaderStyle Width="250px" />
                                <ItemTemplate>
                                    <a href="#" title="<%# DataBinder.Eval(Container.DataItem, "fnWriteName") %>" class="gvlink">可写字段</a>
                                    <a href="#" title="<%# DataBinder.Eval(Container.DataItem, "fnUserNames") %>" class="gvlink">经办人员</a>
                                    <a href="#" title="<%# DataBinder.Eval(Container.DataItem, "fnDeptNames") %>" class="gvlink">经办部门</a>
                                    <a href="#" title="<%# DataBinder.Eval(Container.DataItem, "fnRoleNames") %>" class="gvlink">经办角色</a>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
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
        <asp:TextBox ID="lblwfno" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>
