<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Quick.aspx.cs" Inherits="hkpro.portal.kjfs.Quick" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>快捷方式</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="form1" method="post" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 40px">&nbsp;快捷方式类型：<asp:Image ID="ImageY" runat="server" ImageUrl='../../attach/portal/quick/N.gif' />
                                个人&nbsp;<asp:Image ID="ImageN" runat="server" ImageUrl='../../attach/portal/quick/Y.gif' />
                                公共(禁止修改和删除)
                            <asp:HyperLink ID="downfj" Enabled="true" Target="_blank" runat="server" CssClass="blue"
                                Visible="false" Text="运行/下载注册文件" />
                            </td>
                            <td align="right">
                                <input type="button" name="AddBtn" value="新 增" class="mybtn" onclick="javascript: popAdd('quick_view.aspx');" />
                                <asp:Button CssClass="mybtn" ID="RegBtn" Text="生成注册文件" runat="server" OnClick="Reg_Click"></asp:Button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#bdbdbe">
                                    <tr>
                                        <td bgcolor="#ffffff" valign="top">
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="qid" DataSourceID="SqlDataSource1"
                                                EmptyDataText="暂无任何快捷方式！" Width="100%" ShowHeader="False" OnRowDataBound="Item_Bound" CssClass="hkgv">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="公共">
                                                        <ItemTemplate>
                                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("qlx", "../../attach/portal/quick/{0}.gif") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="center" Width="30px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="图标">
                                                        <ItemTemplate>
                                                            <asp:Image ID="Imageqcs" runat="server" ImageUrl='<%# Eval("qtb", "../../attach/portal/quick/{0}") %>' />
                                                            <a href="<%# Eval("link") %>" class="gvlink" target="<%# Eval("tar") %>">
                                                                <asp:Label ID="Labelnr" runat="server" Text='<%# Bind("qmc") %>' /></a>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="程序路径">
                                                        <ItemTemplate>
                                                            <font color="#999999">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("qlj") %>'></asp:Label></font>
                                                            <a href="#" onclick="javascript:popMod('quick_view.aspx?id=<%# Eval("qid") %>')">
                                                                <asp:Image ID="Imageqlj" runat="server" ImageUrl='../../images/edit.gif' ToolTip="修改此快捷方式" /></a>
                                                            <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Delete"
                                                                OnClientClick="return confirm('确认要执行删除吗？')" ImageUrl="../../images/del.gif" AlternateText="删除此快捷方式" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="序号" Visible="False">
                                                        <ItemTemplate>
                                                            <asp:Label ID="dp_id" runat="server" Text='<%# Eval("qid")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <RowStyle BackColor="#F7F7F7" />
                                                <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                <AlternatingRowStyle BackColor="#E6E6E6" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <font color="red">步骤:1.新增/修改快捷方式>> 2.生成注册文件>> 3.直接在线运行注册文件并导入注册表，或者下载注册文件到本地然后手工导入，完成!<br />
                                提醒:只有成功写入了注册表的电脑，才可以正常使用上述快捷方式!</font>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:haokeConnectionString %>"></asp:SqlDataSource>
    </form>
</body>
</html>
