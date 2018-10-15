<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilesManage.aspx.cs" Inherits="hkpro.oa.dagl.FilesManage" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>案卷管理</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 25px">案卷编号:<asp:TextBox ID="jsNumber" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                案卷名称:<asp:TextBox ID="jsName" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                所属卷库:<asp:TextBox ID="jsRoomName" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                所属部门:<asp:TextBox ID="jsUnitName" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                编制机构:<asp:TextBox ID="jsBzPost" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 25px">保管期限:<asp:TextBox ID="jsBgTime" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                全&nbsp;宗&nbsp;号:<asp:TextBox ID="jsQuanZong" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                目&nbsp;录&nbsp;号:<asp:TextBox ID="jsMulu" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                档案馆号:<asp:TextBox ID="jsDaGuan" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                保险箱号:<asp:TextBox ID="jsBaoXian" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 25px">缩&nbsp;微&nbsp;号:<asp:TextBox ID="jsSuoWei" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                凭证类别:<asp:TextBox ID="jsPinZheng" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="查 询" OnClick="Query_Click"
                                    CausesValidation="False" />
                                <input type="button" id="AddBtn" name="AddBtn" value="增 加" class="mybtn" onclick="javascript: popAdd('FilesManage_Add.aspx');"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv" OnRowCommand="GridView1_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Number" HeaderText="案卷编号">
                                            <ItemStyle Wrap="False" />
                                            <HeaderStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Name" HeaderText="案卷名称">
                                            <ItemStyle Wrap="False" />
                                            <HeaderStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="所属部门">
                                            <HeaderStyle Wrap="False" />
                                            <ItemTemplate>
                                                <%# ((Eval("UnitName").ToString().Replace("—", "").Replace("|", "")))%>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="State" HeaderText="状态">
                                            <ItemStyle Wrap="False" />
                                            <HeaderStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="相关操作">
                                            <HeaderStyle Wrap="False" Width="175px" />
                                            <ItemTemplate>
                                                <asp:Label ID="HyId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "id")%>'
                                                    Visible="false"></asp:Label>
                                                <a href="#" onclick="javascript:popMod('FilesManage_show.aspx?id=<%# Eval("id") %>')"
                                                    class="gvlink">查看</a> <a href="FilesManageshowBook.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id")%>"
                                                        class="gvlink">查看文件</a> <a href="#" onclick="javascript:popMod('FilesManage_update.aspx?id=<%# Eval("id") %>')"
                                                            class="gvlink">修改</a><br />
                                                <asp:LinkButton ID="ShouHui" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'
                                                    CommandName="ShouHui" CssClass="gvlink">收回文件</asp:LinkButton>
                                                <asp:LinkButton ID="Shanchu" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'
                                                    CommandName="Shanchu" CssClass="gvlink">删除</asp:LinkButton>
                                                <asp:LinkButton ID="ZtOrQd" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'
                                                    CommandName="ZtOrQd" CssClass="gvlink">拆卷/封卷</asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="175px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 22px">
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
