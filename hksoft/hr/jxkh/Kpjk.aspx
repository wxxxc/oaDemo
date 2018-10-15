<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kpjk.aspx.cs" Inherits="hkpro.oa.jxkh.Kpjk" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/MyJs.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>考评过程监控</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td>
                    <table id="search" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tbody>
                            <tr>
                                <td style="height: 40px" colspan="2">
                                    考评期数：<asp:TextBox ID="kpqs" runat="server" CssClass="mytext" Width="100"></asp:TextBox>
                                    考评开始日：<asp:TextBox ID="ksrq_s" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                                CssClass="mytext" Width="75" MaxLength="10"></asp:TextBox>至<asp:TextBox ID="ksrq_e" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                                CssClass="mytext" Width="75" MaxLength="10"></asp:TextBox>
                                    <asp:Button CssClass="btn btn-info" ID="QueryBtn" runat="server" Text="查询" OnClick="Query_Click"
                                        CausesValidation="False" AccessKey="f" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                        DataKeyNames="kpid" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                        <Columns>
                                            <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle Width="30px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="考评期数">
                                                <HeaderStyle Width="150" />
                                                <ItemTemplate>
                                                    <a href="Kpjk_View.aspx?id=<%# Eval("kpid") %>" target="_self" class="gvlink">
                                                        <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("kpqs") %>'></asp:Label></a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="考评日期">
                                                <HeaderStyle Width="90" />
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblkprq_s" runat="server" Text='<%# Bind("ksrq", "{0:yyyy-MM-dd}") %>'></asp:Label><br />
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("jzrq", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="CypwNames" HeaderText="参与评委">
                                            </asp:BoundField>
                                            <asp:BoundField DataField="bkprs" HeaderText="被考评人数">
                                                <HeaderStyle Width="80" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="kpzt" HeaderText="状态">
                                                <HeaderStyle Width="70" />
                                                <ItemStyle Wrap="false" HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ui_desc" HeaderText="创建人">
                                                <HeaderStyle Width="80" />
                                            </asp:BoundField>
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
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</body>
</html>
