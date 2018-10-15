<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kpxmwh_View_Bkpr.aspx.cs" Inherits="hkpro.oa.jxkh.Kpxmwh_View_Bkpr" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>

    <script type="text/javascript" src="../../CssJs/MyJs.js"></script>

    <title>考评项目维护</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td class="td_base" width="80%" height="25px">
                    本次考评项目的被考评人信息
                </td>
                <td class="td_base" width="20%">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table id="search" cellspacing="0" cellpadding="0" width="98%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td style="height: 10px">
                                </td>
                                <td align="left">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="left">
                                    <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center">
                                        <tr>
                                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                                align="center">
                                                <a href="Kpxmwh_View.aspx?id=<%=kpid.Text %>" class="black">基本信息</a>
                                            </td>
                                            <td style="width: 91px; background-image: url(../../images/tab_b_y.gif)" align="center">
                                                <a href="#" class="mail_top">被考评人信息</a>
                                            </td>
                                            <td align="right">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                    <table border="0" cellpadding="0" cellspacing="0" align="center" class="form" width="100%">
                                        <tr>
                                            <td>
                                                被考评人：<asp:DropDownList ID="ssbid" runat="server" Width="150px">
                                                </asp:DropDownList>
                                                <asp:Button CssClass="btn btn-primary" ID="SaveBtn" runat="server" Text="单个添加" OnClick="Save_Click"
                                                    AccessKey="s" Visible="false"></asp:Button>
                                                <asp:Button CssClass="btn btn-success" ID="SaveAddBtn" runat="server" Text="批量添加" OnClick="SaveAdd_Click" OnClientClick="return confirm('确认要添加全部被考评人吗？')" CausesValidation="false" Visible="false"></asp:Button>
                                                <asp:Button CssClass="btn btn-warning" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click" OnClientClick="return confirm('确认要执行删除吗？')" CausesValidation="false" Visible="false"></asp:Button>
                                                <input type="button" name="BackBtn" value="关闭" class="btn btn-danger" onclick="javascript:window.close()"
                                                    accesskey="q" />
                                            </td>
                                        </tr>
                                        </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="height: 22px">
                                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                        DataSourceID="SqlDataSource1" DataKeyNames="bid" EmptyDataText="没有查到符合条件的数据！" Width="100%"
                                        CssClass="hkgv" AllowPaging="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle Width="30" />
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>&nbsp;</HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chk" runat="server" CssClass="mybox"></asp:CheckBox>
                                                </ItemTemplate>
                                                <HeaderStyle Width="30px"></HeaderStyle>
                                                <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="用户编码">
                                                <HeaderStyle Width="10%" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("bid") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="xm" HeaderText="被考评人姓名">
                                                <HeaderStyle Width="15%" />
                                                <ItemStyle Wrap="false" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="bs" HeaderText="部室">
                                                <HeaderStyle Width="15%" />
                                                <ItemStyle Wrap="false" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="gw" HeaderText="岗位">
                                                <HeaderStyle Width="15%" />
                                                <ItemStyle Wrap="false" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="gwf" HeaderText="岗位分">
                                                <HeaderStyle Width="10%" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="fgzrmc" HeaderText="分管副主管">
                                                <HeaderStyle Width="15%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="bz" HeaderText="备注">
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="序号" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="dp_id" runat="server" Text='<%# Eval("bid")%>'></asp:Label>
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
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    <asp:Label ID="kpid" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ssbid"
        ErrorMessage="请选择被考评人">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:haokeConnectionString %>">
    </asp:SqlDataSource>
    </form>
</body>
</html>
