<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feijx.aspx.cs" Inherits="hkpro.portal.yjgl.Feijx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>废件箱</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 10px"></td>
                            <td align="right" style="height: 10px"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                    <tr>
                                        <td style="height: 21px; width: 61px; background-image: url(../../images/tab_n.gif)"
                                            align="center">
                                            <a href="sjx.aspx?i=2" class="black">收件箱</a>
                                        </td>
                                        <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                            <a href="fajx.aspx" class="black">发件箱</a>
                                        </td>
                                        <td style="width: 61px; background-image: url(../../images/tab_y.gif)" align="center">
                                            <a href="feijx.aspx" class="mail_top">废件箱</a>
                                        </td>
                                        <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                            <a href="cgx.aspx" class="black">草稿箱</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                            <a href="xyj.aspx" class="black">撰写新邮件</a>
                                        </td>
                                        <td align="right">
                                            <asp:DropDownList ID="fjly" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Query_Click">
                                                <asp:ListItem Text="来自收件箱" Value="s" Selected="true"></asp:ListItem>
                                                <asp:ListItem Text="来自发件箱" Value="f"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="彻底删除" OnClick="Del_Click"
                                                OnClientClick="return confirm('确认要彻底删除吗？')"></asp:Button>
                                            <asp:Button CssClass="mybtn" ID="RevBtn" runat="server" Text="还 原" OnClick="Rev_Click"
                                                OnClientClick="return confirm('确认要还原吗？')"></asp:Button>
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
                                            <HeaderStyle CssClass="mw30" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderStyle Width="30px"></HeaderStyle>
                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                            <HeaderTemplate>
                                                <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16; height: 16" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="标题">
                                            <ItemTemplate>
                                                <asp:Label ID="Labelnr" runat="server" Text='<%# Bind("bt") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Wrap="false" />
                                                <HeaderStyle CssClass="mwp30" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="jsrNames2" HeaderText="全部收件人">
                                                <HeaderStyle CssClass="mwp30" />
                                        </asp:BoundField>
                                        <asp:ImageField DataImageUrlField="fjbz" DataImageUrlFormatString="../../images/{0}.gif"
                                            HeaderImageUrl="../../images/y.gif" HeaderText="附件标志">
                                            <ItemStyle HorizontalAlign="center" />
                                            <HeaderStyle CssClass="mw30" />
                                        </asp:ImageField>
                                        <asp:TemplateField HeaderText="发送人">
                                            <HeaderStyle Wrap="false" />
                                            <ItemStyle Wrap="false" />
                                            <ItemTemplate>
                                                <asp:Label ID="Labelfs" runat="server" Text='<%# Bind("fsrName") %>' />
                                            </ItemTemplate>
                                             <HeaderStyle CssClass="mw120" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="fssj" HeaderText="日期" DataFormatString="{0:yyyy-MM-dd}"
                                            HtmlEncode="False">
                                             <HeaderStyle CssClass="mw80" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="zyjb" HeaderText="重要级别">
                                         <HeaderStyle CssClass="mw60" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="msbz" HeaderText="密送">
                                           <HeaderStyle CssClass="mw40" />
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
