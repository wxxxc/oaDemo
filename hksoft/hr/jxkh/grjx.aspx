<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grjx.aspx.cs" Inherits="hksoft.hr.jxkh.grjx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人绩效</title>
    <link href="../../assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../../css/style.css" rel="stylesheet" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../assets/plugins/jquery/jquery.min.js"></script>
    <script src="../../assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="../../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>

    <style>
        td {
            text-align: center;
        }

        .pagebtn {
            width: 50px;
            height: 30px;
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
                            <td style="height: 60px; line-height: 60px;" colspan="2">
                                <span>用户：</span>
                                <asp:Label ID="yhname" runat="server" style="padding: 10px"><%=userName%></asp:Label>
                                 <span>分数：</span>
                                <asp:Label ID="Label2" runat="server" style="padding: 10px;color:red;" ><%=khscore%></asp:Label>
                                <span style="padding: 10px">考核项目：</span>
                                <asp:TextBox ID="TextBox2" runat="server" CssClass="mytext" Width="180" Height="38" Style="border-radius: 2px"></asp:TextBox>
                                <span style="padding: 10px">日期：</span>
                                <asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                    CssClass="text-center" Width="150" Height="38" border-radius="2px"></asp:TextBox>
                                <span style="padding: 10px">至</span>
                                <asp:TextBox ID="TextBox1" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                    CssClass="text-center" Width="150" Height="38" border-radius="2px"></asp:TextBox>&nbsp
                                <asp:Button CssClass="btn btn-info" ID="button" runat="server" Text="查询" OnClick="Query_Click"
                                    CausesValidation="False" />
                                &nbsp                              
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="mytable table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                        EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table">
                                        <Columns>
                                            <asp:TemplateField HeaderText="序号">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle CssClass="mw30" />
                                            </asp:TemplateField>
                                            <%--<asp:TemplateField>
                                                <HeaderStyle Width="30px" CssClass="v-m"></HeaderStyle>
                                                <ItemStyle Width="30px" HorizontalAlign="Center" CssClass="v-m" />
                                                <HeaderTemplate>
                                                    <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" class="mybox" style="width: 16px; height: 16px" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>

                                            <%--                                            <asp:TemplateField HeaderText="被考核人">
                                                <ItemTemplate>
                                                    <asp:Label ID="yhname" runat="server" Text='<%# Bind("yhname") %>'> </asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="mw80" />
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="考核项目">
                                                <HeaderStyle CssClass="mw90" />
                                                <ItemTemplate>
                                                    <asp:Label ID="xmname" runat="server" Text='<%# Bind("Xmmc") %>'></asp:Label></font>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <%--<asp:BoundField DataField="score" HeaderText="所得分数">
                                                <HeaderStyle CssClass="mw120" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>--%>
                                            <asp:BoundField DataField="num" HeaderText="次数">
                                                <HeaderStyle CssClass="mw120" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="附件">
                                                <HeaderStyle CssClass="mw90" />
                                                <ItemTemplate>
                                                    <%# getfuji(Eval("fjlj").ToString()) %>
                                                   <%-- <a class="a" href="<%=qy_fjylurl.Text %><%# Eval("fjlj") %><%# Eval("fjmc") %>" style='<%# isshowfj(Eval("fjlj").ToString()+Eval("fjlj").ToString()) %>' target="_blank" id="f">在线预览</a>--%>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="开始日期">
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle CssClass="mw70" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Labelbegin" runat="server" Text='<%# Bind("begindate", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="截止日期">
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle CssClass="mw70" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Labelend" runat="server" Text='<%# Bind("enddate", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--  <asp:BoundField DataField="createuser" HeaderText="创建人">
                                                <HeaderStyle CssClass="mw120" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>--%>
                                            <%--                                            <asp:TemplateField HeaderText="创建时间">
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle CssClass="mw70" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Labelcjsj" runat="server" Text='<%# Bind("createtime", "{0:yyyy-MM-dd HH:mm:ss}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
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
                                    InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="转到" PageSize="12">
                                </webdiyer:AspNetPager>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>

    </form>
</body>
</html>
