<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cyy.aspx.cs" Inherits="hkpro.portal.grbg.Cyy" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>我的常用语</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 40px; width: 220">请选择分类：<asp:DropDownList ID="xzlx" runat="server" OnSelectedIndexChanged="ChangeType"
                                AutoPostBack="True">
                                <asp:ListItem Text="出差理由" Value="01"></asp:ListItem>
                                <asp:ListItem Text="待办工作审批" Value="02" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            </td>
                            <td align="right">
                                <asp:Panel ID="panel2" runat="server" ScrollBars="none">
                                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" ErrorMessage="请输入内容"
                                        Display="Static" ControlToValidate="name">&nbsp;
                                    </asp:RequiredFieldValidator>
                                    内容：<asp:TextBox ID="name" runat="server" CssClass="mytext" Width="200px"></asp:TextBox>
                                </asp:Panel>
                            </td>
                            <td align="right">
                                <asp:Button ID="add" runat="Server" OnClick="Save_Click" CausesValidation="true"
                                    CssClass="mybtn" />
                                <asp:Button CssClass="mybtn" ID="StopBtn" runat="server" Text="禁 用" OnClick="Stop_Click"
                                    CausesValidation="false" />
                                <asp:Button CssClass="mybtn" ID="PassBtn" runat="server" Text="启 用" OnClick="Pass_Click"
                                    CausesValidation="false" />
                                <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
                                    ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                  <div class="mytable table-responsive">
                                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                    DataKeyNames="cid" DataSourceID="SqlDataSource1" OnRowDataBound="OnRow_Bound" EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="mw30" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="checkbox" name="chkall" id="chkall" title="全选或取消" onclick="CheckAll(this.form)"
                                                    style="width: 16; height: 16" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chk" runat="server" CssClass="mybox"></asp:CheckBox>
                                            </ItemTemplate>
                                            <HeaderStyle Width="30px" HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="nr" HeaderText="内容">
                                             <HeaderStyle CssClass="mwp80" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="zt" HeaderText="状态" ReadOnly="True">
                                             <HeaderStyle CssClass="mw60" />
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
                                       <HeaderStyle CssClass="mw60" />
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                                    ImageUrl="../../images/edit.gif" AlternateText="修改此记录" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="删除" ShowHeader="False">
                                            <HeaderStyle Width="60px" />
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Delete"
                                                    OnClientClick="return confirm('确认要执行删除吗？')" ImageUrl="../../images/del.gif" AlternateText="删除此记录" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="序号" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="dp_id" runat="server" Text='<%# Eval("cid")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                                      </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:haokeConnectionString %>">
            <UpdateParameters>
                <asp:Parameter Name="nr" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
