<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qjdcx.aspx.cs" Inherits="hkpro.oa.kqgl.Qjdcx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>��ٵ���ѯ</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="2" width="800" border="0">
                        <tr>
                            <td style="height: 5px" colspan="6"></td>
                        </tr>
                        <tr>
                            <td align="right">������ͣ�
                            </td>
                            <td>
                                <asp:DropDownList ID="qjlx" runat="server" Width="150">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                    <asp:ListItem Text="���" Value="���"></asp:ListItem>
                                    <asp:ListItem Text="̽�׼�" Value="̽�׼�"></asp:ListItem>
                                    <asp:ListItem Text="���" Value="���"></asp:ListItem>
                                    <asp:ListItem Text="ɥ��" Value="ɥ��"></asp:ListItem>
                                    <asp:ListItem Text="����" Value="����"></asp:ListItem>
                                    <asp:ListItem Text="����" Value="����"></asp:ListItem>
                                    <asp:ListItem Text="�¼�" Value="�¼�"></asp:ListItem>
                                    <asp:ListItem Text="����" Value="����"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="right">ѡ���ţ�
                            </td>
                            <td>
                                <asp:DropDownList ID="bm" runat="server" CssClass="mytext" Width="150" AutoPostBack="true"
                                    OnSelectedIndexChanged="bm_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td align="right">����ˣ�
                            </td>
                            <td>
                                <asp:DropDownList ID="ry" runat="server" CssClass="mytext" Width="150">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">״̬��
                            </td>
                            <td>
                                <asp:DropDownList ID="qjzt" runat="server" Width="150">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                    <asp:ListItem Text="¼��" Value="¼��"></asp:ListItem>
                                    <asp:ListItem Text="������" Value="������"></asp:ListItem>
                                    <asp:ListItem Text="������" Value="������"></asp:ListItem>
                                    <asp:ListItem Text="��ȷ��" Value="��ȷ��"></asp:ListItem>
                                    <asp:ListItem Text="���˻�" Value="���˻�"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="right">��ٿ�ʼʱ�䣺
                            </td>
                            <td colspan="3">
                                <asp:TextBox ID="qjkssj_s" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                    CssClass="mytext" Width="70"></asp:TextBox>��<asp:TextBox ID="qjkssj_e" onclick="SelectDate(this,'yyyy-MM-dd')"
                                        runat="server" CssClass="mytext" Width="70"></asp:TextBox>
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="��ѯ"
                                    OnClick="Ref_Click" CausesValidation="False"></asp:Button>
                                <asp:Button CssClass="mybtn" ID="ExpBtn" runat="server" Text="����" OnClick="Exp_Click" />
                                <asp:Button CssClass="mybtn" ID="ClearBtn" runat="server" Text="���"
                                    CausesValidation="false" OnClick="Clear_Click"></asp:Button>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 5px" colspan="6"></td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td colspan="2">
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
                                        <asp:TemplateField HeaderText="�����">
                                            <HeaderStyle Wrap="false" />
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popView('Qjdcx_View.aspx?id=<%# Eval("qid") %>')"
                                                    class="gvlink">
                                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("sqrmc") %>'></asp:Label></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="qjlx" HeaderText="����">
                                            <HeaderStyle Width="60px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="��ʼ����">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("qjkssj", "{0:yyyy-MM-dd}") %>'></asp:Label>(<asp:Label
                                                    ID="Label7" runat="server" Text='<%# Bind("qjkssd") %>'></asp:Label>)
                                            </ItemTemplate>
                                            <HeaderStyle Width="120px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="��ֹ����">
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("qjjssj", "{0:yyyy-MM-dd}") %>'></asp:Label>(<asp:Label
                                                    ID="Label8" runat="server" Text='<%# Bind("qjjssd") %>'></asp:Label>)
                                            </ItemTemplate>
                                            <HeaderStyle Width="120px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="qjts" HeaderText="�������">
                                            <HeaderStyle Width="60px" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="qjzt" HeaderText="״̬">
                                            <HeaderStyle Width="55px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="qjly" HeaderText="�������"></asp:BoundField>
                                        <asp:BoundField DataField="gztzqk" HeaderText="�����������">
                                            <HeaderStyle Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sqbmmc" HeaderText="��������">
                                            <ItemStyle Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sqsj" HeaderText="¼��ʱ��" DataFormatString="{0:yyyy-MM-dd}"
                                            HtmlEncode="False">
                                            <HeaderStyle Width="80px" />
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
