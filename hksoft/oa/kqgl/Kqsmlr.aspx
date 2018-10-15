<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kqsmlr.aspx.cs" Inherits="hkpro.oa.kqgl.Kqsmlr" %>

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
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                align="center">
                                <a href="Qjdlr.aspx" class="black">请假单</a>
                            </td>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_y.gif)"
                                align="center">
                                <a href="Kqsmlr.aspx" class="mail_top">考勤说明</a>
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
                            <td align="right">统计类型：
                            </td>
                            <td>
                                <asp:DropDownList ID="qdqt" runat="server" Width="150">
                                    <asp:ListItem Text="全部" Value=""></asp:ListItem>
                                    <asp:ListItem Text="仅显示签到" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="仅显示签退" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="right">状态：
                            </td>
                            <td>
                                <asp:DropDownList ID="smzt" runat="server" Width="150">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                    <asp:ListItem Text="录入" Value="录入"></asp:ListItem>
                                    <asp:ListItem Text="送审中" Value="送审中"></asp:ListItem>
                                    <asp:ListItem Text="已审批" Value="已审批"></asp:ListItem>
                                    <asp:ListItem Text="已确认" Value="已确认"></asp:ListItem>
                                    <asp:ListItem Text="已退回" Value="已退回"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="right">考勤情况说明：
                            </td>
                            <td>
                                <asp:TextBox ID="kqqksm" runat="server" CssClass="mytext" Width="150"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">日期：
                            </td>
                            <td colspan="5">
                                <asp:TextBox ID="qdsj_s" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                    Width="70"></asp:TextBox>至<asp:TextBox ID="qdsj_e" onclick="SelectDate(this,'yyyy-MM-dd')"
                                        runat="server" CssClass="mytext" Width="70"></asp:TextBox>
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="查询" OnClick="Ref_Click"
                                    CausesValidation="False"></asp:Button>
                                <input type="button" name="AddBtn" value="新增" class="mybtn" onclick="javascript: popAdd('Kqsmlr_Add.aspx');" />
                                <asp:Button CssClass="mybtn" ID="ClearBtn" runat="server" Text="清空" CausesValidation="false"
                                    OnClick="Clear_Click"></asp:Button>
                                <asp:Image ID="Image1" runat="server" ImageUrl="../../images/help.gif" ToolTip="您只能查看、管理个人录入的考勤说明" />
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
                                        <asp:TemplateField HeaderText="日期">
                                            <HeaderStyle Width="80px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('Kqsmlr_Mod.aspx?id=<%# Eval("sid") %>')"
                                                    class="gvlink">
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("qdsj", "{0:yyyy-MM-dd}") %>'></asp:Label></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ynqd1" HeaderText="上午签到">
                                            <HeaderStyle Width="60px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ynqt1" HeaderText="上午签退">
                                            <HeaderStyle Width="60px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ynqd2" HeaderText="下午签到">
                                            <HeaderStyle Width="60px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ynqt2" HeaderText="下午签退">
                                            <HeaderStyle Width="60px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ynqd3" HeaderText="晚上签到">
                                            <HeaderStyle Width="60px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ynqt3" HeaderText="晚上签退">
                                            <HeaderStyle Width="60px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="smzt" HeaderText="状态">
                                            <HeaderStyle Width="55px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="kqqksm" HeaderText="考勤情况说明"></asp:BoundField>
                                        <asp:BoundField DataField="sqsj" HeaderText="录入时间" DataFormatString="{0:yyyy-MM-dd}"
                                            HtmlEncode="False">
                                            <HeaderStyle Width="80px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sscs" HeaderText="送审次数">
                                            <HeaderStyle Width="60px" />
                                            <ItemStyle HorizontalAlign="center" />
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
