<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wdmp.aspx.cs" Inherits="hkpro.oa.mpgl.Wdmp" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�ҵ���Ƭ��</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="../../cssjs/mypc.css" />
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
                                <asp:ListItem Value="xm" Selected="True">����</asp:ListItem>
                                <asp:ListItem Value="zw">ְ��</asp:ListItem>
                                <asp:ListItem Value="gsdh">��˾�绰</asp:ListItem>
                                <asp:ListItem Value="czdh">����绰</asp:ListItem>
                                <asp:ListItem Value="gsmc">��˾����</asp:ListItem>
                                <asp:ListItem Value="gsdz">��˾��ַ</asp:ListItem>
                                <asp:ListItem Value="yzbm">��������</asp:ListItem>
                                <asp:ListItem Value="w_mail">��������</asp:ListItem>
                                <asp:ListItem Value="hylb">��ҵ���</asp:ListItem>
                                <asp:ListItem Value="xz">����</asp:ListItem>
                                <asp:ListItem Value="mplx">��Ƭ����</asp:ListItem>
                                <asp:ListItem Value="gswz">��˾��ַ</asp:ListItem>
                                <asp:ListItem Value="bmmc">��������</asp:ListItem>
                                <asp:ListItem Value="zzdh">סլ�绰</asp:ListItem>
                                <asp:ListItem Value="h_mail">��������</asp:ListItem>
                                <asp:ListItem Value="yddh">�ƶ��绰</asp:ListItem>
                                <asp:ListItem Value="msn">MSN��</asp:ListItem>
                                <asp:ListItem Value="qq">QQ��</asp:ListItem>
                            </asp:DropDownList>
                                <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="100"></asp:TextBox>
                                &nbsp;<asp:CheckBox ID="qtyh" Text="��ʾ�����û��Ĺ�����Ƭ" runat="server"></asp:CheckBox>
                            </td>
                            <td align="right">
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="��ѯ" OnClick="Query_Click"
                                    CausesValidation="False" />
                                <input type="button" name="AddBtn" value="����" class="mybtn" onclick="javascript: popAdd('wdmp_add.aspx');" />
                                <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click"
                                    OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')"></asp:Button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                    <div class="mytable table-responsive">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="id" EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="mw30"  />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderStyle Width="30px"></HeaderStyle>
                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                            <HeaderTemplate>
                                                <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" />
                                                   <HeaderStyle CssClass="mw30"  />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="id" HeaderText="���">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                            <FooterStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="����">
                                            <HeaderStyle CssClass="mw60" />
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('wdmp_mod.aspx?id=<%# Eval("id") %>')" class="gvlink">
                                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("xm") %>'></asp:Label></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="zw" HeaderText="ְ��">
                                            <HeaderStyle CssClass="mw80" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="gsmc" HeaderText="��˾����">
                                              <HeaderStyle CssClass="mwp30" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="gsdh" HeaderText="��˾�绰">
                                            <HeaderStyle CssClass="mw100" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="mplx" HeaderText="��Ƭ����">
                                            <HeaderStyle CssClass="mw80" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="gsdz" HeaderText="��˾��ַ">
                                              <HeaderStyle CssClass="mwp30" />
                                        </asp:BoundField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                                        </div>
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
