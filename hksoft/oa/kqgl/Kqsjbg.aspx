<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kqsjbg.aspx.cs" Inherits="hkpro.oa.kqgl.Kqsjbg" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>考勤数据变更</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="2" width="800" border="0">
                        <tr>
                            <td style="height: 5px" colspan="6"></td>
                        </tr>
                        <tr>
                            <td align="right">选择部门：
                            </td>
                            <td>
                                <asp:DropDownList ID="bm" runat="server" CssClass="mytext" Width="150" AutoPostBack="true"
                                    OnSelectedIndexChanged="bm_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td align="right">选择人员：
                            </td>
                            <td>
                                <asp:DropDownList ID="ry" runat="server" CssClass="mytext" Width="150">
                                </asp:DropDownList>
                            </td>
                            <td align="right">统计范围：
                            </td>
                            <td>
                                <asp:DropDownList ID="tjfw" runat="server" CssClass="mytext" Width="150">
                                    <asp:ListItem Text="全部人员" Value=""></asp:ListItem>
                                    <asp:ListItem Text="只显示特殊考勤人员" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">考勤日期：
                            </td>
                            <td colspan="5">
                                <asp:TextBox ID="kqrq_s" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                    Width="75"></asp:TextBox>至<asp:TextBox ID="kqrq_e" onclick="SelectDate(this,'yyyy-MM-dd')"
                                        runat="server" CssClass="mytext" Width="75"></asp:TextBox>
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="查 询" OnClick="Ref_Click"></asp:Button>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 5px" colspan="6"></td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    EmptyDataText="没有查到符合条件的数据！" Width="1200" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="操作">
                                            <HeaderStyle Wrap="false" />
                                            <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popView('Kqsjbg_View.aspx?id=<%# Eval("rybh") %>&rq=<%# Eval("kqrq") %>')"
                                                    class="gvlink">变更</a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="查看">
                                            <HeaderStyle Wrap="false" />
                                            <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblyh" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ui_id")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="lblrq" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "kqrq")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="lbltxt" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="考勤日期">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("kqrq", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Width="80px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="rybh" HeaderText="对应考勤机ID">
                                            <HeaderStyle Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ui_id" HeaderText="人员编码"></asp:BoundField>
                                        <asp:BoundField DataField="xm" HeaderText="姓名"></asp:BoundField>
                                        <asp:BoundField DataField="sb1" HeaderText="上班1"></asp:BoundField>
                                        <asp:BoundField DataField="xb2" HeaderText="下班2"></asp:BoundField>
                                        <asp:BoundField DataField="sb3" HeaderText="上班3"></asp:BoundField>
                                        <asp:BoundField DataField="xb4" HeaderText="下班4"></asp:BoundField>
                                        <asp:BoundField DataField="sb5" HeaderText="上班5"></asp:BoundField>
                                        <asp:BoundField DataField="xb6" HeaderText="下班6"></asp:BoundField>
                                        <asp:BoundField DataField="cdcs" HeaderText="迟到次数"></asp:BoundField>
                                        <asp:BoundField DataField="ztcs" HeaderText="早退次数"></asp:BoundField>
                                        <asp:BoundField DataField="kgcs" HeaderText="旷工次数"></asp:BoundField>
                                        <asp:BoundField DataField="wqdcs" HeaderText="无签到次数"></asp:BoundField>
                                        <asp:BoundField DataField="wqtcs" HeaderText="无签退次数"></asp:BoundField>
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
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="kqrq_s"
            ErrorMessage="请选择考勤开始日期">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="kqrq_e"
            ErrorMessage="请选择考勤截止日期">&nbsp;
        </asp:RequiredFieldValidator>
    </form>
</body>
</html>
