<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qyggcx.aspx.cs" Inherits="hkpro.portal.xzgl.Qyggcx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�����ѯ</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 40px">���ټ�����<asp:DropDownList ID="query_tj" runat="server">
                                <asp:ListItem Value="ggzt">��������</asp:ListItem>
                                <asp:ListItem Value="ggnr">��������</asp:ListItem>
                                <asp:ListItem Value="zt">״̬</asp:ListItem>
                            </asp:DropDownList>
                                <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="100"></asp:TextBox>
                                <asp:DropDownList ID="lx" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Query_Click"
                                    Visible="false">
                                    <asp:ListItem Text="��ҵ����" Value="��ҵ"></asp:ListItem>
                                    <asp:ListItem Text="��Ӧ�̹���" Value="��Ӧ��"></asp:ListItem>
                                    <asp:ListItem Text="��Ա����" Value="��Ա"></asp:ListItem>
                                    <asp:ListItem Text="��ҵҵ������" Value="��ҵҵ��"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="right">
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="�� ѯ" OnClick="Query_Click"
                                    CausesValidation="False" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="ggid" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ggid" HeaderText="����">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                            <FooterStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="��������">
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popView('qygg_view.aspx?id=<%# Eval("ggid") %>')"
                                                    class="gvlink">
                                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("ggzt") %>'></asp:Label></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="lx" HeaderText="����">
                                            <HeaderStyle Width="60px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="��ֹ����">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="170px" />
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("kssj", "{0:yyyy-MM-dd}") %>'></asp:Label>��<asp:Label
                                                    ID="Label3" runat="server" Text='<%# Bind("jssj", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="zt" HeaderText="״̬">
                                            <HeaderStyle Width="60px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ui_desc" HeaderText="¼����">
                                            <HeaderStyle Width="90" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="¼��ʱ��">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="120px" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbllrsj" runat="server" Text='<%# Bind("lrsj", "{0:yyyy-MM-dd HH:mm}") %>'></asp:Label>
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
                            <td colspan="2" style="height: 22px">
                                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                    ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
                                    NumericButtonCount="10" FirstPageText="��ҳ" LastPageText="ĩҳ" NextPageText="��ҳ"
                                    PrevPageText="��ҳ" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
                                    InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go">
                                </webdiyer:AspNetPager>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
