<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qjdlr.aspx.cs" Inherits="hkpro.oa.kqgl.Qjdlr" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>我的考勤</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="height: 10px"></td>
            </tr>
            <tr>
                <td valign="top" align="center">
                    <table cellspacing="0" cellpadding="0" border="0" width="98%">
                        <tr>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                align="center">
                                <a href="Wdkq.aspx" class="black">上班/下班</a>
                            </td>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_y.gif)"
                                align="center">
                                <a href="Qjdlr.aspx" class="mail_top">请假单</a>
                            </td>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                align="center">
                                <a href="Kqsmlr.aspx" class="black">考勤说明</a>
                            </td>
                            <td align="right">&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="2" width="98%" border="0" class="form" align="center">
                        <tr>
                            <td style="height: 25px" colspan="6">
                                <asp:Label ID="lblkyjq" Font-Bold="true" ForeColor="Green" Font-Size="Medium" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label3" Font-Bold="true" ForeColor="Red" Font-Size="Medium" runat="server">本年剩余假期：事假</asp:Label><asp:Label
                                ID="shj" Font-Bold="true" ForeColor="Red" Font-Size="Medium" runat="server"></asp:Label><asp:Label
                                    ID="Label5" Font-Bold="true" ForeColor="Red" Font-Size="Medium" runat="server">天&nbsp;</asp:Label><asp:Label
                                        ID="Label6" Font-Bold="true" ForeColor="Red" Font-Size="Medium" runat="server">病假</asp:Label><asp:Label
                                            ID="bj" Font-Bold="true" ForeColor="Red" Font-Size="Medium" runat="server"></asp:Label><asp:Label
                                                ID="Label8" Font-Bold="true" ForeColor="Red" Font-Size="Medium" runat="server">天&nbsp;</asp:Label><asp:Label
                                                    ID="lblnj1" Font-Bold="true" ForeColor="Red" Font-Size="Medium" runat="server">年假</asp:Label><asp:Label
                                                        ID="nj" Font-Bold="true" ForeColor="Red" Font-Size="Medium" runat="server"></asp:Label><asp:Label
                                                            ID="lblnj2" Font-Bold="true" ForeColor="Red" Font-Size="Medium" runat="server">天&nbsp;</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">请假类型：<asp:DropDownList ID="qjlx" runat="server">
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
                                状态：<asp:DropDownList ID="qjzt" runat="server">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                    <asp:ListItem Text="录入" Value="录入"></asp:ListItem>
                                    <asp:ListItem Text="送审中" Value="送审中"></asp:ListItem>
                                    <asp:ListItem Text="已审批" Value="已审批"></asp:ListItem>
                                    <asp:ListItem Text="已确认" Value="已确认"></asp:ListItem>
                                    <asp:ListItem Text="已退回" Value="已退回"></asp:ListItem>
                                </asp:DropDownList>
                                请假开始时间：<asp:TextBox ID="qjkssj_s" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                    CssClass="mytext" Width="70"></asp:TextBox>至<asp:TextBox ID="qjkssj_e" onclick="SelectDate(this,'yyyy-MM-dd')"
                                        runat="server" CssClass="mytext" Width="70"></asp:TextBox>
                                请假理由：<asp:TextBox ID="qjly" runat="server" CssClass="mytext" Width="150"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="查询"
                                    OnClick="Ref_Click" CausesValidation="False"></asp:Button>
                                <input type="button" name="AddBtn" value="新增" class="mybtn" onclick="javascript: popAdd('Qjdlr_Add.aspx');" />
                                <asp:Button CssClass="mybtn" ID="ClearBtn" runat="server" Text="清空"
                                    CausesValidation="false" OnClick="Clear_Click"></asp:Button>
                                <asp:Image ID="Image1" runat="server" ImageUrl="../../images/help.gif" ToolTip="您只能查看、管理个人录入的请假单" />
                                <asp:Label ID="lblmsg" runat="server" Text="提醒：事假每月不超过1天，每季度不超过2天；病假每月不超过0.5天" Font-Size="Small"
                                    ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="请假理由">
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('Qjdlr_Mod.aspx?id=<%# Eval("qid") %>')" class="gvlink">
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("qjly") %>'></asp:Label></a>
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
                                        <asp:BoundField DataField="gztzqk" HeaderText="工作调整情况"></asp:BoundField>
                                        <asp:BoundField DataField="sqsj" HeaderText="录入时间" DataFormatString="{0:yyyy-MM-dd}"
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
    </form>
</body>
</html>
