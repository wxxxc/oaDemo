<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bkpr_View_pfxm.aspx.cs"
    Inherits="hkpro.oa.jxkh.Bkpr_View_pfxm" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>

    <script type="text/javascript" src="../../CssJs/MyJs.js"></script>

    <title>��������ά��</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td class="td_base" width="80%" height="25px">
                    �������˵�������Ŀ
                </td>
                <td class="td_base" width="20%">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table id="search" cellspacing="0" cellpadding="0" width="98%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td style="height: 10px">
                                </td>
                                <td align="left">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="left">
                                    <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center">
                                        <tr>
                                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                                align="center">
                                                <a href="Bkpr_View.aspx?id=<%=bid.Text %>" class="black">������Ϣ</a>
                                            </td>
                                            <td style="width: 91px; background-image: url(../../images/tab_b_y.gif)" align="center">
                                                <a href="#" class="mail_top">������Ŀ��Ϣ</a>
                                            </td>
                                            <td align="right">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                    <table border="0" cellpadding="0" cellspacing="0" align="center" class="form" width="100%">
                                        <tr>
                                            <td>
                                                ������Ŀ��<asp:DropDownList ID="ssxmid" runat="server" Width="150px" 
                                                    AutoPostBack="true" onselectedindexchanged="ssxmid_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                ��ֵ��<asp:TextBox CssClass="mytext" ID="fz" runat="server" Width="60px"></asp:TextBox>
                                                ����ϸ��<asp:TextBox ID="kpxz" runat="server" CssClass="mytext" Width="120px"></asp:TextBox>
                                                <asp:Button CssClass="btn btn-primary" ID="SaveBtn" runat="server" Text="���" OnClick="Save_Click"
                                                    AccessKey="s"></asp:Button>
                                                <asp:Button CssClass="btn btn-danger" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" CausesValidation="false"></asp:Button>
                                                <input type="button" name="BackBtn" value="�ر�" class="btn btn-warning" onclick="javascript:window.close()"
                                                    accesskey="q" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                ���ֵȼ�����&gt;=<asp:TextBox CssClass="mytext" ID="pfdj_y" runat="server" Width="77px"></asp:TextBox>
                                                &gt;��&gt;=<asp:TextBox CssClass="mytext" ID="pfdj_l" runat="server" Width="76px"></asp:TextBox>
                                                &gt;��&gt;=<asp:TextBox CssClass="mytext" ID="pfdj_z" runat="server" Width="77px"></asp:TextBox>
                                                ��&lt;=<asp:TextBox CssClass="mytext" ID="pfdj_c" runat="server" Width="76px"></asp:TextBox>
                                                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblgwf" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="height: 22px">
                                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                        DataSourceID="SqlDataSource1" DataKeyNames="aid" EmptyDataText="û�в鵽�������������ݣ�" Width="100%"
                                        CssClass="hkgv" AllowPaging="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle Width="30" />
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>&nbsp;</HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chk" runat="server" CssClass="mybox"></asp:CheckBox>
                                                </ItemTemplate>
                                                <HeaderStyle Width="30px"></HeaderStyle>
                                                <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="������Ŀ">
                                                <ItemTemplate>
                                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("xmmc") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="fz" HeaderText="��ֵ">
                                                <HeaderStyle Width="80" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="pfdj_y" HeaderText="��">
                                                <HeaderStyle Width="80" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="pfdj_l" HeaderText="��">
                                                <HeaderStyle Width="80" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="pfdj_z" HeaderText="��">
                                                <HeaderStyle Width="80" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="pfdj_c" HeaderText="��">
                                                <HeaderStyle Width="80" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="kpxz" HeaderText="����ϸ��">
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="���" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="dp_id" runat="server" Text='<%# Eval("aid")%>'></asp:Label>
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
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    <asp:Label ID="bid" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ssxmid"
        ErrorMessage="��ѡ��������Ŀ">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fz"
        ErrorMessage="�������ֵ">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="pfdj_y"
        ErrorMessage="���������ֵȼ�-�ŷ�ֵ">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="pfdj_l"
        ErrorMessage="���������ֵȼ�-����ֵ">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="pfdj_z"
        ErrorMessage="���������ֵȼ�-�з�ֵ">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="pfdj_c"
        ErrorMessage="���������ֵȼ�-���ֵ">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator17" ControlToValidate="fz"
        Display="none" ErrorMessage="��ֵ����Ϊ��ֵ��" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="pfdj_y"
        Display="none" ErrorMessage="���ֵȼ�-�ŷ�ֵ����Ϊ��ֵ��" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="pfdj_l"
        Display="none" ErrorMessage="���ֵȼ�-����ֵ����Ϊ��ֵ��" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="pfdj_z"
        Display="none" ErrorMessage="���ֵȼ�-�з�ֵ����Ϊ��ֵ��" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="pfdj_c"
        Display="none" ErrorMessage="���ֵȼ�-���ֵ����Ϊ��ֵ��" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:haokeConnectionString %>">
    </asp:SqlDataSource>
    </form>
</body>
</html>
