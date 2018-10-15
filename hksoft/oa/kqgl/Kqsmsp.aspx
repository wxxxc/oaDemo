<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kqsmsp.aspx.cs" Inherits="hkpro.oa.kqgl.Kqsmsp" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>����˵������</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
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
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_y.gif)"
                                align="center">
                                <a href="Kqsmsp.aspx" class="mail_top">��������¼</a>
                            </td>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                align="center">
                                <a href="Kqsmsp2.aspx" class="black">��������¼</a>
                            </td>
                            <td align="right">
                                <asp:DropDownList ID="query_tj" runat="server">
                                    <asp:ListItem Value="sqrmc" Selected="True">������</asp:ListItem>
                                    <asp:ListItem Value="kqqksm">�������˵��</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="150"></asp:TextBox>
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="�� ѯ" OnClick="Query_Click"></asp:Button>
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                        EmptyDataText="û�в鵽�������������ݣ�" DataKeyNames="sid" Width="100%" CssClass="hkgv">
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
                            <asp:TemplateField HeaderText="����">
                                <HeaderStyle Width="80px" />
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:popView('Kqsmsp_View.aspx?id=<%# Eval("sid") %>')"
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
                            <asp:BoundField DataField="sqbmmc" HeaderText="��������"></asp:BoundField>
                            <asp:BoundField DataField="sssj" HeaderText="����ʱ��" DataFormatString="{0:yyyy-MM-dd}"
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
                <td style="height: 22px">
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                        ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
                        NumericButtonCount="10" FirstPageText="��ҳ" LastPageText="ĩҳ" NextPageText="��ҳ"
                        PrevPageText="��ҳ" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
                        InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go">
                    </webdiyer:AspNetPager>
                </td>
            </tr>
            <tr style="height: 25px">
                <td>&nbsp;<font color="red">*</font>���������<asp:TextBox ID="spyj" runat="server" Width="150"
                    CssClass="mytext" /><img src="../../images/choose.gif" onclick="openA('../../choose/portal/Spyjview.aspx')"
                        alt="ѡ��ϵͳ�ṩ���������" />
                    <asp:DropDownList ID="jsr" CssClass="mytext" runat="server" AutoPostBack="true" OnSelectedIndexChanged="jsr_Changed"
                        ToolTip="��ʾӵ�п�������Ȩ�޵���Ա">
                    </asp:DropDownList>
                    <asp:DropDownList ID="kqry" CssClass="mytext" runat="server" Visible="false" ToolTip="��ʾ��Ҫ���ս��п���ȷ�ϵ���Ա">
                        <asp:ListItem Text="ѡ���ڹ�����Ա" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="height: 25px">&nbsp;<asp:Button CssClass="mybtn" ID="PassBtn" runat="server" Text="����ͨ��" OnClick="Pass_Click"></asp:Button>
                    <asp:CheckBox ID="xxtz" runat="server" Text="վ����Ϣ֪ͨ��һ��������" Checked="true" />
                    <asp:CheckBox ID="dxtz" runat="server" Text="�ֻ�����֪ͨ��һ��������" />
                </td>
            </tr>
        </table>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="spyj"
            ErrorMessage="�������������">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="jsr"
            ErrorMessage="��ѡ����һ��������">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="kqry"
            ErrorMessage="��ѡ���ڹ�����Ա">&nbsp;
        </asp:RequiredFieldValidator>
    </form>
</body>
</html>
