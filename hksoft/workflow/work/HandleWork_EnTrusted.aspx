<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HandleWork_EnTrusted.aspx.cs"
    Inherits="hkpro.workflow.work.HandleWork_EnTrusted" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
     <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <title>已委托工作</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td style="height: 40px; width: 252px;">
                                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                    <tr>
                                        <td align="center" style="width: 84; height: 20; background-image: url(../../images/flow/sheetn.jpg)">
                                            <a href="HandleWork.aspx" class="black">未办理</a>
                                        </td>
                                        <td align="center" style="width: 84; background-image: url(../../images/flow/sheetn.jpg)">
                                            <a href="HandleWork_Finished.aspx" class="black">己办理</a>
                                        </td>
                                        <td align="center" style="width: 84; background-image: url(../../images/flow/sheety.jpg)">
                                            <a href="HandleWork_EnTrusted.aspx" class="black">己委托</a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;
                            </td>
                            <td align="right">&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <table align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
                        <tr>
                            <td>
                                <asp:DropDownList ID="dp_fname" runat="server" AutoPostBack="True" Width="100px">
                                </asp:DropDownList>
                                表单名称：<asp:TextBox ID="fName" runat="server" Width="100px" CssClass="mytext"></asp:TextBox>
                                工作标题：<asp:TextBox ID="wTitle" runat="server" Width="100px" CssClass="mytext"></asp:TextBox>
                                工作文号：<asp:TextBox ID="wName" runat="server" Width="80px" CssClass="mytext"></asp:TextBox>
                                步骤名称：<asp:TextBox ID="fnName" runat="server" Width="80px" CssClass="mytext"></asp:TextBox>
                                <asp:Button ID="QueBtn" runat="server" Text="查询" OnClick="Query_Click" CssClass="btn btn-info" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top">
                     <div class="mytable table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                        EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table">
                        <Columns>
                            <asp:BoundField DataField="etSerialNo" HeaderText="流水号">
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle CssClass="mw60" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="工作标题">
                                <ItemTemplate>
                                    <a href='HandleWork_EnTrusted_Show.aspx?id=<%# DataBinder.Eval(Container.DataItem, "etID") %>'
                                        class="gvlink" target="_self">
                                        <%# DataBinder.Eval(Container.DataItem, "etTitle")%></a>
                                </ItemTemplate>
                                <HeaderStyle CssClass="mwp30" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="工作文号">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "etName") %>
                                </ItemTemplate>
                                <HeaderStyle CssClass="mwp30" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="ui_desc" HeaderText="发起人">
                                 <HeaderStyle CssClass="mw60"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="etUserName" HeaderText="代办人">
                                 <HeaderStyle CssClass="mw60"/>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="表单类型">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "fName") %>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                 <HeaderStyle CssClass="mw60"/>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="当前步骤">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "fnName")%>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                 <HeaderStyle CssClass="mw100"/>
                            </asp:TemplateField>
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
