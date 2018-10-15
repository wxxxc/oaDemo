<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlow.aspx.cs" Inherits="hkpro.workflow.flow.WorkFlow" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>工作流管理</title>
    <script>
        function showflow(str) {
            var num = Math.random();
            window.open("WorkFlow_Show.aspx?tmp=" + num + "&id=" + str + "", "_blank", "height=650, width=900,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=0,left=0")
        }

        function modflow(str) {
            var num = Math.random();
            window.open("WorkFlow_Mod.aspx?tmp=" + num + "&id=" + str + "", "_blank", "height=650, width=900,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=0,left=0")
        }

        function addflow() {
            var num = Math.random();
            window.open("WorkFlow_Add.aspx?tmp=" + num + "&id=<%=Request.QueryString["FormId"] %>", "_blank", "height=650, width=900,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no,top=0,left=0")
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td height="25">
                    <img src="../../images/arrow_r.gif" border="0" alt=""><b>当前表单：<%=formName %></b>
                </td>
                <td align="right">
                    <input type="button" name="AddBtn" id="AddBtn" runat="server" value="新建工作流" class="btn btn-success"
                        onclick="javascript: addflow();" />
                    <asp:Button CssClass="btn btn-danger" ID="DelBtn" runat="server" Text="删除工作流" OnClick="Del_Click"></asp:Button>&nbsp;
                </td>
            </tr>
            <tr>
                <td valign="top" colspan="2">
                     <div class="mytable table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                        DataKeyNames="wfID" EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table">
                        <Columns>
                            <asp:TemplateField HeaderText="选择">
                                    <HeaderStyle CssClass="mw30" />
                                <ItemStyle HorizontalAlign="Center" Wrap="True" />
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" runat="server" ToolTip="双击每行任意位置可以选中或取消选择框" />
                                    <asp:Label ID="lblVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "wfID") %>'
                                        Visible="False" Width="0px"></asp:Label>
                                    <asp:Label ID="lblNameVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "wfNAME") %>'
                                        Visible="False" Width="0px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="流程名称">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "wfName") %>
                                </ItemTemplate>
                                    <HeaderStyle CssClass="mwp30" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="允许流程监控人员">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "wfUserNames")%>
                                </ItemTemplate>
                                    <HeaderStyle CssClass="mwp50" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="相关操作">
                          <HeaderStyle CssClass="mw120" />
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label ID="lblwfID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "wfID")%>'
                                        Visible="false"></asp:Label>
                                    <asp:Label ID="lblwfNo" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "wfNo")%>'
                                        Visible="false"></asp:Label>
                                    <asp:Label ID="lblshow" runat="server"></asp:Label>
                                    <asp:Label ID="lblmod" runat="server"></asp:Label>
                                    <asp:Label ID="lbldesign" runat="server"></asp:Label>
                                </ItemTemplate>
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
                <td colspan="2">
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
        <asp:DropDownList ID="dpform" runat="server" Visible="False">
        </asp:DropDownList>
    </form>
</body>
</html>
