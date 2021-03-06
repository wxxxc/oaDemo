<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dfsdx.aspx.cs" Inherits="hkpro.portal.dxgl.Dfsdx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>我的短信</title>
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
                                        <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                            align="center">
                                            <a href="yfsdx.aspx" class="black">已发送短信</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/tab_b_y.gif)" align="center">
                                            <a href="dfsdx.aspx" class="mail_top">待发送短信</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                            <a href="xdx.aspx" class="black">写短信</a>
                                        </td>
                                        <td align="right">
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
                                            <HeaderStyle CssClass="mw30" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="id" HeaderText="编码">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                            <FooterStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ssendno" HeaderText="接收号码">  
                                               <HeaderStyle CssClass="mwp30" /></asp:BoundField>
                                        <asp:TemplateField HeaderText="短信内容">
                                            <ItemTemplate>
                                                <asp:Label ID="Labelnr" runat="server" Text='<%# Bind("ssmsmessage") %>' />
                                            </ItemTemplate>
                                                 <HeaderStyle CssClass="mw80" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="dbegintime" HeaderText="请求发送时间" DataFormatString="{0:yy-MM-dd HH:mm:ss}"
                                            HtmlEncode="False">
                                                <HeaderStyle CssClass="mw120" />
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
