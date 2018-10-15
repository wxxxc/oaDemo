<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SealUseLog.aspx.cs" Inherits="hkpro.workflow.seal.SealUseLog" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>印章使用日志</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td style="height: 38px">&nbsp;印章名称：<asp:TextBox ID="jsName" runat="server" CssClass="mytext" Width="100"></asp:TextBox>
                    使用人：<asp:TextBox ID="jsRealname" runat="server" CssClass="mytext" Width="100"></asp:TextBox>
                    时间：<asp:TextBox ID="jsUsetime" runat="server" CssClass="mytext" Width="100" onfocus="calendar();"></asp:TextBox>
                    <asp:Button CssClass="btn btn-info" ID="QueBtn" runat="server" Text=" 查询 " OnClick="Query_Click" />
                    <asp:Button CssClass="btn btn-danger" ID="DelBtn" runat="server" Text=" 删除 " OnClick="Del_Click" />
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <div class="mytable table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                        EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table">
                        <Columns>
                            <asp:TemplateField HeaderText="选择">
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle CssClass="mw30" />
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" ToolTip="双击每行任意位置可以选中或取消选择框" runat="server" />
                                    <asp:Label ID="lblVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "slID") %>'
                                        Visible="False" Width="0px"></asp:Label>
                                    <asp:Label ID="lblNameVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ui_desc") %>'
                                        Visible="False" Width="0px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="slName" HeaderText="印章名称">  <HeaderStyle CssClass="mwp30" /></asp:BoundField>
                            <asp:BoundField DataField="ui_desc" HeaderText="使用人">  <HeaderStyle CssClass="mwp30" /></asp:BoundField>
                            <asp:BoundField DataField="slIP" HeaderText="IP地址">  <HeaderStyle CssClass="mwp30" /></asp:BoundField>
                            <asp:BoundField DataField="UseTime" HeaderText="使用时间">  <HeaderStyle CssClass="mwp30" /></asp:BoundField>
                        </Columns>
                        <HeaderStyle CssClass="hkHeadStyle" />
                        <RowStyle CssClass="hkRowStyle" />
                        <AlternatingRowStyle CssClass="hkAltRowStyle" />
                        <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                    </asp:GridView>
                        </div>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 105; height: 25" align="center">
                                <a href="javascript:void(0)" onclick="chkAllw()" class="page_text">全选</a> <a href="javascript:void(0)"
                                    onclick="nochkAll()" class="page_text">全消</a> <a href="javascript:void(0)" onclick="revchkAll()"
                                        class="page_text">反选</a>
                            </td>
                            <td>
                                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                    ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font class=page_text>共%RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
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
