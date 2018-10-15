<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rwfabudanwei.aspx.cs" Inherits="hksoft.oa.rwgl.rwfabudanwei" %>

<!DOCTYPE html>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <title>任务发布单位</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                             <td style="height:40px">   快速检索：<asp:DropDownList ID="query_tj" runat="server">
                                    <asp:ListItem Value="a.ui_desc">单位名称</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="100"></asp:TextBox>
                            </td>
                            <td align="right">
                                <asp:Button CssClass="btn btn-primary" ID="QueryBtn" runat="server" Text="查 询" OnClick="Query_Click" CausesValidation="False" />
                                <input type="button" id="AddBtn" name="AddBtn" value="增 加" class="btn btn-success" onclick="javascript: popView('rwfabudanweiAdd.aspx');" runat="server" />
                              </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False"
                                    DataKeyNames="id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="序号">
                                            <ItemTemplate>
                                                <%--<a href="#" onclick="javascript:popView('yh_mod.aspx?id=<%# Eval("id") %>')" class="gvlink">--%>
                                                    <asp:Label ID="Labelid" runat="server" Text='<%# Bind("num") %>'></asp:Label></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="name" HeaderText="单位名称">
                                            <ItemStyle Wrap="false" />
                                        </asp:BoundField>
                                        
                                        <asp:BoundField DataField="charge" HeaderText="单位负责人">
                                            <ItemStyle Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="tel" HeaderText="联系电话"></asp:BoundField>
                                        <%--<asp:BoundField DataField="email" HeaderText="电子邮件"></asp:BoundField>--%>
                                    
                                         <asp:BoundField DataField="address" HeaderText="单位地址"></asp:BoundField>
                                       
                                        
                                        <asp:TemplateField HeaderText="操作">
                                            <HeaderStyle Width="160" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popView('rwfabudanweiMod.aspx?id=<%# Eval("id") %>')" class="gvlink">编辑</a>
                                                <%--<a href="#" onclick="Del_Click?id=<%# Eval("id") %>')"  OnClientClick="return confirm('确认要执行删除吗？')" class="gvlink">删除</a>--%>
                                             </ItemTemplate>
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

