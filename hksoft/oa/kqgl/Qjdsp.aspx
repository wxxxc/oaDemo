<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qjdsp.aspx.cs" Inherits="hkpro.oa.kqgl.Qjdsp" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>请假单审批</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" method="post" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td style="height: 10px"></td>
            </tr>
            <tr>
                <td valign="top" align="center">
                    <table cellspacing="0" cellpadding="0" border="0" width="100%">
                        <tr>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_y.gif)"
                                align="center">
                                <a href="Qjdsp.aspx" class="mail_top">待审批记录</a>
                            </td>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                align="center">
                                <a href="Qjdsp2.aspx" class="black">已审批记录</a>
                            </td>
                            <td align="right">请假类型：<asp:DropDownList ID="qjlx" runat="server">
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                <asp:ListItem Text="年假" Value="年假"></asp:ListItem>
                                <asp:ListItem Text="探亲假" Value="探亲假"></asp:ListItem>
                                <asp:ListItem Text="婚假" Value="婚假"></asp:ListItem>
                                <asp:ListItem Text="丧假" Value="丧假"></asp:ListItem>
                                <asp:ListItem Text="产假" Value="产假"></asp:ListItem>
                                <asp:ListItem Text="公假" Value="公假"></asp:ListItem>
                                <asp:ListItem Text="事假" Value="事假"></asp:ListItem>
                                <asp:ListItem Text="病假" Value="病假"></asp:ListItem>
                            </asp:DropDownList>
                                <asp:DropDownList ID="query_tj" runat="server">
                                    <asp:ListItem Value="sqrmc" Selected="True">请假人</asp:ListItem>
                                    <asp:ListItem Value="qjly">请假理由</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="150"></asp:TextBox>
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="查 询" OnClick="Query_Click"></asp:Button>
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                        EmptyDataText="没有查到符合条件的数据！" DataKeyNames="qid" Width="100%" CssClass="hkgv">
                        <Columns>
                            <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30px" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle Width="30px"></HeaderStyle>
                                <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                <HeaderTemplate>
                                    <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16; height: 16" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="请假人">
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:popView('Qjdsp_View.aspx?id=<%# Eval("qid") %>')"
                                        class="gvlink">
                                        <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("sqrmc") %>'></asp:Label></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="qjlx" HeaderText="类型">
                                <HeaderStyle Width="60px" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="开始日期">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("qjkssj", "{0:yyyy-MM-dd}") %>'></asp:Label>(<asp:Label
                                        ID="Label7" runat="server" Text='<%# Bind("qjkssd") %>'></asp:Label>)
                                </ItemTemplate>
                                <HeaderStyle Width="120px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="截止日期">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("qjjssj", "{0:yyyy-MM-dd}") %>'></asp:Label>(<asp:Label
                                        ID="Label8" runat="server" Text='<%# Bind("qjjssd") %>'></asp:Label>)
                                </ItemTemplate>
                                <HeaderStyle Width="120px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="qjts" HeaderText="请假天数">
                                <HeaderStyle Width="60px" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="qjzt" HeaderText="状态">
                                <HeaderStyle Width="55px" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="qjly" HeaderText="请假理由"></asp:BoundField>
                            <asp:BoundField DataField="sqbmmc" HeaderText="所属部门"></asp:BoundField>
                            <asp:BoundField DataField="sssj" HeaderText="送审时间" DataFormatString="{0:yyyy-MM-dd}"
                                HtmlEncode="False">
                                <HeaderStyle Width="80px" />
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
                <td style="height: 22px">
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                        ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                        NumericButtonCount="10" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                        PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
                        InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go">
                    </webdiyer:AspNetPager>
                </td>
            </tr>
            <tr style="height: 25px">
                <td>&nbsp;<font color="red">*</font>审批意见：<asp:TextBox ID="spyj" runat="server" Width="150"
                    CssClass="mytext" /><img src="../../images/choose.gif" onclick="openA('../../choose/portal/Spyjview.aspx')"
                        alt="选择系统提供的审批意见" />
                    <asp:DropDownList ID="jsr" CssClass="mytext" runat="server" AutoPostBack="true" OnSelectedIndexChanged="jsr_Changed"
                        ToolTip="显示拥有考勤审批权限的人员">
                    </asp:DropDownList>
                    <asp:DropDownList ID="kqry" CssClass="mytext" runat="server" Visible="false" ToolTip="显示需要最终进行考勤确认的人员">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="height: 25px">&nbsp;<asp:Button CssClass="mybtn" ID="PassBtn" runat="server" Text="审批通过" OnClick="Pass_Click"></asp:Button>
                    <asp:CheckBox ID="xxtz" runat="server" Text="站内消息通知下一步审批人" Checked="true" />
                    <asp:CheckBox ID="dxtz" runat="server" Text="手机短信通知下一步审批人" />
                </td>
            </tr>
        </table>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="spyj"
            ErrorMessage="请输入审批意见">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="jsr"
            ErrorMessage="请选择下一步审批人">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="kqry"
            ErrorMessage="请选择考勤管理人员">&nbsp;
        </asp:RequiredFieldValidator>
    </form>
</body>
</html>
