<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlow_Node_List.aspx.cs"
    Inherits="hkpro.workflow.flow.WorkFlow_Node_List" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <title>工作流管理 - 流程节点设计(列表视图)</title>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script language="javascript">
        function LoadWindow(URL) {
            loc_x = (screen.availWidth - 700) / 2;
            loc_y = (screen.availHeight - 550) / 2;
            window.open(URL, "set_process", "height=550,width=700,status=1,toolbar=no,menubar=no,location=no,scrollbars=yes,top=" + loc_y + ",left=" + loc_x + ",resizable=yes");
        }

        //新建步骤
        function Add_Step() {
            var str11 = document.getElementById("lblwfno").value;
            LoadWindow("WorkFlow_Node_Add.aspx?FlowNumber=" + str11 + "");
        }

        //编辑步骤属性
        function Edit_Step(Process_ID) {
            LoadWindow("WorkFlow_Node_Base.aspx?ID=" + Process_ID);
        }

        function set_next(Process_ID) {
            var str11 = document.getElementById("lblwfno").value;
            LoadWindow("WorkFlow_Node_Append.aspx?FlowNumber=" + str11 + "&ID=" + Process_ID + "");
        }


        function set_item(Process_ID) {
            LoadWindow("WorkFlow_Node_Write.aspx?ID=" + Process_ID);
        }

        function set_condition(Process_ID) {
            LoadWindow("WorkFlow_Node_Branch.aspx?ID=" + Process_ID);
        }

        function set_user(Process_ID) {
            LoadWindow("WorkFlow_Node_Users.aspx?ID=" + Process_ID);
        }

        function set_dept(Process_ID) {
            LoadWindow("WorkFlow_Node_Depts.aspx?ID=" + Process_ID);
        }

        function set_priv(Process_ID) {
            LoadWindow("WorkFlow_Node_Roles.aspx?ID=" + Process_ID);
        }

        //删除步骤
        function Del_Step(Process_ID) {
            msg = '您确认要删除此步骤吗？';
            if (window.confirm(msg))
                window.open("WorkFlow_Node_Del.aspx?id=" + Process_ID + "", "_blank", "height=1, width=1,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no")
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td height="30" align="right">
                    <input id="AddBtn" type="button" value="增加步骤" style="width: 80" onclick="Add_Step();"
                        class="btn btn-primary" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                        AllowPaging="false" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
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
                            <asp:TemplateField HeaderText="基本属性">
                                <HeaderStyle Width="250px" />
                                <ItemTemplate>
                                    <a href="#" onclick="Edit_Step(<%# DataBinder.Eval(Container.DataItem, "fnID") %>);"
                                        class="gvlink">基本属性</a> <a href="#" onclick="set_next(<%# DataBinder.Eval(Container.DataItem, "fnID") %>);"
                                            class="gvlink">追加步骤</a> <a href="#" onclick="set_item(<%# DataBinder.Eval(Container.DataItem, "fnID") %>);"
                                                title="<%# DataBinder.Eval(Container.DataItem, "fnWriteName") %>" class="gvlink">可写字段</a> <a href="#" onclick="set_condition(<%# DataBinder.Eval(Container.DataItem, "fnID") %>);"
                                                    class="gvlink">条件设置</a>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="经办属性">
                                <HeaderStyle Width="190px" />
                                <ItemTemplate>
                                    <a href="#" onclick="set_user(<%# DataBinder.Eval(Container.DataItem, "fnID") %>);"
                                        title="<%# DataBinder.Eval(Container.DataItem, "fnUserNames") %>" class="gvlink">经办人员</a> <a href="#" onclick="set_dept(<%# DataBinder.Eval(Container.DataItem, "fnID") %>);"
                                            title="<%# DataBinder.Eval(Container.DataItem, "fnDeptNames") %>" class="gvlink">经办部门</a> <a href="#" onclick="set_priv(<%# DataBinder.Eval(Container.DataItem, "fnID") %>);"
                                                title="<%# DataBinder.Eval(Container.DataItem, "fnRoleNames") %>" class="gvlink">经办角色</a>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="操作">
                                <HeaderStyle Width="60px" />
                                <ItemTemplate>
                                    <a href="#" onclick="Del_Step(<%# DataBinder.Eval(Container.DataItem, "fnID") %>);"
                                        class="gvlink">删除</a>
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
