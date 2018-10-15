<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bkpr_View_pfxm.aspx.cs"
    Inherits="hkpro.oa.jxkh.Bkpr_View_pfxm" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>

    <script type="text/javascript" src="../../CssJs/MyJs.js"></script>

    <title>被考评人维护</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td class="td_base" width="80%" height="25px">
                    被考评人的评分项目
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
                                                <a href="Bkpr_View.aspx?id=<%=bid.Text %>" class="black">基本信息</a>
                                            </td>
                                            <td style="width: 91px; background-image: url(../../images/tab_b_y.gif)" align="center">
                                                <a href="#" class="mail_top">评分项目信息</a>
                                            </td>
                                            <td align="right">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                    <table border="0" cellpadding="0" cellspacing="0" align="center" class="form" width="100%">
                                        <tr>
                                            <td>
                                                评分项目：<asp:DropDownList ID="ssxmid" runat="server" Width="150px" 
                                                    AutoPostBack="true" onselectedindexchanged="ssxmid_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                分值：<asp:TextBox CssClass="mytext" ID="fz" runat="server" Width="60px"></asp:TextBox>
                                                考评细则：<asp:TextBox ID="kpxz" runat="server" CssClass="mytext" Width="120px"></asp:TextBox>
                                                <asp:Button CssClass="btn btn-primary" ID="SaveBtn" runat="server" Text="添加" OnClick="Save_Click"
                                                    AccessKey="s"></asp:Button>
                                                <asp:Button CssClass="btn btn-danger" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click" OnClientClick="return confirm('确认要执行删除吗？')" CausesValidation="false"></asp:Button>
                                                <input type="button" name="BackBtn" value="关闭" class="btn btn-warning" onclick="javascript:window.close()"
                                                    accesskey="q" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                评分等级：优&gt;=<asp:TextBox CssClass="mytext" ID="pfdj_y" runat="server" Width="77px"></asp:TextBox>
                                                &gt;良&gt;=<asp:TextBox CssClass="mytext" ID="pfdj_l" runat="server" Width="76px"></asp:TextBox>
                                                &gt;中&gt;=<asp:TextBox CssClass="mytext" ID="pfdj_z" runat="server" Width="77px"></asp:TextBox>
                                                差&lt;=<asp:TextBox CssClass="mytext" ID="pfdj_c" runat="server" Width="76px"></asp:TextBox>
                                                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblgwf" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="height: 22px">
                                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                        DataSourceID="SqlDataSource1" DataKeyNames="aid" EmptyDataText="没有查到符合条件的数据！" Width="100%"
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
                                            <asp:TemplateField HeaderText="评分项目">
                                                <ItemTemplate>
                                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("xmmc") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="fz" HeaderText="分值">
                                                <HeaderStyle Width="80" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="pfdj_y" HeaderText="优">
                                                <HeaderStyle Width="80" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="pfdj_l" HeaderText="良">
                                                <HeaderStyle Width="80" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="pfdj_z" HeaderText="中">
                                                <HeaderStyle Width="80" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="pfdj_c" HeaderText="差">
                                                <HeaderStyle Width="80" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="kpxz" HeaderText="考评细则">
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="序号" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="dp_id" runat="server" Text='<%# Eval("aid")%>'></asp:Label>
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
    <asp:Label ID="bid" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ssxmid"
        ErrorMessage="请选择评分项目">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fz"
        ErrorMessage="请输入分值">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="pfdj_y"
        ErrorMessage="请输入评分等级-优分值">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="pfdj_l"
        ErrorMessage="请输入评分等级-良分值">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="pfdj_z"
        ErrorMessage="请输入评分等级-中分值">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="pfdj_c"
        ErrorMessage="请输入评分等级-差分值">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator17" ControlToValidate="fz"
        Display="none" ErrorMessage="分值必须为数值型" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="pfdj_y"
        Display="none" ErrorMessage="评分等级-优分值必须为数值型" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="pfdj_l"
        Display="none" ErrorMessage="评分等级-良分值必须为数值型" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="pfdj_z"
        Display="none" ErrorMessage="评分等级-中分值必须为数值型" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="pfdj_c"
        Display="none" ErrorMessage="评分等级-差分值必须为数值型" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:haokeConnectionString %>">
    </asp:SqlDataSource>
    </form>
</body>
</html>
