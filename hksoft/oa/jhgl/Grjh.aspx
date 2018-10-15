<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grjh.aspx.cs" Inherits="hkpro.oa.jhgl.Grjh" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>个人计划审批</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 40px">年份：<asp:TextBox ID="jhnf" runat="server" Width="60" CssClass="mytext" onclick="SelectDate(this,'yyyy')"></asp:TextBox>
                                状态：<asp:DropDownList ID="zt" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Query_Click">
                                    <asp:ListItem Text="审核中" Value="审核中"></asp:ListItem>
                                    <asp:ListItem Text="评价中" Value="评价中"></asp:ListItem>
                                    <asp:ListItem Text="完成" Value="完成"></asp:ListItem>
                                </asp:DropDownList>
                                &nbsp; 计划周期：<asp:TextBox ID="jhcq" runat="server" Width="60" CssClass="mytext"></asp:TextBox>
                            </td>
                            <td align="right">
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="查询" OnClick="Query_Click"
                                    CausesValidation="False" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                  <div class="mytable table-responsive">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="jhid" EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="mw30" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="jhid" HeaderText="编码">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                            <FooterStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="jhnf" HeaderText="计划年份">
                                            <HeaderStyle CssClass="mw80" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="jhyf" HeaderText="计划周期">
                                             <HeaderStyle CssClass="mw80" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="总体目标">
                                            <HeaderStyle Wrap="false" />
                                            <ItemStyle Wrap="false" />
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('grjh_mod.aspx?id=<%# Eval("jhid") %>')" class="gvlink">
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ztmb") %>'></asp:Label></a>
                                            </ItemTemplate>
                                             <HeaderStyle CssClass="mwp40" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="mc" HeaderText="计划类型">
                                           <HeaderStyle CssClass="mw120" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ui_desc" HeaderText="计划人">
                                          <HeaderStyle CssClass="mw100" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sprNames" HeaderText="参与审批人">
                                             <HeaderStyle CssClass="mwp40" />
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
