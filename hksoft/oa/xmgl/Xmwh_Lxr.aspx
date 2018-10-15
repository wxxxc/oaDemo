<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Xmwh_Lxr.aspx.cs" Inherits="hkpro.oa.xmgl.Xmwh_Lxr" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>项目维护</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td_base" width="80%" height="25px">新增联系人
                </td>
                <td class="td_base" width="20%"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <table cellspacing="0" cellpadding="0" width="98%" border="0" align="center">
                        <tr>
                            <td style="height: 10px"></td>
                            <td></td>
                        </tr>
                        <tr align="center">
                            <td colspan="2">
                                <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center">
                                    <tr>
                                        <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                            align="center">
                                            <a href="xmwh_view.aspx?id=<%=xmid.Text %>" class="black">项目清单</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                            <a href="xmwh_gzjl.aspx?id=<%=xmid.Text %>" class="black">跟踪记录</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/tab_b_y.gif)" align="center">
                                            <a href="xmwh_lxr.aspx?id=<%=xmid.Text %>" class="mail_top">联系人</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                            <a href="xmwh_fj.aspx?id=<%=xmid.Text %>" class="black">项目附件</a>
                                        </td>
                                        <td align="right" colspan="4">
                                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click"></asp:Button>
                                            <asp:Button ID="PrnBtn" runat="server" Text="打印" CssClass="mybtn" CausesValidation="false"></asp:Button>
                                            <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript: window.close()" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table border="0" cellpadding="0" cellspacing="0" align="center" width="100%" class="form">
                                    <tr>
                                        <td class="form-item" style="width: 20%">姓名：
                                        </td>
                                        <td style="width: 30%">
                                            <asp:TextBox ID="xm" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                                        </td>
                                        <td class="form-item" style="width: 20%">电话：
                                        </td>
                                        <td style="width: 30%">
                                            <asp:TextBox ID="dh" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">工作单位：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="gzdw" runat="server" CssClass="mytext" Width="90%" MaxLength="50"></asp:TextBox>
                                        </td>
                                        <td class="form-item">部门：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="bm" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">职务：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="zw" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                                        </td>
                                        <td class="form-item">关键人员：
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="gjry" runat="server" CssClass="mytext" Width="90%">
                                                <asp:ListItem Text="" Value="" Selected="true"></asp:ListItem>
                                                <asp:ListItem Text="是" Value="是"></asp:ListItem>
                                                <asp:ListItem Text="否" Value="否"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">E-mail：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="mail" runat="server" CssClass="mytext" Width="90%" MaxLength="20"></asp:TextBox>
                                        </td>
                                        <td class="form-item">邮政地址：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="yzdz" runat="server" CssClass="mytext" Width="90%" MaxLength="50"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">备注：
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="bz" runat="server" CssClass="mytext" Width="96%" MaxLength="125"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr>
                <td width="10">&nbsp;
                </td>
                <td>
                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                        DataSourceID="SqlDataSource1" DataKeyNames="lxrid" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                        <Columns>
                            <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="修改">
                                <HeaderStyle Width="40px" />
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <a href="xmwh_lxr.aspx?id=<%# Eval("xmid") %>&lxrid=<%# Eval("lxrid") %>">
                                        <asp:Image ID="Image112" runat="server" ImageUrl='../../images/edit.gif' ToolTip="修改这条记录" /></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="删除" ShowHeader="False">
                                <HeaderStyle Width="40px" />
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Delete"
                                        OnClientClick="return confirm('确认要执行删除吗？')" ImageUrl="../../images/del.gif" AlternateText="删除此类型" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
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
                            <asp:TemplateField HeaderText="序号" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="dp_id" runat="server" Text='<%# Eval("lxrid")%>'></asp:Label>
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
                <td colspan="2" style="height: 22px">
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                        ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                        NumericButtonCount="10" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                        PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
                        InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go">
                    </webdiyer:AspNetPager>
                </td>
            </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="xm"
            ErrorMessage="请输入姓名">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="dh"
            ErrorMessage="请输入电话">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:Label ID="xmid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lxrid" runat="server" Visible="false"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:haokeConnectionString %>"></asp:SqlDataSource>
    </form>
</body>
</html>
