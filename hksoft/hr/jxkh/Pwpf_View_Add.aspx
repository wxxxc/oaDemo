<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pwpf_View_Add.aspx.cs"
    Inherits="hkpro.oa.jxkh.Pwpf_View_Add" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>

    <script type="text/javascript" src="../../CssJs/MyJs.js"></script>

    <title>��ί����</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td class="td_base" width="80%" height="25px">
                    �������ˣ�<asp:Label ID="lblbkpr" runat="server" ForeColor="Yellow"></asp:Label>
                </td>
                <td class="td_base" width="20%">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table border="0" cellpadding="0" cellspacing="0" align="center" class="form" width="100%">
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="mxid" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv" AllowPaging="false"
                                    ShowFooter="true">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="����" FooterText="�ϼ�">
                                            <HeaderStyle Width="30" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <FooterStyle HorizontalAlign="Center" Font-Bold="true" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblxmfl" runat="server" Text='<%# Bind("xmfl") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="������Ŀ">
                                            <HeaderStyle Width="60" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblxmmc" runat="server" Text='<%# Bind("ssxmmc") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="fz" HeaderText="��߷�ֵ">
                                            <HeaderStyle Width="60" />
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="��">
                                            <HeaderStyle Width="80" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblpfdj_y1" runat="server" Text='<%# Bind("pfdj_y") %>'></asp:Label>-<asp:Label
                                                    ID="lblpfdj_y2" runat="server" Text='<%# Bind("fz") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="��">
                                            <HeaderStyle Width="80" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblpfdj_l1" runat="server" Text='<%# Bind("pfdj_l") %>'></asp:Label>-<asp:Label
                                                    ID="lblpfdj_l2" runat="server" Text='<%# Bind("pfdj_y2") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="��">
                                            <HeaderStyle Width="80" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblpfdj_z1" runat="server" Text='<%# Bind("pfdj_z") %>'></asp:Label>-<asp:Label
                                                    ID="lblpfdj_z2" runat="server" Text='<%# Bind("pfdj_l2") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="��">
                                            <HeaderStyle Width="80" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblpfdj_c" runat="server" Text='<%# Bind("pfdj_c") %>'></asp:Label>����
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="kpxz" HeaderText="����ϸ��"></asp:BoundField>
                                        <asp:BoundField DataField="sjpf" HeaderText="ʵ������">
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="����">
                                            <HeaderStyle Width="40" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblgzry" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "pw_gzry")%>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblmxid" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "mxid")%>' Visible="false"></asp:Label>
                                                <a href="#" onclick="javascript:popMini('Pwpf_View_Pf.aspx?mxid=<%# Eval("mxid") %>&kpid=<%# Eval("sskpid") %>&bid=<%# Eval("ssbid") %>&xmid=<%# Eval("ssxmid") %>')"
                                                    class="gvlink"><asp:Label ID="lbltxt" runat="server"></asp:Label></a>
                                                <a href="#" onclick="javascript:popMini('Pwpf_View_Xg.aspx?mxid=<%# Eval("mxid") %>&kpid=<%# Eval("sskpid") %>&bid=<%# Eval("ssbid") %>&xmid=<%# Eval("ssxmid") %>')"
                                                    class="gvlink"><asp:Label ID="lbltxt2" runat="server"></asp:Label></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <FooterStyle CssClass="hkBottomStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item" style="width: 20%">
                                �������ֲο����ϣ�
                            </td>
                            <td style="width: 80%">
                                <asp:Label ID="fujian" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">
                                �����������֣�
                            </td>
                            <td>
                                �����ֵȼ�<asp:DropDownList ID="pflx" runat="server" Width="40">
                                    <asp:ListItem Text="��" Value="��"></asp:ListItem>
                                    <asp:ListItem Text="��" Value="��"></asp:ListItem>
                                    <asp:ListItem Text="��" Value="��"></asp:ListItem>
                                    <asp:ListItem Text="��" Value="��"></asp:ListItem>
                                </asp:DropDownList>
                                ������ֵΪ��׼���¸�<asp:TextBox ID="bfb" runat="server" Width="40" CssClass="mytext"></asp:TextBox>%����ȫ���������˵�����
                                <asp:Button CssClass="btn btn-primary" ID="SaveBtn" runat="server" Text="ȷ ��" OnClick="Save_Click">
                                </asp:Button>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 30" align="center">
                    <asp:Button CssClass="btn btn-danger" ID="CloseBtn" runat="server" Text="�� ��" OnClick="Close_Click" CausesValidation="false">
                    </asp:Button>
                </td>
            </tr>
        </tbody>
    </table>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    <asp:Label ID="lblpwlx" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="bfb"
        ErrorMessage="�������¸��ٷֱ�">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="�¸��ٷֱȱ����ǽ���0��100֮�����ֵ��"
        ControlToValidate="bfb" MinimumValue="0" MaximumValue="100" Type="Double">&nbsp;
    </asp:RangeValidator>
    </form>
</body>
</html>
