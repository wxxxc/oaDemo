<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dxtj.aspx.cs" Inherits="hkpro.portal.dxgl.Dxtj" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>����ͳ��</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server" method="post">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 40px">ͳ�Ʒ�ʽ:<asp:DropDownList ID="tjfs" runat="server" AutoPostBack="true" OnSelectedIndexChanged="tjfs_SelectedIndexChanged">
                                <asp:ListItem Value="zt" Text="���û�"></asp:ListItem>
                                <asp:ListItem Value="bm" Text="������"></asp:ListItem>
                            </asp:DropDownList>
                                <asp:Label ID="lbltitle" runat="server" Text="Ա���Ż�����:"></asp:Label><asp:TextBox ID="user"
                                    runat="server" CssClass="mytext" Width="80"></asp:TextBox>
                                ����ʱ��:<asp:TextBox ID="txtSdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                    CssClass="mytext" Width="80"></asp:TextBox>��<asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')"
                                        runat="server" CssClass="mytext" Width="80"></asp:TextBox>
                                ���ͽ��:<asp:DropDownList ID="fsjg" runat="server">
                                    <asp:ListItem Value="" Text="ȫ��"></asp:ListItem>
                                    <asp:ListItem Value="0" Text="δ����"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="���ͳɹ�"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="����ʧ��"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="�� ѯ" OnClick="Query_Click"></asp:Button>
                                <asp:Button CssClass="mybtn" ID="OutBtn" runat="server" Text="�� ��" OnClick="Out_Click"></asp:Button>
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound1" AutoGenerateColumns="False"
                                    EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="60px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="��������">
                                            <ItemTemplate>
                                                <asp:Label ID="Labelnr" runat="server" Text='<%# Bind("bm_mc") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="���Ͷ�������">
                                            <HeaderStyle Width="250px" />
                                            <ItemStyle HorizontalAlign="Right" />
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("nums") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                                <asp:GridView ID="GridView2" runat="server" OnRowDataBound="OnRow_Bound2" AutoGenerateColumns="False"
                                    EmptyDataText="û�в鵽�������������ݣ�"
                                    Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="60px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="�û�����">
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popView('dxtj_view.aspx?yh=<%# Eval("sSender") %>&mc=<%# Eval("ui_desc") %>&sd=<%=Data1 %>&ed=<%=Data2 %>')"
                                                    class="gvlink">
                                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("sSender") %>'></asp:Label></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ui_desc" HeaderText="�û�����"></asp:BoundField>
                                        <asp:BoundField DataField="bm_mc" HeaderText="����"></asp:BoundField>
                                        <asp:TemplateField HeaderText="���Ͷ�������">
                                            <HeaderStyle Width="150px" />
                                            <ItemStyle HorizontalAlign="Right" />
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("nums") %>'></asp:Label>
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
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSdate"
            ErrorMessage="��ѡ��ʼ����">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEdate"
            ErrorMessage="��ѡ���ֹ����">&nbsp;
        </asp:RequiredFieldValidator>
    </form>
</body>
</html>
