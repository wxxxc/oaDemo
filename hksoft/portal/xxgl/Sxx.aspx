<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sxx.aspx.cs" Inherits="hkpro.portal.xxgl.Sxx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>收消息</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 10px"></td>
                            <td align="right"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                    <tr>
                                        <td style="height: 21px; width: 61px; background-image: url(../../images/tab_y.gif)"
                                            align="center">
                                            <a href="sxx.aspx" class="mail_top">收消息</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                            <a href="yfsxx.aspx" class="black">已发送消息</a>
                                        </td>
                                        <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                            <a href="xxx.aspx" class="black">写消息</a>
                                        </td>
                                        <td align="right">
                                            <asp:DropDownList ID="jsfa" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Receive_Click">
                                                <asp:ListItem Text="全部消息" Value="全部" Selected="true"></asp:ListItem>
                                                <asp:ListItem Text="未读消息" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="已读消息" Value="1"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Button CssClass="mybtn" ID="ReadBtn" runat="server" Text="标记已读" OnClick="Read_Click"></asp:Button>
                                            <asp:Button CssClass="mybtn" ID="RecBtn" runat="server" Text="刷 新" OnClick="Receive_Click"></asp:Button>
                                        </td>
                                    </tr>
                                </table>
                                 <div class="mytable table-responsive">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="id" EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="mw30"  />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderStyle CssClass="mw30"></HeaderStyle>
                                            <ItemStyle CssClass="mw30" Height="18px" HorizontalAlign="center" />
                                            <HeaderTemplate>
                                                <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16; height: 16" />
                                               <HeaderStyle CssClass="mw30"  />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="id" HeaderText="编码">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                            <FooterStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:ImageField DataImageUrlField="zt" DataImageUrlFormatString="../../images/{0}.gif"
                                            HeaderText="状态">
                                            <ItemStyle HorizontalAlign="center" />
                                            <HeaderStyle CssClass="mw40"  />
                                        </asp:ImageField>
                                        <asp:TemplateField HeaderText="内容">
                                            <ItemTemplate>
                                                <asp:Label ID="Labelnr" runat="server" Text='<%# Bind("nr") %>' />
                                            </ItemTemplate>
                                             <HeaderStyle CssClass="mwp80"  />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="发送人">
                                            <HeaderStyle CssClass="mw70" />
                                            <ItemTemplate>
                                                <asp:Label ID="Labelfs" runat="server" Text='<%# Bind("ui_desc") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="fssj" HeaderText="发送时间" DataFormatString="{0:yy-MM-dd HH:mm}"
                                            HtmlEncode="False">
                                            <HeaderStyle CssClass="mw100" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
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
