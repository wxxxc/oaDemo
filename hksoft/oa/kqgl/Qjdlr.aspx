<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qjdlr.aspx.cs" Inherits="hkpro.oa.kqgl.Qjdlr" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>�ҵĿ���</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="height: 10px"></td>
            </tr>
            <tr>
                <td valign="top" align="center">
                    <table cellspacing="0" cellpadding="0" border="0" width="98%">
                        <tr>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                align="center">
                                <a href="Wdkq.aspx" class="black">�ϰ�/�°�</a>
                            </td>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_y.gif)"
                                align="center">
                                <a href="Qjdlr.aspx" class="mail_top">��ٵ�</a>
                            </td>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                align="center">
                                <a href="Kqsmlr.aspx" class="black">����˵��</a>
                            </td>
                            <td align="right">&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="2" width="98%" border="0" class="form" align="center">
                        <tr>
                            <td style="height: 25px" colspan="6">
                                <asp:Label ID="lblkyjq" Font-Bold="true" ForeColor="Green" Font-Size="Medium" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label3" Font-Bold="true" ForeColor="Red" Font-Size="Medium" runat="server">����ʣ����ڣ��¼�</asp:Label><asp:Label
                                ID="shj" Font-Bold="true" ForeColor="Red" Font-Size="Medium" runat="server"></asp:Label><asp:Label
                                    ID="Label5" Font-Bold="true" ForeColor="Red" Font-Size="Medium" runat="server">��&nbsp;</asp:Label><asp:Label
                                        ID="Label6" Font-Bold="true" ForeColor="Red" Font-Size="Medium" runat="server">����</asp:Label><asp:Label
                                            ID="bj" Font-Bold="true" ForeColor="Red" Font-Size="Medium" runat="server"></asp:Label><asp:Label
                                                ID="Label8" Font-Bold="true" ForeColor="Red" Font-Size="Medium" runat="server">��&nbsp;</asp:Label><asp:Label
                                                    ID="lblnj1" Font-Bold="true" ForeColor="Red" Font-Size="Medium" runat="server">���</asp:Label><asp:Label
                                                        ID="nj" Font-Bold="true" ForeColor="Red" Font-Size="Medium" runat="server"></asp:Label><asp:Label
                                                            ID="lblnj2" Font-Bold="true" ForeColor="Red" Font-Size="Medium" runat="server">��&nbsp;</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">������ͣ�<asp:DropDownList ID="qjlx" runat="server">
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
                                ״̬��<asp:DropDownList ID="qjzt" runat="server">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                    <asp:ListItem Text="¼��" Value="¼��"></asp:ListItem>
                                    <asp:ListItem Text="������" Value="������"></asp:ListItem>
                                    <asp:ListItem Text="������" Value="������"></asp:ListItem>
                                    <asp:ListItem Text="��ȷ��" Value="��ȷ��"></asp:ListItem>
                                    <asp:ListItem Text="���˻�" Value="���˻�"></asp:ListItem>
                                </asp:DropDownList>
                                ��ٿ�ʼʱ�䣺<asp:TextBox ID="qjkssj_s" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                    CssClass="mytext" Width="70"></asp:TextBox>��<asp:TextBox ID="qjkssj_e" onclick="SelectDate(this,'yyyy-MM-dd')"
                                        runat="server" CssClass="mytext" Width="70"></asp:TextBox>
                                ������ɣ�<asp:TextBox ID="qjly" runat="server" CssClass="mytext" Width="150"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="��ѯ"
                                    OnClick="Ref_Click" CausesValidation="False"></asp:Button>
                                <input type="button" name="AddBtn" value="����" class="mybtn" onclick="javascript: popAdd('Qjdlr_Add.aspx');" />
                                <asp:Button CssClass="mybtn" ID="ClearBtn" runat="server" Text="���"
                                    CausesValidation="false" OnClick="Clear_Click"></asp:Button>
                                <asp:Image ID="Image1" runat="server" ImageUrl="../../images/help.gif" ToolTip="��ֻ�ܲ鿴���������¼�����ٵ�" />
                                <asp:Label ID="lblmsg" runat="server" Text="���ѣ��¼�ÿ�²�����1�죬ÿ���Ȳ�����2�죻����ÿ�²�����0.5��" Font-Size="Small"
                                    ForeColor="Red"></asp:Label>
                            </td>
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
                                        <asp:TemplateField HeaderText="�������">
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('Qjdlr_Mod.aspx?id=<%# Eval("qid") %>')" class="gvlink">
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("qjly") %>'></asp:Label></a>
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
                                        <asp:BoundField DataField="gztzqk" HeaderText="�����������"></asp:BoundField>
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
