<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dxqx.aspx.cs" Inherits="hkpro.portal.dxgl.Dxqx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>������Ȩ</title>
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
                            <td style="height: 10px"></td>
                            <td align="right"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                    <tr>
                                        <td style="height: 21px; width: 91px; background-image: url(../../images/<%Response.Write(GetSelectImage("tab_b_n", "tab_b_y", ListType, 1)); %>.gif)"
                                            align="center">
                                            <asp:LinkButton ID="lbMyApprove" runat="server" CssClass="black" OnClick="YSQ_Click">����Ȩ�û�</asp:LinkButton>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/<%Response.Write(GetSelectImage("tab_b_n","tab_b_y",ListType,2)); %>.gif)"
                                            align="center">
                                            <asp:LinkButton ID="lbMyDocument" runat="server" CssClass="black" OnClick="WSQ_Click">δ��Ȩ�û�</asp:LinkButton>
                                        </td>
                                        <td align="right"></td>
                                        <td align="right">
                                            <asp:Button CssClass="mybtn" ID="CancelQX" runat="server" Text="ȡ��Ȩ��" OnClick="CancelQX_Click"></asp:Button>
                                            <asp:Button CssClass="mybtn" ID="AddQX" runat="server" Text="���Ȩ��" OnClick="AddQX_Click"
                                                Visible="false"></asp:Button>
                                        </td>
                                    </tr>
                                </table>
                                <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">
                                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                        DataKeyNames="ui_id" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
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
                                            <asp:BoundField DataField="ui_desc" HeaderText="����">
                                                <HeaderStyle Width="90px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="zwmc" HeaderText="ְλ">
                                                <HeaderStyle Width="90px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ui_yddh" HeaderText="�ƶ��绰">
                                                <HeaderStyle Width="100px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ui_bgdh" HeaderText="�칫�绰">
                                                <HeaderStyle Width="120px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ui_mail" HeaderText="Email��ַ"></asp:BoundField>
                                        </Columns>
                                        <RowStyle CssClass="hkRowStyle" />
                                        <HeaderStyle CssClass="hkHeadStyle" />
                                        <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                        <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                    </asp:GridView>
                                </asp:Panel>
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
