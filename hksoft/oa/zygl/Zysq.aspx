<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Zysq.aspx.cs" Inherits="hkpro.oa.zygl.Zysq" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�ҵ�����</title>
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
                                <asp:Image ID="Image2" runat="server" ImageUrl="../../images/oa/gem.gif" />��Դ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ѡ����Դ���ࣺ<asp:DropDownList
                                    ID="zyflxz" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ChangeType">
                                </asp:DropDownList>
                            </td>
                            <td align="right">
                                <input type="button" name="AddBtn" value="������Դ" class="mybtn" onclick="javascript: popAdd('zysq_add.aspx');" />
                                <input type="button" name="AddBtn" value="���복��" class="mybtn" onclick="javascript: popAdd('clsq_add.aspx');" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                   <div class="mytable table-responsive">
                                <asp:GridView ID="GridViewzy" runat="server" AllowSorting="true" AllowPaging="true"
                                    OnRowDataBound="OnRow_Boundzy" AutoGenerateColumns="False" DataKeyNames="sqid" DataSourceID="SqlDataSource1"
                                    EmptyDataText="û�в鵽�������������ݣ�" PageSize="10" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridViewzy.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="mw30" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="sqid" HeaderText="����ID">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                            <FooterStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="������Դ">
                                            <HeaderStyle CssClass="mw200" />
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('zysq_mod.aspx?id=<%# Eval("sqid") %>')" class="gvlink">
                                                    <asp:Label ID="Label31" runat="server" Text='<%# Bind("zymc") %>'></asp:Label></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ʹ�ò���">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("bm_mc") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="mwp80" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="sysj" HeaderText="ʹ��ʱ��" DataFormatString="{0:yy-MM-dd HH:mm}"
                                            HtmlEncode="False">
                                            <HeaderStyle CssClass="mw150" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ghsj" HeaderText="�黹ʱ��" DataFormatString="{0:yy-MM-dd HH:mm}"
                                            HtmlEncode="False">
                                       <HeaderStyle CssClass="mw150" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ztmc" HeaderText="״̬">
                                           <HeaderStyle CssClass="mw80" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="���" Visible="False">
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
                                <asp:Image ID="Image1" runat="server" ImageUrl="../../images/oa/gem.gif" />��������<br />
                                   <div class="mytable table-responsive">
                                <asp:GridView ID="GridViewcl" runat="server" AllowSorting="True" AllowPaging="true"
                                    OnRowDataBound="OnRow_Boundcl" AutoGenerateColumns="False" DataKeyNames="id"
                                    DataSourceID="SqlDataSource2"
                                    EmptyDataText="û�в鵽�������������ݣ�" PageSize="10" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridViewcl.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                           <HeaderStyle CssClass="mw30" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="id" HeaderText="���">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                            <FooterStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="�����ص�">
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('clsq_mod.aspx?id=<%# Eval("id") %>')" class="gvlink">
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("fcdd") %>'></asp:Label></a>
                                            </ItemTemplate>
                                              <HeaderStyle CssClass="mwp40" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="����ص�">
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('clsq_mod.aspx?id=<%# Eval("id") %>')" class="gvlink">
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("dddd") %>'></asp:Label></a>
                                            </ItemTemplate>
                                              <HeaderStyle CssClass="mwp40" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="czrs" HeaderText="��������">
                                             <HeaderStyle CssClass="mw80" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="xssj_s" HeaderText="��ʻʱ��(��)" DataFormatString="{0:yy-MM-dd HH:mm}"
                                            HtmlEncode="False">
                                             <HeaderStyle CssClass="mw150" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="xssj_e" HeaderText="��ʻʱ��(��)" DataFormatString="{0:yy-MM-dd HH:mm}"
                                            HtmlEncode="False">
                                            <HeaderStyle CssClass="mw150" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="zt" HeaderText="״̬">
                                             <HeaderStyle CssClass="mw80" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="���" Visible="False">
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
