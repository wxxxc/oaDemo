<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ndqjhz_View.aspx.cs" Inherits="hkpro.oa.kqgl.Ndqjhz_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�����ٻ���</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td_base" style="width: 80%; height: 25px">�鿴��<asp:Label ID="lblyhmc" runat="server" ForeColor="Yellow"></asp:Label>����<asp:Label
                    ID="lblnf" runat="server" ForeColor="Yellow"></asp:Label>��������ϸ
                </td>
                <td class="td_base" style="width: 20%">&nbsp;
                </td>
            </tr>
            <tr>
                <td valign="top" colspan="2">
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td colspan="2">
                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                    <tr>
                                        <td>
                                            <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                EmptyDataText="��ʱû���κ�������¼" Width="100%" CssClass="hkgv">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle Width="30px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="��ٿ�ʼ����">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("qjkssj", "{0:yyyy-MM-dd}") %>'></asp:Label>(<asp:Label
                                                                ID="Label7" runat="server" Text='<%# Bind("qjkssd") %>'></asp:Label>)
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="120px" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="��ٽ�ֹ����">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("qjjssj", "{0:yyyy-MM-dd}") %>'></asp:Label>(<asp:Label
                                                                ID="Label8" runat="server" Text='<%# Bind("qjjssd") %>'></asp:Label>)
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="120px" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="qjlx" HeaderText="�������">
                                                        <HeaderStyle Width="60" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="qjts" HeaderText="�������">
                                                        <HeaderStyle Width="60" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="qjly" HeaderText="�������"></asp:BoundField>
                                                </Columns>
                                                <RowStyle CssClass="hkRowStyle" />
                                                <HeaderStyle CssClass="hkHeadStyle" />
                                                <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center" style="height: 30">
                                <input type="button" name="BackBtn" value="�� ��" class="mybtn" onclick="javascript: window.close()" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
