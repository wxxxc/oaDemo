<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cs.aspx.cs" Inherits="hkpro.portal.csxx.Cs" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>参数选项</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="sform1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="97%" align="center" border="0">
                    <tr>
                        <td style="height: 40px">
                            <font color="red">提示：部分参数设置后需要重新登录系统方可生效！</font>
                        </td>
                        <td align="right">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:GridView ID="GridView1" runat="server" OnRowDataBound="RowDataBound" AutoGenerateColumns="False"
                                DataSourceID="SqlDataSource1"  Width="100%" DataKeyNames="Paramt" EmptyDataText="对不起，检索不出任何记录！"  CssClass="hkgv">
                                <Columns>
                                    <asp:BoundField DataField="Paramt" HeaderText="参数编码" ReadOnly="True" SortExpression="Paramt"
                                        Visible="False" />
                                    <asp:TemplateField HeaderText="参数名称" SortExpression="P_name">
                                        <ItemStyle Wrap="false" />
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("P_name") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("P_name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="值" SortExpression="P_string">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="value" runat="server" Text='<%# Bind("P_string") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("P_string") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="P_Comm" HeaderText="备注说明" SortExpression="P_comm" ReadOnly="True">
                                    </asp:BoundField>
                                    <asp:CommandField ButtonType="Image" CancelImageUrl="../../images/cancel.gif" CancelText="取消修改"
                                        EditImageUrl="../../images/edit.gif" EditText="修改参数" HeaderText="操作" ShowEditButton="True"
                                        UpdateImageUrl="../../images/save.gif" UpdateText="保存修改">
                                        <HeaderStyle Width="60px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:CommandField>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:haokeConnectionString %>"
        CancelSelectOnNullParameter="false">
        <UpdateParameters>
            <asp:Parameter Name="P_string" />
            <asp:Parameter Name="Paramt" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
