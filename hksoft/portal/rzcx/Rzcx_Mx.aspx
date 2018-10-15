<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rzcx_Mx.aspx.cs" Inherits="hkpro.portal.rzcx.Rzcx_Mx1" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��־��ѯ</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server" method="post">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="height: 10"></td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" border="0" width="98%" align="center">
                        <tr>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                align="center">
                                <a href="rzcx.aspx" class="black">��¼��־����</a>
                            </td>
                            <td style="width: 91px; background-image: url(../../images/tab_b_y.gif)" align="center">
                                <a href="rzcx_mx.aspx" class="mail_top">��¼��־��ϸ</a>
                            </td>
                            <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                <a href="rzcx_cz.aspx" class="black">������־��ϸ</a>
                            </td>
                            <td align="right">&nbsp;
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0" class="form">
                        <tr>
                            <td align="right">������Ա��
                            </td>
                            <td>
                                <asp:TextBox ID="rysq" runat="server" CssClass="mytext" Width="150px" />&nbsp;<img
                                    src="../../images/choose.gif" onclick="openA('../../choose/portal/yhview.aspx?id=rysq2')"
                                    alt="ѡ��Ҫ��ѯ�Ĳ�����Ա" />
                            </td>
                            <td align="right">ģ����룺
                            </td>
                            <td>
                                <asp:TextBox ID="jrmk" runat="server" CssClass="mytext" Width="150px" />
                            </td>
                            <td align="right">IP��ַ��
                            </td>
                            <td>
                                <asp:TextBox ID="ipdz" runat="server" CssClass="mytext" Width="150px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">��¼״̬��
                            </td>
                            <td colspan="5">
                                <asp:DropDownList ID="dlzt" runat="server">
                                    <asp:ListItem Text="" Value="" Selected="true"></asp:ListItem>
                                    <asp:ListItem Text="��¼ϵͳ" Value="��¼ϵͳ"></asp:ListItem>
                                    <asp:ListItem Text="ע��ϵͳ" Value="ע��ϵͳ"></asp:ListItem>
                                </asp:DropDownList>
                                �������ڣ�<asp:TextBox ID="txtSdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                    CssClass="mytext" Width="70"></asp:TextBox>��<asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')"
                                        runat="server" CssClass="mytext" Width="70"></asp:TextBox>
                                ��¼��ڣ�<asp:DropDownList ID="dl_rk" runat="server">
                                    <asp:ListItem Text="ȫ��" Value=""></asp:ListItem>
                                    <asp:ListItem Text="PC" Value="PC"></asp:ListItem>
                                    <asp:ListItem Text="WebAPP" Value="WebAPP"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button CssClass="btn btn-info" ID="QueryBtn" runat="server" Text="��ѯ" CausesValidation="true"
                                    OnClick="Query_Click"></asp:Button>
                                <asp:Button CssClass="btn btn-warning" ID="ClearBtn" runat="server" Text="���" CausesValidation="true"
                                    OnClick="Clear_Click"></asp:Button>
                                <asp:Button CssClass="btn btn-success" ID="ExpBtn" runat="server" Text="����" OnClick="Exp_Click" />
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="dl_id" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="dl_rq" HeaderText="��������" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"
                                            HtmlEncode="False">
                                            <HeaderStyle Width="140px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="dl_id" HeaderText="�û�����">
                                            <HeaderStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="�û�����">
                                            <HeaderStyle Width="80px" />
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="dl_ip" HeaderText="IP��ַ"></asp:BoundField>
                                        <asp:BoundField DataField="dl_port" HeaderText="�˿ں�"></asp:BoundField>
                                        <asp:BoundField DataField="dl_zt" HeaderText="��¼״̬">
                                            <HeaderStyle Width="80px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="����ģ��">
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("open_mk") %>'></asp:Label>-<asp:Label
                                                    ID="Label5" runat="server" Text='<%# Bind("modu_mc") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="dl_rk" HeaderText="��¼���">
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
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSdate"
            ErrorMessage="�������������(��)">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEdate"
            ErrorMessage="�������������(��)">&nbsp;
        </asp:RequiredFieldValidator>
    </form>
</body>
</html>
