<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Xm_Lxr_Prn.aspx.cs" Inherits="hkpro.oa.xmgl.Xm_Lxr_Prn" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>打印联系人</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="hkshow1">
        &nbsp;
        <input type="button" name="print" class="mybtn" value="打印" onclick="javascript:PrintPage1()">
        <input type="button" id="CloseBtn" class="mybtn" value="取消打印" onclick="javascript:window.close()" />
        &nbsp; 选择纸张宽度：<asp:DropDownList ID="papersize" runat="server" AutoPostBack="true"
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
                                    联系人打印<hr class="hr1" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellSpacing="1"
                                    DataKeyNames="xmid" DataSourceID="SqlDataSource1" EmptyDataText="没有任何联系人信息可以输出！" Width="100%" ShowFooter="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="xm" HeaderText="姓名">
                                            <HeaderStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="bm" HeaderText="部门">
                                            <HeaderStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="zw" HeaderText="职务">
                                            <HeaderStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="gzdw" HeaderText="工作单位"></asp:BoundField>
                                        <asp:BoundField DataField="dh" HeaderText="电话">
                                            <HeaderStyle Width="120px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="gjry" HeaderText="关键人">
                                            <HeaderStyle Width="60px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="yzdz" HeaderText="邮政地址"></asp:BoundField>
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
