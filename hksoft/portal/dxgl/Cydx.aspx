<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cydx.aspx.cs" Inherits="hkpro.portal.dxgl.Cydx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>���ö���</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                    <tr>
                        <td style="height: 40px">
                            ��ѡ��������ͣ�<asp:DropDownList ID="dxlx" runat="server" OnSelectedIndexChanged="ChangeType"
                                AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                        <td align="right">
                            <asp:Panel ID="panel2" runat="server" ScrollBars="none">
                                �������ݣ�<asp:TextBox ID="nr" runat="server" CssClass="mytext" Width="300px" MaxLength="90"></asp:TextBox>
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
                                DataSourceID="SqlDataSource1"  OnRowDataBound="Item_Bound" EmptyDataText="û�в鵽�������������ݣ�" Width="100%"  CssClass="hkgv">
                                <Columns>
                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle Width="30px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="id" HeaderText="���ű���">
                                        <HeaderStyle CssClass="hidden" />
                                        <ItemStyle CssClass="hidden" />
                                        <FooterStyle CssClass="hidden" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nr" HeaderText="��������"></asp:BoundField>
                                    <asp:BoundField DataField="mc" HeaderText="��������" ReadOnly="true">
                                        <HeaderStyle Width="80px" />
                                        <ItemStyle HorizontalAlign="center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="�޸�" ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Update"
                                                ImageUrl="../../images/save.gif" AlternateText="�����޸�" />
                                            <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                                ImageUrl="../../images/cancel.gif" AlternateText="ȡ���޸�" />
                                        </EditItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle Width="80px" />
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                                ImageUrl="../../images/edit.gif" AlternateText="�޸Ĵ�����" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ɾ��" ShowHeader="False">
                                        <HeaderStyle Width="80px" />
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Delete"
                                                ImageUrl="../../images/del.gif" AlternateText="ɾ��������" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="���" Visible="False">
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
                            ��
                            <asp:Label ID="Msg" runat="server" ForeColor="#999999">0</asp:Label>
                            ��
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
    <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ErrorMessage="�������������"
        Display="Static" ControlToValidate="nr">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
