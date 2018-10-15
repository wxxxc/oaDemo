<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kpjk_View.aspx.cs" Inherits="hkpro.oa.jxkh.Kpjk_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>

    <script type="text/javascript" src="../../CssJs/MyJs.js"></script>

    <title>�������̼��</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td class="td_base" width="80%" height="25px">
                    ��ǰ������Ŀ��<asp:Label ID="lblxmmc" runat="server" ForeColor="Yellow"></asp:Label>
                </td>
                <td class="td_base" width="20%">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table border="0" cellpadding="0" cellspacing="0" align="center" class="form" width="100%">
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv" AllowPaging="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="5%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="��ί����">
                                            <HeaderStyle Width="20%" />
                                            <ItemTemplate>
                                                <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("pid") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="pwxm" HeaderText="��ί����">
                                            <HeaderStyle Width="25%" />
                                            <ItemStyle Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="pfxm" HeaderText="Ӧ������(��)">
                                            <HeaderStyle Width="20%" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sjpf" HeaderText="��������(��)">
                                            <HeaderStyle Width="20%" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="����">
                                            <HeaderStyle Width="10%" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblpid" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "pid")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="lblpfxm" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "pfxm")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="lblsjpf" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "sjpf")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="lbltxt" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Wrap="False" />
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
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 30" align="center">
                    <asp:Button CssClass="mybtn" ID="ZeroBtn" runat="server" Text="�ܾ������ֲ���" OnClick="Zero_Click"
                        OnClientClick="return confirm('ȷ��Ҫ���ܾ������������Ϊ0��')"></asp:Button>
                    <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="��������" OnClick="Save_Click"
                        OnClientClick="return confirm('ȷ��Ҫ�������ο�����')"></asp:Button>
                    <input type="button" name="BackBtn" value="�� ��" class="btn btn-info" onclick="javascript:location.href='Kpjk.aspx'"
                        accesskey="q" />
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</body>
</html>
