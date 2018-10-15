<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bkpr.aspx.cs" Inherits="hkpro.oa.jxkh.Bkpr" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/MyJs.js"></script>

    <title>被考评人维护</title>
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
                                <td style="height: 40px">
                                    所属部门：<asp:DropDownList ID="ssbm" runat="server">
                                    </asp:DropDownList>
                                    快速检索：<asp:DropDownList ID="query_tj" runat="server">
                                        <asp:ListItem Value="a.bid" Selected="True">用户编码</asp:ListItem>
                                        <asp:ListItem Value="a.xm">姓名</asp:ListItem>
                                        <asp:ListItem Value="a.bs">部室</asp:ListItem>
                                        <asp:ListItem Value="a.gw">岗位</asp:ListItem>
                                        <asp:ListItem Value="a.fgzrmc">分管副主管</asp:ListItem>
                                        <asp:ListItem Value="a.bz">备注</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="100"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Button CssClass="btn btn-info" ID="QueryBtn" runat="server" Text="查 询" OnClick="Query_Click"
                                        CausesValidation="False" AccessKey="f" />
                                    <input type="button" id="AddBtn" name="AddBtn" value="增 加" class="btn btn-primary" onclick="javascript:popAdd('Bkpr_View.aspx');"
                                        accesskey="a" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                        DataKeyNames="bid" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                        <Columns>
                                            <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle Width="30px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="用户编码">
                                                <HeaderStyle Width="10%" />
                                                <ItemTemplate>
                                                    <a href="#" onclick="javascript:popAdd('Bkpr_View.aspx?id=<%# Eval("bid") %>')" class="gvlink">
                                                        <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("bid") %>'></asp:Label></a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="xm" HeaderText="姓名">
                                                <HeaderStyle Width="10%" />
                                                <ItemStyle Wrap="false" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="bs" HeaderText="部室">
                                                <HeaderStyle Width="10%" />
                                                <ItemStyle Wrap="false" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="gw" HeaderText="岗位">
                                                <HeaderStyle Width="10%" />
                                                <ItemStyle Wrap="false" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="gwf" HeaderText="岗位分">
                                                <HeaderStyle Width="10%" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="fgzrmc" HeaderText="分管副主管">
                                                <HeaderStyle Width="10%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="bz" HeaderText="备注">
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
