<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Xmwh_Gzjl.aspx.cs" Inherits="hkpro.oa.xmgl.Xmwh_Gzjl" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>��Ŀά��</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td_base" width="80%" height="25px">�������ټ�¼
                </td>
                <td class="td_base" width="20%"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <table cellspacing="0" cellpadding="0" width="98%" border="0" align="center">
                        <tr>
                            <td style="height: 10px"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center">
                                    <tr>
                                        <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                            align="center">
                                            <a href="xmwh_view.aspx?id=<%=xmid.Text %>" class="black">��Ŀ�嵥</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/tab_b_y.gif)" align="center">
                                            <a href="xmwh_gzjl.aspx?id=<%=xmid.Text %>" class="mail_top">���ټ�¼</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                            <a href="xmwh_lxr.aspx?id=<%=xmid.Text %>" class="black">��ϵ��</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                            <a href="xmwh_fj.aspx?id=<%=xmid.Text %>" class="black">��Ŀ����</a>
                                        </td>
                                        <td align="right" colspan="4">
                                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="����" OnClick="Save_Click"></asp:Button>
                                            <asp:Button ID="PrnBtn" runat="server" Text="��ӡ" CssClass="mybtn" CausesValidation="false"></asp:Button>
                                            <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript: window.close()" />
                                        </td>
                                    </tr>
                                </table>
                                <table border="0" cellpadding="0" cellspacing="0" align="center" width="100%" class="form">
                                    <tr>
                                        <td class="form-item" style="width: 20%">�������ڣ�
                                        </td>
                                        <td style="width: 30%">
                                            <asp:TextBox ID="gzrq" runat="server" CssClass="mytext" Width="90%" onclick="SelectDate(this,'yyyy-MM-dd')"
                                                MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td class="form-item" style="width: 20%">���ټ�����
                                        </td>
                                        <td style="width: 30%">
                                            <asp:TextBox ID="gzztjs" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">����״̬������
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="gzztxs" runat="server" CssClass="mytext" Width="96%" MaxLength="50"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">������
                                        </td>
                                        <td colspan="3">
                                            <input id="fj" runat="server" type="file" style="width: 96%;" class="mytext" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataSourceID="SqlDataSource1" DataKeyNames="gzid" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="5%" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="gzrq" HeaderText="��������" DataFormatString="{0:yyyy-MM-dd}"
                                            HtmlEncode="False">
                                            <HeaderStyle Width="90px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="gzztjs" HeaderText="����״̬����"></asp:BoundField>
                                        <asp:BoundField DataField="gzztxs" HeaderText="����״̬����"></asp:BoundField>
                                        <asp:BoundField DataField="gzfjmc" HeaderText="����"></asp:BoundField>
                                        <asp:TemplateField HeaderText="����">
                                            <HeaderStyle Width="40px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <a href="../..<%# Eval("gzfjlj") %><%# Eval("gzfjmc") %>" target="_blank">
                                                    <asp:Image ID="Image111" runat="server" ImageUrl='../../images/down_s.gif' ToolTip="���ظ���������" /></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="�޸�">
                                            <HeaderStyle Width="40px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <a href="xmwh_gzjl.aspx?id=<%# Eval("xmid") %>&gzid=<%# Eval("gzid") %>">
                                                    <asp:Image ID="Image112" runat="server" ImageUrl='../../images/edit.gif' ToolTip="�޸�������¼" /></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ɾ��" ShowHeader="False">
                                            <HeaderStyle Width="40px" />
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Delete"
                                                    OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" ImageUrl="../../images/del.gif" AlternateText="ɾ��������" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="���" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="dp_id" runat="server" Text='<%# Eval("gzid")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <FooterStyle CssClass="hkBottomStyle" />
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
        <asp:Label ID="xmid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="gzid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="savelj" Visible="false" runat="server"></asp:Label>
        <asp:Label ID="lblAttachSize" runat="server" Visible="false"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:haokeConnectionString %>"></asp:SqlDataSource>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="gzrq"
            ErrorMessage="�������������">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="gzztjs"
            ErrorMessage="���������״̬����">&nbsp;
        </asp:RequiredFieldValidator>
    </form>
</body>
</html>
