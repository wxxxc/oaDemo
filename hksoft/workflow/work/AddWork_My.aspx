<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddWork_My.aspx.cs" Inherits="hkpro.workflow.work.AddWork_My" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>我的新建</title>
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
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td style="height: 45px; width: 168px;">
                                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                    <tr>
                                        <td align="center" style="width: 84; height: 20; background-image: url(../../images/flow/sheetn.jpg)">
                                            <a href="AddWork.aspx" class="black">工作管理</a>
                                        </td>
                                        <td align="center" style="width: 84; background-image: url(../../images/flow/sheety.jpg)">我的新建
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
                            <td>&nbsp;表单类型：<asp:DropDownList ID="txt_fName" runat="server" Width="150px">
                            </asp:DropDownList>
                                流水号：<asp:TextBox ID="txt_wSerialNo" runat="server" Width="150px" CssClass="mytext"></asp:TextBox>
                                录入时间：<asp:TextBox ID="txt_sdate" runat="server" Width="75px" onfocus="calendar();"
                                    CssClass="mytext"></asp:TextBox>至<asp:TextBox ID="txt_edate" runat="server" Width="75px"
                                        onfocus="calendar();" CssClass="mytext"></asp:TextBox>
                                状态：<asp:DropDownList ID="txt_wStatus" runat="server">
                                    <asp:ListItem>所有类型</asp:ListItem>
                                    <asp:ListItem>等待办理</asp:ListItem>
                                    <asp:ListItem>正在办理</asp:ListItem>
                                    <asp:ListItem>正常结束</asp:ListItem>
                                    <asp:ListItem>强制结束</asp:ListItem>
                                    <asp:ListItem>驳回审批</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;工作文号：<asp:TextBox ID="Name" runat="server" Width="150px" CssClass="mytext"></asp:TextBox>
                                发起人：<asp:TextBox ID="txt_PromoterName" runat="server" Width="150px" CssClass="mytext"></asp:TextBox>
                                工作标题：<asp:TextBox ID="wTitle" runat="server" Width="163px" CssClass="mytext"></asp:TextBox>
                                <asp:Button ID="QueBtn" runat="server" Text="查询" OnClick="QueBtn_Click1" CssClass="mybtn" />
                                <input id="ClearBtn" type="button" value="清空" onclick="clearall()" class="mybtn" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                        EmptyDataText="没有查到符合条件的数据！" Width="1300" CssClass="hkgv">
                        <Columns>
                            <asp:BoundField DataField="wSerialNo" HeaderText="流水号">
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="50px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="工作标题">
                                <ItemTemplate>
                                    <a href='QueryWork_Show.aspx?id=<%# DataBinder.Eval(Container.DataItem, "wID") %>'
                                        class="gvlink" target="_self">
                                        <%# DataBinder.Eval(Container.DataItem, "wTitle")%></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="工作文号">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "wName")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ui_desc" HeaderText="发起人"></asp:BoundField>
                            <asp:BoundField DataField="wStatus" HeaderText="状态"></asp:BoundField>
                            <asp:BoundField DataField="LastTime" HeaderText="最后审批时间" DataFormatString="{0:yyyy-MM-dd HH:mm}"
                                HtmlEncode="False">
                                <ItemStyle Wrap="False" Width="120" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="表单类型">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "fName")%>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="当前步骤">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "NextNodeName")%>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="流程操作">
                                <HeaderStyle />
                                <ItemTemplate>
                                    <asp:Label ID="lblwID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "wID")%>'
                                        Visible="false"></asp:Label>
                                    <asp:Label ID="lbltxt" runat="server"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Wrap="false" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle CssClass="hkHeadStyle" />
                        <RowStyle CssClass="hkRowStyle" />
                        <AlternatingRowStyle CssClass="hkAltRowStyle" />
                        <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                    </asp:GridView>
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
