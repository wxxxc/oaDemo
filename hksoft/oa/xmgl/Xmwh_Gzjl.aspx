<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Xmwh_Gzjl.aspx.cs" Inherits="hkpro.oa.xmgl.Xmwh_Gzjl" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>项目维护</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td_base" width="80%" height="25px">新增跟踪记录
                </td>
                <td class="td_base" width="20%"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <table cellspacing="0" cellpadding="0" width="98%" border="0" align="center">
                        <tr>
                            <td style="height: 10px"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center">
                                    <tr>
                                        <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                            align="center">
                                            <a href="xmwh_view.aspx?id=<%=xmid.Text %>" class="black">项目清单</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/tab_b_y.gif)" align="center">
                                            <a href="xmwh_gzjl.aspx?id=<%=xmid.Text %>" class="mail_top">跟踪记录</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                            <a href="xmwh_lxr.aspx?id=<%=xmid.Text %>" class="black">联系人</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                            <a href="xmwh_fj.aspx?id=<%=xmid.Text %>" class="black">项目附件</a>
                                        </td>
                                        <td align="right" colspan="4">
                                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click"></asp:Button>
                                            <asp:Button ID="PrnBtn" runat="server" Text="打印" CssClass="mybtn" CausesValidation="false"></asp:Button>
                                            <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript: window.close()" />
                                        </td>
                                    </tr>
                                </table>
                                <table border="0" cellpadding="0" cellspacing="0" align="center" width="100%" class="form">
                                    <tr>
                                        <td class="form-item" style="width: 20%">跟踪日期：
                                        </td>
                                        <td style="width: 30%">
                                            <asp:TextBox ID="gzrq" runat="server" CssClass="mytext" Width="90%" onclick="SelectDate(this,'yyyy-MM-dd')"
                                                MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td class="form-item" style="width: 20%">跟踪简述：
                                        </td>
                                        <td style="width: 30%">
                                            <asp:TextBox ID="gzztjs" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">跟踪状态详述：
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="gzztxs" runat="server" CssClass="mytext" Width="96%" MaxLength="50"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">附件：
                                        </td>
                                        <td colspan="3">
                                            <input id="fj" runat="server" type="file" style="width: 96%;" class="mytext" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataSourceID="SqlDataSource1" DataKeyNames="gzid" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="5%" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="gzrq" HeaderText="跟踪日期" DataFormatString="{0:yyyy-MM-dd}"
                                            HtmlEncode="False">
                                            <HeaderStyle Width="90px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="gzztjs" HeaderText="跟踪状态简述"></asp:BoundField>
                                        <asp:BoundField DataField="gzztxs" HeaderText="跟踪状态详述"></asp:BoundField>
                                        <asp:BoundField DataField="gzfjmc" HeaderText="附件"></asp:BoundField>
                                        <asp:TemplateField HeaderText="下载">
                                            <HeaderStyle Width="40px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <a href="../..<%# Eval("gzfjlj") %><%# Eval("gzfjmc") %>" target="_blank">
                                                    <asp:Image ID="Image111" runat="server" ImageUrl='../../images/down_s.gif' ToolTip="下载附件到本地" /></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="修改">
                                            <HeaderStyle Width="40px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <a href="xmwh_gzjl.aspx?id=<%# Eval("xmid") %>&gzid=<%# Eval("gzid") %>">
                                                    <asp:Image ID="Image112" runat="server" ImageUrl='../../images/edit.gif' ToolTip="修改这条记录" /></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="删除" ShowHeader="False">
                                            <HeaderStyle Width="40px" />
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Delete"
                                                    OnClientClick="return confirm('确认要执行删除吗？')" ImageUrl="../../images/del.gif" AlternateText="删除此类型" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="序号" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="dp_id" runat="server" Text='<%# Eval("gzid")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <FooterStyle CssClass="hkBottomStyle" />
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
        <asp:Label ID="xmid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="gzid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="savelj" Visible="false" runat="server"></asp:Label>
        <asp:Label ID="lblAttachSize" runat="server" Visible="false"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:haokeConnectionString %>"></asp:SqlDataSource>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="gzrq"
            ErrorMessage="请输入跟踪日期">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="gzztjs"
            ErrorMessage="请输入跟踪状态简述">&nbsp;
        </asp:RequiredFieldValidator>
    </form>
</body>
</html>
