<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rzcx_Mx.aspx.cs" Inherits="hkpro.portal.rzcx.Rzcx_Mx1" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>日志查询</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server" method="post">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="height: 10"></td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" border="0" width="98%" align="center">
                        <tr>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                align="center">
                                <a href="rzcx.aspx" class="black">登录日志汇总</a>
                            </td>
                            <td style="width: 91px; background-image: url(../../images/tab_b_y.gif)" align="center">
                                <a href="rzcx_mx.aspx" class="mail_top">登录日志明细</a>
                            </td>
                            <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                <a href="rzcx_cz.aspx" class="black">操作日志明细</a>
                            </td>
                            <td align="right">&nbsp;
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0" class="form">
                        <tr>
                            <td align="right">操作人员：
                            </td>
                            <td>
                                <asp:TextBox ID="rysq" runat="server" CssClass="mytext" Width="150px" />&nbsp;<img
                                    src="../../images/choose.gif" onclick="openA('../../choose/portal/yhview.aspx?id=rysq2')"
                                    alt="选择要查询的操作人员" />
                            </td>
                            <td align="right">模块编码：
                            </td>
                            <td>
                                <asp:TextBox ID="jrmk" runat="server" CssClass="mytext" Width="150px" />
                            </td>
                            <td align="right">IP地址：
                            </td>
                            <td>
                                <asp:TextBox ID="ipdz" runat="server" CssClass="mytext" Width="150px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">登录状态：
                            </td>
                            <td colspan="5">
                                <asp:DropDownList ID="dlzt" runat="server">
                                    <asp:ListItem Text="" Value="" Selected="true"></asp:ListItem>
                                    <asp:ListItem Text="登录系统" Value="登录系统"></asp:ListItem>
                                    <asp:ListItem Text="注销系统" Value="注销系统"></asp:ListItem>
                                </asp:DropDownList>
                                操作日期：<asp:TextBox ID="txtSdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                    CssClass="mytext" Width="70"></asp:TextBox>至<asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')"
                                        runat="server" CssClass="mytext" Width="70"></asp:TextBox>
                                登录入口：<asp:DropDownList ID="dl_rk" runat="server">
                                    <asp:ListItem Text="全部" Value=""></asp:ListItem>
                                    <asp:ListItem Text="PC" Value="PC"></asp:ListItem>
                                    <asp:ListItem Text="WebAPP" Value="WebAPP"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button CssClass="btn btn-info" ID="QueryBtn" runat="server" Text="查询" CausesValidation="true"
                                    OnClick="Query_Click"></asp:Button>
                                <asp:Button CssClass="btn btn-warning" ID="ClearBtn" runat="server" Text="清空" CausesValidation="true"
                                    OnClick="Clear_Click"></asp:Button>
                                <asp:Button CssClass="btn btn-success" ID="ExpBtn" runat="server" Text="导出" OnClick="Exp_Click" />
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="dl_id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="dl_rq" HeaderText="操作日期" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"
                                            HtmlEncode="False">
                                            <HeaderStyle Width="140px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="dl_id" HeaderText="用户编码">
                                            <HeaderStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="用户名称">
                                            <HeaderStyle Width="80px" />
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="dl_ip" HeaderText="IP地址"></asp:BoundField>
                                        <asp:BoundField DataField="dl_port" HeaderText="端口号"></asp:BoundField>
                                        <asp:BoundField DataField="dl_zt" HeaderText="登录状态">
                                            <HeaderStyle Width="80px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="进入模块">
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("open_mk") %>'></asp:Label>-<asp:Label
                                                    ID="Label5" runat="server" Text='<%# Bind("modu_mc") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="dl_rk" HeaderText="登录入口">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
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
                </td>
            </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSdate"
            ErrorMessage="请输入操作日期(自)">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEdate"
            ErrorMessage="请输入操作日期(至)">&nbsp;
        </asp:RequiredFieldValidator>
    </form>
</body>
</html>
