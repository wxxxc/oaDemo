<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dbsxfz_Fp.aspx.cs" Inherits="hkpro.portal.yhgl.Dbsxfz_Fp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>待办事项授权</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
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
                            分配『<asp:Label ID="lblgname" runat="server" />』分组的待办事项
                        </td>
                        <td align="right">
                            <input type="button" class="mybtn" name="BackBtn" value="确定返回" onclick="javascript:location.href='Dbsxfz.aspx'" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:DataGrid ID="dg" runat="server" Width="100%" CellSpacing="0" AutoGenerateColumns="False"
                                OnItemDataBound="dg_ItemDataBound" 
                                CssClass="hkgv">
                                <Columns>
                                    <asp:BoundColumn DataField="id" HeaderText="待办事项编码">
                                        <HeaderStyle HorizontalAlign="center" Width="100px" />
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:TemplateColumn HeaderText="待办事项名称">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="center" />
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="Status" HeaderText="状态">
                                        <HeaderStyle HorizontalAlign="center" Width="60" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundColumn>
                                    <asp:TemplateColumn HeaderText="选择">
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CkboxRole" runat="server" AutoPostBack="True" OnCheckedChanged="CkboxRole_CheckedChanged" /></ItemTemplate>
                                        <HeaderStyle HorizontalAlign="center" Width="60px" />
                                    </asp:TemplateColumn>
                                </Columns>
                                <AlternatingItemStyle CssClass="hkAltRowStyle" />
                                <HeaderStyle CssClass="hkHeadStyle" />
                                <ItemStyle CssClass="hkRowStyle" />
                            </asp:DataGrid>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="lbltid" runat="server" Visible="false"></asp:Label>
    </form>
</body>
</html>
