<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wdyjx.aspx.cs" Inherits="hkpro.portal.xzgl.Wdyjx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>我的意见箱</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="height: 10"></td>
            </tr>
            <tr>
                <td align="center">
                    <table cellspacing="0" cellpadding="0" border="0" width="98%">
                        <tr>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_y.gif)"
                                align="center">
                                <a href="Wdyjx.aspx" class="mail_top">收到的意见</a>
                            </td>
                            <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                <a href="Wdyjx_f.aspx" class="black">发出的意见</a>
                            </td>
                            <td align="right">&nbsp;
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" border="0" class="form">
                        <tr>
                            <td style="height: 40px">检索主题：<asp:DropDownList ID="tj" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Select_Click">
                                <asp:ListItem Value="待回复" Text="待回复的意见" Selected="true"></asp:ListItem>
                                <asp:ListItem Value="已回复" Text="已回复的意见"></asp:ListItem>
                            </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center">
                        <div class="mytable table-responsive">
                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                        DataKeyNames="yjid" EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table">
                        <Columns>
                            <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle  CssClass="mw30" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="意见标题">
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:popMod('wdyjx_view.aspx?id=<%# Eval("yjid") %>')"
                                        class="gvlink">
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("yjbt") %>'></asp:Label></a>
                                </ItemTemplate>
                                 <HeaderStyle  CssClass="mwp50" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="mc" HeaderText="意见箱"> <HeaderStyle  CssClass="mw150" /></asp:BoundField>
                            <asp:BoundField DataField="fbrmc" HeaderText="发表人">
                                 <HeaderStyle  CssClass="mw150" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fbsj" HeaderText="发表时间" DataFormatString="{0:yyyy-MM-dd}"
                                HtmlEncode="False">
                                 <HeaderStyle  CssClass="mw60" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="hfrmc" HeaderText="回复人">
                                 <HeaderStyle  CssClass="mw80" />
                            </asp:BoundField>
                            <asp:BoundField DataField="hfsj" HeaderText="回复时间" DataFormatString="{0:yyyy-MM-dd}"
                                HtmlEncode="False">
                                <HeaderStyle  CssClass="mw60" />
                                <ItemStyle HorizontalAlign="center" />
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
    </form>
</body>
</html>
