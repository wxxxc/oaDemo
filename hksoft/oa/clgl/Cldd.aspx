<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cldd.aspx.cs" Inherits="hkpro.oa.clgl.Cldd" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>车辆调度</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                    <tr>
                        <td style="height: 40px">
                            行驶时间(自)：<asp:TextBox ID="txtSdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                CssClass="mytext" Width="130"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSdate"
                                ErrorMessage="请输入培训时间(自)">&nbsp;
                            </asp:RequiredFieldValidator>&nbsp;行驶时间(至)：<asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')"
                                runat="server" CssClass="mytext" Width="130"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEdate"
                                ErrorMessage="请输入培训时间(至)">&nbsp;
                            </asp:RequiredFieldValidator>
                            状态：<asp:DropDownList ID="zt" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ChangeType">
                                <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="审批中" Value="审批中"></asp:ListItem>
                                <asp:ListItem Text="已同意" Value="已同意"></asp:ListItem>
                                <asp:ListItem Text="已拒绝" Value="已拒绝"></asp:ListItem>
                                <asp:ListItem Text="已归还" Value="已归还"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td align="right">
                            <asp:Button CssClass="mybtn" ID="RefBtn" runat="server" Text="查询" OnClick="ChangeType"
                                CausesValidation="False"  />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="mytable table-responsive">
                            <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                 DataKeyNames="id"  EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table">
                                <Columns>
                                    <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle Width="30px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="id" HeaderText="编号">
                                        <HeaderStyle CssClass="hidden" />
                                        <ItemStyle CssClass="hidden" />
                                        <FooterStyle CssClass="hidden" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="路线">
                                        <ItemTemplate>
                                            <a href="#" onclick="javascript:popMod('cldd_view.aspx?id=<%# Eval("id") %>')" class="gvlink">
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("fcdd") %>'></asp:Label>-<asp:Label
                                                    ID="Label38" runat="server" Text='<%# Bind("dddd") %>'></asp:Label></a>
                                        </ItemTemplate>
                                         <HeaderStyle CssClass="mwp8"  />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="申请部门">
                                      <HeaderStyle CssClass="mw80"  />
                                        <ItemTemplate>
                                            <asp:Label ID="Label37" runat="server" Text='<%# Bind("bm_mc") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="申请人">
                                         <HeaderStyle CssClass="mw80"  />
                                        <ItemTemplate>
                                            <asp:Label ID="Label39" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="czrs" HeaderText="乘坐人数">
                                        <HeaderStyle CssClass="mw80"  />
                                        <ItemStyle HorizontalAlign="right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="zt" HeaderText="状态">
                                         <HeaderStyle CssClass="mw60"  />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                </Columns>
                                <RowStyle CssClass="hkRowStyle" />
                                <HeaderStyle CssClass="hkHeadStyle" />
                                <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                            </asp:GridView>
                                </div>
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
