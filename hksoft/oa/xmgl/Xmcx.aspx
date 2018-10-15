<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Xmcx.aspx.cs" Inherits="hkpro.oa.xmgl.Xmcx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��Ŀ��ѯ</title>
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
                            <td colspan="4" style="height: 5px"></td>
                        </tr>
                        <tr>
                            <td align="right" style="height: 25px">��Ŀ���ƣ�
                            </td>
                            <td>
                                <asp:TextBox ID="xmmc" runat="server" CssClass="mytext" Width="150px" />
                            </td>
                            <td align="right" style="height: 25px">����ʡ�ݣ�
                            </td>
                            <td>
                                <asp:TextBox ID="sssf" runat="server" CssClass="mytext" Width="150px" />
                            </td>
                            <td align="right" style="height: 25px">�������У�
                            </td>
                            <td>
                                <asp:TextBox ID="sscs" runat="server" CssClass="mytext" Width="150px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="height: 25px">��Ŀ���ȣ�
                            </td>
                            <td>
                                <asp:DropDownList ID="xmjd" runat="server" Width="150px">
                                    <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="�����Ա���" Value="�����Ա���"></asp:ListItem>
                                    <asp:ListItem Text="�쵼ͬ��" Value="�쵼ͬ��"></asp:ListItem>
                                    <asp:ListItem Text="��˾ͨ��" Value="��˾ͨ��"></asp:ListItem>
                                    <asp:ListItem Text="˫��Э��" Value="˫��Э��"></asp:ListItem>
                                    <asp:ListItem Text="ǩ��Э��" Value="ǩ��Э��"></asp:ListItem>
                                    <asp:ListItem Text="��Ŀ���" Value="��Ŀ���"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td></td>
                            <td colspan="3">
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="��ѯ" OnClick="Query_Click"
                                    CausesValidation="False" />
                                <asp:Button ID="PrnBtn" runat="server" Text="��ӡ" CssClass="mybtn"></asp:Button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 5px"></td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="xmid" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="��Ŀ����">
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('xmcx_view.aspx?id=<%# Eval("xmid") %>')"
                                                    class="gvlink">
                                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("xmmc") %>'></asp:Label></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="xmjd" HeaderText="��Ŀ����">
                                            <HeaderStyle Width="100px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sssf" HeaderText="����ʡ��">
                                            <HeaderStyle Width="120px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sscs" HeaderText="��������">
                                            <HeaderStyle Width="120px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="cjsj" HeaderText="����ʱ��" DataFormatString="{0:yyyy-MM-dd}"
                                            HtmlEncode="False">
                                            <HeaderStyle Width="120px" />
                                            <ItemStyle HorizontalAlign="Center" />
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
