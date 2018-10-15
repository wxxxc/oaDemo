<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Xmwh_Lxr.aspx.cs" Inherits="hkpro.oa.xmgl.Xmwh_Lxr" %>

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
                <td class="td_base" width="80%" height="25px">������ϵ��
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
                        <tr align="center">
                            <td colspan="2">
                                <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center">
                                    <tr>
                                        <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                            align="center">
                                            <a href="xmwh_view.aspx?id=<%=xmid.Text %>" class="black">��Ŀ�嵥</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                            <a href="xmwh_gzjl.aspx?id=<%=xmid.Text %>" class="black">���ټ�¼</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/tab_b_y.gif)" align="center">
                                            <a href="xmwh_lxr.aspx?id=<%=xmid.Text %>" class="mail_top">��ϵ��</a>
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
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table border="0" cellpadding="0" cellspacing="0" align="center" width="100%" class="form">
                                    <tr>
                                        <td class="form-item" style="width: 20%">������
                                        </td>
                                        <td style="width: 30%">
                                            <asp:TextBox ID="xm" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                                        </td>
                                        <td class="form-item" style="width: 20%">�绰��
                                        </td>
                                        <td style="width: 30%">
                                            <asp:TextBox ID="dh" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">������λ��
                                        </td>
                                        <td>
                                            <asp:TextBox ID="gzdw" runat="server" CssClass="mytext" Width="90%" MaxLength="50"></asp:TextBox>
                                        </td>
                                        <td class="form-item">���ţ�
                                        </td>
                                        <td>
                                            <asp:TextBox ID="bm" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">ְ��
                                        </td>
                                        <td>
                                            <asp:TextBox ID="zw" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                                        </td>
                                        <td class="form-item">�ؼ���Ա��
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="gjry" runat="server" CssClass="mytext" Width="90%">
                                                <asp:ListItem Text="" Value="" Selected="true"></asp:ListItem>
                                                <asp:ListItem Text="��" Value="��"></asp:ListItem>
                                                <asp:ListItem Text="��" Value="��"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">E-mail��
                                        </td>
                                        <td>
                                            <asp:TextBox ID="mail" runat="server" CssClass="mytext" Width="90%" MaxLength="20"></asp:TextBox>
                                        </td>
                                        <td class="form-item">������ַ��
                                        </td>
                                        <td>
                                            <asp:TextBox ID="yzdz" runat="server" CssClass="mytext" Width="90%" MaxLength="50"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">��ע��
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="bz" runat="server" CssClass="mytext" Width="96%" MaxLength="125"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr>
                <td width="10">&nbsp;
                </td>
                <td>
                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                        DataSourceID="SqlDataSource1" DataKeyNames="lxrid" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                        <Columns>
                            <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="�޸�">
                                <HeaderStyle Width="40px" />
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <a href="xmwh_lxr.aspx?id=<%# Eval("xmid") %>&lxrid=<%# Eval("lxrid") %>">
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
                            <asp:BoundField DataField="xm" HeaderText="����">
                                <HeaderStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="bm" HeaderText="����">
                                <HeaderStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="zw" HeaderText="ְ��">
                                <HeaderStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="gzdw" HeaderText="������λ"></asp:BoundField>
                            <asp:BoundField DataField="dh" HeaderText="�绰">
                                <HeaderStyle Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="gjry" HeaderText="�ؼ���">
                                <HeaderStyle Width="60px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="���" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="dp_id" runat="server" Text='<%# Eval("lxrid")%>'></asp:Label>
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
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="xm"
            ErrorMessage="����������">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="dh"
            ErrorMessage="������绰">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:Label ID="xmid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lxrid" runat="server" Visible="false"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:haokeConnectionString %>"></asp:SqlDataSource>
    </form>
</body>
</html>
