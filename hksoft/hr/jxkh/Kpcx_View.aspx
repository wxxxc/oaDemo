<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kpcx_View.aspx.cs" Inherits="hkpro.oa.jxkh.Kpcx_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>

    <script type="text/javascript" src="../../CssJs/MyJs.js"></script>

    <title>���������ѯ</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td class="td_base" width="80%" height="25px">
                    ��ǰ������Ŀ��<asp:Label ID="lblxmmc" runat="server" ForeColor="Yellow"></asp:Label>��ע�������Թ���ְ��ֱ���Ϊ��׼��
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
                                        <asp:TemplateField HeaderText="����">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="�������˱���">
                                            <ItemTemplate>
                                                <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("�������˱���") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="����" HeaderText="����">
                                            <ItemStyle Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="����" HeaderText="����">
                                            <ItemStyle Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="��λ��" HeaderText="��λ��">
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="�ܵ÷�" HeaderText="�ܵ÷�">
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="�ܵ÷ֱ���" HeaderText="�ܵ÷ֱ���" DataFormatString="{0:P}" HtmlEncode="False">
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="����ְ��ⶥ��" HeaderText="����ְ��ⶥ��">
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="����ְ��÷�" HeaderText="����ְ��÷�">
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="����ְ��ֱ���" HeaderText="����ְ��ֱ���" DataFormatString="{0:P}" HtmlEncode="False">
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="���˹����ⶥ��" HeaderText="���˹����ⶥ��">
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="���˹����÷�" HeaderText="���˹����÷�">
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="���˹����ֱ���" HeaderText="���˹����ֱ���" DataFormatString="{0:P}" HtmlEncode="False">
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="����">
                                            <HeaderStyle Width="60" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblbid" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "�������˱���")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="lblkpid" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "������ĿID")%>'
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
                    <asp:Button CssClass="btn btn-success" ID="ExpBtn" runat="server" Text="�� ��" OnClick="Exp_Click" />
                    <input type="button" name="BackBtn" value="�� ��" class="btn btn-primary" onclick="javascript:location.href='Kpcx.aspx'"
                        accesskey="q" />
                </td>
            </tr>
        </tbody>
    </table>
    
    <asp:Label ID="lblpwlx" runat="server" Visible="false"></asp:Label>
    </form>
</body>
</html>
