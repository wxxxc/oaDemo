<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Yjxsz.aspx.cs" Inherits="hkpro.portal.xzgl.Yjxsz" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>���������</title>
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
                                <asp:ListItem Value="mc" Selected="True">���������</asp:ListItem>
                                <asp:ListItem Value="zt">״̬</asp:ListItem>
                                <asp:ListItem Value="lx">����</asp:ListItem>
                                <asp:ListItem Value="UserNames">�û���Χ</asp:ListItem>
                            </asp:DropDownList>
                                <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="100"></asp:TextBox>
                                <asp:DropDownList ID="lx" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Query_Click"
                                    Visible="false">
                                    <asp:ListItem Text="ֻ������ҵ�û�" Value="��ҵ"></asp:ListItem>
                                    <asp:ListItem Text="ֻ����Ӧ��" Value="��Ӧ��"></asp:ListItem>
                                    <asp:ListItem Text="ֻ����VIP��Ա" Value="��Ա"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="right">
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="�� ѯ" OnClick="Query_Click"
                                    CausesValidation="False" />
                                <input type="button" id="AddBtn" name="AddBtn" value="�� ��" class="mybtn" onclick="javascript: popAdd('yjxsz_add.aspx');"
                                    runat="server" />
                                <asp:Button CssClass="mybtn" ID="UseBtn" runat="server" Text="�� ��" OnClick="Use_Click"></asp:Button>
                                <asp:Button CssClass="mybtn" ID="StopBtn" runat="server" Text="ͣ ��" OnClick="Stop_Click"></asp:Button>
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
                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                            <HeaderTemplate>
                                                <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16; height: 16" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="���������">
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('yjxsz_mod.aspx?id=<%# Eval("id") %>')" class="gvlink">
                                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("mc") %>'></asp:Label></a>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ui_desc" HeaderText="����Ա">
                                            <HeaderStyle Width="100px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="lx" HeaderText="����">
                                            <HeaderStyle Width="50px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="zt" HeaderText="״̬">
                                            <HeaderStyle Width="50px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="UserNames" HeaderText="�û���Χ"></asp:BoundField>
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
