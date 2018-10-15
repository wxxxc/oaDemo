<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lxwh.aspx.cs" Inherits="hkpro.portal.csxx.Lxwh" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>�Զ�������</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 40px; width: 220">��ѡ�����ͣ�<asp:DropDownList ID="xzlx" runat="server" OnSelectedIndexChanged="ChangeType"
                                AutoPostBack="True" Width="120">
                            </asp:DropDownList>
                            </td>
                            <td align="right">
                                <asp:Panel ID="panel2" runat="server" ScrollBars="none">
                                    �������ƣ�<asp:TextBox ID="name" runat="server" CssClass="mytext" Width="110px" MaxLength="50"></asp:TextBox>
                                </asp:Panel>
                            </td>
                            <td align="right">
                                <asp:Button ID="add" runat="Server" OnClick="Save_Click" CausesValidation="true"
                                    CssClass="btn btn-success" />
                                <asp:Button CssClass="btn btn-primary" ID="StopBtn" runat="server" Text="�� ��" OnClick="Stop_Click"
                                    CausesValidation="false" />
                                <asp:Button CssClass="btn btn-info" ID="PassBtn" runat="server" Text="�� ��" OnClick="Pass_Click"
                                    CausesValidation="false" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1"
                                    OnRowDataBound="OnRow_Bound" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="checkbox" name="chkall" id="chkall" title="ȫѡ��ȡ��" onclick="CheckAll(this.form)"
                                                    style="width: 16; height: 16" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chk" runat="server" CssClass="mybox"></asp:CheckBox>
                                            </ItemTemplate>
                                            <HeaderStyle Width="30px" HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="id" HeaderText="���ͱ���" ReadOnly="True">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="mc" HeaderText="��������"></asp:BoundField>
                                        <asp:BoundField DataField="zt" HeaderText="״̬" ReadOnly="True">
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
                                                    OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" ImageUrl="../../images/del.gif" AlternateText="ɾ��������" />
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
        <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" ErrorMessage="��������������"
            Display="Static" ControlToValidate="name">&nbsp;
        </asp:RequiredFieldValidator>
    </form>
</body>
</html>
