<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OffSealManage.aspx.cs"
    Inherits="hkpro.workflow.seal.OffSealManage" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
     <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>公章管理</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td style="height: 38px">&nbsp;快速检索：<asp:DropDownList ID="query_tj" runat="server">
                                <asp:ListItem Value="oName" Selected="True">公章名称</asp:ListItem>
                                <asp:ListItem Value="oRemark">备注</asp:ListItem>
                            </asp:DropDownList>
                                <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="150"></asp:TextBox>
                            </td>
                            <td align="right">
                                <asp:Button CssClass="btn btn-info" ID="QueBtn" runat="server" Text=" 查询 " OnClick="Query_Click" />
                                <input type="button" name="AddBtn" id="AddBtn" runat="server" value=" 增加 " class="btn btn-primary"
                                    onclick="javascript: location.href = 'OffSealManage_Add.aspx';" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                 <div class="mytable table-responsive">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                                    OnRowCommand="OnRow_Command" DataKeyNames="oID" EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table" AllowPaging="false" >
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../Images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="mw30" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="oID" HeaderText="自动ID">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="oNAME" HeaderText="公章名称">
                                            <HeaderStyle CssClass="mw150" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="oRemark" HeaderText="备注">
                                             <HeaderStyle CssClass="mwp80" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="AddTime" HeaderText="创建日期" DataFormatString="{0:yyyy-MM-dd}"
                                            HtmlEncode="False">
                                            <HeaderStyle CssClass="mw100" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="相关操作">
                                            <HeaderStyle CssClass="mw200" />
                                            <ItemTemplate>
                                                <a class="gvlink" href='OffSealManage_Do.aspx?id=<%# DataBinder.Eval(Container.DataItem, "oID") %>&no=<%# DataBinder.Eval(Container.DataItem, "oNo") %>'>管理</a>
                                                <asp:LinkButton ID="LBtn_stop" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "oID") %>'
                                                    CommandName="Stop" CssClass="gvlink">停用</asp:LinkButton>
                                                <asp:LinkButton ID="LBtn_use" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "oID") %>'
                                                    CommandName="Use" CssClass="gvlink">启用</asp:LinkButton>
                                                <asp:LinkButton ID="LBtn_reset" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "oID") %>'
                                                    CommandName="PwdReset" CssClass="gvlink">重置密码</asp:LinkButton>
                                                <asp:LinkButton ID="LBtn_del" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "oID") %>'
                                                    CommandName="Del" CssClass="gvlink">删除</asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
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
                    </table>
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
