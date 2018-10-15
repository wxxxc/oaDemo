<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pwpf_View_Show.aspx.cs" Inherits="hkpro.oa.jxkh.Pwpf_View_Show" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>

    <script type="text/javascript" src="../../CssJs/MyJs.js"></script>

    <title>评委评分</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td class="td_base" width="80%" height="25px">
                    被考评人：<asp:Label ID="lblbkpr" runat="server" ForeColor="Yellow"></asp:Label>&nbsp;&nbsp;
                    私人查询密钥：<asp:TextBox ID="cxmy" runat="server" TextMode="Password" CssClass="mytext"></asp:TextBox>
                    <asp:Button CssClass="btn btn-primary" ID="QueryBtn" runat="server" Text="确 定" OnClick="Query_Click" AccessKey="f" />
                    <input type="button" name="BackBtn" value="关 闭" class="btn btn-danger" onclick="javascript:window.close()" accesskey="q" />
                </td>
                <td class="td_base" width="20%">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table border="0" cellpadding="0" cellspacing="0" align="center" class="form" width="100%">
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="mxid" EmptyDataText="没有查到符合条件的数据！" Width="100%"
                                    CssClass="hkgv" AllowPaging="false" ShowFooter="true">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="分类" FooterText="合计">
                                            <HeaderStyle Width="30" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <FooterStyle HorizontalAlign="Center" Font-Bold="true" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblxmfl" runat="server" Text='<%# Bind("xmfl") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="评分项目">
                                            <HeaderStyle Width="60" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblxmmc" runat="server" Text='<%# Bind("ssxmmc") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="fz" HeaderText="最高分值">
                                            <HeaderStyle Width="60" />
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="优">
                                            <HeaderStyle Width="80" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblpfdj_y1" runat="server" Text='<%# Bind("pfdj_y") %>'></asp:Label>-<asp:Label
                                                    ID="lblpfdj_y2" runat="server" Text='<%# Bind("fz") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="良">
                                            <HeaderStyle Width="80" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblpfdj_l1" runat="server" Text='<%# Bind("pfdj_l") %>'></asp:Label>-<asp:Label
                                                    ID="lblpfdj_l2" runat="server" Text='<%# Bind("pfdj_y2") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="中">
                                            <HeaderStyle Width="80" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblpfdj_z1" runat="server" Text='<%# Bind("pfdj_z") %>'></asp:Label>-<asp:Label
                                                    ID="lblpfdj_z2" runat="server" Text='<%# Bind("pfdj_l2") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="差">
                                            <HeaderStyle Width="80" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblpfdj_c" runat="server" Text='<%# Bind("pfdj_c") %>'></asp:Label>以下
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="kpxz" HeaderText="考评细则"></asp:BoundField>
                                        <asp:BoundField DataField="sjpf" HeaderText="实际评分">
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="pfbz" HeaderText="评分备注"></asp:BoundField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <FooterStyle CssClass="hkBottomStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item" style="width: 20%">
                                个人评分参考材料：
                            </td>
                            <td style="width: 80%">
                                <asp:Label ID="fujian" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    <asp:Label ID="lblpwlx" runat="server" Visible="false"></asp:Label>
    
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="cxmy"
        ErrorMessage="请输入私人查询密钥">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
