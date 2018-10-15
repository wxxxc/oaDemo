<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tpdc.aspx.cs" Inherits="hkpro.portal.tpgl.Tpdc" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>ͶƱ������Ŀ</title>
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
                            <td style="height: 40px">
                                <asp:DropDownList ID="lx" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Query_Click"
                                    Visible="false">
                                    <asp:ListItem Text="��ҵ" Value="��ҵ" Selected="true"></asp:ListItem>
                                    <asp:ListItem Text="��Ӧ��" Value="��Ӧ��"></asp:ListItem>
                                    <asp:ListItem Text="��Ա" Value="��Ա"></asp:ListItem>
                                    <asp:ListItem Text="��ҵҵ��" Value="��ҵҵ��"></asp:ListItem>
                                    <asp:ListItem Text="��ҵ�⻧" Value="��ҵ�⻧"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Label ID="label1" runat="server"></asp:Label><asp:Label ID="label2" runat="server"
                                    ForeColor="red"></asp:Label>
                            </td>
                            <td align="right">
                                <input type="button" name="AddBtn" value="�� ��" class="mybtn" onclick="javascript: popAdd('tpdc_view.aspx');" />
                                <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="ɾ ��" OnClick="Del_Click"
                                    OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')"></asp:Button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="id" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderStyle Width="30px"></HeaderStyle>
                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                            <HeaderTemplate>
                                                <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16; height: 16" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="id" HeaderText="����">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                            <FooterStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="��Ŀ����">
                                            <HeaderStyle Width="200px" />
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('tpdc_view.aspx?id=<%# Eval("id") %>')" class="gvlink">
                                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("ProjectName") %>'></asp:Label></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ProjectType" HeaderText="����">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="70px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ProjectTag" HeaderText="״̬">
                                            <HeaderStyle Width="70" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ProjectCom" HeaderText="��Ŀ˵��"></asp:BoundField>
                                        <asp:BoundField DataField="cjsj" HeaderText="����ʱ��">
                                            <HeaderStyle Width="140" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
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
