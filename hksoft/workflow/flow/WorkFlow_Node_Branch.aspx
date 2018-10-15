<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlow_Node_Branch.aspx.cs"
    Inherits="hkpro.workflow.flow.WorkFlow_Node_Branch" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script>
    function addbranch() {
        var num = Math.random();
        var littleproduct = document.getElementById("dpStep");
        var cindex = littleproduct.selectedIndex;
        var cText = littleproduct.options[cindex].text;
        var cValue = littleproduct.options[cindex].value;

        if (cText == "请选择") {
            alert('请先选择【转入步骤】再添加！');
            form1.dpStep.focus();
            return false;
        }
        else {
            var KeyID = "" + cValue + "";

            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5') {
                window.open("WorkFlow_Node_Branch_Add.aspx?tmp=" + num + "&KeyID=" + KeyID + "&FlowId=<%=Request.QueryString["id"]%>", 'window', 'height=200,width=450,top=150,left=300,toolbar=no,menubar=no,scrollbars=no, resizable=yes,location=no, status=no');
        }
        else {
            window.showModalDialog("WorkFlow_Node_Branch_Add.aspx?tmp=" + num + "&KeyID=" + KeyID + "&FlowId=<%=Request.QueryString["id"]%>", "window", "dialogWidth:450px;DialogHeight=200px;status:no;scroll=no;help:no");
        }
    }
}
</script>
<head id="Head1" runat="server">
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>工作流管理 - 条件设置</title>
    <base target="_self" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="top" align="center">
                    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                        <tr>
                            <td class="form-item" width="20%">步骤序号：
                            </td>
                            <td width="80%">
                                <asp:TextBox ID="fnNum" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">步骤名称：
                            </td>
                            <td>
                                <asp:TextBox ID="fnName" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">转入到步骤：
                            </td>
                            <td>
                                <asp:DropDownList ID="dpStep" runat="server" Width="90%" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" height="25">
                                <asp:Button ID="AddBtn" runat="server" Text=" 增加 " CssClass="btn btn-success" />
                                <input id="CloseBtn" class="btn btn-danger" onclick="javascript: window.close()" type="button"
                                    value=" 关闭 " />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                                    OnRowCommand="OnRow_Command" EmptyDataText="没有查到符合条件的数据！" Width="100%" AllowPaging="false" CssClass="hkgv">
                                    <Columns>
                                        <asp:BoundField DataField="fbName" HeaderText="字段名称"></asp:BoundField>
                                        <asp:BoundField DataField="fbType" HeaderText="字段类型"></asp:BoundField>
                                        <asp:BoundField DataField="fbCondi" HeaderText="条件判断"></asp:BoundField>
                                        <asp:BoundField DataField="fbValue" HeaderText="判断依据"></asp:BoundField>
                                        <asp:TemplateField HeaderText="相关操作">
                                            <HeaderStyle Width="120px" />
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LBtn_Mod" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "fbID") %>'
                                                    CommandName="mod" CssClass="gvlink">修改</asp:LinkButton>
                                                <asp:LinkButton ID="LBtn_Del" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "fbID") %>'
                                                    CommandName="del" CssClass="gvlink">删除</asp:LinkButton>
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
                </td>
            </tr>
        </table>
        <font color="red">&nbsp;注：Chrome/Safari/FireFox等非IE内核浏览器需要手工刷新后，才能看到新录入的数据。</font>
        <asp:TextBox ID="lblfno" runat="server" Style="display: none"></asp:TextBox>
        <asp:TextBox ID="lblwfno" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>
