<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cydx.aspx.cs" Inherits="hkpro.portal.dxgl.Cydx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>常用短信</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                    <tr>
                        <td style="height: 40px">
                            请选择短信类型：<asp:DropDownList ID="dxlx" runat="server" OnSelectedIndexChanged="ChangeType"
                                AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                        <td align="right">
                            <asp:Panel ID="panel2" runat="server" ScrollBars="none">
                                短信内容：<asp:TextBox ID="nr" runat="server" CssClass="mytext" Width="300px" MaxLength="90"></asp:TextBox>
                            </asp:Panel>
                        </td>
                        <td align="right">
                            <asp:Button ID="add" runat="Server" OnClick="Save_Click" CausesValidation="true"
                                CssClass="mybtn" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
                                DataSourceID="SqlDataSource1"  OnRowDataBound="Item_Bound" EmptyDataText="没有查到符合条件的数据！" Width="100%"  CssClass="hkgv">
                                <Columns>
                                    <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle Width="30px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="id" HeaderText="短信编码">
                                        <HeaderStyle CssClass="hidden" />
                                        <ItemStyle CssClass="hidden" />
                                        <FooterStyle CssClass="hidden" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nr" HeaderText="短信内容"></asp:BoundField>
                                    <asp:BoundField DataField="mc" HeaderText="短信类型" ReadOnly="true">
                                        <HeaderStyle Width="80px" />
                                        <ItemStyle HorizontalAlign="center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="修改" ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Update"
                                                ImageUrl="../../images/save.gif" AlternateText="保存修改" />
                                            <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                                ImageUrl="../../images/cancel.gif" AlternateText="取消修改" />
                                        </EditItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle Width="80px" />
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                                ImageUrl="../../images/edit.gif" AlternateText="修改此类型" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="删除" ShowHeader="False">
                                        <HeaderStyle Width="80px" />
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Delete"
                                                ImageUrl="../../images/del.gif" AlternateText="删除此类型" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="序号" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="dp_id" runat="server" Text='<%# Eval("id")%>'></asp:Label>
                                        </ItemTemplate>
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
                        <td colspan="3" style="height: 22px">
                            共
                            <asp:Label ID="Msg" runat="server" ForeColor="#999999">0</asp:Label>
                            行
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:haokeConnectionString %>">
        <UpdateParameters>
            <asp:Parameter Name="mc" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ErrorMessage="请输入短信内容"
        Display="Static" ControlToValidate="nr">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
