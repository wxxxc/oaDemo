<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QueryWork.aspx.cs" Inherits="hkpro.workflow.work.QueryWork" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
     <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <title>工作查询</title>
    <script>
        function clearall() {
            document.getElementById('txt_wSerialNo').value = '';
            document.getElementById('txt_PromoterName').value = '';
            document.getElementById('Name').value = '';
            document.getElementById('txt_sdate').value = '';
            document.getElementById('txt_edate').value = '';
            document.getElementById('txt_fName').value = '0';
            document.getElementById('txt_wStatus').value = '所有类型';
            document.getElementById('wTitle').value = '';
            document.getElementById('fqbm').value = '0';
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="1" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td height="5"></td>
                        </tr>
                        <tr>
                            <td>&nbsp;表单类型：<asp:DropDownList ID="txt_fName" runat="server" Width="150px">
                            </asp:DropDownList>
                                流水号：<asp:TextBox ID="txt_wSerialNo" runat="server" Width="150px" CssClass="mytext"></asp:TextBox>
                                录入时间：<asp:TextBox ID="txt_sdate" runat="server" Width="75px" CssClass="mytext" onfocus="calendar();"></asp:TextBox>至<asp:TextBox
                                    ID="txt_edate" runat="server" Width="75px" CssClass="mytext" onfocus="calendar();"></asp:TextBox>
                                状态：<asp:DropDownList ID="txt_wStatus" runat="server">
                                    <asp:ListItem>所有类型</asp:ListItem>
                                    <asp:ListItem>等待办理</asp:ListItem>
                                    <asp:ListItem>正在办理</asp:ListItem>
                                    <asp:ListItem>正常结束</asp:ListItem>
                                    <asp:ListItem>强制结束</asp:ListItem>
                                    <asp:ListItem>驳回审批</asp:ListItem>
                                    <asp:ListItem>自动结束</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;工作文号：<asp:TextBox ID="Name" runat="server" Width="150px" CssClass="mytext"></asp:TextBox>
                                发起人：<asp:TextBox ID="txt_PromoterName" runat="server" Width="150px" CssClass="mytext"></asp:TextBox>
                                工作标题：<asp:TextBox ID="wTitle" runat="server" Width="162px" CssClass="mytext"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;发起部门：<asp:DropDownList ID="fqbm" runat="server" Width="150px">
                            </asp:DropDownList>
                                排序条件：<asp:DropDownList ID="pxtj1" runat="server" CssClass="mytext">
                                    <asp:ListItem Text="最后审批时间" Value="A.LastTime" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="表单类型" Value="C.fname"></asp:ListItem>
                                    <asp:ListItem Text="工作标题" Value="A.wTitle"></asp:ListItem>
                                    <asp:ListItem Text="流水号" Value="A.wSerialNo"></asp:ListItem>
                                    <asp:ListItem Text="工作文号" Value="A.wName"></asp:ListItem>
                                    <asp:ListItem Text="发起人" Value="B.ui_desc"></asp:ListItem>
                                    <asp:ListItem Text="状态" Value="A.wStatus"></asp:ListItem>
                                    <asp:ListItem Text="录入时间" Value="A.AddTime"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="pxtj2" runat="server" CssClass="mytext">
                                    <asp:ListItem Text="升序" Value="asc"></asp:ListItem>
                                    <asp:ListItem Text="降序" Value="desc" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button ID="QueBtn" runat="server" Text="查询" OnClick="QueBtn_Click1" CssClass="btn btn-info" />
                                <input id="ClearBtn" type="button" value="清空" onclick="clearall()" class="btn btn-primary" />
                                <asp:Image ID="Image1" runat="server" ImageUrl="../../images/help.gif" ToolTip="只有参与流程环节的经办人员（包括经办部门、经办角色下的人员）才能看到相应记录" />
                            </td>
                        </tr>
                        <tr>
                            <td height="5"></td>
                        </tr>
                        <tr>
                            <td>
                                 <div class="mytable table-responsive">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                                    EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:BoundField DataField="wSerialNo" HeaderText="流水号">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="mw30"  />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="工作标题">
                                            <ItemTemplate>
                                                <a href='QueryWork_Show.aspx?id=<%# DataBinder.Eval(Container.DataItem, "wID") %>'
                                                    class="gvlink" target="_self">
                                                    <%# DataBinder.Eval(Container.DataItem, "wTitle")%></a>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="mwp30"  />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="工作文号">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "wName")%>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="mwp30" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="PromoterName" HeaderText="发起人"><HeaderStyle CssClass="mw60"  /></asp:BoundField>
                                        <asp:BoundField DataField="wUserNames" HeaderText="当前经办人"><HeaderStyle CssClass="mw60"  /></asp:BoundField>
                                        <asp:BoundField DataField="wStatus" HeaderText="状态">
                                            <ItemStyle Wrap="False" />
                                            <HeaderStyle CssClass="mw60"  />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="LastTime" HeaderText="最后审批时间" DataFormatString="{0:yyyy-MM-dd HH:mm}"
                                            HtmlEncode="False">
                                            <HeaderStyle CssClass="mw150"  />
                                            <ItemStyle Wrap="False" Width="120" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="表单类型">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "fName")%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                            <HeaderStyle CssClass="mw100"  />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="当前步骤">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "NextNodeName") %>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="mw100"  />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="流程操作">
                                            <ItemTemplate>
                                                <asp:Label ID="lblwID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "wID")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="lbltxt" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                            <HeaderStyle CssClass="mw150"  />
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
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                        ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font class=page_text>共%RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                        NumericButtonCount="10" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                        PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
                        InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go">
                    </webdiyer:AspNetPager>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
