<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kjfstb.aspx.cs" Inherits="hkpro.portal.kjfs.Kjfstb" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>��ݷ�ʽ</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="height: 10"></td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" border="0" width="98%" align="center">
                        <tr>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_y.gif)"
                                align="center">
                                <a href="Kjfstb.aspx" class="mail_top">��ݷ�ʽͼ��</a>
                            </td>
                            <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                <a href="Ggkjfs.aspx" class="black">������ݷ�ʽ</a>
                            </td>
                            <td align="right">&nbsp;
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0" class="form">
                        <tr>
                            <td>
                                <asp:Panel ID="panel2" runat="server" ScrollBars="none">
                                    ͼ�����ƣ�<asp:TextBox ID="name" runat="server" CssClass="mytext" Width="120px" MaxLength="20"></asp:TextBox>
                                    ͼƬ·����<input id="fj" runat="server" type="file" style="width: 200px;" class="mytext" />
                                </asp:Panel>
                            </td>
                            <td align="right">
                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" ErrorMessage="������ͼ������"
                                    Display="Static" ControlToValidate="name">&nbsp;
                                </asp:RequiredFieldValidator>
                            </td>
                            <td align="right">
                                <asp:Button ID="add" runat="Server" OnClick="Save_Click" CausesValidation="true"
                                    CssClass="btn btn-success" />
                                <asp:Button CssClass="btn btn-primary" ID="StopBtn" runat="server" Text="�� ��" OnClick="Stop_Click"
                                    CausesValidation="false" />
                                <asp:Button CssClass="btn btn-info" ID="PassBtn" runat="server" Text="�� ��" OnClick="Pass_Click"
                                    CausesValidation="false" />
                                <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
                                    ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td colspan="3">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="tbid"
                                    DataSourceID="SqlDataSource1" OnRowDataBound="Item_Bound" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
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
                                                    style="width: 16; height=16" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chk" runat="server" CssClass="mybox"></asp:CheckBox>
                                            </ItemTemplate>
                                            <HeaderStyle Width="30px" HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="tbid" HeaderText="����" ReadOnly="True">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="tbmc" HeaderText="ͼ������"></asp:BoundField>
                                        <asp:TemplateField HeaderText="ͼƬ">
                                            <ItemTemplate>
                                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("tblj", "../../attach/portal/quick/{0}") %>' />
                                            </ItemTemplate>
                                            <HeaderStyle Width="100px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="tbzt" HeaderText="״̬" ReadOnly="True">
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
                                                    ImageUrl="../../images/edit.gif" AlternateText="�޸Ĵ˿�ݷ�ʽ��ͼ��" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ɾ��" ShowHeader="False">
                                            <HeaderStyle Width="80px" />
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Delete"
                                                    OnClientClick="return confirm('�����Ҫɾ����')" ImageUrl="../../images/del.gif" AlternateText="ɾ���˿�ݷ�ʽ��ͼ��" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="���" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="dp_id" runat="server" Text='<%# Eval("tbid")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                                <br />
                                <font color="red">��ʾ���Ƽ�ʹ��50*50px��.gif��ʽ��ȥ������ɫ��ͼƬ����ͼƬ���Ʋ�Ҫ�ظ����⸲�ǣ�</font>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:haokeConnectionString %>">
            <UpdateParameters>
                <asp:Parameter Name="tbmc" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
