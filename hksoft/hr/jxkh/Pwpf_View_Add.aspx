<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pwpf_View_Add.aspx.cs"
    Inherits="hkpro.oa.jxkh.Pwpf_View_Add" %>

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
                    被考评人：<asp:Label ID="lblbkpr" runat="server" ForeColor="Yellow"></asp:Label>
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
                                    DataKeyNames="mxid" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv" AllowPaging="false"
                                    ShowFooter="true">
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
                                        <asp:TemplateField HeaderText="操作">
                                            <HeaderStyle Width="40" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblgzry" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "pw_gzry")%>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblmxid" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "mxid")%>' Visible="false"></asp:Label>
                                                <a href="#" onclick="javascript:popMini('Pwpf_View_Pf.aspx?mxid=<%# Eval("mxid") %>&kpid=<%# Eval("sskpid") %>&bid=<%# Eval("ssbid") %>&xmid=<%# Eval("ssxmid") %>')"
                                                    class="gvlink"><asp:Label ID="lbltxt" runat="server"></asp:Label></a>
                                                <a href="#" onclick="javascript:popMini('Pwpf_View_Xg.aspx?mxid=<%# Eval("mxid") %>&kpid=<%# Eval("sskpid") %>&bid=<%# Eval("ssbid") %>&xmid=<%# Eval("ssxmid") %>')"
                                                    class="gvlink"><asp:Label ID="lbltxt2" runat="server"></asp:Label></a>
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
                        <tr>
                            <td class="form-item" style="width: 20%">
                                个人评分参考材料：
                            </td>
                            <td style="width: 80%">
                                <asp:Label ID="fujian" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">
                                批量快速评分：
                            </td>
                            <td>
                                以评分等级<asp:DropDownList ID="pflx" runat="server" Width="40">
                                    <asp:ListItem Text="优" Value="优"></asp:ListItem>
                                    <asp:ListItem Text="良" Value="良"></asp:ListItem>
                                    <asp:ListItem Text="中" Value="中"></asp:ListItem>
                                    <asp:ListItem Text="差" Value="差"></asp:ListItem>
                                </asp:DropDownList>
                                的上限值为基准，下浮<asp:TextBox ID="bfb" runat="server" Width="40" CssClass="mytext"></asp:TextBox>%设置全部被考评人的评分
                                <asp:Button CssClass="btn btn-primary" ID="SaveBtn" runat="server" Text="确 定" OnClick="Save_Click">
                                </asp:Button>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 30" align="center">
                    <asp:Button CssClass="btn btn-danger" ID="CloseBtn" runat="server" Text="关 闭" OnClick="Close_Click" CausesValidation="false">
                    </asp:Button>
                </td>
            </tr>
        </tbody>
    </table>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    <asp:Label ID="lblpwlx" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="bfb"
        ErrorMessage="请输入下浮百分比">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="下浮百分比必须是介于0至100之间的数值！"
        ControlToValidate="bfb" MinimumValue="0" MaximumValue="100" Type="Double">&nbsp;
    </asp:RangeValidator>
    </form>
</body>
</html>
