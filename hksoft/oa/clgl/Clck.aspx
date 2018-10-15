<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clck.aspx.cs" Inherits="hkpro.oa.clgl.Clck" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�����鿴</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 40px">�������⣺<asp:DropDownList ID="query_tj" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Query_Click">
                                <asp:ListItem Value="w">δ����ĳ���</asp:ListItem>
                                <asp:ListItem Value="y">�ѽ���ĳ���</asp:ListItem>
                            </asp:DropDownList>
                            </td>
                            <td align="right"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="mytable table-responsive">
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="false" OnRowDataBound="OnRow_Bound"
                                    AutoGenerateColumns="False" DataKeyNames="id" EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                             <HeaderStyle CssClass="mw30"  />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="id" HeaderText="���">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                            <FooterStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="cph" HeaderText="���ƺ�">
                                            <HeaderStyle CssClass="mw80"  />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="clmc" HeaderText="��������">
                                             <HeaderStyle CssClass="mwp8"  />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="��������Ա">
                                            <HeaderStyle CssClass="mw120"  />
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="zdzs" HeaderText="�������(��)">
                                             <HeaderStyle CssClass="mw80"  />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="qyrq" HeaderText="��������" DataFormatString="{0:yyyy-MM-dd}"
                                            HtmlEncode="False">
                                             <HeaderStyle CssClass="mw80"  />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="cz" HeaderText="��ֵ(��)">
                                        <HeaderStyle CssClass="mw80"  />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <PagerStyle CssClass="hkBottomStyle" Font-Bold="False" Font-Italic="False"
                                        Font-Names="Batang" Font-Overline="False" Font-Strikeout="True" ForeColor="#0000C0" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                    <PagerSettings PageButtonCount="25" />
                                </asp:GridView>
                                    </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
