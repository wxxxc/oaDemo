<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDoc.aspx.cs" Inherits="hkpro.workflow.docu.AdminDoc" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
     <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>红头文件</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td style="height: 38px">&nbsp;文件名称：<asp:TextBox ID="jsname" runat="server" CssClass="mytext" Width="150"></asp:TextBox>
                            </td>
                            <td align="right">
                                <asp:Button CssClass="btn btn-info" ID="QueBtn" runat="server" Text=" 查询 " OnClick="Query_Click" />
                                <input type="button" name="AddBtn" id="AddBtn" runat="server" value=" 增加 " class="btn btn-primary"
                                    onclick="javascript: location.href = 'AdminDoc_Add.aspx';" />
                                <asp:Button CssClass="btn btn-warning" ID="ModBtn" runat="server" Text=" 修改 " OnClick="Mod_Click" />
                                <asp:Button CssClass="btn btn-danger" ID="DelBtn" runat="server" Text=" 删除 " OnClick="Del_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                    <div class="mytable table-responsive">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                                    EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="选择">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="mw30"/>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect" runat="server" />
                                                <asp:Label ID="lblVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "adID") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                                <asp:Label ID="lblNameVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "adName") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="文件名称">
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('AdminDoc_Show.aspx?id=<%# Eval("adID") %>')"
                                                    class="gvlink">
                                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("adName") %>'></asp:Label>
                                                </a>
                                            </ItemTemplate>
                                               <HeaderStyle CssClass="mwp50" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="adType" HeaderText="文档类型">         <HeaderStyle CssClass="mw120" /></asp:BoundField>
                                        <asp:BoundField DataField="ui_desc" HeaderText="创建人">
                                            <HeaderStyle CssClass="mw60" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="AddTime" HeaderText="创建日期" DataFormatString="{0:yyyy-MM-dd}"
                                            HtmlEncode="False">
                                            <HeaderStyle CssClass="mw60" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                    </Columns>
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <RowStyle CssClass="hkRowStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                                        </div>
                            </td>
                        </tr>
                    </table>
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
