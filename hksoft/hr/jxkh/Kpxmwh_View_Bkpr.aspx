<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kpxmwh_View_Bkpr.aspx.cs" Inherits="hkpro.oa.jxkh.Kpxmwh_View_Bkpr" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>

    <script type="text/javascript" src="../../CssJs/MyJs.js"></script>

    <title>������Ŀά��</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td class="td_base" width="80%" height="25px">
                    ���ο�����Ŀ�ı���������Ϣ
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
                                                <a href="Kpxmwh_View.aspx?id=<%=kpid.Text %>" class="black">������Ϣ</a>
                                            </td>
                                            <td style="width: 91px; background-image: url(../../images/tab_b_y.gif)" align="center">
                                                <a href="#" class="mail_top">����������Ϣ</a>
                                            </td>
                                            <td align="right">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                    <table border="0" cellpadding="0" cellspacing="0" align="center" class="form" width="100%">
                                        <tr>
                                            <td>
                                                �������ˣ�<asp:DropDownList ID="ssbid" runat="server" Width="150px">
                                                </asp:DropDownList>
                                                <asp:Button CssClass="btn btn-primary" ID="SaveBtn" runat="server" Text="�������" OnClick="Save_Click"
                                                    AccessKey="s" Visible="false"></asp:Button>
                                                <asp:Button CssClass="btn btn-success" ID="SaveAddBtn" runat="server" Text="�������" OnClick="SaveAdd_Click" OnClientClick="return confirm('ȷ��Ҫ���ȫ������������')" CausesValidation="false" Visible="false"></asp:Button>
                                                <asp:Button CssClass="btn btn-warning" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" CausesValidation="false" Visible="false"></asp:Button>
                                                <input type="button" name="BackBtn" value="�ر�" class="btn btn-danger" onclick="javascript:window.close()"
                                                    accesskey="q" />
                                            </td>
                                        </tr>
                                        </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="height: 22px">
                                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                        DataSourceID="SqlDataSource1" DataKeyNames="bid" EmptyDataText="û�в鵽�������������ݣ�" Width="100%"
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
                                            <asp:TemplateField HeaderText="�û�����">
                                                <HeaderStyle Width="10%" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("bid") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="xm" HeaderText="������������">
                                                <HeaderStyle Width="15%" />
                                                <ItemStyle Wrap="false" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="bs" HeaderText="����">
                                                <HeaderStyle Width="15%" />
                                                <ItemStyle Wrap="false" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="gw" HeaderText="��λ">
                                                <HeaderStyle Width="15%" />
                                                <ItemStyle Wrap="false" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="gwf" HeaderText="��λ��">
                                                <HeaderStyle Width="10%" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="fgzrmc" HeaderText="�ֹܸ�����">
                                                <HeaderStyle Width="15%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="bz" HeaderText="��ע">
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="���" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="dp_id" runat="server" Text='<%# Eval("bid")%>'></asp:Label>
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
    <asp:Label ID="kpid" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ssbid"
        ErrorMessage="��ѡ�񱻿�����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:haokeConnectionString %>">
    </asp:SqlDataSource>
    </form>
</body>
</html>
