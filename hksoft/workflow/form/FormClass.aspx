<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormClass.aspx.cs" Inherits="hkpro.workflow.form.FormClass" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
      <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>表单分类</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td style="height: 38px">&nbsp;快速检索：<asp:DropDownList ID="query_tj" runat="server">
                                <asp:ListItem Value="fcName" Selected="True">分类名称</asp:ListItem>
                                <asp:ListItem Value="fcRemark">备注</asp:ListItem>
                            </asp:DropDownList>
                                <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="150"></asp:TextBox>
                            </td>
                            <td align="right">
                                <asp:Button CssClass="btn btn-info" ID="QueBtn" runat="server" Text=" 查询 " OnClick="Query_Click" />
                                <input type="button" name="AddBtn" id="AddBtn" runat="server" value=" 增加 " class="btn btn-success"
                                    onclick="javascript: location.href = 'FormClass_Add.aspx'" />
                                <asp:Button CssClass="btn btn-warning" ID="ModBtn" runat="server" Text=" 修改 " OnClick="Mod_Click" />
                                <asp:Button CssClass="btn btn-danger" ID="DelBtn" runat="server" Text=" 删除 " OnClick="Del_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                              <div class="mytable table-responsive">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                                    DataKeyNames="fcID" EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../Images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="mw30" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="选择">
                                            <HeaderStyle CssClass="mw30" />
                                            <ItemStyle HorizontalAlign="Center" Wrap="True" />
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect" runat="server" ToolTip="双击每行任意位置可以选中或取消选择框" />
                                                <asp:Label ID="lblVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fcID") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                                <asp:Label ID="lblNameVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fcNAME") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="fcID" HeaderText="分类编码">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="分类名称">
                                            <HeaderStyle CssClass="mw200" />
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('FormClass_Show.aspx?id=<%# Eval("fcID") %>')"
                                                    class="gvlink">
                                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("fcNAME") %>'></asp:Label>
                                                </a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="fcRemark" HeaderText="备注">
                                               <HeaderStyle CssClass="mwp80" />
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
