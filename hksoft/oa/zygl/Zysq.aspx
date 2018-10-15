<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Zysq.aspx.cs" Inherits="hkpro.oa.zygl.Zysq" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>我的申请</title>
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
                            <td style="height: 40px">
                                <asp:Image ID="Image2" runat="server" ImageUrl="../../images/oa/gem.gif" />资源申请&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择资源分类：<asp:DropDownList
                                    ID="zyflxz" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ChangeType">
                                </asp:DropDownList>
                            </td>
                            <td align="right">
                                <input type="button" name="AddBtn" value="申请资源" class="mybtn" onclick="javascript: popAdd('zysq_add.aspx');" />
                                <input type="button" name="AddBtn" value="申请车辆" class="mybtn" onclick="javascript: popAdd('clsq_add.aspx');" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                   <div class="mytable table-responsive">
                                <asp:GridView ID="GridViewzy" runat="server" AllowSorting="true" AllowPaging="true"
                                    OnRowDataBound="OnRow_Boundzy" AutoGenerateColumns="False" DataKeyNames="sqid" DataSourceID="SqlDataSource1"
                                    EmptyDataText="没有查到符合条件的数据！" PageSize="10" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridViewzy.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="mw30" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="sqid" HeaderText="申请ID">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                            <FooterStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="申请资源">
                                            <HeaderStyle CssClass="mw200" />
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('zysq_mod.aspx?id=<%# Eval("sqid") %>')" class="gvlink">
                                                    <asp:Label ID="Label31" runat="server" Text='<%# Bind("zymc") %>'></asp:Label></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="使用部门">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("bm_mc") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="mwp80" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="sysj" HeaderText="使用时间" DataFormatString="{0:yy-MM-dd HH:mm}"
                                            HtmlEncode="False">
                                            <HeaderStyle CssClass="mw150" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ghsj" HeaderText="归还时间" DataFormatString="{0:yy-MM-dd HH:mm}"
                                            HtmlEncode="False">
                                       <HeaderStyle CssClass="mw150" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ztmc" HeaderText="状态">
                                           <HeaderStyle CssClass="mw80" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="序号" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="dp_id" runat="server" Text='<%# Eval("sqid")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <PagerStyle CssClass="hkBottomStyle" Font-Bold="False" Font-Italic="False" Font-Names="Batang"
                                        Font-Overline="False" Font-Strikeout="True" ForeColor="#0000C0" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                    <PagerSettings PageButtonCount="25" />
                                </asp:GridView>
                                       </div>
                                <br />
                                <asp:Image ID="Image1" runat="server" ImageUrl="../../images/oa/gem.gif" />车辆申请<br />
                                   <div class="mytable table-responsive">
                                <asp:GridView ID="GridViewcl" runat="server" AllowSorting="True" AllowPaging="true"
                                    OnRowDataBound="OnRow_Boundcl" AutoGenerateColumns="False" DataKeyNames="id"
                                    DataSourceID="SqlDataSource2"
                                    EmptyDataText="没有查到符合条件的数据！" PageSize="10" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridViewcl.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                           <HeaderStyle CssClass="mw30" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="id" HeaderText="编号">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                            <FooterStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="发车地点">
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('clsq_mod.aspx?id=<%# Eval("id") %>')" class="gvlink">
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("fcdd") %>'></asp:Label></a>
                                            </ItemTemplate>
                                              <HeaderStyle CssClass="mwp40" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="到达地点">
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('clsq_mod.aspx?id=<%# Eval("id") %>')" class="gvlink">
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("dddd") %>'></asp:Label></a>
                                            </ItemTemplate>
                                              <HeaderStyle CssClass="mwp40" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="czrs" HeaderText="乘坐人数">
                                             <HeaderStyle CssClass="mw80" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="xssj_s" HeaderText="行驶时间(自)" DataFormatString="{0:yy-MM-dd HH:mm}"
                                            HtmlEncode="False">
                                             <HeaderStyle CssClass="mw150" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="xssj_e" HeaderText="行驶时间(至)" DataFormatString="{0:yy-MM-dd HH:mm}"
                                            HtmlEncode="False">
                                            <HeaderStyle CssClass="mw150" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="zt" HeaderText="状态">
                                             <HeaderStyle CssClass="mw80" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="序号" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="dp_id" runat="server" Text='<%# Eval("id")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <PagerStyle CssClass="hkBottomStyle" Font-Bold="False" Font-Italic="False" Font-Names="Batang"
                                        Font-Overline="False" Font-Strikeout="True" ForeColor="#0000C0" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                    <PagerSettings PageButtonCount="25" />
                                </asp:GridView>
                                       </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:haokeConnectionString %>" />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:haokeConnectionString %>" />
    </form>
</body>
</html>
