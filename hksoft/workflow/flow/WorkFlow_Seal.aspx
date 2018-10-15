<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlow_Seal.aspx.cs"
    Inherits="hkpro.workflow.flow.WorkFlow_Seal" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script>
    function addseal() {
        var num = Math.random();

        //browser
        var bstr = getBrowserType();
        if (bstr == '3' | bstr == '4' | bstr == '5') {
            window.open("WorkFlow_Seal_Add.aspx?tmp=" + num + "&FlowNumber=<%=Request.QueryString["FlowNumber"]%>", 'window', 'height=200,width=450,top=150,left=300,toolbar=no,menubar=no,scrollbars=no, resizable=yes,location=no, status=no');
    }
    else {
        window.showModalDialog("WorkFlow_Seal_Add.aspx?tmp=" + num + "&FlowNumber=<%=Request.QueryString["FlowNumber"]%>", "window", "dialogWidth:450px;DialogHeight=200px;status:no;scroll=no;help:no");
    }

}
</script>
<head id="Head1" runat="server">
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>工作流管理 - 电子印章</title>
    <base target="_self" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <table align="center" border="0" cellpadding="4" cellspacing="1" width="100%">
            <tr>
                <td height="30" align="right">
                    <asp:Button ID="AddBtn" runat="server" Text=" 增加 " CssClass="btn btn-success" />
                    <input id="CloseBtn" class="btn btn-danger" onclick="javascript: window.close()" type="button"
                        value=" 关闭 " />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                        AllowPaging="false" OnRowCommand="OnRow_Command" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                        <Columns>
                            <asp:BoundField DataField="fsName" HeaderText="印章域"></asp:BoundField>
                            <asp:BoundField DataField="fsUserNames" HeaderText="允许使用人"></asp:BoundField>
                            <asp:TemplateField HeaderText="相关操作">
                                <HeaderStyle Width="90px" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="LBtn_Mod" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "fsID") %>'
                                        CommandName="mod" CssClass="gvlink">修改</asp:LinkButton>
                                    <asp:LinkButton ID="LBtn_Del" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "fsID") %>'
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
        <font color="red">&nbsp;注：Chrome/Safari/FireFox等非IE内核浏览器需要手工刷新后，才能看到新录入的数据。</font>
        <asp:TextBox ID="lblfid" runat="server" Style="display: none"></asp:TextBox>
        <asp:TextBox ID="lblwfid" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>
