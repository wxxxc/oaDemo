<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Xm_Lxr_Prn.aspx.cs" Inherits="hkpro.oa.xmgl.Xm_Lxr_Prn" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>��ӡ��ϵ��</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="hkshow1">
        &nbsp;
        <input type="button" name="print" class="mybtn" value="��ӡ" onclick="javascript:PrintPage1()">
        <input type="button" id="CloseBtn" class="mybtn" value="ȡ����ӡ" onclick="javascript:window.close()" />
        &nbsp; ѡ��ֽ�ſ�ȣ�<asp:DropDownList ID="papersize" runat="server" AutoPostBack="true"
            OnSelectedIndexChanged="ChangeSize_Selected">
        </asp:DropDownList>
    </div>
    <table cellspacing="0" cellpadding="0" width="100%" style="height: 100%" border="0">
        <tr>
            <td style="height: 100%" valign="top" align="center">
                <asp:Panel ID="panel1" runat="server">
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td colspan="6" align="center">
                                <h3>
                                    <asp:Label runat="server" ID="qymc" /><br />
                                    ��ϵ�˴�ӡ<hr class="hr1" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellSpacing="1"
                                    DataKeyNames="xmid" DataSourceID="SqlDataSource1" EmptyDataText="û���κ���ϵ����Ϣ���������" Width="100%" ShowFooter="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
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
                                        <asp:BoundField DataField="yzdz" HeaderText="������ַ"></asp:BoundField>
                                    </Columns>
                                    <HeaderStyle CssClass="print_title" />
                                    <RowStyle CssClass="print_list_gray" />
                                    <FooterStyle CssClass="print_bottom" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:haokeConnectionString %>" />
    </form>
</body>
</html>
