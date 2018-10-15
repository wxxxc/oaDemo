<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pwpf_View.aspx.cs" Inherits="hkpro.oa.jxkh.Pwpf_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>

    <script type="text/javascript" src="../../CssJs/MyJs.js"></script>

    <title>��ί����</title>
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
                            <td class="form-item" style="width:20%">�������ֲο����ϣ�</td>
                            <td style="width:80%"><asp:Label ID="fujian" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="2">
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
                                        <asp:TemplateField HeaderText="�û�����">
                                            <HeaderStyle Width="10%" />
                                            <ItemTemplate>
                                                <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("bid") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="xm" HeaderText="������������">
                                            <HeaderStyle Width="13%" />
                                            <ItemStyle Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="bs" HeaderText="����">
                                            <HeaderStyle Width="12%" />
                                            <ItemStyle Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="gw" HeaderText="��λ">
                                            <HeaderStyle Width="10%" />
                                            <ItemStyle Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="gwf" HeaderText="��λ��">
                                            <HeaderStyle Width="8%" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="fgzrmc" HeaderText="�ֹܸ�����">
                                            <HeaderStyle Width="10%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ykp" HeaderText="Ӧ������(��)">
                                            <HeaderStyle Width="12%" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sjkp" HeaderText="��������(��)">
                                            <HeaderStyle Width="12%" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="����">
                                            <HeaderStyle Width="8%" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblbid" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "bid")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="lblkpid" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "sskpid")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="lblypf" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ykp")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="lblsjpf" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "sjkp")%>'
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
                    <input type="button" name="BackBtn" value="�� ��" class="btn btn-info" onclick="javascript:location.href='Pwpf.aspx'"
                        accesskey="q" />
                </td>
            </tr>
        </tbody>
    </table>
    
    <asp:Label ID="lblpwlx" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblkpzt" runat="server" Visible="false"></asp:Label>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>
