<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ylwdrc.aspx.cs" Inherits="hksoft.portal.rcgl.ylwdrc" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
      <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <style>
        td {
        text-align:center;
        }
    </style>
   
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td style="height: 80px" colspan="2">&nbsp;
                                 <span style="padding: 10px">类别：</span>
                                <asp:DropDownList ID="DropDownList1" runat="server" Style="height: 38px; border-radius: 2px">
                                <asp:ListItem Value="ytj" Selected="True">已写日志</asp:ListItem>
                                <asp:ListItem Value="wtj">未写日志</asp:ListItem>
                                </asp:DropDownList>
                                <span style="padding: 10px">日志人：</span>
                                 <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="180" Height="38" Style="border-radius: 2px"></asp:TextBox>
                               
                               <%-- <asp:DropDownList ID="query_tj" runat="server" Style="height: 30px; border-radius: 2px">
                                <asp:ListItem Value="ui_desc">日志人</asp:ListItem>
                                <asp:ListItem Value="rczt">日志主题</asp:ListItem>
                                <asp:ListItem Value="bm_mc">所在部门</asp:ListItem>
                                </asp:DropDownList>--%>
                                
                                 <span style="padding: 10px">部门：</span> <asp:DropDownList ID="bm" runat="server" CssClass="mytext" Width="250"  Height="38" border-radius="2px">
                                <asp:ListItem  Text="领导&科级干部，部门中心负责人" Value="1000000"></asp:ListItem>
                                
                            </asp:DropDownList>
                                <span style="padding: 10px">日期：</span>
                                 <asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                                        CssClass="mytext" Width="180" Height="38" border-radius="2px" ></asp:TextBox>
                                 <span style="padding: 10px">至</span> 
                                <asp:TextBox ID="TextBox1" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                                        CssClass="mytext" Width="180" Height="38" border-radius="2px" ></asp:TextBox>&nbsp
                                <asp:Button CssClass="btn btn-info" ID="button" runat="server" Text="查询" OnClick="Query_Click"
                                    CausesValidation="False" />
                                 </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="mytable table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                        EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table">
                                        <Columns>
                                            <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle CssClass="mw30" />
                                            </asp:TemplateField>
                                           <%-- <asp:TemplateField>
                                                <HeaderStyle Width="30px"></HeaderStyle>
                                                <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                                <HeaderTemplate>
                                                    <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16; height: 16" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                           
                                            <asp:TemplateField HeaderText="日志人">
                                                <ItemTemplate>
                                                    <a href="#" onclick="javascript:popView('ylxqview.aspx?rcid=<%# Eval("rcid") %>')"
                                                        class="gvlink">
                                                        <asp:Label ID="Labelsyz" runat="server" Text='<%# Bind("ui_desc") %>'> </asp:Label></a>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="mw80" />
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="主题">
                                                <HeaderStyle CssClass="mw90" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Labelrczt" runat="server" Text='<%# Bind("rczt") %>'></asp:Label></font>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="bm" HeaderText="所在部门">
                                                <HeaderStyle CssClass="mw120" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                              <asp:BoundField DataField="zw" HeaderText="职位">
                                                <HeaderStyle CssClass="mw120" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="日期">
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle CssClass="mw70" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Labelcjsj" runat="server" Text='<%# Bind("cjsj", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <RowStyle CssClass="hkRowStyle" />
                                        <HeaderStyle CssClass="hkHeadStyle" />
                                        <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                        <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 22px">
                                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                    ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                                    NumericButtonCount="10" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                    PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
                                    InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go" PageSize="15">
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
