<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Xm_Gzjl_Prn.aspx.cs" Inherits="hkpro.oa.xmgl.Xm_Gzjl_Prn" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>��ӡ���ټ�¼</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="hkshow1">
        &nbsp;
        <input type="button" name="print" class="mybtn" value="��ӡ" onclick="javascript:PrintPage1()"
            >
        <input type="button" id="CloseBtn" class="mybtn" value="ȡ����ӡ" onclick="javascript:window.close()"
             />
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
                                    ���ټ�¼��ӡ<hr class="hr1" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellSpacing="1"
                                    DataKeyNames="xmid" DataSourceID="SqlDataSource1" EmptyDataText="û���κθ��ټ�¼���������" Width="100%" ShowFooter="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="40px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="gzrq" HeaderText="��������" DataFormatString="{0:yyyy-MM-dd}"
                                            HtmlEncode="False">
                                            <HeaderStyle Width="90px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="gzztjs" HeaderText="����״̬����"></asp:BoundField>
                                        <asp:BoundField DataField="gzztxs" HeaderText="����״̬����"></asp:BoundField>
                                        <asp:BoundField DataField="gzfjmc" HeaderText="����"></asp:BoundField>
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
