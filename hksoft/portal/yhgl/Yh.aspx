<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Yh.aspx.cs" Inherits="hkpro.portal.yhgl.Yh" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <title>用户维护</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 40px">所属部门：<asp:DropDownList ID="ssbm" runat="server">
                            </asp:DropDownList>
                                快速检索：<asp:DropDownList ID="query_tj" runat="server">
                                    <asp:ListItem Value="a.ui_id" Selected="True">用户编码</asp:ListItem>
                                    <asp:ListItem Value="a.ui_desc">姓名</asp:ListItem>
                                    <asp:ListItem Value="a.ui_sex">性别</asp:ListItem>
                                    <asp:ListItem Value="a.ui_status">状态</asp:ListItem>
                                    <asp:ListItem Value="a.ui_yddh">移动电话</asp:ListItem>
                                    <asp:ListItem Value="a.ui_bgdh">办公电话</asp:ListItem>
                                    <asp:ListItem Value="b.zwmc">职位</asp:ListItem>
                                    <asp:ListItem Value="c.role_name">角色</asp:ListItem>
                                    <asp:ListItem Value="e.qy_qc">所属公司</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="100"></asp:TextBox>
                            </td>
                            <td align="right">
                                <asp:Button CssClass="btn btn-primary" ID="QueryBtn" runat="server" Text="查 询" OnClick="Query_Click" CausesValidation="False" />
                                <input type="button" id="AddBtn" name="AddBtn" value="增 加" class="btn btn-success" onclick="javascript:popView('yh_add.aspx');" runat="server" />
                                <asp:Button CssClass="btn btn-info" ID="ExpBtn" runat="server" Text="导 出" OnClick="Exp_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="ui_id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="编码">
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popView('yh_mod.aspx?id=<%# Eval("ui_id") %>')" class="gvlink">
                                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("ui_id") %>'></asp:Label></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ui_desc" HeaderText="姓名">
                                            <ItemStyle Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ui_sex" HeaderText="性别">
                                            <HeaderStyle Width="30px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="bm_mc" HeaderText="部门">
                                            <ItemStyle Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="zwmc" HeaderText="职位">
                                            <ItemStyle Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="role_name" HeaderText="角色"></asp:BoundField>
                                        <asp:BoundField DataField="ui_yddh" HeaderText="移动电话"></asp:BoundField>
                                        <asp:BoundField DataField="ui_status" HeaderText="状态">
                                            <HeaderStyle Width="35px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="qy_qc" HeaderText="所属公司"></asp:BoundField>
                                        <asp:BoundField DataField="cjsj" HeaderText="建档日期" DataFormatString="{0:yyyy-MM-dd}"
                                            HtmlEncode="False">
                                            <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="操作">
                                            <HeaderStyle Width="160" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popView('Yh_Bm.aspx?id=<%# Eval("ui_id") %>')" class="gvlink">附加部门(<asp:Label ID="lblbmsl" runat="server" Text='<%# Bind("bmsl") %>'></asp:Label>)</a>
                                                <a href="#" onclick="javascript:popView('Yh_Js.aspx?id=<%# Eval("ui_id") %>')" class="gvlink">附加角色(<asp:Label ID="lbljssl" runat="server" Text='<%# Bind("jssl") %>'></asp:Label>)</a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
