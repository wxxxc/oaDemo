<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kqsmlr.aspx.cs" Inherits="hkpro.oa.kqgl.Kqsmlr" %>

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
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                align="center">
                                <a href="Qjdlr.aspx" class="black">��ٵ�</a>
                            </td>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_y.gif)"
                                align="center">
                                <a href="Kqsmlr.aspx" class="mail_top">����˵��</a>
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
                            <td align="right">ͳ�����ͣ�
                            </td>
                            <td>
                                <asp:DropDownList ID="qdqt" runat="server" Width="150">
                                    <asp:ListItem Text="ȫ��" Value=""></asp:ListItem>
                                    <asp:ListItem Text="����ʾǩ��" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="����ʾǩ��" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="right">״̬��
                            </td>
                            <td>
                                <asp:DropDownList ID="smzt" runat="server" Width="150">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                    <asp:ListItem Text="¼��" Value="¼��"></asp:ListItem>
                                    <asp:ListItem Text="������" Value="������"></asp:ListItem>
                                    <asp:ListItem Text="������" Value="������"></asp:ListItem>
                                    <asp:ListItem Text="��ȷ��" Value="��ȷ��"></asp:ListItem>
                                    <asp:ListItem Text="���˻�" Value="���˻�"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="right">�������˵����
                            </td>
                            <td>
                                <asp:TextBox ID="kqqksm" runat="server" CssClass="mytext" Width="150"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">���ڣ�
                            </td>
                            <td colspan="5">
                                <asp:TextBox ID="qdsj_s" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                    Width="70"></asp:TextBox>��<asp:TextBox ID="qdsj_e" onclick="SelectDate(this,'yyyy-MM-dd')"
                                        runat="server" CssClass="mytext" Width="70"></asp:TextBox>
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="��ѯ" OnClick="Ref_Click"
                                    CausesValidation="False"></asp:Button>
                                <input type="button" name="AddBtn" value="����" class="mybtn" onclick="javascript: popAdd('Kqsmlr_Add.aspx');" />
                                <asp:Button CssClass="mybtn" ID="ClearBtn" runat="server" Text="���" CausesValidation="false"
                                    OnClick="Clear_Click"></asp:Button>
                                <asp:Image ID="Image1" runat="server" ImageUrl="../../images/help.gif" ToolTip="��ֻ�ܲ鿴���������¼��Ŀ���˵��" />
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
                                        <asp:TemplateField HeaderText="����">
                                            <HeaderStyle Width="80px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('Kqsmlr_Mod.aspx?id=<%# Eval("sid") %>')"
                                                    class="gvlink">
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("qdsj", "{0:yyyy-MM-dd}") %>'></asp:Label></a>
                                            </ItemTemplate>
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
                                        <asp:BoundField DataField="sqsj" HeaderText="¼��ʱ��" DataFormatString="{0:yyyy-MM-dd}"
                                            HtmlEncode="False">
                                            <HeaderStyle Width="80px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sscs" HeaderText="�������">
                                            <HeaderStyle Width="60px" />
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
