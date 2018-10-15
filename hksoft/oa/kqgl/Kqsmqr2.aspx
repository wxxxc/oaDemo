<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kqsmqr2.aspx.cs" Inherits="hkpro.oa.kqgl.Kqsmqr2" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>����˵��ȷ��</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" method="post" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td style="height: 10px"></td>
            </tr>
            <tr>
                <td valign="top" align="center">
                    <table cellspacing="0" cellpadding="0" border="0" width="100%">
                        <tr>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                align="center">
                                <a href="Kqsmqr.aspx" class="black">��ȷ�ϼ�¼</a>
                            </td>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_y.gif)"
                                align="center">
                                <a href="Kqsmqr2.aspx" class="mail_top">��ȷ�ϼ�¼</a>
                            </td>
                            <td align="right">
                                <asp:DropDownList ID="query_tj" runat="server">
                                    <asp:ListItem Value="sqrmc" Selected="True">������</asp:ListItem>
                                    <asp:ListItem Value="kqqksm">�������˵��</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="150"></asp:TextBox>
                                <asp:Button CssClass="mybtn" ID="Button1" runat="server" Text="�� ѯ" OnClick="Receive_Click"></asp:Button>
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                        EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                        <Columns>
                            <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="����">
                                <HeaderStyle Width="80px" />
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:popView('Kqsmqr2_View.aspx?id=<%# Eval("sssid") %>')"
                                        class="gvlink">
                                        <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("qdsj", "{0:yyyy-MM-dd}") %>'></asp:Label></a>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="ynqd1" HeaderText="����ǩ��">
                                <HeaderStyle Width="60px" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ynqt1" HeaderText="����ǩ��">
                                <HeaderStyle Width="60px" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ynqd2" HeaderText="����ǩ��">
                                <HeaderStyle Width="60px" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ynqt2" HeaderText="����ǩ��">
                                <HeaderStyle Width="60px" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ynqd3" HeaderText="����ǩ��">
                                <HeaderStyle Width="60px" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ynqt3" HeaderText="����ǩ��">
                                <HeaderStyle Width="60px" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="smzt" HeaderText="״̬">
                                <HeaderStyle Width="55px" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="kqqksm" HeaderText="�������˵��"></asp:BoundField>
                            <asp:BoundField DataField="sqrmc" HeaderText="������"></asp:BoundField>
                            <asp:BoundField DataField="sqbmmc" HeaderText="��������">
                                <HeaderStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="spsj" HeaderText="����ʱ��" DataFormatString="{0:yyyy-MM-dd}"
                                HtmlEncode="False">
                                <HeaderStyle Width="80px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="spzt" HeaderText="����״̬">
                                <HeaderStyle Width="60px" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="spyj" HeaderText="�������"></asp:BoundField>
                        </Columns>
                        <RowStyle CssClass="hkRowStyle" />
                        <HeaderStyle CssClass="hkHeadStyle" />
                        <AlternatingRowStyle CssClass="hkAltRowStyle" />
                        <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td style="height: 22px">
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                        ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
                        NumericButtonCount="10" FirstPageText="��ҳ" LastPageText="ĩҳ" NextPageText="��ҳ"
                        PrevPageText="��ҳ" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
                        InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go">
                    </webdiyer:AspNetPager>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
