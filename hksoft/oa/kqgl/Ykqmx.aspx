<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ykqmx.aspx.cs" Inherits="hkpro.oa.kqgl.Ykqmx" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>月考勤情况</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table id="hkshow2" cellspacing="0" cellpadding="2" width="800" border="0">
                        <tr>
                            <td align="right">统计月份：
                            </td>
                            <td>
                                <asp:TextBox ID="kqrq" onclick="SelectDate(this,'yyyy-MM')" runat="server" CssClass="mytext"
                                    Width="150"></asp:TextBox>
                            </td>
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
                        </tr>
                        <tr>
                            <td align="right">&nbsp;
                            </td>
                            <td colspan="5">
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="查询"
                                    OnClick="Ref_Click"></asp:Button>
                                <asp:Button CssClass="mybtn" ID="ExpBtn" runat="server" Text="导出" OnClick="Exp_Click" />
                                <asp:Button CssClass="mybtn" ID="ClearBtn" runat="server" Text="清空"
                                    CausesValidation="false" OnClick="Clear_Click"></asp:Button>
                                <font color="red">注：已经自动去除了各员工请假和考勤说明（考勤管理员已确认通过）的相关记录</font>
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv" ShowFooter="false" AllowPaging="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="yhid" HeaderText="用户编码"></asp:BoundField>
                                        <asp:BoundField DataField="ui_desc" HeaderText="姓名"></asp:BoundField>
                                        <asp:BoundField DataField="bm_mc" HeaderText="部门"></asp:BoundField>
                                        <asp:BoundField DataField="cdcs" HeaderText="迟到(次)">
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ztcs" HeaderText="早退(次)">
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wqdcs" HeaderText="未签到(次)">
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wqtcs" HeaderText="未签退(次)">
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="kgcs" HeaderText="旷工(次)">
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <FooterStyle CssClass="hkBottomStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="kqrq"
            ErrorMessage="请选择统计月份">&nbsp;
        </asp:RequiredFieldValidator>
    </form>
</body>
</html>
