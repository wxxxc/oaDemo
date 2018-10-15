<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wdmp.aspx.cs" Inherits="hkpro.oa.mpgl.Wdmp" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>我的名片夹</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 40px">快速检索：<asp:DropDownList ID="query_tj" runat="server">
                                <asp:ListItem Value="xm" Selected="True">姓名</asp:ListItem>
                                <asp:ListItem Value="zw">职务</asp:ListItem>
                                <asp:ListItem Value="gsdh">公司电话</asp:ListItem>
                                <asp:ListItem Value="czdh">传真电话</asp:ListItem>
                                <asp:ListItem Value="gsmc">公司名称</asp:ListItem>
                                <asp:ListItem Value="gsdz">公司地址</asp:ListItem>
                                <asp:ListItem Value="yzbm">邮政编码</asp:ListItem>
                                <asp:ListItem Value="w_mail">工作邮箱</asp:ListItem>
                                <asp:ListItem Value="hylb">行业类别</asp:ListItem>
                                <asp:ListItem Value="xz">性质</asp:ListItem>
                                <asp:ListItem Value="mplx">名片类型</asp:ListItem>
                                <asp:ListItem Value="gswz">公司网址</asp:ListItem>
                                <asp:ListItem Value="bmmc">部门名称</asp:ListItem>
                                <asp:ListItem Value="zzdh">住宅电话</asp:ListItem>
                                <asp:ListItem Value="h_mail">个人邮箱</asp:ListItem>
                                <asp:ListItem Value="yddh">移动电话</asp:ListItem>
                                <asp:ListItem Value="msn">MSN号</asp:ListItem>
                                <asp:ListItem Value="qq">QQ号</asp:ListItem>
                            </asp:DropDownList>
                                <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="100"></asp:TextBox>
                                &nbsp;<asp:CheckBox ID="qtyh" Text="显示其它用户的共享名片" runat="server"></asp:CheckBox>
                            </td>
                            <td align="right">
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="查询" OnClick="Query_Click"
                                    CausesValidation="False" />
                                <input type="button" name="AddBtn" value="增加" class="mybtn" onclick="javascript: popAdd('wdmp_add.aspx');" />
                                <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click"
                                    OnClientClick="return confirm('确认要执行删除吗？')"></asp:Button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
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
                                            <HeaderStyle Width="30px"></HeaderStyle>
                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                            <HeaderTemplate>
                                                <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" />
                                                   <HeaderStyle CssClass="mw30"  />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="id" HeaderText="编号">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                            <FooterStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="姓名">
                                            <HeaderStyle CssClass="mw60" />
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('wdmp_mod.aspx?id=<%# Eval("id") %>')" class="gvlink">
                                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("xm") %>'></asp:Label></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="zw" HeaderText="职务">
                                            <HeaderStyle CssClass="mw80" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="gsmc" HeaderText="公司名称">
                                              <HeaderStyle CssClass="mwp30" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="gsdh" HeaderText="公司电话">
                                            <HeaderStyle CssClass="mw100" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="mplx" HeaderText="名片类型">
                                            <HeaderStyle CssClass="mw80" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="gsdz" HeaderText="公司地址">
                                              <HeaderStyle CssClass="mwp30" />
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
